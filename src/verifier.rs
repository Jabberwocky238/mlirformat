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
//! `verifier/` (`builtin.rs`, `quant.rs`), listed in [`DIALECTS`].

use alloc::string::{String, ToString};
use alloc::vec::Vec;

/// The builtin types and attributes.
mod builtin;
/// `quant` types.
mod quant;

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
    /// `%x` used where no `%x` is in scope.
    #[error("use of undeclared SSA value name `%{0}`")]
    UndeclaredValue(String),
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
    /// `definitionsPerScope`): a region's go out of scope at its end.
    scopes: Vec<Vec<&'x str>>,
    /// Where the innermost isolated-from-above op's regions start in `scopes`: nothing below is
    /// visible.
    floor: usize,
    /// Names used before any definition, per isolated scope (`forwardRefPlaceholders`): a later
    /// definition anywhere in that scope resolves one; one left at its end is undeclared.
    forward: Vec<Vec<&'x str>>,
    /// Inside a raw op's regions: their entry arguments are in its unread header, so a use there
    /// is not judged.
    opaque: usize,
}

impl<'x> Verifier<'x> {
    #[inline]
    pub fn new(opt: &'x MlirOpt) -> Self {
        Self { opt, attr_aliases: Vec::new(), type_aliases: Vec::new(), loc_aliases: Vec::new(), scopes: alloc::vec![Vec::new()], floor: 0, forward: alloc::vec![Vec::new()], opaque: 0 }
    }

    /// Is `%name` defined and visible here?
    #[inline]
    fn visible(&self, name: &str) -> bool {
        self.scopes[self.floor..].iter().any(|s| s.contains(&name))
    }

    /// `%name` defined here (`defineSSAValue`): not over one in scope; it resolves a forward use.
    fn define(&mut self, name: &'x str) -> Result<(), Invalid> {
        if self.visible(name) {
            return Err(Invalid::RedefinedValue(name.into()));
        }
        if let Some(f) = self.forward.last_mut() {
            f.retain(|n| *n != name);
        }
        if let Some(s) = self.scopes.last_mut() {
            s.push(name);
        }
        Ok(())
    }

    /// `%name` used here (`resolveSSAUse`): defined, or a forward use to be defined later.
    fn use_value(&mut self, name: &'x str) {
        if self.opaque == 0
            && !self.visible(name)
            && let Some(f) = self.forward.last_mut()
            && !f.contains(&name)
        {
            f.push(name);
        }
    }

    /// The end of an isolated scope (the module, an isolated op): no forward use left.
    fn close(&mut self) -> Result<(), Invalid> {
        match self.forward.last_mut().and_then(|f| f.first().copied()) {
            Some(name) => Err(Invalid::UndeclaredValue(name.into())),
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
        self.operands.iter().for_each(|u| v.use_value(&u.name));
        self.properties.verify(v)?;
        self.attributes.verify(v)?;
        self.ty.verify(v)?;
        let isolated = v.opt.op_info(&self.name).is_some_and(|i| i.has(crate::Trait::IsIsolatedFromAbove));
        let raw = self.raw.iter().flatten().filter_map(|p| if let crate::Piece::Region(r) = p { Some(r) } else { None });
        v.regions(self.regions.iter(), isolated, false)?;
        v.regions(raw, isolated, true)?;
        // Results are defined once the whole op is read.
        self.results.iter().try_for_each(|d| v.define(&d.name))
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
        self.args.iter().try_for_each(|a| v.define(&a.name))?;
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
}

/// Every dialect with rules.
const DIALECTS: &[&dyn DialectRules] = &[&builtin::Builtin, &quant::Quant];

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
