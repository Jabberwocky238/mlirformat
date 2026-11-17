use alloc::collections::BTreeMap;
use alloc::format;
use alloc::string::{String, ToString};
use alloc::vec;
use alloc::vec::Vec;

use crate::{AffineBin, AffineExpr, AffineMap, ApInt, Attribute, Const, Dim, Error, FloatKind, IntegerSet, IntoStatic, Scalar, Shaped, ShapedKind, Signedness, StridedLayout, Type};

/// What an attribute or a type is written with, in order; a nested attribute or type is its
/// index in `Entities`, a string goes to the string section
#[derive(Clone, PartialEq, Eq, PartialOrd, Ord, Debug)]
pub enum Piece {
    Var(u64),
    SVar(i64),
    Byte(u8),
    Attr(usize),
    Type(usize),
    Str(String),
    Blob(Vec<u8>),
    /// Part of the identity, not written (a `distinct` attribute's id)
    Key(u64),
}

#[derive(Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Debug)]
pub enum Kind {
    Attr,
    Type,
}

/// How an attribute or a type is encoded: by its dialect, or as its text
#[derive(Clone, PartialEq, Eq, PartialOrd, Ord, Debug)]
pub enum Enc {
    Custom(Vec<Piece>),
    /// The text written, and the text as given (its identity)
    Text(String, String),
}

#[derive(Clone, PartialEq, Eq, PartialOrd, Ord, Debug)]
pub struct Entity {
    pub kind: Kind,
    pub dialect: String,
    pub enc: Enc,
}

impl Entity {
    pub fn children(&self) -> impl Iterator<Item = usize> + '_ {
        let pieces: &[Piece] = match &self.enc {
            Enc::Custom(p) => p,
            Enc::Text(..) => &[],
        };
        pieces.iter().filter_map(|p| match p {
            Piece::Attr(i) | Piece::Type(i) => Some(*i),
            _ => None,
        })
    }
}

/// The builtin dialect's attribute codes (`BuiltinDialectAttributes`)
#[derive(Clone, Copy)]
pub enum A {
    Array = 0,
    Dictionary = 1,
    String = 2,
    StringWithType = 3,
    FlatSymbolRef = 4,
    SymbolRef = 5,
    Type = 6,
    Unit = 7,
    Integer = 8,
    Float = 9,
    CallSiteLoc = 10,
    FileLineColLoc = 11,
    FusedLoc = 12,
    FusedLocWithMetadata = 13,
    NameLoc = 14,
    UnknownLoc = 15,
    DenseArray = 17,
    DenseTypedElements = 18,
    DenseStringElements = 19,
    SparseElements = 20,
    Distinct = 21,
    FileLineColRange = 22,
    AffineMap = 23,
    IntegerSet = 24,
    StridedLayout = 25,
}

/// The builtin dialect's type codes (`BuiltinDialectTypes`)
#[derive(Clone, Copy)]
pub enum T {
    Integer = 0,
    Index = 1,
    Function = 2,
    Complex = 9,
    MemRef = 10,
    MemRefWithMemSpace = 11,
    None = 12,
    RankedTensor = 13,
    RankedTensorWithEncoding = 14,
    Tuple = 15,
    UnrankedMemRef = 16,
    UnrankedMemRefWithMemSpace = 17,
    UnrankedTensor = 18,
    Vector = 19,
    VectorWithScalableDims = 20,
    Token = 33,
}

/// An affine expression's code (`AffineExprBytecodeKind`)
#[derive(Clone, Copy)]
pub enum E {
    Dim = 0,
    Symbol = 1,
    Constant = 2,
    Add = 3,
    Mul = 4,
    Mod = 5,
    FloorDiv = 6,
    CeilDiv = 7,
}

/// An affine map's form (`AffineMapBytecodeKind`), the low bits of its header
#[derive(Clone, Copy)]
pub enum M {
    Identity = 0,
    Permutation = 1,
    ProjectedPermutation = 2,
    General = 3,
}

impl From<A> for Piece {
    fn from(a: A) -> Self {
        Piece::Var(a as u64)
    }
}

impl From<T> for Piece {
    fn from(t: T) -> Self {
        Piece::Var(t as u64)
    }
}

impl From<E> for Piece {
    fn from(e: E) -> Self {
        Piece::Var(e as u64)
    }
}

/// The builtin float types' codes, in `FloatKind` order
pub const FLOAT_CODES: &[(FloatKind, u64)] = &[
    (FloatKind::BF16, 3),
    (FloatKind::F16, 4),
    (FloatKind::F32, 5),
    (FloatKind::F64, 6),
    (FloatKind::F80, 7),
    (FloatKind::F128, 8),
    (FloatKind::TF32, 21),
    (FloatKind::F8E5M2, 22),
    (FloatKind::F8E4M3, 23),
    (FloatKind::F8E4M3FN, 24),
    (FloatKind::F8E5M2FNUZ, 25),
    (FloatKind::F8E4M3FNUZ, 26),
    (FloatKind::F8E4M3B11FNUZ, 27),
    (FloatKind::F8E3M4, 28),
    (FloatKind::F4E2M1FN, 29),
    (FloatKind::F6E2M3FN, 30),
    (FloatKind::F6E3M2FN, 31),
    (FloatKind::F8E8M0FNU, 32),
];

