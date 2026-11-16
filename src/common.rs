use alloc::boxed::Box;
use alloc::format;
use alloc::string::String;
use alloc::vec::Vec;
use core::fmt;

use serde::Serialize;
use serde::de::DeserializeOwned;

use crate::generator::Printer;
use crate::parser::{Fields, Parser, R};

pub use crate::text::Str;

keywords! {
    pub enum Signedness { Signless = "i", Signed = "si", Unsigned = "ui" }

    pub enum ShapedKind { Tensor = "tensor", MemRef = "memref", Vector = "vector" }

    pub enum FloatKind {
        F4E2M1FN = "f4E2M1FN", F6E2M3FN = "f6E2M3FN", F6E3M2FN = "f6E3M2FN", F8E5M2 = "f8E5M2", F8E4M3 = "f8E4M3",
        F8E4M3FN = "f8E4M3FN", F8E5M2FNUZ = "f8E5M2FNUZ", F8E4M3FNUZ = "f8E4M3FNUZ", F8E4M3B11FNUZ = "f8E4M3B11FNUZ",
        F8E3M4 = "f8E3M4", F8E8M0FNU = "f8E8M0FNU", BF16 = "bf16", F16 = "f16", TF32 = "tf32", F32 = "f32", F64 = "f64",
        F80 = "f80", F128 = "f128",
    }
}

