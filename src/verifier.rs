//! ⭐ What `mlir-opt` rejects while it reads text, checked on the IR read from it.
//!
//! The parser keeps attribute and type bodies as text and reads a custom form as far as its
//! format goes, so text `mlir-opt` refuses can still read here. [`Verify`] is the one place that
//! refuses it afterwards: every IR node says what makes it invalid, [`MlirOpt::verify`] walks a
//! module. What only `mlir-opt`'s verifier (ODS constraints, an op's `verify()`) rejects is not
//! checked here.
//!
//! This file is the structure every dialect shares: the walk, aliases, locations, SSA scopes.
//! What one dialect's types and attributes must be is its [`DialectRules`], one file each under
//! `verifier/` (`arm_sve.rs`, `builtin.rs`, `llvm.rs`, `ptr.rs`, `quant.rs`, `spirv.rs`, `xegpu.rs`), listed in [`DIALECTS`].

use alloc::string::{String, ToString};
use alloc::vec::Vec;

/// `arm_sve` ops.
mod arm_sve;
/// The builtin types and attributes.
mod builtin;
/// LLVM dialect ops and attributes.
mod llvm;
/// ODS constraints of inherent attributes.
mod ods;
/// `ptr` attributes.
mod ptr;
/// `quant` types.
mod quant;
/// SPIR-V types.
mod spirv;
/// XeGPU types and attributes.
mod xegpu;

use crate::{Attribute, Block, BlockArg, Extended, FunctionType, Item, MlirOpt, Module, NamedAttr, Operation, Region, Shaped, Type};

/// Why `mlir-opt` would not read it. The text is the offending one, copied only on failure.
#[derive(Debug, Clone, PartialEq, Eq, thiserror::Error)]
pub enum Invalid {
    /// `affine_map<(i, j) -> (x)>`: undeclared or redefined identifier, non-affine expression,
    /// malformed text.
    #[error("invalid affine map `{0}`")]
    AffineMap(String),
    /// `affine_set<(i) : (i)>`: as [`Invalid::AffineMap`], or a constraint without `== 0` / `>= 0`.
    #[error("invalid integer set `{0}`")]
    AffineSet(String),
    /// `#a = ...` twice.
    #[error("redefinition of attribute alias id `{0}`")]
    AttrAliasRedefined(String),
    /// `!t = ...` twice.
    #[error("redefinition of type alias id `{0}`")]
    TypeAliasRedefined(String),
    /// A custom form its op's format does not read (`affine.for %i = 1 too 10`): the op is
    /// registered with a custom format, yet the text stayed raw.
    #[error("`{0}`: custom form does not match the op's syntax")]
    CustomForm(String),
    /// `dense<"0x...">`: not `0x` and hex digits, or not one element / every element's bytes.
    #[error("invalid hex elements `{0}`")]
    DenseHex(String),
    /// `dense<[1.5, 2]> : tensor<3xi32>`: a literal not of the type's shape, or a float literal
    /// of an integer type.
    #[error("invalid dense literal `{0}`")]
    DenseLiteral(String),
    /// `-1 : i0`: an integer its type cannot hold.
    #[error("integer constant out of range for attribute `{0}`")]
    IntRange(String),
    /// `array<tf32: ..>`: a dense array of elements that are not whole bytes.
    #[error("element type bitwidth must be a multiple of 8: `{0}`")]
    DenseArrayWidth(String),
    /// `vector<memref<2xf32>>`: a vector holds integers, floats, `index` or a dialect's
    /// `VectorElementTypeInterface` type.
    #[error("invalid vector element type `{0}`")]
    VectorElement(String),
    /// `loc()`.
    #[error("expected location instance")]
    EmptyLocation,
    /// `loc(#a)` with no `#a = loc(..)` in the module.
    #[error("location alias `#{0}` was never defined")]
    LocationAlias(String),
    /// `loc(#a)` where `#a` is no location (`#a = true`).
    #[error("`#{0}` is not a location")]
    NotLocation(String),
    /// A dialect type's body its dialect would not read (`!quant.uniform<i33:f32, 1.0>`).
    #[error("invalid type `{ty}`: {why}")]
    DialectType { ty: String, why: String },
    /// An op's custom form its dialect's parser would not read (`llvm.func @f(..., i32)`).
    #[error("`{op}`: {why}")]
    DialectOp { op: String, why: String },
    /// A dialect attribute its dialect would not read or verify (`#xegpu.layout<sg_data = [8]>`).
    #[error("invalid attribute `{attr}`: {why}")]
    DialectAttr { attr: String, why: String },
    /// An inherent attribute its ODS constraint refuses (`function_type = i64` on `llvm.func`).
    #[error("`{op}`: attribute `{attr}` fails its ODS constraint")]
    AttrConstraint { op: String, attr: String },
    /// `%x` used where no `%x` is in scope.
    #[error("use of undeclared SSA value name `%{0}`")]
    UndeclaredValue(String),
    /// `%x` used as another type than it has, or than other uses gave it.
    #[error("use of value `%{0}` expects different type than prior uses: `{1}`")]
    ValueType(String, String),
    /// An op's operand naming an entry argument of its own region, which nothing outside the
    /// region sees (`affine.for %i = #map(%i)`).
    #[error("region entry argument `%{0}` is already in use")]
    RegionArgInUse(String),
    /// `%x` defined where a `%x` is already in scope.
    #[error("redefinition of SSA value `%{0}`")]
    RedefinedValue(String),
}