/// Each float type's width in bits, as `APFloat::bitcastToAPInt` gives it
pub const FLOAT_BITS: &[(FloatKind, u32)] = &[
    (FloatKind::BF16, 16),
    (FloatKind::F16, 16),
    (FloatKind::F32, 32),
    (FloatKind::F64, 64),
    (FloatKind::F80, 80),
    (FloatKind::F128, 128),
    (FloatKind::TF32, 19),
    (FloatKind::F8E5M2, 8),
    (FloatKind::F8E4M3, 8),
    (FloatKind::F8E4M3FN, 8),
    (FloatKind::F8E5M2FNUZ, 8),
    (FloatKind::F8E4M3FNUZ, 8),
    (FloatKind::F8E4M3B11FNUZ, 8),
    (FloatKind::F8E3M4, 8),
    (FloatKind::F4E2M1FN, 4),
    (FloatKind::F6E2M3FN, 6),
    (FloatKind::F6E3M2FN, 6),
    (FloatKind::F8E8M0FNU, 8),
];

/// `ShapedType::kDynamic`
pub const DYNAMIC: i64 = i64::MIN;
/// The width `IndexType` stores an integer in (`IndexType::kInternalStorageBitWidth`)
pub const INDEX_BITS: u32 = 64;
/// The bits of a word of an `APInt`
const WORD_BITS: u32 = 64;
/// The widest integer a byte holds
const BYTE_BITS: u32 = 8;
/// A splat of `true` in a packed `i1` dense attribute
pub const SPLAT_TRUE: u8 = 0xFF;

pub const BUILTIN: &str = "builtin";
/// `DenseResourceElementsAttr`'s code: read, not written (resources are not)
pub const DENSE_RESOURCE: u64 = 16;
/// The quant dialect, whose types have their own encoding
const QUANT: &str = "quant";

/// Every attribute and type a module refers to, each once
#[derive(Default)]
pub struct Entities {
    pub list: Vec<Entity>,
    index: BTreeMap<Entity, usize>,
    /// The `distinct` attributes, by their id in the text
    distinct: BTreeMap<String, u64>,
}

fn err(what: &str, of: impl core::fmt::Display) -> Error {
    Error(format!("bytecode: {what} `{of}`"))
}

impl Entities {
    fn intern(&mut self, e: Entity) -> usize {
        if let Some(i) = self.index.get(&e) {
            return *i;
        }
        self.list.push(e.clone());
        self.index.insert(e, self.list.len() - 1);
        self.list.len() - 1
    }

    fn custom(&mut self, kind: Kind, pieces: Vec<Piece>) -> usize {
        self.intern(Entity { kind, dialect: String::from(BUILTIN), enc: Enc::Custom(pieces) })
    }

    /// An attribute or type written as its text. Printed on its own, its `distinct` attributes are
    /// numbered afresh from zero; the ids it was given stay its identity.
    fn text(&mut self, kind: Kind, dialect: &str, text: String) -> usize {
        let shown = Self::renumber_distinct(&text);
        self.intern(Entity { kind, dialect: String::from(dialect), enc: Enc::Text(shown, text) })
    }

    fn renumber_distinct(text: &str) -> String {
        const DISTINCT: &str = "distinct[";
        let (mut out, mut rest, mut ids) = (String::new(), text, Vec::<String>::new());
        while let Some(at) = rest.find(DISTINCT) {
            let after = &rest[at + DISTINCT.len()..];
            let Some(end) = after.find(']') else { break };
            let id = &after[..end];
            let n = ids.iter().position(|x| x == id).unwrap_or_else(|| {
                ids.push(String::from(id));
                ids.len() - 1
            });
            out.push_str(&rest[..at + DISTINCT.len()]);
            out.push_str(&format!("{n}"));
            rest = &after[end..];
        }
        out.push_str(rest);
        out
    }

    /// The dialect of a dialect attribute's or type's name (`arith.overflow`, `llvm`)
    fn namespace(name: &str) -> &str {
        let end = name.find(['.', '<']).unwrap_or(name.len());
        &name[..end]
    }

    // Types

    pub fn ty(&mut self, t: &Type<'_>) -> Result<usize, Error> {
        let pieces = match t {
            Type::Integer { signedness, width } => {
                let s = match signedness {
                    Signedness::Signless => 0,
                    Signedness::Signed => 1,
                    Signedness::Unsigned => 2,
                };
                vec![T::Integer.into(), Piece::Var(u64::from(*width) << 2 | s)]
            }
            Type::Float(k) => vec![Piece::Var(FLOAT_CODES.iter().find(|(f, _)| f == k).map(|(_, c)| *c).ok_or_else(|| err("float type", t))?)],
            Type::Index => vec![T::Index.into()],
            Type::NoneType => vec![T::None.into()],
            Type::Token => vec![T::Token.into()],
            Type::Complex(e) => vec![T::Complex.into(), Piece::Type(self.ty(e)?)],
            Type::Tuple(ts) => {
                let mut p = vec![T::Tuple.into()];
                self.types(ts, &mut p)?;
                p
            }
            Type::Function(f) => {
                let mut p = vec![T::Function.into()];
                self.types(&f.inputs, &mut p)?;
                self.types(&f.results, &mut p)?;
                p
            }
            Type::Shaped(s) => self.shaped(s)?,
            Type::Extended(e) if Self::namespace(&e.name) == QUANT => {
                let p = self.quant(&e.name, e.body.as_deref().unwrap_or_default())?;
                return Ok(self.intern(Entity { kind: Kind::Type, dialect: String::from(QUANT), enc: Enc::Custom(p) }));
            }
            Type::Extended(e) => return Ok(self.text(Kind::Type, Self::namespace(&e.name), t.to_string())),
        };
        Ok(self.custom(Kind::Type, pieces))
    }

