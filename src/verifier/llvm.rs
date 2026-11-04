//! LLVM dialect ops and attributes as `mlir-opt` reads them: `LLVMFuncOp::parse`,
//! `GlobalOp::parse` (`LLVMIR/IR/LLVMDialect.cpp`), `#llvm.cconv` / `#llvm.linkage` cases.

use alloc::string::{String, ToString};

use super::{DialectRules, Invalid, Verifier};
use crate::{Attribute, MlirOpt, Operation, Parser, Piece, R, ShapedKind, Type};

keywords! {
    /// The ops whose custom form is checked.
    enum OpKind {
        Func = "func",
        Global = "mlir.global",
    }
}

/// `CConv`'s cases (`LLVMEnums.td`).
const CCONVS: &[&str] = &[
    "ccc", "fastcc", "coldcc", "cc_10", "cc_11", "anyregcc", "preserve_mostcc", "preserve_allcc",
    "swiftcc", "cxx_fast_tlscc", "tailcc", "cfguard_checkcc", "swifttailcc", "x86_stdcallcc", "x86_fastcallcc", "arm_apcscc",
    "arm_aapcscc", "arm_aapcs_vfpcc", "msp430_intrcc", "x86_thiscallcc", "ptx_kernelcc", "ptx_devicecc", "spir_funccc", "spir_kernelcc",
    "intel_ocl_bicc", "x86_64_sysvcc", "win64cc", "x86_vectorcallcc", "hhvmcc", "hhvm_ccc", "x86_intrcc", "avr_intrcc",
    "avr_signalcc", "avr_builtincc", "amdgpu_vscc", "amdgpu_gscc", "amdgpu_pscc", "amdgpu_cscc", "amdgpu_kernelcc", "x86_regcallcc",
    "amdgpu_hscc", "msp430_builtincc", "amdgpu_lscc", "amdgpu_escc", "aarch64_vectorcallcc", "aarch64_sve_vectorcallcc", "wasm_emscripten_invokecc", "amdgpu_gfxcc",
    "m68k_intrcc",
];

/// `Linkage`'s cases (`LLVMEnums.td`).
const LINKAGES: &[&str] = &[
    "external", "available_externally", "linkonce", "linkonce_odr", "weak", "weak_odr", "appending", "internal",
    "private", "extern_weak", "common",
];

/// `Visibility`'s cases (`LLVMEnums.td`).
const VISIBILITIES: &[&str] = &[
    "hidden", "protected",
];

/// `UnnamedAddr`'s cases (`LLVMEnums.td`).
const UNNAMED_ADDRS: &[&str] = &[
    "local_unnamed_addr", "unnamed_addr",
];

/// A cursor over a raw custom form.
struct LlvmText<'a, 'd> {
    p: Parser<'a, 'd>,
}