impl From<Invalid> for crate::Error {
    #[inline]
    fn from(e: Invalid) -> Self {
        Self(e.to_string())
    }
}

/// What a check sees: the converter (its dialects), the module's aliases defined so far, and the
/// location aliases used (a location may name an alias defined further down).
pub struct Verifier<'x> {
    pub opt: &'x MlirOpt,
    attr_aliases: Vec<(&'x str, &'x Attribute<'x>)>,
    type_aliases: Vec<&'x str>,
    loc_aliases: Vec<&'x str>,
    /// The values each enclosing region has defined so far, innermost last (MLIR's
    /// `definitionsPerScope`): a region's go out of scope at its end. Each name with the types
    /// of its values (`%0:2` two), where known.
    scopes: Vec<Vec<(&'x str, Vec<Option<&'x Type<'x>>>)>>,
    /// Where the innermost isolated-from-above op's regions start in `scopes`: nothing below is
    /// visible.
    floor: usize,
    /// Names used before any definition, per isolated scope (`forwardRefPlaceholders`), with the
    /// types their uses gave (by result number): a later definition anywhere in that scope
    /// resolves one; one left at its end is undeclared.
    forward: Vec<Vec<(&'x str, Vec<(u32, &'x Type<'x>)>)>>,
    /// Inside a raw op's regions: their entry arguments are in its unread header, so a use there
    /// is not judged.
    opaque: usize,
}

impl<'x> Verifier<'x> {
    #[inline]
    pub fn new(opt: &'x MlirOpt) -> Self {
        Self { opt, attr_aliases: Vec::new(), type_aliases: Vec::new(), loc_aliases: Vec::new(), scopes: alloc::vec![Vec::new()], floor: 0, forward: alloc::vec![Vec::new()], opaque: 0 }
    }

    /// The types of `%name` if it is defined and visible here.
    #[inline]
    fn visible(&self, name: &str) -> Option<&[Option<&'x Type<'x>>]> {
        self.scopes[self.floor..].iter().rev().find_map(|s| s.iter().find(|(n, _)| *n == name)).map(|(_, t)| t.as_slice())
    }

    /// The same type, as MLIR compares them ([`builtin::Builtin::same`]).
    #[inline]
    fn same(a: &Type<'_>, b: &Type<'_>) -> bool {
        builtin::Builtin::same(a, b)
    }

    /// `%name` defined here with its values' types (`defineSSAValue`): not over one in scope;
    /// it resolves a forward use, which must have used these types.
    fn define(&mut self, name: &'x str, tys: Vec<Option<&'x Type<'x>>>) -> Result<(), Invalid> {
        if self.visible(name).is_some() {
            return Err(Invalid::RedefinedValue(name.into()));
        }
        if let Some(f) = self.forward.last_mut()
            && let Some(i) = f.iter().position(|(n, _)| *n == name)
        {
            let (_, used) = f.remove(i);
            if let Some((_, t)) = used.iter().find(|(k, t)| tys.get(*k as usize).copied().flatten().is_some_and(|d| !Self::same(d, t))) {
                return Err(Invalid::ValueType(name.into(), t.to_string()));
            }
        }
        if let Some(s) = self.scopes.last_mut() {
            s.push((name, tys));
        }
        Ok(())
    }

    /// `%name#k` used here as `ty` (`resolveSSAUse`): defined with that type, or a forward use
    /// to be defined later, every use of it with one type.
    fn use_value(&mut self, value: &'x crate::Value<'x>, ty: Option<&'x Type<'x>>) -> Result<(), Invalid> {
        if self.opaque > 0 {
            return Ok(());
        }
        let k = value.index.unwrap_or(0);
        if let Some(tys) = self.visible(&value.name) {
            return match (tys.get(k as usize).copied().flatten(), ty) {
                (Some(d), Some(t)) if !Self::same(d, t) => Err(Invalid::ValueType(value.name.to_string(), t.to_string())),
                _ => Ok(()),
            };
        }
        let Some(f) = self.forward.last_mut() else { return Ok(()) };
        let used = match f.iter_mut().find(|(n, _)| *n == &*value.name) {
            Some((_, used)) => used,
            None => {
                f.push((&value.name, Vec::new()));
                &mut f.last_mut().expect("just pushed").1
            }
        };
        if let Some(t) = ty {
            match used.iter().find(|(i, _)| *i == k) {
                Some((_, u)) if !Self::same(u, t) => return Err(Invalid::ValueType(value.name.to_string(), t.to_string())),
                Some(_) => {}
                None => used.push((k, t)),
            }
        }
        Ok(())
    }

    /// The end of an isolated scope (the module, an isolated op): no forward use left.
    fn close(&mut self) -> Result<(), Invalid> {
        match self.forward.last_mut().and_then(|f| f.first()) {
            Some((name, _)) => Err(Invalid::UndeclaredValue((*name).into())),
            None => Ok(()),
        }
    }

    /// An op's regions, each a scope; `isolated`: they see nothing outside and resolve their own
    /// forward uses; `opaque`: their uses are not judged.
    fn regions(&mut self, regions: impl Iterator<Item = &'x Region<'x>>, isolated: bool, opaque: bool) -> Result<(), Invalid> {
        let floor = self.floor;
        if isolated {
            self.floor = self.scopes.len();
            self.forward.push(Vec::new());
        }
        self.opaque += usize::from(opaque);
        let mut r = regions.into_iter().try_for_each(|region| {
            self.scopes.push(Vec::new());
            let r = region.blocks.verify(self);
            self.scopes.pop();
            r
        });
        if isolated {
            r = r.and_then(|()| self.close());
            self.forward.pop();
        }
        self.opaque -= usize::from(opaque);
        self.floor = floor;
        r
    }

    /// The dialect types (`!ns.x<..>`) and attributes (`#ns.x<..>`) written in a raw op's text,
    /// each read and checked as if it stood in a structured op.
    fn raw_text(&mut self, text: &str) -> Result<(), Invalid> {
        let bytes = text.as_bytes();
        let mut i = 0;
        while i < bytes.len() {
            let sigil = bytes[i];
            // A dialect name: `ns.mnemonic` right after the sigil.
            let name = text[i + 1..].bytes().take_while(|c| c.is_ascii_alphanumeric() || matches!(c, b'_' | b'.')).count();
            // A builtin keyword attribute (`dense<..>`, `affine_map<..>`, `array<..>`) at a word start.
            let word_start = i == 0 || !(bytes[i - 1].is_ascii_alphanumeric() || matches!(bytes[i - 1], b'_' | b'.' | b'$' | b'%' | b'#' | b'!' | b'@'));
            if word_start && ["dense<", "affine_map<", "affine_set<", "array<"].iter().any(|k| text[i..].starts_with(k)) {
                if let Some((len, r)) = Self::check_raw(crate::Parser::new(&text[i..], self.opt), false, self.opt) {
                    r?;
                    i += len.max(1);
                    continue;
                }
            }
            if matches!(sigil, b'!' | b'#') && text[i + 1..i + 1 + name].contains('.') {
                let rest = &text[i..];
                let opt = self.opt;
                let read = crate::Parser::new(rest, opt);
                let r = Self::check_raw(read, sigil == b'!', opt);
                if let Some((len, r)) = r {
                    r?;
                    i += len.max(1);
                    continue;
                }
            }
            i += 1;
        }
        Ok(())
    }

    /// One type (`ty`) or attribute at the start of `p`'s text, checked by its dialect's rules:
    /// how long it is, and the verdict; `None` when it does not read (left to the op's own reader).
    fn check_raw(mut p: crate::Parser<'_, '_>, ty: bool, opt: &MlirOpt) -> Option<(usize, Result<(), Invalid>)> {
        let v = Verifier::new(opt);
        let r = if ty {
            let t = p.ty().ok()?;
            match &t {
                Type::Extended(e) => rules(&e.name).map_or(Ok(()), |d| d.ty(&v, &t)),
                _ => Ok(()),
            }
        } else {
            let a = p.attr().ok()?;
            match &a {
                Attribute::Extended { ext, .. } => rules(&ext.name).map_or(Ok(()), |d| d.attr(&v, &a)),
                a => builtin::Builtin.attr(&v, a),
            }
        };
        Some((p.pos(), r))
    }

    /// The text inside a `loc(..)`: not empty; an alias is resolved once the module is read.
    fn loc(&mut self, loc: &'x Option<crate::Str<'x>>) -> Result<(), Invalid> {
        match loc.as_deref().map(str::trim) {
            Some("") => Err(Invalid::EmptyLocation),
            Some(l) if let Some(name) = l.strip_prefix('#').filter(|n| n.bytes().all(|c| c.is_ascii_alphanumeric() || matches!(c, b'_' | b'$' | b'.' | b'-'))) => {
                self.loc_aliases.push(name);
                Ok(())
            }
            _ => Ok(()),
        }
    }
}

/// ⭐ An IR node `mlir-opt` may refuse to read: `Err` is the first reason it would.
pub trait Verify<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid>;
}

/// Containers: every element.
macro_rules! verify_each {
    ($($(#[$m:meta])* $ty:ty => |$x:ident| $iter:expr;)*) => {$(
        $(#[$m])*
        impl<'x, T: Verify<'x>> Verify<'x> for $ty {
            #[inline]
            fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
                let $x = self;
                $iter.try_for_each(|t| t.verify(v))
            }
        }
    )*};
}

verify_each! {
    [T] => |xs| xs.iter();
    Vec<T> => |xs| xs.iter();
    Option<T> => |x| x.iter();
    alloc::boxed::Box<T> => |x| core::iter::once(&**x);
}

impl<'x> Verify<'x> for Module<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        // The top level is the implicit module's region, an isolated scope.
        self.items.verify(v)?;
        v.close()?;
        // Every location alias used is defined, and is a location.
        for name in core::mem::take(&mut v.loc_aliases) {
            match v.attr_aliases.iter().find(|(n, _)| *n == name) {
                None => return Err(Invalid::LocationAlias(name.into())),
                Some((_, Attribute::Builtin { name: kind, .. })) if kind == "loc" => {}
                Some(_) => return Err(Invalid::NotLocation(name.into())),
            }
        }
        Ok(())
    }
}

