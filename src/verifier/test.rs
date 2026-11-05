//! The `test` dialect's types and attributes that `mlir-opt` (which registers it) reads by
//! their own parsers: `test/lib/Dialect/Test/{TestAttrDefs,TestTypeDefs,TestOps}.td`,
//! `TestAttributes.cpp`, `TestTypes.cpp`.

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::{Attribute, MlirOpt, Parser, R, Signedness, Type};

keywords! {
    /// The `test` attributes checked here.
    enum AttrKind {
        CustomStruct = "custom_struct",
        CustomFloat = "custom_float",
        BitEnum = "bit_enum",
        DecimalShape = "decimal_shape",
        DynamicSingleton = "dynamic_singleton",
        DynamicPair = "dynamic_pair",
    }
}

keywords! {
    /// The `test` types checked here.
    enum TypeKind {
        TypeVerification = "type_verification",
        Struct = "struct",
        DynamicSingleton = "dynamic_singleton",
        DynamicPair = "dynamic_pair",
    }
}

keywords! {
    /// `#test.custom_struct`'s parameters (`struct(params)`).
    enum StructParam {
        TypeStr = "type_str",
        Value = "value",
        OptValue = "opt_value",
    }
}

keywords! {
    /// `TestBitEnum`'s cases.
    enum BitCase {
        Read = "read",
        Write = "write",
        Execute = "execute",
    }
}

keywords! {
    /// `parseCustomFloatAttr`'s float types, by their bit width.
    enum FloatName {
        Float = "float",
        Double = "double",
        Fp80 = "fp80",
    }
}

impl FloatName {
    /// `APFloat::semanticsSizeInBits`.
    #[inline]
    fn bits(self) -> u32 {
        match self {
            FloatName::Float => 32,
            FloatName::Double => 64,
            FloatName::Fp80 => 80,
        }
    }
}

/// A cursor over one `test` attribute or type body.
struct TestText<'a, 'd> {
    p: Parser<'a, 'd>,
}

impl TestText<'_, '_> {
    /// The rest is `>` and nothing more.
    fn close(&mut self) -> R<()> {
        self.p.expect(">")?;
        self.p.ws();
        if self.p.rest().is_empty() { Ok(()) } else { self.p.err("expected end of the attribute") }
    }

    /// `struct($type_str, custom<CustomStructAttr>($value), custom<CustomOptStructFieldAttr>($opt_value))`:
    /// `name = value` in any order, each once, the two required ones present.
    fn custom_struct(&mut self) -> R<()> {
        self.p.expect("<")?;
        let mut seen: Vec<StructParam> = Vec::new();
        loop {
            let Ok(name) = self.p.ident() else { return self.p.err("expected valid keyword") };
            let param = match StructParam::try_from(name) {
                Ok(k) if !seen.contains(&k) => k,
                _ => return self.p.err(alloc::format!("duplicate or unknown struct parameter name: {name}")),
            };
            self.p.expect("=").or_else(|_| self.p.err("expected '='"))?;
            match param {
                StructParam::TypeStr => drop(self.p.string()?),
                // `?` or an integer.
                StructParam::Value if self.p.eat("?") => {}
                StructParam::Value => {
                    self.p.eat("-");
                    self.p.number::<u64>()?;
                }
                // An integer, or an array.
                StructParam::OptValue => drop(self.p.bare_attr()?),
            }
            seen.push(param);
            if !self.p.eat(",") {
                break;
            }
        }
        if let Some(missing) = [StructParam::TypeStr, StructParam::Value].into_iter().find(|k| !seen.contains(k)) {
            return self.p.err(alloc::format!("struct is missing required parameter: {missing}"));
        }
        self.close()
    }

    /// `<"float" : literal>`: `AsmParser::parseFloat` of that type (`parseFloatFromIntegerLiteral`).
    fn custom_float(&mut self) -> R<()> {
        self.p.expect("<")?;
        let name = self.p.string()?;
        self.p.expect(":")?;
        let Ok(kind) = FloatName::try_from(name) else { return self.p.err("unknown float type, expected 'float', 'double' or 'fp80'") };
        let neg = self.p.eat("-");
        self.p.ws();
        let text = self.p.rest();
        let len = text.bytes().take_while(|c| c.is_ascii_alphanumeric() || matches!(c, b'.' | b'+' | b'-')).count();
        let lit = &text[..len];
        match lit.strip_prefix("0x") {
            _ if lit.is_empty() || !lit.starts_with(|c: char| c.is_ascii_digit()) => return self.p.err("expected floating point literal"),
            Some(_) if neg => return self.p.err("hexadecimal float literal should not have a leading minus"),
            Some(hex) => {
                let digits = hex.trim_start_matches('0');
                let top = digits.chars().next().and_then(|c| c.to_digit(16)).map_or(0, |d| 32 - d.leading_zeros());
                if (digits.len() as u32).saturating_sub(1) * 4 + top > kind.bits() {
                    return self.p.err("hexadecimal float constant out of range for type");
                }
            }
            None if !lit.contains(['.', 'e', 'E']) => return self.p.err("unexpected decimal integer literal for a floating point value"),
            None => {}
        }
        self.p.skip(len);
        self.close()
    }