impl<'a> LlvmText<'a, '_> {
    /// One optional keyword out of `cases`.
    fn optional(&mut self, cases: &[&str]) -> bool {
        cases.iter().any(|k| self.p.eat_kw(k))
    }

    /// `LLVM::isCompatibleType`, as far as builtin types go: integers, floats, vectors of them;
    /// a dialect type is left to its dialect.
    fn compatible(&mut self, t: &Type<'_>) -> R<()> {
        let ok = match t {
            Type::Integer { .. } | Type::Float(_) | Type::Extended(_) => true,
            Type::Shaped(s) => s.kind == ShapedKind::Vector && matches!(*s.elem, Type::Integer { .. } | Type::Float(_) | Type::Extended(_)),
            _ => false,
        };
        if ok { Ok(()) } else { self.p.err(alloc::format!("expected LLVM type, got '{t}'")) }
    }

    /// `[linkage] [visibility] [unnamed_addr] [cconv] @name(args) [-> results]`, up to the
    /// optional clauses after the signature.
    fn func(&mut self) -> R<()> {
        self.optional(LINKAGES);
        self.optional(VISIBILITIES);
        self.optional(UNNAMED_ADDRS);
        self.optional(CCONVS);
        if !self.p.at(b'@') {
            return self.p.err("expected valid '@'-identifier for symbol name");
        }
        self.p.sym_name()?;
        self.p.expect("(")?;
        if !self.p.eat(")") {
            loop {
                if self.p.eat("...") {
                    if !self.p.eat(")") {
                        return self.p.err("variadic arguments must be in the end of the argument list");
                    }
                    break;
                }
                if self.p.at(b'%') {
                    self.p.sigil('%')?;
                    self.p.expect(":")?;
                }
                let t = self.p.ty()?;
                self.compatible(&t)?;
                self.p.opt_dict()?;
                self.p.opt_loc()?;
                if !self.p.eat(",") {
                    self.p.expect(")")?;
                    break;
                }
            }
        }
        if self.p.eat("->") {
            let results = if self.p.eat("(") {
                let mut n = 0;
                if !self.p.eat(")") {
                    loop {
                        let t = self.p.ty()?;
                        self.compatible(&t)?;
                        self.p.opt_dict()?;
                        n += 1;
                        if !self.p.eat(",") {
                            self.p.expect(")")?;
                            break;
                        }
                    }
                }
                n
            } else {
                let t = self.p.ty()?;
                self.compatible(&t)?;
                1
            };
            if results > 1 {
                return self.p.err("expected zero or one function result");
            }
        }
        Ok(())
    }

    /// `[linkage] [visibility] [thread_local] [unnamed_addr] [constant] @name([value])
    /// [comdat(..)] [{..}] [: type]`: one type at most, none only for a string value.
    fn global(&mut self) -> R<()> {
        self.optional(LINKAGES);
        self.optional(VISIBILITIES);
        self.p.eat_kw("thread_local");
        self.optional(UNNAMED_ADDRS);
        self.p.eat_kw("constant");
        self.p.sym_name()?;
        self.p.expect("(")?;
        let value = if self.p.eat(")") {
            None
        } else {
            let a = self.p.attr()?;
            self.p.expect(")")?;
            Some(a)
        };
        if self.p.eat_kw("comdat") {
            self.p.expect("(")?;
            self.p.attr()?;
            self.p.expect(")")?;
        }
        self.p.opt_dict()?;
        let types = if self.p.eat(":") {
            let mut n = 1;
            self.p.ty()?;
            while self.p.eat(",") {
                self.p.ty()?;
                n += 1;
            }
            n
        } else {
            0
        };
        match (types, value) {
            (2.., _) => self.p.err("expected zero or one type"),
            (0, Some(Attribute::Str { .. })) => Ok(()),
            (0, _) => self.p.err("type can only be omitted for string globals"),
            _ => Ok(()),
        }
    }
}

/// The LLVM dialect's rules.
pub(super) struct Llvm;

impl Llvm {
    /// A raw custom form's header: the text before its first region.
    fn header<'o>(op: &'o Operation<'_>) -> Option<&'o str> {
        match op.raw.as_deref()?.first()? {
            Piece::Text(t) => Some(t),
            Piece::Region(_) => Some(""),
        }
    }

    fn why(opt: &MlirOpt, kind: OpKind, text: &str) -> Result<(), String> {
        let mut l = LlvmText { p: Parser::new(text, opt) };
        match kind {
            OpKind::Func => l.func(),
            OpKind::Global => l.global(),
        }
        .map_err(|e| e.placed(text).to_string())
    }
}

impl DialectRules for Llvm {
    #[inline]
    fn namespace(&self) -> &'static str {
        "llvm"
    }

    fn op(&self, v: &Verifier<'_>, op: &Operation<'_>) -> Result<(), Invalid> {
        let Some(kind) = op.name.strip_prefix("llvm.").and_then(|m| OpKind::try_from(m).ok()) else { return Ok(()) };
        let Some(text) = Self::header(op) else { return Ok(()) };
        Self::why(v.opt, kind, text).map_err(|why| Invalid::DialectOp { op: op.name.to_string(), why })
    }

    /// `#llvm.cconv<..>` / `#llvm.linkage<..>`: one of the enum's cases.
    fn attr(&self, _v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        let Attribute::Extended { ext, .. } = a else { return Ok(()) };
        let cases = match ext.mnemonic() {
            "cconv" => CCONVS,
            "linkage" => LINKAGES,
            _ => return Ok(()),
        };
        let case = ext.body.as_deref().and_then(|b| b.trim().strip_prefix('<')?.strip_suffix('>')).map(str::trim);
        match case {
            Some(c) if !cases.contains(&c) => Err(Invalid::DialectAttr { attr: a.to_string(), why: alloc::format!("expected one of {cases:?}") }),
            _ => Ok(()),
        }
    }
}