impl<'x> Verify<'x> for Item<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        match self {
            Item::AttrAlias { name, value } => {
                if v.attr_aliases.iter().any(|(n, _)| n == name) {
                    return Err(Invalid::AttrAliasRedefined(name.to_string()));
                }
                v.attr_aliases.push((name, value));
                value.verify(v)
            }
            Item::TypeAlias { name, ty } => {
                if v.type_aliases.contains(&&**name) {
                    return Err(Invalid::TypeAliasRedefined(name.to_string()));
                }
                v.type_aliases.push(name);
                ty.verify(v)
            }
            Item::Metadata { .. } => Ok(()),
            Item::Op(op) => op.verify(v),
        }
    }
}

impl<'x> Verify<'x> for Operation<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        if self.raw.is_some() && v.opt.template(&self.name).is_some_and(|t| t.custom) {
            return Err(Invalid::CustomForm(self.name.to_string()));
        }
        v.loc(&self.loc)?;
        if let Some(u) = self.operands.iter().find(|u| self.regions.iter().filter_map(|r| r.blocks.first()).any(|b| b.args.iter().any(|a| a.name == u.name))) {
            return Err(Invalid::RegionArgInUse(u.name.to_string()));
        }
        // An operand's type, when the op says one per operand.
        let typed = self.ty.inputs.len() == self.operands.len();
        for (i, u) in self.operands.iter().enumerate() {
            v.use_value(u, typed.then(|| &self.ty.inputs[i]))?;
        }
        rules(&self.name).map_or(Ok(()), |d| d.op(v, self))?;
        // Each inherent attribute present, against its ODS constraint (`verifyInherentAttrs`).
        let props = match &self.properties {
            Some(Attribute::Dict(xs)) => xs.as_slice(),
            _ => &[],
        };
        for (name, c) in ods::C::of_op(&self.name) {
            if let Some(a) = props.iter().chain(&self.attributes).find(|a| a.name == *name)
                && !c.admits(a.value.as_ref())
            {
                return Err(Invalid::AttrConstraint { op: self.name.to_string(), attr: (*name).into() });
            }
        }
        self.properties.verify(v)?;
        self.attributes.verify(v)?;
        self.ty.verify(v)?;
        // A raw custom form still spells types and attributes: each dialect one in its text is
        // read and checked.
        for t in self.raw.iter().flatten().filter_map(|p| if let crate::Piece::Text(t) = p { Some(t) } else { None }) {
            v.raw_text(t)?;
        }
        let isolated = v.opt.op_info(&self.name).is_some_and(|i| i.has(crate::Trait::IsIsolatedFromAbove));
        let raw = self.raw.iter().flatten().filter_map(|p| if let crate::Piece::Region(r) = p { Some(r) } else { None });
        // A raw header that names values (`scf.for %i = ..`) may give its regions arguments
        // unseen here; one that names none (`test.graph_region {`) gives none.
        let names = self.raw.iter().flatten().any(|p| matches!(p, crate::Piece::Text(t) if t.contains('%')));
        v.regions(self.regions.iter(), isolated, false)?;
        v.regions(raw, isolated, names)?;
        // Results are defined once the whole op is read, `%0:2` two of them; typed when the op
        // gives every result one.
        let counts: usize = self.results.iter().map(|d| d.count.unwrap_or(1) as usize).sum();
        let mut tys = self.ty.results.iter().map(Some).chain(core::iter::repeat(None)).map(|t| t.filter(|_| counts == self.ty.results.len()));
        self.results.iter().try_for_each(|d| v.define(&d.name, tys.by_ref().take(d.count.unwrap_or(1) as usize).collect()))
    }
}