    fn types(&mut self, ts: &[Type<'_>], p: &mut Vec<Piece>) -> Result<(), Error> {
        p.push(Piece::Var(ts.len() as u64));
        for t in ts {
            p.push(Piece::Type(self.ty(t)?));
        }
        Ok(())
    }

    fn shape(dims: &[Dim], p: &mut Vec<Piece>) {
        p.push(Piece::Var(dims.len() as u64));
        for d in dims {
            p.push(Piece::SVar(match d {
                Dim::Static(n) | Dim::Scalable(n) => *n,
                Dim::Dynamic => DYNAMIC,
            }));
        }
    }

    fn shaped(&mut self, s: &Shaped<'_>) -> Result<Vec<Piece>, Error> {
        let elem = self.ty(&s.elem)?;
        Ok(match (s.kind, &s.shape) {
            (ShapedKind::Tensor, None) => vec![T::UnrankedTensor.into(), Piece::Type(elem)],
            (ShapedKind::Tensor, Some(dims)) => {
                let mut p = match s.extras.first() {
                    Some(enc) => vec![T::RankedTensorWithEncoding.into(), Piece::Attr(self.attr(enc)?)],
                    None => vec![T::RankedTensor.into()],
                };
                Self::shape(dims, &mut p);
                p.push(Piece::Type(elem));
                p
            }
            (ShapedKind::Vector, dims) => {
                let dims = dims.as_deref().unwrap_or_default();
                let scalable = dims.iter().any(|d| matches!(d, Dim::Scalable(_)));
                let mut p = vec![if scalable { T::VectorWithScalableDims } else { T::Vector }.into()];
                if scalable {
                    p.push(Piece::Var(dims.len() as u64));
                    p.extend(dims.iter().map(|d| Piece::Byte(u8::from(matches!(d, Dim::Scalable(_))))));
                }
                Self::shape(dims, &mut p);
                p.push(Piece::Type(elem));
                p
            }
            (ShapedKind::MemRef, None) => match s.extras.first().filter(|a| !Self::default_space(a)) {
                Some(space) => vec![T::UnrankedMemRefWithMemSpace.into(), Piece::Attr(self.attr(space)?), Piece::Type(elem)],
                None => vec![T::UnrankedMemRef.into(), Piece::Type(elem)],
            },
            (ShapedKind::MemRef, Some(dims)) => {
                let (layout, space) = match &s.extras[..] {
                    [] => (None, None),
                    [one] if Self::is_layout(one) => (Some(one), None),
                    [one] => (None, Some(one)),
                    [layout, space, ..] => (Some(layout), Some(space)),
                };
                let layout = match layout {
                    Some(l) => self.attr(l)?,
                    None => self.affine_map(&AffineMap::identity(dims.len() as u32)),
                };
                let mut p = match space.filter(|a| !Self::default_space(a)) {
                    Some(space) => vec![T::MemRefWithMemSpace.into(), Piece::Attr(self.attr(space)?)],
                    None => vec![T::MemRef.into()],
                };
                Self::shape(dims, &mut p);
                p.push(Piece::Type(elem));
                p.push(Piece::Attr(layout));
                p
            }
        })
    }

    /// A memref's first extra is its layout when it is a map or a strided layout
    fn is_layout(a: &Attribute<'_>) -> bool {
        matches!(a, Attribute::Builtin { name, .. } if name == "affine_map" || name == "strided")
    }

    /// Memory space `0 : i64` is no memory space at all
    fn default_space(a: &Attribute<'_>) -> bool {
        matches!(a, Attribute::Int { lit, ty } if lit == "0" && ty.as_ref().is_none_or(|t| *t == Type::Integer { signedness: Signedness::Signless, width: 64 }))
    }

    // Attributes

    pub fn string(&mut self, s: &str) -> usize {
        self.custom(Kind::Attr, vec![A::String.into(), Piece::Str(String::from(s))])
    }

    /// A name or symbol as written: bare, or quoted with escapes
    fn unquote(s: &str) -> Result<String, Error> {
        match s.strip_prefix('"').and_then(|s| s.strip_suffix('"')) {
            Some(lit) => Attribute::Str { lit: lit.into(), ty: None }.text(),
            None => Ok(String::from(s)),
        }
    }

    pub fn attr(&mut self, a: &Attribute<'_>) -> Result<usize, Error> {
        let pieces = match a {
            Attribute::Unit => vec![A::Unit.into()],
            Attribute::Bool(b) => vec![A::Integer.into(), Piece::Type(self.ty(&Type::I1)?), Piece::Byte(u8::from(*b))],
            Attribute::Int { lit, ty: Some(ty @ Type::Float(k)) } => {
                let width = Self::float_bits(*k)?;
                let digits = lit.strip_prefix("0x").ok_or_else(|| err("float attribute", a))?;
                let bits = u128::from_str_radix(digits, 16).map_err(|_| err("float attribute", a))?;
                let mut p = vec![A::Float.into(), Piece::Type(self.ty(ty)?)];
                Self::apint(width, bits, &mut p);
                p
            }
            Attribute::Int { lit, ty } => {
                let ty = ty.clone().unwrap_or(Type::Integer { signedness: Signedness::Signless, width: 64 });
                let width = match &ty {
                    Type::Integer { width, .. } => *width,
                    Type::Index => INDEX_BITS,
                    _ => return Err(err("integer attribute", a)),
                };
                let v = Const::try_from(&Attribute::Int { lit: lit.clone(), ty: Some(ty.clone()) }).map_err(|_| err("integer", a))?;
                let bits = match v.values[0] {
                    Scalar::Int(i) => i.bits(),
                    _ => return Err(err("integer", a)),
                };
                let mut p = vec![A::Integer.into(), Piece::Type(self.ty(&ty)?)];
                Self::apint(width, bits, &mut p);
                p
            }
            Attribute::Float { lit, ty } => {
                let ty = ty.clone().unwrap_or(Type::Float(FloatKind::F64));
                let Type::Float(k) = ty else { return Err(err("float attribute", a)) };
                let v = Const::try_from(&Attribute::Float { lit: lit.clone(), ty: Some(ty.clone()) }).map_err(|_| err("float", a))?;
                let mut p = vec![A::Float.into(), Piece::Type(self.ty(&ty)?)];
                Self::apint(Self::float_bits(k)?, Self::scalar_bits(v.values[0])?, &mut p);
                p
            }
            Attribute::Str { ty, .. } => {
                let s = a.text()?;
                match ty {
                    None => vec![A::String.into(), Piece::Str(s)],
                    Some(t) => vec![A::StringWithType.into(), Piece::Str(s), Piece::Type(self.ty(t)?)],
                }
            }
            Attribute::Type(t) => vec![A::Type.into(), Piece::Type(self.ty(t)?)],
            Attribute::Array(xs) => {
                let mut p = vec![A::Array.into(), Piece::Var(xs.len() as u64)];
                for x in xs {
                    p.push(Piece::Attr(self.attr(x)?));
                }
                p
            }
            Attribute::Dict(entries) => {
                let mut named = Vec::new();
                for e in entries {
                    named.push((Self::unquote(&e.name)?, e.value.as_ref()));
                }
                return self.dict(named);
            }
            Attribute::SymbolRef(path) => {
                let mut parts = Vec::new();
                for s in path {
                    parts.push(Self::unquote(s.trim_start_matches('@'))?);
                }
                let root = self.string(&parts[0]);
                if parts.len() == 1 {
                    vec![A::FlatSymbolRef.into(), Piece::Attr(root)]
                } else {
                    let mut p = vec![A::SymbolRef.into(), Piece::Attr(root), Piece::Var(parts.len() as u64 - 1)];
                    for s in &parts[1..] {
                        let leaf = self.string(s);
                        p.push(Piece::Attr(self.custom(Kind::Attr, vec![A::FlatSymbolRef.into(), Piece::Attr(leaf)])));
                    }
                    p
                }
            }
            Attribute::DenseArray { ty, values } => {
                let mut blob = Vec::new();
                for v in values {
                    let lit = Attribute::Int { lit: v.clone(), ty: None };
                    let c = match ty {
                        Type::Float(_) => Const::try_from(&Attribute::Float { lit: v.clone(), ty: Some(ty.clone()) }),
                        _ if *v == "true" || *v == "false" => Const::try_from(&Attribute::Bool(*v == "true")),
                        _ => Const::try_from(&Attribute::Int { lit: v.clone(), ty: Some(ty.clone()) }),
                    };
                    let c = c.map_err(|_| err("array element", lit))?;
                    Self::element(ty, c.values[0], &mut blob)?;
                }
                vec![A::DenseArray.into(), Piece::Type(self.ty(ty)?), Piece::Var(values.len() as u64), Piece::Blob(blob)]
            }
            Attribute::Builtin { name, body, ty } => self.builtin(a, name, body, ty.as_ref())?,
            Attribute::Extended { ext, .. } => return Ok(self.text(Kind::Attr, Self::namespace(&ext.name), a.to_string())),
        };
        Ok(self.custom(Kind::Attr, pieces))
    }

    pub fn dict(&mut self, mut named: Vec<(String, Option<&Attribute<'_>>)>) -> Result<usize, Error> {
        named.sort_by(|a, b| a.0.cmp(&b.0));
        let mut p = vec![A::Dictionary.into(), Piece::Var(named.len() as u64)];
        for (n, v) in named {
            p.push(Piece::Attr(self.string(&n)));
            p.push(Piece::Attr(self.attr(v.unwrap_or(&Attribute::Unit))?));
        }
        Ok(self.custom(Kind::Attr, p))
    }

    fn builtin(&mut self, a: &Attribute<'_>, name: &str, body: &str, ty: Option<&Type<'_>>) -> Result<Vec<Piece>, Error> {
        let inner = || body.strip_prefix('<').and_then(|b| b.strip_suffix('>')).map(str::trim).ok_or_else(|| err("attribute", a));
        Ok(match name {
            "dense" => {
                let ty = ty.ok_or_else(|| err("untyped dense attribute", a))?;
                if let Some(hex) = inner()?.strip_prefix("\"0x").and_then(|h| h.strip_suffix('"')) {
                    let view = Self::shaped_view(ty).ok_or_else(|| err("dense attribute", a))?;
                    let values = Self::raw_values(view.element_type(), hex).ok_or_else(|| err("dense attribute", a))?;
                    vec![A::DenseTypedElements.into(), Piece::Type(self.ty(ty)?), Piece::Blob(Self::dense_data(&view, &values)?)]
                } else if inner()?.starts_with('"') {
                    self.dense_strings(ty, inner()?)?
                } else {
                    let view = Self::shaped_view(ty).ok_or_else(|| err("dense attribute", a))?;
                    let c = Const::try_from(&Attribute::Builtin { name: name.into(), body: body.into(), ty: Some(view.clone()) }).map_err(|_| err("dense attribute", a))?;
                    let mut p = vec![A::DenseTypedElements.into(), Piece::Type(self.ty(ty)?)];
                    p.push(Piece::Blob(Self::dense_data(&view, &c.values)?));
                    p
                }
            }
            "sparse" => {
                let ty = ty.ok_or_else(|| err("untyped sparse attribute", a))?;
                let rank = ty.dims().map_or(0, |d| d.len());
                let elem = ty.element_type();
                let body = inner()?;
                let (indices, values) = if body.is_empty() {
                    (format!("dense<> : tensor<0x{rank}xi64>"), format!("dense<> : tensor<0x{elem}>"))
                } else {
                    let at = split_top(body, ",").ok_or_else(|| err("sparse attribute", a))?;
                    let (lit_i, lit_v) = (body[..at].trim(), body[at + 1..].trim());
                    let shape_i = literal_shape(lit_i);
                    let shape_i = if shape_i.is_empty() { vec![1, rank] } else { shape_i };
                    let shape_v = literal_shape(lit_v);
                    let shape_v = if shape_v.is_empty() { vec![shape_i[0]] } else { shape_v };
                    let dims = |s: &[usize]| s.iter().map(|d| format!("{d}x")).collect::<String>();
                    (format!("dense<{lit_i}> : tensor<{}i64>", dims(&shape_i)), format!("dense<{lit_v}> : tensor<{}{elem}>", dims(&shape_v)))
                };
                let (indices, values) = (parse_attr(&indices)?, parse_attr(&values)?);
                vec![A::SparseElements.into(), Piece::Type(self.ty(ty)?), Piece::Attr(self.attr(&indices)?), Piece::Attr(self.attr(&values)?)]
            }
            "affine_map" => {
                let m = AffineMap::try_from(a).map_err(|_| err("affine map", a))?;
                let k = self.affine_map(&m);
                return Ok(self.list[k].pieces());
            }
            "affine_set" => {
                let s = IntegerSet::try_from(a).map_err(|_| err("integer set", a))?;
                let mut p = vec![A::IntegerSet.into(), Piece::Var(u64::from(s.dims)), Piece::Var(u64::from(s.syms)), Piece::Var(s.constraints.len() as u64)];
                for (e, _) in &s.constraints {
                    Self::affine_expr(e, &mut p);
                }
                p.extend(s.constraints.iter().map(|(_, eq)| Piece::Byte(u8::from(*eq))));
                p
            }
            "strided" => {
                let s = StridedLayout::try_from(a).map_err(|_| err("strided layout", a))?;
                let mut p = vec![A::StridedLayout.into(), Piece::SVar(s.offset), Piece::Var(s.strides.len() as u64)];
                p.extend(s.strides.iter().map(|s| Piece::SVar(*s)));
                p
            }
            "loc" => {
                let k = self.loc(inner_parens(body).ok_or_else(|| err("location", a))?)?;
                return Ok(self.list[k].pieces());
            }
            "distinct" => {
                let (id, rest) = body.strip_prefix('[').and_then(|b| b.split_once(']')).ok_or_else(|| err("distinct attribute", a))?;
                let n = self.distinct.len() as u64;
                let key = *self.distinct.entry(String::from(id.trim())).or_insert(n);
                let referenced = parse_attr(rest.trim().strip_prefix('<').and_then(|r| r.strip_suffix('>')).ok_or_else(|| err("distinct attribute", a))?)?;
                vec![A::Distinct.into(), Piece::Attr(self.attr(&referenced)?), Piece::Key(key)]
            }
            _ => return Err(err("builtin attribute", a)),
        })
    }

    /// A shaped type as a tensor of its shape and element type: a dialect's shaped type
    /// (`!spirv.arm.tensor<3xi32>`) read by its leading `dims x element`
    fn shaped_view(t: &Type<'_>) -> Option<Type<'static>> {
        match t {
            Type::Shaped(_) => Some(t.clone().into_static()),
            Type::Extended(e) => {
                let inner = e.inner()?;
                let head = &inner[..split_top(inner, ",").unwrap_or(inner.len())];
                Type::try_from(&*format!("tensor<{}>", head.trim())).ok().map(IntoStatic::into_static)
            }
            _ => None,
        }
    }

    /// The elements of a dense attribute given as its raw data in hex, as MLIR stores them
    fn raw_values(elem: &Type<'_>, hex: &str) -> Option<Vec<Scalar>> {
        let bytes: Vec<u8> = (0..hex.len() / 2).map(|i| u8::from_str_radix(hex.get(2 * i..2 * i + 2)?, 16).ok()).collect::<Option<_>>()?;
        let (part, complex) = match elem {
            Type::Complex(p) => (&**p, true),
            t => (t, false),
        };
        let width = match part {
            Type::Integer { width, .. } => *width,
            Type::Index => INDEX_BITS,
            Type::Float(k) => Self::float_bits(*k).ok()?,
            _ => return None,
        };
        let w = width.div_ceil(BYTE_BITS) as usize;
        let read = |c: &[u8]| {
            let mut b = [0u8; 16];
            b[..c.len()].copy_from_slice(c);
            ApInt::from_bits(width, u128::from_le_bytes(b))
        };
        let step = if complex { 2 * w } else { w };
        Some(bytes.chunks(step).map(|c| if complex { Scalar::Complex(read(&c[..w]), read(&c[w..])) } else { Scalar::Int(read(c)) }).collect())
    }

    fn dense_strings(&mut self, ty: &Type<'_>, inner: &str) -> Result<Vec<Piece>, Error> {
        let mut strings = Vec::new();
        let mut rest = inner;
        while let Some(at) = rest.find('"') {
            let body = &rest[at + 1..];
            let mut end = 0;
            let b = body.as_bytes();
            while end < b.len() && b[end] != b'"' {
                end += if b[end] == b'\\' { 2 } else { 1 };
            }
            strings.push(Attribute::Str { lit: body[..end].into(), ty: None }.text()?);
            rest = &body[(end + 1).min(body.len())..];
        }
        let splat = strings.len() == 1 || strings.windows(2).all(|w| w[0] == w[1]) && !strings.is_empty();
        let mut p = vec![A::DenseStringElements.into(), Piece::Type(self.ty(ty)?), Piece::Var(u64::from(splat))];
        if splat {
            p.push(Piece::Str(strings.swap_remove(0)));
        } else {
            p.extend(strings.into_iter().map(Piece::Str));
        }
        Ok(p)
    }

    /// The raw data of a dense attribute: one element when all are equal, `i1` packed eight to a byte
    fn dense_data(ty: &Type<'_>, values: &[Scalar]) -> Result<Vec<u8>, Error> {
        let elem = ty.element_type();
        let count = ty.element_count().unwrap_or(values.len());
        let splat = !values.is_empty() && (values.len() == 1 || values.windows(2).all(|w| w[0] == w[1]));
        if *elem == Type::I1 {
            let bit = |s: &Scalar| matches!(s, Scalar::Int(i) if !i.is_zero());
            if splat {
                return Ok(vec![if bit(&values[0]) { SPLAT_TRUE } else { 0 }]);
            }
            let mut out = vec![0u8; count.div_ceil(BYTE_BITS as usize)];
            for (i, v) in values.iter().enumerate() {
                if bit(v) {
                    out[i / BYTE_BITS as usize] |= 1 << (i % BYTE_BITS as usize);
                }
            }
            return Ok(out);
        }
        let mut out = Vec::new();
        for v in if splat { &values[..1] } else { values } {
            Self::element(elem, *v, &mut out)?;
        }
        Ok(out)
    }

    /// One element of a dense attribute or array, as MLIR stores it: its bits in whole bytes,
    /// little-endian
    fn element(ty: &Type<'_>, v: Scalar, out: &mut Vec<u8>) -> Result<(), Error> {
        let width = match ty {
            Type::Integer { width, .. } => *width,
            Type::Index => INDEX_BITS,
            Type::Float(k) => Self::float_bits(*k)?,
            Type::Complex(part) => {
                let [re, im] = v.parts().ok_or_else(|| err("complex element", ty))?;
                Self::element(part, re, out)?;
                return Self::element(part, im, out);
            }
            _ => return Err(err("dense element type", ty)),
        };
        let bytes = width.div_ceil(BYTE_BITS) as usize;
        out.extend_from_slice(&Self::scalar_bits(v)?.to_le_bytes()[..bytes]);
        Ok(())
    }

    fn scalar_bits(v: Scalar) -> Result<u128, Error> {
        Ok(match v {
            Scalar::Int(i) => i.bits(),
            Scalar::Float(f) => u128::from(f.bits),
            Scalar::Wide(w) => w.bits(),
            _ => return Err(Error(String::from("bytecode: a complex scalar where one part was expected"))),
        })
    }

    fn float_bits(k: FloatKind) -> Result<u32, Error> {
        FLOAT_BITS.iter().find(|(f, _)| *f == k).map(|(_, b)| *b).ok_or_else(|| err("float type", k))
    }

    /// `writeAPIntWithKnownWidth`: a byte up to eight bits, a varint up to 64, else its words
    fn apint(width: u32, bits: u128, p: &mut Vec<Piece>) {
        if width <= BYTE_BITS {
            p.push(Piece::Byte(bits as u8));
        } else if width <= WORD_BITS {
            p.push(Piece::SVar(bits as u64 as i64));
        } else {
            let active = u128::BITS - bits.leading_zeros();
            let words = active.div_ceil(WORD_BITS).max(1);
            p.push(Piece::Var(u64::from(words)));
            for w in 0..words {
                p.push(Piece::SVar((bits >> (w * WORD_BITS)) as u64 as i64));
            }
        }
    }

    pub fn affine_map(&mut self, m: &AffineMap) -> usize {
        let dims = u64::from(m.dims);
        let positions: Option<Vec<u64>> = m.results.iter().map(|e| if let AffineExpr::Dim(d) = e { Some(u64::from(*d)) } else { None }).collect();
        let mut p = vec![A::AffineMap.into()];
        let distinct = |ps: &[u64]| ps.iter().enumerate().all(|(i, x)| !ps[..i].contains(x));
        match positions {
            Some(ps) if m.syms == 0 && ps.len() as u64 == dims && ps.iter().enumerate().all(|(i, d)| *d == i as u64) => p.push(Piece::Var(dims << 2 | M::Identity as u64)),
            Some(ps) if ps.len() as u64 == dims && distinct(&ps) => {
                p.push(Piece::Var(dims << 2 | M::Permutation as u64));
                p.extend(ps.into_iter().map(Piece::Var));
            }
            Some(ps) if m.syms == 0 && distinct(&ps) => {
                p.push(Piece::Var(dims << 2 | M::ProjectedPermutation as u64));
                p.push(Piece::Var(ps.len() as u64));
                p.extend(ps.into_iter().map(Piece::Var));
            }
            _ => {
                p.push(Piece::Var(dims << 2 | M::General as u64));
                p.push(Piece::Var(u64::from(m.syms)));
                p.push(Piece::Var(m.results.len() as u64));
                for e in &m.results {
                    Self::affine_expr(e, &mut p);
                }
            }
        }
        self.custom(Kind::Attr, p)
    }

    fn affine_expr(e: &AffineExpr, p: &mut Vec<Piece>) {
        match e {
            AffineExpr::Dim(d) => p.extend([E::Dim.into(), Piece::Var(u64::from(*d))]),
            AffineExpr::Sym(s) => p.extend([E::Symbol.into(), Piece::Var(u64::from(*s))]),
            AffineExpr::Const(c) => p.extend([E::Constant.into(), Piece::SVar(*c)]),
            AffineExpr::Bin(k, l, r) => {
                p.push(
                    match k {
                        AffineBin::Add => E::Add,
                        AffineBin::Mul => E::Mul,
                        AffineBin::Mod => E::Mod,
                        AffineBin::FloorDiv => E::FloorDiv,
                        AffineBin::CeilDiv => E::CeilDiv,
                    }
                    .into(),
                );
                Self::affine_expr(l, p);
                Self::affine_expr(r, p);
            }
        }
    }

    // Locations

    /// A location, as written inside `loc(...)`
    pub fn loc(&mut self, text: &str) -> Result<usize, Error> {
        let t = text.trim();
        let pieces = if t == "unknown" {
            vec![A::UnknownLoc.into()]
        } else if let Some(rest) = t.strip_prefix("callsite(") {
            let body = rest.strip_suffix(')').ok_or_else(|| err("location", t))?;
            let at = split_top(body, " at ").ok_or_else(|| err("location", t))?;
            vec![A::CallSiteLoc.into(), Piece::Attr(self.loc(&body[..at])?), Piece::Attr(self.loc(&body[at + 4..])?)]
        } else if let Some(rest) = t.strip_prefix("fused") {
            let rest = rest.trim_start();
            let (meta, list) = match rest.strip_prefix('<') {
                Some(r) => {
                    let end = close(r, '<', '>').ok_or_else(|| err("location", t))?;
                    (Some(&r[..end]), r[end + 1..].trim_start())
                }
                None => (None, rest),
            };
            let list = list.strip_prefix('[').and_then(|l| l.strip_suffix(']')).ok_or_else(|| err("location", t))?;
            let parts = split_list(list);
            let mut p = vec![if meta.is_some() { A::FusedLocWithMetadata } else { A::FusedLoc }.into(), Piece::Var(parts.len() as u64)];
            for part in parts {
                p.push(Piece::Attr(self.loc(part)?));
            }
            if let Some(m) = meta {
                p.push(Piece::Attr(self.attr(&parse_attr(m)?)?));
            }
            p
        } else if t.starts_with('"') {
            let end = string_end(t).ok_or_else(|| err("location", t))?;
            let name = Self::unquote(&t[..end])?;
            let rest = t[end..].trim_start();
            if let Some(child) = rest.strip_prefix('(') {
                let child = child.strip_suffix(')').ok_or_else(|| err("location", t))?;
                let s = self.string(&name);
                vec![A::NameLoc.into(), Piece::Attr(s), Piece::Attr(self.loc(child)?)]
            } else if let Some(pos) = rest.strip_prefix(':') {
                let s = self.string(&name);
                Self::file_loc(s, pos).ok_or_else(|| err("location", t))?
            } else {
                let s = self.string(&name);
                vec![A::NameLoc.into(), Piece::Attr(s), Piece::Attr(self.loc("unknown")?)]
            }
        } else {
            return Err(err("location", t));
        };
        Ok(self.custom(Kind::Attr, pieces))
    }

    /// `line:col`, `line:col to :col`, `line:col to line:col`, `line`
    fn file_loc(file: usize, pos: &str) -> Option<Vec<Piece>> {
        let (start, end) = match pos.split_once(" to ") {
            Some((s, e)) => (s.trim(), Some(e.trim())),
            None => (pos.trim(), None),
        };
        let (line, col) = match start.split_once(':') {
            Some((l, c)) => (l.parse::<u64>().ok()?, Some(c.parse::<u64>().ok()?)),
            None => (start.parse::<u64>().ok()?, None),
        };
        let (end_line, end_col) = match end {
            None => (line, col),
            Some(e) => match e.split_once(':') {
                Some(("", c)) => (line, Some(c.parse().ok()?)),
                Some((l, c)) => (l.parse().ok()?, Some(c.parse().ok()?)),
                None => (e.parse().ok()?, None),
            },
        };
        let col = col.unwrap_or(0);
        let end_col = end_col.unwrap_or(col);
        if end.is_none() && start.contains(':') {
            return Some(vec![A::FileLineColLoc.into(), Piece::Attr(file), Piece::Var(line), Piece::Var(col)]);
        }
        let mut p = vec![A::FileLineColRange.into(), Piece::Attr(file)];
        let nums: Vec<u64> = if line == 0 && col == 0 && end_line == 0 && end_col == 0 {
            vec![]
        } else if col == 0 && line == end_line {
            vec![line]
        } else if end_col == col && line == end_line {
            vec![line, col]
        } else if line == end_line {
            vec![line, col, end_col]
        } else {
            vec![line, col, end_line, end_col]
        };
        p.push(Piece::Var(nums.len() as u64));
        p.extend(nums.into_iter().map(Piece::Var));
        Some(p)
    }
}

impl Entity {
    fn pieces(&self) -> Vec<Piece> {
        match &self.enc {
            Enc::Custom(p) => p.clone(),
            Enc::Text(..) => Vec::new(),
        }
    }
}

/// The shape of a tensor literal: how many elements each level of brackets holds
fn literal_shape(lit: &str) -> Vec<usize> {
    let Some(inner) = lit.trim().strip_prefix('[').and_then(|l| l.strip_suffix(']')) else { return Vec::new() };
    let items = split_list(inner);
    let mut shape = vec![items.len()];
    if let Some(first) = items.first() {
        shape.extend(literal_shape(first));
    }
    shape
}

/// The text between the outer parentheses of `(...)`
fn inner_parens(body: &str) -> Option<&str> {
    body.trim().strip_prefix('(')?.strip_suffix(')')
}

/// Where the string at the start of `s` ends (after its closing quote)
fn string_end(s: &str) -> Option<usize> {
    let b = s.as_bytes();
    let mut i = 1;
    while i < b.len() {
        match b[i] {
            b'\\' => i += 2,
            b'"' => return Some(i + 1),
            _ => i += 1,
        }
    }
    None
}

/// The index of the bracket closing the one just before `s` starts
fn close(s: &str, open: char, shut: char) -> Option<usize> {
    let mut depth = 0usize;
    let mut quoted = false;
    let mut escaped = false;
    for (i, c) in s.char_indices() {
        if quoted {
            match (escaped, c) {
                (true, _) => escaped = false,
                (false, '\\') => escaped = true,
                (false, '"') => quoted = false,
                _ => {}
            }
            continue;
        }
        match c {
            '"' => quoted = true,
            c if c == open => depth += 1,
            c if c == shut && depth == 0 => return Some(i),
            c if c == shut => depth -= 1,
            _ => {}
        }
    }
    None
}

/// The byte index of `sep` at nesting depth zero, outside strings
fn split_top(s: &str, sep: &str) -> Option<usize> {
    let mut depth = 0i32;
    let mut quoted = false;
    let b = s.as_bytes();
    let mut i = 0;
    while i < b.len() {
        let c = b[i];
        if quoted {
            if c == b'\\' {
                i += 1;
            } else if c == b'"' {
                quoted = false;
            }
        } else {
            match c {
                b'"' => quoted = true,
                b'(' | b'[' | b'{' | b'<' => depth += 1,
                b')' | b']' | b'}' | b'>' => depth -= 1,
                _ if depth == 0 && s[i..].starts_with(sep) => return Some(i),
                _ => {}
            }
        }
        i += 1;
    }
    None
}

/// `a, b, c` split at the commas at depth zero
fn split_list(s: &str) -> Vec<&str> {
    let mut out = Vec::new();
    let mut rest = s;
    while let Some(at) = split_top(rest, ",") {
        out.push(rest[..at].trim());
        rest = &rest[at + 1..];
    }
    if !rest.trim().is_empty() {
        out.push(rest.trim());
    }
    out
}

fn parse_attr(s: &str) -> Result<Attribute<'_>, Error> {
    Attribute::try_from(s).map_err(|e| Error(e.to_string()))
}
