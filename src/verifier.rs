//! ⭐ What `mlir-opt` rejects while it reads text, checked on the IR read from it.
//!
//! The parser keeps attribute and type bodies as text and reads a custom form as far as its
//! format goes, so text `mlir-opt` refuses can still read here. [`Verify`] is the one place that
//! refuses it afterwards: every IR node says what makes it invalid, [`MlirOpt::verify`] walks a
//! module. What only `mlir-opt`'s verifier (ODS constraints, an op's `verify()`) rejects is not
//! checked here.

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use crate::affine_expr::{Map, Set};
use crate::{AffineMap, Attribute, Block, BlockArg, Extended, FunctionType, IntegerSet, Item, MlirOpt, Module, NamedAttr, Operation, Region, Shaped, Type};

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
}

impl From<Invalid> for crate::Error {
    #[inline]
    fn from(e: Invalid) -> Self {
        Self(e.to_string())
    }
}

/// What a check sees: the converter (its dialects) and the module's aliases defined so far.
pub struct Verifier<'x> {
    pub opt: &'x MlirOpt,
    attr_aliases: Vec<&'x str>,
    type_aliases: Vec<&'x str>,
}

impl<'x> Verifier<'x> {
    #[inline]
    pub fn new(opt: &'x MlirOpt) -> Self {
        Self { opt, attr_aliases: Vec::new(), type_aliases: Vec::new() }
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
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        self.items.verify(v)
    }
}

impl<'x> Verify<'x> for Item<'x> {
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
        match self {
            Item::AttrAlias { name, value } => {
                if v.attr_aliases.contains(&&**name) {
                    return Err(Invalid::AttrAliasRedefined(name.to_string()));
                }
                v.attr_aliases.push(name);
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
        // A registered op with a custom format left raw (`affine.for %i = 1 too 10`) is not
        // refused yet: valid upstream text still stays raw where a template falls short
        // (`linalg.generic #trait ins(..)`, 230 chunks), and refusing would refuse it too.
        self.properties.verify(v)?;
        self.attributes.verify(v)?;
        self.ty.verify(v)?;
        self.regions.verify(v)
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
        self.ops.verify(v)
    }
}

impl<'x> Verify<'x> for BlockArg<'x> {
    #[inline]
    fn verify(&'x self, v: &mut Verifier<'x>) -> Result<(), Invalid> {
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
    #[inline]
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
            Attribute::Builtin { name, body, ty } => {
                Builtin::try_from(&**name).map_or(Ok(()), |b| b.verify(body))?;
                ty.verify(v)
            }
            Attribute::Int { ty, .. } | Attribute::Float { ty, .. } | Attribute::Str { ty, .. } => ty.verify(v),
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

keywords! {
    /// The builtin keyword attributes whose body is checked.
    enum Builtin {
        AffineMap = "affine_map",
        AffineSet = "affine_set",
    }
}

impl Builtin {
    /// Its raw body (`<(d0) -> (d0)>`) as `mlir-opt` would read it.
    fn verify(self, body: &str) -> Result<(), Invalid> {
        let inner = body.trim().strip_prefix('<').and_then(|b| b.strip_suffix('>')).unwrap_or(body);
        match self {
            Builtin::AffineMap => Map::try_from(inner).ok().and_then(|m| AffineMap::try_from(&m).ok()).map(drop).ok_or_else(|| Invalid::AffineMap(body.into())),
            Builtin::AffineSet => Set::try_from(inner).ok().and_then(|s| IntegerSet::try_from(&s).ok()).map(drop).ok_or_else(|| Invalid::AffineSet(body.into())),
        }
    }
}

impl MlirOpt {
    /// ⭐ `Err` when `mlir-opt` would not read the text `m` was read from (see [`Verify`]).
    #[inline]
    pub fn verify<'x>(&'x self, m: &'x Module<'x>) -> Result<(), Invalid> {
        m.verify(&mut Verifier::new(self))
    }
}