impl<'x> Verify<'x> for Region<'x> {
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        self.blocks.verify(v)
    }
}

impl<'x> Verify<'x> for Block<'x> {
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        self.args.verify(v)?;
        self.args.iter().try_for_each(|a| v.define(&a.name, alloc::vec![Some(&a.ty)]))?;
        self.ops.verify(v)
    }
}

impl<'x> Verify<'x> for BlockArg<'x> {
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        v.loc(&self.loc)?;
        self.ty.verify(v)
    }
}

impl<'x> Verify<'x> for NamedAttr<'x> {
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        self.value.verify(v)
    }
}

impl<'x> Verify<'x> for FunctionType<'x> {
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        self.inputs.verify(v)?;
        self.results.verify(v)
    }
}

impl<'x> Verify<'x> for Type<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        match self {
            Type::Extended(e) => rules(&e.name).map_or(Ok(()), |d| d.ty(v, self))?,
            _ => builtin::Builtin.ty(v, self)?,
        }
        match self {
            Type::Complex(t) => t.verify(v),
            Type::Tuple(ts) => ts.verify(v),
            Type::Function(f) => f.verify(v),
            Type::Shaped(s) => s.verify(v),
            Type::Extended(e) => e.verify(v),
            Type::Integer { .. } | Type::Float(_) | Type::Index | Type::NoneType => Ok(()),
        }
    }
}