    /// `<read, write>`: `TestBitEnum` cases, `, `-separated.
    fn bit_enum(&mut self) -> R<()> {
        self.p.expect("<")?;
        loop {
            let w = self.p.ident()?;
            if BitCase::try_from(w).is_err() {
                return self.p.err(alloc::format!("expected one of [read, write, execute] for a test bit enum, got: {w}"));
            }
            if !self.p.eat(",") {
                break;
            }
        }
        self.close()
    }

    /// `<1x2x3>`: decimal integers (`parseOptionalDecimalInteger`), `x`-separated (`1x0xb` is not).
    fn decimal_shape(&mut self) -> R<()> {
        self.p.expect("<")?;
        self.p.ws();
        if self.p.eat(">") {
            return Ok(());
        }
        loop {
            // `0x3` is `0`, then the next dim (`parseOptionalDecimalInteger` splits a hex token).
            let digits = self.p.rest().bytes().take_while(u8::is_ascii_digit).count();
            if digits == 0 {
                return self.p.err("expected an integer");
            }
            self.p.skip(digits);
            if self.p.rest().starts_with('x') {
                self.p.skip(1);
                continue;
            }
            break;
        }
        self.close()
    }

    /// `<{name, type}, ..>`.
    fn structure(&mut self) -> R<()> {
        self.p.expect("<")?;
        while self.p.eat("{") {
            self.p.ident().or_else(|_| self.p.err("expected valid keyword"))?;
            self.p.expect(",")?;
            self.p.ty()?;
            self.p.expect("}")?;
            if !self.p.eat(",") {
                break;
            }
        }
        self.close()
    }
}

/// How many comma-separated parameters a body `<a, b<c, d>>` has.
fn param_count(body: Option<&str>) -> usize {
    let Some(inner) = body.and_then(|b| b.trim().strip_prefix('<')?.strip_suffix('>')) else { return 0 };
    if inner.trim().is_empty() {
        return 0;
    }
    let mut depth = 0i32;
    1 + inner
        .chars()
        .filter(|c| {
            match c {
                '<' | '(' | '[' | '{' => depth += 1,
                '>' | ')' | ']' | '}' => depth -= 1,
                _ => {}
            }
            *c == ',' && depth == 0
        })
        .count()
}

/// The `test` dialect's rules.
pub(super) struct Test;

impl Test {
    /// A dynamic type or attribute (`TestAttributes.cpp` / `TestTypes.cpp`'s `DynamicTypeDefinition`):
    /// as many parameters as it was registered with.
    fn dynamic(body: Option<&str>, want: usize, what: &str) -> Result<(), String> {
        match param_count(body) {
            n if n == want => Ok(()),
            n => Err(alloc::format!("expected {want} {what} arguments, but had {n}")),
        }
    }

    /// Reads `body` with `f`.
    fn read<'a, 'd>(opt: &'d MlirOpt, body: &'a str, f: impl FnOnce(&mut TestText<'a, 'd>) -> R<()>) -> Result<(), String> {
        let mut t = TestText { p: Parser::new(body, opt) };
        f(&mut t).map_err(|e| e.placed(body).to_string())
    }
}

impl DialectRules for Test {
    #[inline]
    fn namespace(&self) -> &'static str {
        "test"
    }

    fn ty(&self, v: &Verifier<'_>, t: &Type<'_>) -> Result<(), Invalid> {
        let Type::Extended(e) = t else { return Ok(()) };
        let body = e.body.as_deref();
        let r = match TypeKind::try_from(e.mnemonic()) {
            Ok(TypeKind::DynamicSingleton) => Self::dynamic(body, 0, "type"),
            Ok(TypeKind::DynamicPair) => Self::dynamic(body, 2, "type"),
            Ok(TypeKind::Struct) => Self::read(v.opt, body.unwrap_or(""), TestText::structure),
            // `AnyTypeOf<[I16, I32]>:$param`.
            Ok(TypeKind::TypeVerification) => match body.and_then(|b| Parser::read(b.trim().strip_prefix('<')?.strip_suffix('>')?, |p| p.ty()).ok()) {
                Some(Type::Integer { signedness: Signedness::Signless, width: 16 | 32 }) | None => Ok(()),
                Some(_) => Err("failed to verify 'param': 16-bit signless integer or 32-bit signless integer".into()),
            },
            Err(()) => Ok(()),
        };
        r.map_err(|why| Invalid::DialectType { ty: t.to_string(), why })
    }

    fn attr(&self, v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        let Attribute::Extended { ext, .. } = a else { return Ok(()) };
        let body = ext.body.as_deref();
        let r = match AttrKind::try_from(ext.mnemonic()) {
            Ok(AttrKind::DynamicSingleton) => Self::dynamic(body, 0, "attribute"),
            Ok(AttrKind::DynamicPair) => Self::dynamic(body, 2, "attribute"),
            Ok(AttrKind::CustomStruct) => Self::read(v.opt, body.unwrap_or(""), TestText::custom_struct),
            Ok(AttrKind::CustomFloat) => Self::read(v.opt, body.unwrap_or(""), TestText::custom_float),
            Ok(AttrKind::BitEnum) => Self::read(v.opt, body.unwrap_or(""), TestText::bit_enum),
            Ok(AttrKind::DecimalShape) => Self::read(v.opt, body.unwrap_or(""), TestText::decimal_shape),
            Err(()) => Ok(()),
        };
        r.map_err(|why| Invalid::DialectAttr { attr: a.to_string(), why })
    }
}
