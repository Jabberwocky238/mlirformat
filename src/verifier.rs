use alloc::string::{String, ToString};
use alloc::vec::Vec;

mod acc;

mod arm_sve;

mod builtin;

mod llvm;

mod ods;

mod ptr;

mod quant;

mod rocdl;

mod spirv;

mod test;

mod tosa;

mod xegpu;

use alloc::borrow::Cow;

use crate::{Attribute, Block, BlockArg, Extended, FunctionType, Item, MlirOpt, Module, NamedAttr, Operation, Region, Shaped, Type};

#[derive(Debug, Clone, PartialEq, Eq, thiserror::Error)]
pub enum Invalid {
    #[error("invalid affine map `{0}`")]
    AffineMap(String),
    #[error("invalid integer set `{0}`")]
    AffineSet(String),
    #[error("redefinition of attribute alias id `{0}`")]
    AttrAliasRedefined(String),
    #[error("redefinition of type alias id `{0}`")]
    TypeAliasRedefined(String),
    #[error("`{0}`: custom form does not match the op's syntax")]
    CustomForm(String),
    #[error("invalid hex elements `{0}`")]
    DenseHex(String),
    #[error("invalid dense literal `{0}`")]
    DenseLiteral(String),
    #[error("unexpected decimal integer literal for a floating point value `{0}`")]
    FloatLiteral(String),
    #[error("floating point value not valid for specified type `{0}`")]
    FloatType(String),
    #[error("integer constant out of range for attribute `{0}`")]
    IntRange(String),
    #[error("element type bitwidth must be a multiple of 8: `{0}`")]
    DenseArrayWidth(String),
    #[error("expected integer or float type, got: `{0}`")]
    DenseArrayType(String),
    #[error("invalid vector element type `{0}`")]
    VectorElement(String),
    #[error("expected location instance")]
    EmptyLocation,
    #[error("location alias `#{0}` was never defined")]
    LocationAlias(String),
    #[error("`#{0}` is not a location")]
    NotLocation(String),
    #[error("invalid type `{ty}`: {why}")]
    DialectType { ty: String, why: String },
    #[error("`{op}`: {why}")]
    DialectOp { op: String, why: String },
    #[error("invalid attribute `{attr}`: {why}")]
    DialectAttr { attr: String, why: String },
    #[error("`{op}`: attribute `{attr}` fails its ODS constraint")]
    AttrConstraint { op: String, attr: String },
    #[error("`{op}`: {what} #{index} has type `{ty}`, not one its ODS constraint admits")]
    TypeKind { op: String, what: &'static str, index: usize, ty: String },
    #[error("use of undeclared SSA value name `%{0}`")]
    UndeclaredValue(String),
    #[error("use of value `%{0}` expects different type than prior uses: `{1}`")]
    ValueType(String, String),
    #[error("region entry argument `%{0}` is already in use")]
    RegionArgInUse(String),
    #[error("redefinition of SSA value `%{0}`")]
    RedefinedValue(String),
}

impl From<Invalid> for crate::Error {
    #[inline]
    fn from(e: Invalid) -> Self {
        Self(e.to_string())
    }
}

pub struct Verifier<'x> {
    pub opt: &'x MlirOpt,
    attr_aliases: Vec<(&'x str, &'x Attribute<'x>)>,
    type_aliases: Vec<&'x str>,
    loc_aliases: Vec<&'x str>,
    scopes: Vec<Vec<(&'x str, Vec<Option<Cow<'x, Type<'x>>>>)>>,
    floor: usize,
    forward: Vec<Vec<(&'x str, Vec<(u32, &'x Type<'x>)>)>>,
    opaque: usize,
}

impl<'x> Verifier<'x> {
    #[inline]
    pub fn new(opt: &'x MlirOpt) -> Self {
        Self { opt, attr_aliases: Vec::new(), type_aliases: Vec::new(), loc_aliases: Vec::new(), scopes: alloc::vec![Vec::new()], floor: 0, forward: alloc::vec![Vec::new()], opaque: 0 }
    }

    #[inline]
    fn visible(&self, name: &str) -> Option<&[Option<Cow<'x, Type<'x>>>]> {
        self.scopes[self.floor..].iter().rev().find_map(|s| s.iter().find(|(n, _)| *n == name)).map(|(_, t)| t.as_slice())
    }

    #[inline]
    fn same(a: &Type<'_>, b: &Type<'_>) -> bool {
        builtin::Builtin::same(a, b)
    }

    fn define(&mut self, name: &'x str, tys: Vec<Option<Cow<'x, Type<'x>>>>) -> Result<(), Invalid> {
        if self.visible(name).is_some() {
            return Err(Invalid::RedefinedValue(name.into()));
        }
        if let Some(f) = self.forward.last_mut()
            && let Some(i) = f.iter().position(|(n, _)| *n == name)
        {
            let (_, used) = f.remove(i);
            if let Some((_, t)) = used.iter().find(|(k, t)| tys.get(*k as usize).and_then(Option::as_deref).is_some_and(|d| !Self::same(d, t))) {
                return Err(Invalid::ValueType(name.into(), t.to_string()));
            }
        }
        if let Some(s) = self.scopes.last_mut() {
            s.push((name, tys));
        }
        Ok(())
    }

    fn use_value(&mut self, value: &'x crate::Value<'x>, ty: Option<&'x Type<'x>>) -> Result<(), Invalid> {
        if self.opaque > 0 {
            return Ok(());
        }
        let k = value.index.unwrap_or(0);
        if let Some(tys) = self.visible(&value.name) {
            return match (tys.get(k as usize).and_then(Option::as_deref), ty) {
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

    fn close(&mut self) -> Result<(), Invalid> {
        match self.forward.last_mut().and_then(|f| f.first()) {
            Some((name, _)) => Err(Invalid::UndeclaredValue((*name).into())),
            None => Ok(()),
        }
    }

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

    fn raw_text(&mut self, text: &str) -> Result<(), Invalid> {
        let bytes = text.as_bytes();
        let mut i = 0;
        while i < bytes.len() {
            let sigil = bytes[i];
            let name = text[i + 1..].bytes().take_while(|c| c.is_ascii_alphanumeric() || matches!(c, b'_' | b'.')).count();
            let word_start = i == 0 || !(bytes[i - 1].is_ascii_alphanumeric() || matches!(bytes[i - 1], b'_' | b'.' | b'$' | b'%' | b'#' | b'!' | b'@'));
            if word_start && ["dense<", "affine_map<", "affine_set<", "array<"].iter().any(|k| text[i..].starts_with(k)) {
                if let Some((len, r)) = Self::check_raw(crate::Parser::new(&text[i..], self.opt), false, self.opt) {
                    r?;
                    i += len.max(1);
                    continue;
                }
            }
            let word = &text[i + 1..i + 1 + name];
            if matches!(sigil, b'!' | b'#') && (word.contains('.') || (sigil == b'#' && text[i + 1 + name..].starts_with('<') && DIALECTS.iter().any(|d| d.namespace() == word))) {
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
                Attribute::Extended { ext, .. } => owner(ext).map_or(Ok(()), |d| d.attr(&v, &a)).and_then(|()| match &ext.body {
                    Some(b) => Verifier::new(opt).raw_text(b.get(1..).unwrap_or("")),
                    None => Ok(()),
                }),
                a => builtin::Builtin.attr(&v, a),
            }
        };
        Some((p.pos(), r))
    }

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

pub trait Verify<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid>;
}

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
        self.items.verify(v)?;
        v.close()?;
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
        let typed = self.ty.inputs.len() == self.operands.len();
        for (i, u) in self.operands.iter().enumerate() {
            v.use_value(u, typed.then(|| &self.ty.inputs[i]))?;
        }
        rules(&self.name).map_or(Ok(()), |d| d.op(v, self))?;
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
        let (ins, outs) = ods::K::of_op(&self.name);
        for (what, ks, tys) in [("operand", ins, &self.ty.inputs), ("result", outs, &self.ty.results)] {
            if let Some(ks) = ks.filter(|ks| ks.len() == tys.len())
                && let Some((index, t)) = tys.iter().enumerate().find(|(i, t)| !ks[*i].admits(t))
            {
                return Err(Invalid::TypeKind { op: self.name.to_string(), what, index, ty: t.to_string() });
            }
        }
        self.properties.verify(v)?;
        self.attributes.verify(v)?;
        self.ty.verify(v)?;
        for t in self.raw.iter().flatten().filter_map(|p| if let crate::Piece::Text(t) = p { Some(t) } else { None }) {
            v.raw_text(t)?;
        }
        let isolated = v.opt.op_info(&self.name).is_some_and(|i| i.has(crate::Trait::IsIsolatedFromAbove));
        let raw = self.raw.iter().flatten().filter_map(|p| if let crate::Piece::Region(r) = p { Some(r) } else { None });
        let names = self.raw.iter().flatten().any(|p| matches!(p, crate::Piece::Text(t) if t.contains('%')));
        v.regions(self.regions.iter(), isolated, false)?;
        v.regions(raw, isolated, names)?;
        let counts: usize = self.results.iter().map(|d| d.count.unwrap_or(1) as usize).sum();
        let raw_tys = self.raw.as_ref().and_then(|_| rules(&self.name)?.raw_results(v, self)).filter(|ts| ts.len() == counts);
        let given: Vec<Cow<'x, Type<'x>>> = match raw_tys {
            Some(ts) => ts.into_iter().map(Cow::Owned).collect(),
            None => self.ty.results.iter().map(Cow::Borrowed).collect(),
        };
        let typed = counts == given.len();
        let mut tys = given.into_iter().map(Some).chain(core::iter::repeat(None)).map(|t| t.filter(|_| typed));
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
        self.args.iter().try_for_each(|a| v.define(&a.name, alloc::vec![Some(Cow::Borrowed(&a.ty))]))?;
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
            Type::Integer { .. } | Type::Float(_) | Type::Index | Type::NoneType | Type::Token => Ok(()),
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
            Attribute::Extended { ext, .. } => owner(ext).map_or(Ok(()), |d| d.attr(v, self))?,
            _ => builtin::Builtin.attr(v, self)?,
        }
        match self {
            Attribute::Builtin { ty, .. } | Attribute::Int { ty, .. } | Attribute::Float { ty, .. } | Attribute::Str { ty, .. } => ty.verify(v),
            Attribute::Type(t) => t.verify(v),
            Attribute::Array(xs) => xs.verify(v),
            Attribute::Dict(xs) => xs.verify(v),
            Attribute::DenseArray { ty, .. } => ty.verify(v),
            Attribute::Extended { ext, ty } => {
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

trait DialectRules: Sync {
    fn namespace(&self) -> &'static str;

    #[inline]
    fn ty(&self, _v: &Verifier<'_>, _t: &Type<'_>) -> Result<(), Invalid> {
        Ok(())
    }

    #[inline]
    fn attr(&self, _v: &Verifier<'_>, _a: &Attribute<'_>) -> Result<(), Invalid> {
        Ok(())
    }

    #[inline]
    fn op(&self, _v: &Verifier<'_>, _op: &Operation<'_>) -> Result<(), Invalid> {
        Ok(())
    }

    #[inline]
    fn raw_results<'x>(&self, _v: &Verifier<'x>, _op: &'x Operation<'x>) -> Option<Vec<Type<'x>>> {
        None
    }
}

const DIALECTS: &[&dyn DialectRules] = &[&acc::Acc, &arm_sve::ArmSve, &builtin::Builtin, &llvm::Llvm, &ptr::Ptr, &quant::Quant, &rocdl::Rocdl, &spirv::Spirv, &test::Test, &tosa::Tosa, &xegpu::XeGpu];

#[inline]
fn rules(name: &str) -> Option<&'static dyn DialectRules> {
    let ns = name.split_once('.')?.0;
    DIALECTS.iter().copied().find(|d| d.namespace() == ns)
}

fn owner(ext: &Extended<'_>) -> Option<&'static dyn DialectRules> {
    rules(&ext.name).or_else(|| ext.body.as_ref().and_then(|_| DIALECTS.iter().copied().find(|d| d.namespace() == ext.name)))
}

impl Extended<'_> {
    #[inline]
    fn mnemonic(&self) -> &str {
        self.name.split_once('.').map_or(&*self.name, |(_, m)| m)
    }
}

impl MlirOpt {
    #[inline]
    pub fn verify<'x>(&'x self, m: &'x Module<'x>) -> Result<(), Invalid> {
        m.verify(&mut Verifier::new(self))
    }
}