impl<'x> Verify<'x> for Shaped<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        self.elem.verify(v)?;
        self.extras.verify(v)
    }
}

impl<'x> Verify<'x> for Extended<'x> {
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        self.params.verify(v)
    }
}

impl<'x> Verify<'x> for Attribute<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        match self {
            Attribute::Extended { ext, .. } => rules(&ext.name).map_or(Ok(()), |d| d.attr(v, self))?,
            _ => builtin::Builtin.attr(v, self)?,
        }
        match self {
            Attribute::Builtin { ty, .. } | Attribute::Int { ty, .. } | Attribute::Float { ty, .. } | Attribute::Str { ty, .. } => ty.verify(v),
            Attribute::Type(t) => t.verify(v),
            Attribute::Array(xs) => xs.verify(v),
            Attribute::Dict(xs) => xs.verify(v),
            Attribute::DenseArray { ty, .. } => ty.verify(v),
            Attribute::Extended { ext, ty } => {
                // A dialect attribute's body kept as text may hold more dialect attributes and
                // types (`#dlti.dl_entry<.., #ptr.spec<..>>`): each is checked too.
                if let Some(b) = &ext.body {
                    v.raw_text(b.get(1..).unwrap_or(""))?;
                }
                ext.verify(v)?;
                ty.verify(v)
            }
            Attribute::Unit | Attribute::Bool(_) | Attribute::SymbolRef(_) => Ok(()),
        }
    }
}