ast! {
    pub struct Module<'a> {
        pub items: Vec<Item<'a>>,
    }

    pub enum Item<'a> {
        AttrAlias { name: Str<'a>, value: Attribute<'a> },
        TypeAlias { name: Str<'a>, ty: Type<'a> },
        Metadata { body: Str<'a> },
        Op(Operation<'a>),
    }

    #[derive(Default)]
    pub struct Operation<'a> {
        pub results: Vec<ResultDef<'a>>,
        pub name: Str<'a>,
        pub operands: Vec<Value<'a>>,
        pub successors: Vec<Str<'a>>,
        pub properties: Option<Attribute<'a>>,
        pub regions: Vec<Region<'a>>,
        pub attributes: Vec<NamedAttr<'a>>,
        pub ty: FunctionType<'a>,
        pub loc: Option<Str<'a>>,
        pub raw: Option<Vec<Piece<'a>>>,
    }

    pub struct ResultDef<'a> {
        pub name: Str<'a>,
        pub count: Option<u32>,
    }

    pub enum Piece<'a> {
        Text(Str<'a>),
        Region(Region<'a>),
    }

    pub struct Value<'a> {
        pub name: Str<'a>,
        pub index: Option<u32>,
    }

    pub struct Region<'a> {
        pub blocks: Vec<Block<'a>>,
    }

    pub struct Block<'a> {
        pub label: Option<Str<'a>>,
        pub args: Vec<BlockArg<'a>>,
        pub ops: Vec<Operation<'a>>,
    }

    pub struct BlockArg<'a> {
        pub name: Str<'a>,
        pub ty: Type<'a>,
        pub loc: Option<Str<'a>>,
    }

    pub struct NamedAttr<'a> {
        pub name: Str<'a>,
        pub value: Option<Attribute<'a>>,
    }

    #[derive(Default)]
    pub struct FunctionType<'a> {
        pub inputs: Vec<Type<'a>>,
        pub results: Vec<Type<'a>>,
    }

    pub enum Dim {
        Static(i64),
        Dynamic,
        Scalable(i64),
    }

    pub struct Shaped<'a> {
        pub kind: ShapedKind,
        pub shape: Option<Vec<Dim>>,
        pub elem: Box<Type<'a>>,
        pub extras: Vec<Attribute<'a>>,
    }

    pub struct Extended<'a> {
        pub name: Str<'a>,
        pub body: Option<Str<'a>>,
        pub params: Vec<Attribute<'a>>,
    }

    pub enum Type<'a> {
        Integer { signedness: Signedness, width: u32 },
        Float(FloatKind),
        Index,
        NoneType,
        Token,
        Complex(Box<Type<'a>>),
        Tuple(Box<[Type<'a>]>),
        Function(Box<FunctionType<'a>>),
        Shaped(Box<Shaped<'a>>),
        Extended(Box<Extended<'a>>),
    }

    pub enum Attribute<'a> {
        Unit,
        Bool(bool),
        Int { lit: Str<'a>, ty: Option<Type<'a>> },
        Float { lit: Str<'a>, ty: Option<Type<'a>> },
        Str { lit: Str<'a>, ty: Option<Type<'a>> },
        Type(Type<'a>),
        Array(Vec<Attribute<'a>>),
        Dict(Vec<NamedAttr<'a>>),
        SymbolRef(Vec<Str<'a>>),
        DenseArray { ty: Type<'a>, values: Box<[Str<'a>]> },
        Builtin { name: Str<'a>, body: Str<'a>, ty: Option<Type<'a>> },
        Extended { ext: Box<Extended<'a>>, ty: Option<Type<'a>> },
    }
}

impl Extended<'_> {
    #[inline]
    pub fn inner(&self) -> Option<&str> {
        self.body.as_deref()?.strip_prefix('<')?.strip_suffix('>')
    }

    pub fn shaped_elem(&self) -> Option<Type<'static>> {
        let body = self.body.as_deref()?.strip_prefix('<')?;
        let mut depth = 0usize;
        let end = body.char_indices().find_map(|(i, c)| {
            match c {
                '<' | '(' | '[' | '{' => depth += 1,
                '>' | ')' | ']' | '}' if depth == 0 => return Some(i),
                '>' | ')' | ']' | '}' => depth -= 1,
                ',' if depth == 0 => return Some(i),
                _ => {}
            }
            None
        })?;
        if let Ok(t) = crate::Parser::read(body[..end].trim(), |p| p.ty()) {
            return Some(t.owned());
        }
        let shaped = format!("vector<{}>", body[..end].trim());
        match crate::Parser::read(&shaped, |p| p.ty()).ok()? {
            Type::Shaped(s) => Some(s.elem.owned()),
            _ => None,
        }
    }
}

impl Operation<'_> {
    pub(crate) fn shrink_to_fit(&mut self) {
        self.results.shrink_to_fit();
        self.operands.shrink_to_fit();
        self.successors.shrink_to_fit();
        self.regions.shrink_to_fit();
        self.attributes.shrink_to_fit();
        if let Some(Attribute::Dict(d)) = &mut self.properties {
            d.shrink_to_fit();
        }
        self.ty.inputs.shrink_to_fit();
        self.ty.results.shrink_to_fit();
    }
}

impl Type<'_> {
    pub const I1: Type<'static> = Type::Integer { signedness: Signedness::Signless, width: 1 };

    #[inline]
    pub const fn int(width: u32) -> Type<'static> {
        Type::Integer { signedness: Signedness::Signless, width }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, thiserror::Error)]
#[error("{line}:{col}: {msg}")]
pub struct ParseError {
    pub offset: usize,
    pub line: usize,
    pub col: usize,
    pub msg: String,
}

impl ParseError {
    pub fn at(src: &str, offset: usize, msg: impl Into<String>) -> Self {
        let before = &src[..offset.min(src.len())];
        let line = before.matches('\n').count() + 1;
        let col = offset - before.rfind('\n').map_or(0, |i| i + 1) + 1;
        Self { offset, line, col, msg: msg.into() }
    }

    #[inline]
    pub fn unplaced(offset: usize, msg: impl Into<String>) -> Self {
        Self { offset, line: 0, col: 0, msg: msg.into() }
    }

    pub fn placed(self, src: &str) -> Self {
        match self.line {
            0 => Self::at(src, self.offset, self.msg),
            _ => self,
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, thiserror::Error)]
#[error("{0}")]
pub struct Error(pub String);

impl From<&str> for Error {
    #[inline]
    fn from(s: &str) -> Self {
        Self(s.into())
    }
}

impl From<String> for Error {
    #[inline]
    fn from(s: String) -> Self {
        Self(s)
    }
}

impl serde::ser::Error for Error {
    #[inline]
    fn custom<T: fmt::Display>(msg: T) -> Self {
        Self(format!("{msg}"))
    }
}

impl serde::de::Error for Error {
    #[inline]
    fn custom<T: fmt::Display>(msg: T) -> Self {
        Self(format!("{msg}"))
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SymKind {
    Type,
    Attr,
}

impl SymKind {
    pub const fn sigil(self) -> char {
        match self {
            Self::Type => '!',
            Self::Attr => '#',
        }
    }
}

pub trait Print {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result;
}

pub trait Parse: Sized {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self>;
}

pub trait Op: Print + Parse + Serialize + DeserializeOwned {
    const NAME: &'static str;
    const KEYS: &'static [&'static str];
    const FIELDS: &'static [Field];
    const FORMAT: &'static str;
    const CUSTOM: bool = true;

    fn from_fields(f: &mut Fields) -> Result<Self, Error>;

    fn into_fields(self) -> Result<Vec<(&'static str, Content)>, Error>;

    fn fields(&self) -> Result<Vec<(&'static str, Content)>, Error>;

    #[inline]
    fn serialize_fields<S: serde::Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        Content::Struct(Self::NAME, self.fields().map_err(serde::ser::Error::custom)?).serialize(s)
    }

    #[inline]
    fn into_content(self) -> Result<Content, Error> {
        Ok(Content::Struct(Self::NAME, self.into_fields()?))
    }

    #[inline]
    fn from_content(c: Content) -> Result<Self, Error> {
        Self::from_fields(&mut Fields::try_from(c)?)
    }

    #[inline]
    fn print_generic(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.generic(&Operation::of_op(self).map_err(|_| fmt::Error)?)
    }

    #[inline]
    fn owned<B: Op>(borrowed: B, p: &mut Parser<'_, '_>) -> R<Self> {
        borrowed.into_content().and_then(Self::from_content).or_else(|e| p.err(e.0))
    }

    fn print_by_format(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        if !Self::CUSTOM {
            return self.print_generic(p);
        }
        Format::of::<Self>().map_err(|_| fmt::Error)?.print(self, p)
    }

    fn parse_by_format(p: &mut Parser<'_, '_>) -> R<Self> {
        if !Self::CUSTOM {
            return p.err(format!("`{}` has no custom form", Self::NAME));
        }
        Format::of::<Self>().or_else(|e| p.err(e.0))?.parse(p)
    }

    fn template() -> Template
    where
        Self: 'static,
    {
        Template::of::<Self>()
    }
}

#[derive(Clone, Copy)]
pub struct Template {
    pub name: &'static str,
    pub custom: bool,
    pub parse: for<'a> fn(&mut Parser<'a, '_>) -> R<Operation<'a>>,
    pub print: fn(&Operation<'_>, &mut Printer<'_, '_>) -> Option<fmt::Result>,
    pub defaults: fn() -> Vec<NamedAttr<'static>>,
    pub format: fn() -> Option<Format<'static>>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct DialectTraits {
    pub dependents: &'static [&'static str],
    pub constant_materializer: bool,
    pub canonicalizer: bool,
}

pub trait Dialect: Send + Sync {
    fn namespace(&self) -> &'static str;

    #[inline]
    fn traits(&self) -> DialectTraits {
        DialectTraits::default()
    }

    fn ops(&self) -> Vec<Template>;

    #[inline]
    fn op_infos(&self) -> Vec<crate::OpInfo> {
        crate::OpInfos::upstream().of_dialect(self.namespace())
    }

    #[inline]
    fn parse_params<'a>(&self, kind: SymKind, name: &str, p: &mut Parser<'a, '_>) -> Option<R<Vec<Attribute<'a>>>> {
        let _ = (kind, name, p);
        None
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Content {
    Bool(bool),
    I8(i8),
    I16(i16),
    I32(i32),
    I64(i64),
    U8(u8),
    U16(u16),
    U32(u32),
    U64(u64),
    F32(f32),
    F64(f64),
    Char(char),
    Str(String),
    Bytes(Vec<u8>),
    None,
    Some(Box<Content>),
    Unit,
    UnitStruct(&'static str),
    Newtype(&'static str, Box<Content>),
    Seq(Vec<Content>),
    Map(Vec<(Content, Content)>),
    Struct(&'static str, Vec<(&'static str, Content)>),
    Variant(&'static str, u32, &'static str, Box<Payload>),
    Attr(Attribute<'static>),
    Region(Box<Region<'static>>),
}

#[derive(Debug, Clone, PartialEq)]
pub enum Payload {
    Unit,
    Newtype(Content),
    Tuple(Vec<Content>),
    Struct(Vec<(&'static str, Content)>),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Infer {
    I1,
    I1Like(&'static str),
    TypeOf(&'static str),
    Same(&'static str),
    Is(&'static str),
    ElemOf(&'static str),
    Width(&'static str),
    Svbool(&'static str),
    OuterTile(&'static str),
    Pair(&'static str),
    Field(&'static str),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Role {
    Operand { ty: &'static str },
    Type { result: Option<usize>, infer: Option<Infer>, strip: Option<&'static str> },
    Prop { unit: bool, int: Option<&'static str>, dialect: Option<&'static str>, default: Option<&'static str>, dense: Option<&'static str>, symbol: bool, bits: Option<&'static str>, optional: bool },
    Region,
    Successor,
    Attrs,
    Loc,
}

#[derive(Debug, Clone, Copy)]
pub struct Field {
    pub name: &'static str,
    pub variadic: bool,
    pub role: Role,
    pub ty: FieldType,
}

#[derive(Debug, Clone, Copy)]
pub struct Schema {
    pub name: &'static str,
    pub fields: &'static [Field],
}

#[derive(Clone, Copy)]
pub enum FieldType {
    Attr { required: bool },
    Typed(fn(Content) -> Result<Content, Error>),
}

impl FieldType {
    #[inline]
    pub const fn of<T: Serialize + DeserializeOwned>() -> Self {
        Self::Typed(Self::through::<T>)
    }

    #[inline]
    fn through<T: Serialize + DeserializeOwned>(c: Content) -> Result<Content, Error> {
        Content::of(&c.to::<T>()?)
    }
}

impl fmt::Debug for FieldType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Attr { required } => write!(f, "Attr {{ required: {required} }}"),
            Self::Typed(_) => f.write_str("Typed"),
        }
    }
}

impl Schema {
    #[inline]
    pub fn field(&self, name: &str) -> Option<&Field> {
        self.fields.iter().find(|f| f.name == name && !matches!(f.role, Role::Attrs | Role::Loc))
    }

    #[inline]
    pub fn of_role<P: Fn(&Role) -> bool>(&self, pick: P) -> impl Iterator<Item = &'static Field> + use<P> {
        self.fields.iter().filter(move |f| pick(&f.role))
    }

    #[inline]
    pub fn defaults(&self) -> Vec<NamedAttr<'static>> {
        self.of_role(|r| matches!(r, Role::Prop { optional: false, .. })).filter_map(|f| f.default_attr().map(|a| NamedAttr::of(f.name, a))).collect()
    }
}

impl Field {
    pub fn dense_ty(&self) -> Option<Type<'static>> {
        let Role::Prop { dense: Some(el), .. } = self.role else { return None };
        Some(match el {
            "i1" => Type::Integer { signedness: Signedness::Signless, width: 1 },
            "i8" => Type::Integer { signedness: Signedness::Signless, width: 8 },
            "i16" => Type::Integer { signedness: Signedness::Signless, width: 16 },
            "i32" => Type::Integer { signedness: Signedness::Signless, width: 32 },
            "i64" => Type::Integer { signedness: Signedness::Signless, width: 64 },
            "f32" => Type::Float(FloatKind::F32),
            "f64" => Type::Float(FloatKind::F64),
            _ => return None,
        })
    }

    #[inline]
    pub fn keyword_dialect(&self) -> Option<(&'static str, &'static str)> {
        let Role::Prop { dialect: Some(d), .. } = self.role else { return None };
        d.split_once('<')
    }

    pub fn bit_enum(&self) -> Option<BitEnum> {
        let Role::Prop { bits: Some(b), .. } = self.role else { return None };
        let mut parts = b.splitn(3, '/');
        let (mnemonic, sep, cases) = (parts.next()?, parts.next()?, parts.next()?);
        let cases = cases.split(';').filter_map(|c| c.split_once('=')).filter_map(|(k, v)| Some((k, v.parse().ok()?))).collect();
        Some(BitEnum { mnemonic, sep, cases })
    }

    pub fn default_attr(&self) -> Option<Attribute<'static>> {
        match self.role {
            Role::Prop { int: Some("i1"), default: Some(v), dialect: None, .. } => return Some(Attribute::Bool(!matches!(v, "0" | "false"))),
            Role::Prop { int: Some(t), default: Some(v), dialect: None, .. } => return Some(Attribute::Int { lit: Str::Borrowed(v), ty: Type::try_from(t).ok() }),
            Role::Prop { int: None, default: Some(v @ ("true" | "false")), dialect: None, .. } => return Some(Attribute::Bool(v == "true")),
            _ => {}
        }
        let Role::Prop { dialect: Some(d), default: Some(body), .. } = self.role else { return None };
        if let Some((ns, mnemonic)) = self.keyword_dialect() {
            return Some(Attribute::Extended { ext: alloc::boxed::Box::new(Extended { name: Str::Borrowed(ns), body: Some(Str::Owned(format!("<{mnemonic} {body}>"))), params: Vec::new() }), ty: None });
        }
        let body = (!body.is_empty()).then_some(Str::Borrowed(body));
        Some(Attribute::Extended { ext: alloc::boxed::Box::new(Extended { name: Str::Borrowed(d), body, params: Vec::new() }), ty: None })
    }
}

pub struct BitEnum {
    pub mnemonic: &'static str,
    pub sep: &'static str,
    pub cases: Vec<(&'static str, u64)>,
}

impl BitEnum {
    pub fn show(&self, value: u64) -> String {
        let (groups, single): (Vec<_>, Vec<_>) = self.cases.iter().filter(|(_, v)| *v != 0).partition(|(_, v)| v.count_ones() > 1);
        let mut left = value;
        let mut words = Vec::new();
        for &(k, v) in groups.into_iter().chain(single) {
            if left & v == v {
                words.push(k);
                left &= !v;
            }
        }
        if words.is_empty() {
            words.extend(self.cases.iter().find(|(_, v)| *v == 0).map(|(k, _)| *k));
        }
        let list = words.join(self.sep);
        if self.mnemonic.is_empty() { list } else { format!("{}<{list}>", self.mnemonic) }
    }

    #[inline]
    pub fn value(&self, word: &str) -> Option<u64> {
        self.cases.iter().find(|(k, _)| *k == word).map(|(_, v)| *v)
    }
}

impl Module<'_> {
    pub fn aliases(&self) -> Vec<(String, String)> {
        self.items
            .iter()
            .filter_map(|i| match i {
                Item::AttrAlias { name, value } => Some((String::from(&**name), alloc::format!("{value}"))),
                _ => None,
            })
            .collect()
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Elem<'f> {
    Lit(&'f str),
    Var(&'f str),
    QVar(&'f str),
    TypeOf(&'f str, bool),
    FnType(Vec<&'f str>, Vec<&'f str>),
    AttrDict(bool),
    Group { anchor: &'f str, elems: Vec<Elem<'f>> },
    Zip { integers: &'f str, values: &'f str },
    Custom { name: &'f str, parts: Vec<Elem<'f>> },
    OiList(Vec<Elem<'f>>),
}

pub struct Format<'f> {
    pub elems: Vec<Elem<'f>>,
    pub schema: Schema,
}

impl<'f> Format<'f> {
    pub fn new(src: &'f str, schema: Schema) -> Result<Self, Error> {
        let (elems, rest) = Elem::list(src, schema.name)?;
        if !rest.trim().is_empty() {
            return Err(format!("{}: format: unexpected `{rest}`", schema.name).into());
        }
        Ok(Self { elems, schema })
    }

    #[inline]
    pub fn of<O: Op>() -> Result<Format<'static>, Error> {
        Format::new(O::FORMAT, Schema::of::<O>())
    }

    #[inline]
    pub fn field(&self, name: &str) -> Result<&Field, Error> {
        self.schema.field(name).ok_or_else(|| format!("{}: format names no field `{name}`", self.schema.name).into())
    }

    pub fn type_var(&self, name: &str) -> Result<&Field, Error> {
        let f = self.field(name)?;
        match f.role {
            Role::Operand { ty } => self.field(ty),
            Role::Type { .. } => Ok(f),
            _ => Err(format!("`type(${name})`: not an operand or type variable").into()),
        }
    }

    pub fn shared_count(&self, name: &str, var: &Field, len: impl FnOnce(&Field) -> usize) -> usize {
        match self.schema.field(name) {
            Some(f) if f.variadic && !var.variadic && matches!(f.role, Role::Operand { .. }) => len(f).max(1),
            _ => 1,
        }
    }

    pub fn before_colon(&self, name: &str) -> bool {
        let mut flat = Vec::new();
        Elem::flatten(&self.elems, &mut flat);
        let mut after = flat.into_iter().skip_while(|e| **e != Elem::Var(name) && **e != Elem::QVar(name)).skip(1);
        let maybe_empty = |e: &&Elem<'_>| match e {
            Elem::AttrDict(_) => true,
            Elem::Var(n) => self.schema.field(n).is_some_and(|f| f.variadic && matches!(f.role, Role::Operand { .. })),
            _ => false,
        };
        after.find(|e| !maybe_empty(e)) == Some(&Elem::Lit(":"))
    }

    pub fn keyword_dict(&self) -> bool {
        let mut flat = Vec::new();
        Elem::flatten(&self.elems, &mut flat);
        flat.contains(&&Elem::AttrDict(true))
    }

    #[inline]
    pub fn literal(&self, word: &str) -> bool {
        let mut flat = Vec::new();
        Elem::flatten(&self.elems, &mut flat);
        flat.contains(&&Elem::Lit(word))
    }

    #[inline]
    pub fn spelled(&self) -> Vec<&'f str> {
        let mut out = Vec::new();
        Elem::names(&self.elems, &mut out);
        out
    }
}

impl<'f> Elem<'f> {
    fn list(mut rest: &'f str, op: &str) -> Result<(Vec<Self>, &'f str), Error> {
        let bad = |m: String| Error(format!("{op}: format: {m}"));
        let var = |s: &'f str| -> Result<(&'f str, &'f str), Error> {
            let s = s.trim_start().strip_prefix('$').ok_or_else(|| bad(format!("expected `$name` at `{s}`")))?;
            let end = s.find(|c: char| !(c.is_ascii_alphanumeric() || c == '_')).unwrap_or(s.len());
            Ok((&s[..end], &s[end..]))
        };
        let close = |s: &'f str, c: char| s.trim_start().strip_prefix(c).ok_or_else(|| bad(format!("expected `{c}`")));
        let mut out = Vec::new();
        loop {
            rest = rest.trim_start();
            if let Some(after) = rest.strip_prefix("custom<") {
                let (elem, tail) = Self::custom(after, op)?;
                out.push(elem);
                rest = tail;
                continue;
            }
            if let Some(after) = rest.strip_prefix("oilist(") {
                let (elem, tail) = Self::oilist(after, op)?;
                out.push(elem);
                rest = tail;
                continue;
            }
            let (elem, tail) = match rest.chars().next() {
                None | Some(')') | Some('|') => return Ok((out, rest)),
                Some('`') => {
                    let end = rest[1..].find('`').ok_or_else(|| bad("unterminated literal".into()))?;
                    (Self::Lit(&rest[1..=end]), &rest[end + 2..])
                }
                Some('$') => {
                    let (name, tail) = var(rest)?;
                    (Self::Var(name), tail.strip_prefix('^').unwrap_or(tail))
                }
                Some('(') => {
                    let (elems, tail) = Self::list(&rest[1..], op)?;
                    let anchor = Self::anchor(&rest[1..]).ok_or_else(|| bad("a group needs an anchor `$x^`".into()))?;
                    (Self::Group { anchor, elems }, tail.strip_prefix(")?").ok_or_else(|| bad("a group must end with `)?`".into()))?)
                }
                _ if rest.starts_with("attr-dict-with-keyword") => (Self::AttrDict(true), &rest["attr-dict-with-keyword".len()..]),
                _ if rest.starts_with("attr-dict") => (Self::AttrDict(false), &rest["attr-dict".len()..]),
                _ if rest.starts_with("qualified(") => {
                    let (mut inner, tail) = Self::list(&rest["qualified(".len()..], op)?;
                    let (Some(elem), true) = (inner.pop(), inner.is_empty()) else { return Err(bad("`qualified(...)` takes one element".into())) };
                    let elem = match elem {
                        Self::TypeOf(n, _) => Self::TypeOf(n, true),
                        Self::Var(n) => Self::QVar(n),
                        e => e,
                    };
                    (elem, close(tail, ')')?)
                }
                _ if rest.starts_with("type(") => {
                    let (name, tail) = var(&rest["type(".len()..])?;
                    let tail = close(tail, ')')?;
                    (Self::TypeOf(name, false), tail.strip_prefix('^').unwrap_or(tail))
                }
                _ if rest.starts_with("functional-type(") => {
                    let side = |mut s: &'f str, end: char| -> Result<(Vec<&'f str>, &'f str), Error> {
                        let mut names = Vec::new();
                        loop {
                            let (n, tail) = var(s)?;
                            names.push(n);
                            s = tail.trim_start();
                            if s.starts_with(end) {
                                return Ok((names, s));
                            }
                        }
                    };
                    let (a, tail) = side(&rest["functional-type(".len()..], ',')?;
                    let (b, tail) = side(close(tail, ',')?, ')')?;
                    (Self::FnType(a, b), close(tail, ')')?)
                }
                _ => return Err(bad(format!("unexpected `{rest}`"))),
            };
            out.push(elem);
            rest = tail;
        }
    }

    fn oilist(mut rest: &'f str, op: &str) -> Result<(Self, &'f str), Error> {
        let bad = |m: &str| Error(format!("{op}: format: oilist: {m}"));
        let mut clauses = Vec::new();
        loop {
            let (elems, tail) = Self::list(rest, op)?;
            let mut names = Vec::new();
            Self::names(&elems, &mut names);
            let anchor = names.first().copied().ok_or_else(|| bad("a clause without a variable"))?;
            clauses.push(Self::Group { anchor, elems });
            let tail = tail.trim_start();
            match tail.strip_prefix('|') {
                Some(next) => rest = next,
                None => return Ok((Self::OiList(clauses), tail.strip_prefix(')').ok_or_else(|| bad("expected `)`"))?)),
            }
        }
    }

    fn anchor(group: &'f str) -> Option<&'f str> {
        let (mut depth, mut quoted) = (0usize, false);
        for (i, c) in group.char_indices() {
            match c {
                '`' => quoted = !quoted,
                _ if quoted => {}
                '(' => depth += 1,
                ')' if depth == 0 => return None,
                ')' => depth -= 1,
                '^' if depth == 0 => {
                    let pre = &group[..i];
                    let pre = pre.strip_suffix(')').unwrap_or(pre);
                    return pre.rfind('$').map(|s| &pre[s + 1..]);
                }
                _ => {}
            }
        }
        None
    }

    fn flatten<'x>(elems: &'x [Self], out: &mut Vec<&'x Self>) {
        for e in elems {
            match e {
                Self::Group { elems, .. } | Self::Custom { parts: elems, .. } | Self::OiList(elems) => Self::flatten(elems, out),
                e => out.push(e),
            }
        }
    }

    fn names(elems: &[Self], out: &mut Vec<&'f str>) {
        for e in elems {
            match e {
                Self::Var(n) | Self::QVar(n) => out.push(n),
                Self::Zip { integers, values } => out.extend([integers, values]),
                Self::Group { elems, .. } | Self::Custom { parts: elems, .. } | Self::OiList(elems) => Self::names(elems, out),
                _ => {}
            }
        }
    }

    #[inline]
    pub fn check(src: &'f str, op: &str) -> Result<(), Error> {
        let (_, rest) = Self::list(src, op)?;
        if rest.trim().is_empty() { Ok(()) } else { Err(Error(format!("{op}: format: unexpected `{rest}`"))) }
    }

    fn custom(after: &'f str, op: &str) -> Result<(Self, &'f str), Error> {
        let bad = |m: String| Error(format!("{op}: format: {m}"));
        let (name, tail) = after.split_once('>').ok_or_else(|| bad("`custom<` without its `>`".into()))?;
        let tail = tail.trim_start().strip_prefix('(').ok_or_else(|| bad(format!("`custom<{name}>` without `(`")))?;
        let end = Self::close(tail).ok_or_else(|| bad(format!("`custom<{name}>(` without `)`")))?;
        let mut args = Vec::new();
        for piece in Self::pieces(&tail[..end]) {
            let (mut elems, rest) = Self::list(piece, op)?;
            match (elems.pop(), elems.is_empty() && rest.trim().is_empty()) {
                (Some(e), true) => args.push(e),
                _ => return Err(bad(format!("`custom<{name}>`: `{piece}` is not one element"))),
            }
        }
        let parts = crate::syntax::expand(name, &args).ok_or_else(|| bad(format!("`custom<{name}>`: no such directive")))??;
        Ok((Self::Custom { name, parts }, &tail[end + 1..]))
    }

    fn close(s: &str) -> Option<usize> {
        let (mut depth, mut lit) = (0i32, false);
        for (i, c) in s.char_indices() {
            match c {
                '`' => lit = !lit,
                _ if lit => {}
                '(' => depth += 1,
                ')' if depth == 0 => return Some(i),
                ')' => depth -= 1,
                _ => {}
            }
        }
        None
    }

    fn pieces(s: &'f str) -> Vec<&'f str> {
        let (mut out, mut depth, mut lit, mut start) = (Vec::new(), 0i32, false, 0usize);
        for (i, c) in s.char_indices() {
            match c {
                '`' => lit = !lit,
                _ if lit => {}
                '(' => depth += 1,
                ')' => depth -= 1,
                ',' if depth == 0 => {
                    out.push(&s[start..i]);
                    start = i + 1;
                }
                _ => {}
            }
        }
        if !s[start..].trim().is_empty() || !out.is_empty() {
            out.push(&s[start..]);
        }
        out
    }
}