/// ⭐ One dialect's rules: what its types and attributes must be for `mlir-opt` to read them
/// (the dialect's own `parseType` / `parseAttribute` and their `verifyInvariants`). One
/// implementation per file under `verifier/`; the walk calls the one owning each node.
trait DialectRules: Sync {
    /// Its namespace (`quant`); `builtin` owns the types and attributes without one.
    fn namespace(&self) -> &'static str;

    /// One of its types, before the walk goes into it.
    #[inline]
    fn ty(&self, _v: &Verifier<'_>, _t: &Type<'_>) -> Result<(), Invalid> {
        Ok(())
    }

    /// One of its attributes, before the walk goes into it.
    #[inline]
    fn attr(&self, _v: &Verifier<'_>, _a: &Attribute<'_>) -> Result<(), Invalid> {
        Ok(())
    }

    /// One of its ops, before the walk goes into it (a raw custom form included).
    #[inline]
    fn op(&self, _v: &Verifier<'_>, _op: &Operation<'_>) -> Result<(), Invalid> {
        Ok(())
    }
}

/// Every dialect with rules.
const DIALECTS: &[&dyn DialectRules] = &[&arm_sve::ArmSve, &builtin::Builtin, &llvm::Llvm, &ptr::Ptr, &quant::Quant, &spirv::Spirv, &xegpu::XeGpu];

/// The rules of the dialect owning `!ns.mnemonic` / `#ns.mnemonic`; an alias (`!t`, `#map`)
/// has none: its definition is checked.
#[inline]
fn rules(name: &str) -> Option<&'static dyn DialectRules> {
    let ns = name.split_once('.')?.0;
    DIALECTS.iter().copied().find(|d| d.namespace() == ns)
}

impl Extended<'_> {
    /// `mnemonic` of `ns.mnemonic`.
    #[inline]
    fn mnemonic(&self) -> &str {
        self.name.split_once('.').map_or(&*self.name, |(_, m)| m)
    }
}

impl MlirOpt {
    /// ⭐ `Err` when `mlir-opt` would not read the text `m` was read from (see [`Verify`]).
    #[inline]
    pub fn verify<'x>(&'x self, m: &'x Module<'x>) -> Result<(), Invalid> {
        m.verify(&mut Verifier::new(self))
    }
}
