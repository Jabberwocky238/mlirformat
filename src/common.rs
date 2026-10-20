//! Everything an MLIR IR is made of, plus the traits dialects build on. Reading text is
//! `parser.rs`, writing it is `generator.rs`; this file only defines.
//!
//! ```text
//! Module      top-level ops + type / attribute aliases
//! Operation   the one instruction: results, name, operands, successors, properties, regions,
//!             attributes, signature, location (a custom form no dialect understood stays raw)
//! Region      blocks;   Block: label, typed arguments, ops;   Value: an SSA name
//! Type        builtin types structured; dialect types `!ns.name<...>` as name + body
//! Attribute   compile-time constants; dialect attributes `#ns.name<...>` as name + body
//! Dialect     a namespace's custom syntax; `#[mlir::op]` structs are typed views of Operation
//! ```

use alloc::borrow::Cow;
use alloc::boxed::Box;
use alloc::format;
use alloc::string::String;
use alloc::vec::Vec;
use core::fmt;

use serde::Serialize;
use serde::de::DeserializeOwned;

use crate::generator::Printer;
use crate::parser::{Parser, R};

/// Source text slice; borrowed after parsing, owned after building or deserializing.
pub type Str<'a> = Cow<'a, str>;

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
    /// A whole `.mlir` file.
    pub struct Module<'a> {
        pub items: Vec<Item<'a>>,
    }

    pub enum Item<'a> {
        /// `#name = <attr>`
        AttrAlias { name: Str<'a>, value: Attribute<'a> },
        /// `!name = <type>`
        TypeAlias { name: Str<'a>, ty: Type<'a> },
        /// `{-# ... #-}`, raw body between the markers.
        Metadata { body: Str<'a> },
        Op(Operation<'a>),
    }

    /// ⭐ The one instruction. Generic form: `%r = "name"(operands)[^succ] <{props}> (regions) {attrs} : type loc(...)`.
    #[derive(Default)]
    pub struct Operation<'a> {
        pub results: Vec<ResultDef<'a>>,
        /// Raw (still escaped) op name.
        pub name: Str<'a>,
        pub operands: Vec<Value<'a>>,
        /// Block labels without the `^`.
        pub successors: Vec<Str<'a>>,
        pub properties: Option<Attribute<'a>>,
        pub regions: Vec<Region<'a>>,
        pub attributes: Vec<NamedAttr<'a>>,
        pub ty: FunctionType<'a>,
        /// Raw contents of `loc(...)`.
        pub loc: Option<Str<'a>>,
        /// A custom form no dialect understood: the text after the name, with nested regions
        /// still parsed. The structured fields above are then empty.
        pub raw: Option<Vec<Piece<'a>>>,
    }

    /// `%name` or `%name:count` on the left of `=`.
    pub struct ResultDef<'a> {
        pub name: Str<'a>,
        pub count: Option<u32>,
    }

    pub enum Piece<'a> {
        Text(Str<'a>),
        Region(Region<'a>),
    }

    /// An SSA value: `%name` or `%name#index`.
    pub struct Value<'a> {
        pub name: Str<'a>,
        pub index: Option<u32>,
    }

    pub struct Region<'a> {
        pub blocks: Vec<Block<'a>>,
    }

    pub struct Block<'a> {
        /// Label without the `^`; `None` for an implicit entry block.
        pub label: Option<Str<'a>>,
        pub args: Vec<BlockArg<'a>>,
        pub ops: Vec<Operation<'a>>,
    }

    pub struct BlockArg<'a> {
        pub name: Str<'a>,
        pub ty: Type<'a>,
        pub loc: Option<Str<'a>>,
    }

    /// `name = value`, or a bare `name` (unit attribute). A quoted name keeps its quotes.
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
        /// Scalable vector dim `[n]`.
        Scalable(i64),
    }

    pub struct Shaped<'a> {
        pub kind: ShapedKind,
        /// `None` for unranked (`*`).
        pub shape: Option<Vec<Dim>>,
        pub elem: Box<Type<'a>>,
        /// Encoding / layout / memory space attributes after the element type.
        pub extras: Vec<Attribute<'a>>,
    }

    /// Dialect type/attribute (`!ns.name<...>`, `#ns.name<...>`) or alias (`!t`, `#map`).
    pub struct Extended<'a> {
        pub name: Str<'a>,
        /// Raw body including delimiters. Printed verbatim when present.
        pub body: Option<Str<'a>>,
        /// Structured parameters from a [`Dialect`]; printed as `<p, ...>` when there is no body.
        pub params: Vec<Attribute<'a>>,
    }

    pub enum Type<'a> {
        Integer { signedness: Signedness, width: u32 },
        Float(FloatKind),
        Index,
        NoneType,
        Complex(Box<Type<'a>>),
        Tuple(Vec<Type<'a>>),
        Function(FunctionType<'a>),
        Shaped(Shaped<'a>),
        /// `!name` or `!name<...>`: dialect type or alias.
        Extended(Extended<'a>),
    }

    pub enum Attribute<'a> {
        Unit,
        Bool(bool),
        /// Raw literal (decimal or hex), optional `: type`.
        Int { lit: Str<'a>, ty: Option<Type<'a>> },
        Float { lit: Str<'a>, ty: Option<Type<'a>> },
        /// Raw (still escaped) string contents.
        Str { lit: Str<'a>, ty: Option<Type<'a>> },
        Type(Type<'a>),
        Array(Vec<Attribute<'a>>),
        Dict(Vec<NamedAttr<'a>>),
        /// `@a::@b`; quoted segments keep their quotes.
        SymbolRef(Vec<Str<'a>>),
        /// `array<i32: 1, 2>`
        DenseArray { ty: Type<'a>, values: Vec<Str<'a>> },
        /// Builtin keyword attribute with raw body: `dense<...>`, `affine_map<...>`, `distinct[0]<...>`, ...
        Builtin { name: Str<'a>, body: Str<'a>, ty: Option<Type<'a>> },
        /// `#name` or `#name<...>` with optional `: type`: dialect attribute or alias.
        Extended { ext: Extended<'a>, ty: Option<Type<'a>> },
    }
}

impl Type<'_> {
    pub const I1: Type<'static> = Type::Integer { signedness: Signedness::Signless, width: 1 };

    pub const fn int(width: u32) -> Type<'static> {
        Type::Integer { signedness: Signedness::Signless, width }
    }
}

// ---- errors ------------------------------------------------------------------------------

/// A text error with its position.
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
}

/// A conversion error (typed op ⇄ [`Operation`], serde).
#[derive(Debug, Clone, PartialEq, Eq, thiserror::Error)]
#[error("{0}")]
pub struct Error(pub String);

impl From<&str> for Error {
    fn from(s: &str) -> Self {
        Self(s.into())
    }
}

impl From<String> for Error {
    fn from(s: String) -> Self {
        Self(s)
    }
}

impl serde::ser::Error for Error {
    fn custom<T: fmt::Display>(msg: T) -> Self {
        Self(format!("{msg}"))
    }
}

impl serde::de::Error for Error {
    fn custom<T: fmt::Display>(msg: T) -> Self {
        Self(format!("{msg}"))
    }
}

// ---- dialects and typed ops --------------------------------------------------------------

/// Which kind of extended symbol a body belongs to.
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

/// ⭐ A typed op: a struct written with `#[mlir::op]`, a typed view of [`Operation`]. Conversions
/// go through serde; the custom form follows [`Op::FORMAT`] unless `print` / `parse` are written
/// by hand (`func.func`, `builtin.module`).
/// ⭐ 写出自定义形式 —— 和 [`Parse`] 对偶，一如 `From` 之于 `Into`。
pub trait Print {
    /// 写出自定义形式，op 名在内。
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result;
}

/// ⭐ 从自定义形式读回 —— 和 [`Print`] 对偶。
///
/// **这一对的法则是 `parse(print(x)) == x`。** `#[mlir::op(format = "…")]` 由**一条格式串**
/// 同时生成两侧，法则因此自动成立——这正是「实现 `From` 就白得 `Into`」的那个形状。
/// 写 `custom` 的 op 自己写两侧，就脱离了这条保证：两个函数可以互相说谎，法则只能靠
/// `tests/dialects.rs` 拿 `mlir-opt` 的真实输出去守。⛔ 所以 `custom` 是逃生口，不是选项，
/// 能用格式串说清的就别手写。
pub trait Parse: Sized {
    /// 读 op 名之后的那一截。
    fn parse(p: &mut Parser<'_, '_>) -> R<Self>;
}

pub trait Op: Print + Parse + Serialize + DeserializeOwned {
    /// Fully qualified name, e.g. `"arith.addi"`.
    const NAME: &'static str;
    /// ODS-style assembly format (see [`Elem`]).
    const FORMAT: &'static str;
    /// Whether the op has a custom form; `false` (`#[mlir::op(..., generic)]`): it always prints
    /// generic, typed conversions still work.
    const CUSTOM: bool = true;

    /// This op written generically. A hand-written [`print`](Self::print) ends here whenever the
    /// custom form cannot say what the op holds — the generic form always can, and is still
    /// valid MLIR.
    fn print_generic(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.generic(&Operation::of_op(self).map_err(|_| fmt::Error)?)
    }

    /// Hands back an op that owns its text. A hand-written [`parse`](Self::parse) builds its op
    /// out of pieces borrowed from the parser; those borrows end with the call, so the op it
    /// returns has to be a copy. It takes the borrowed op as an argument rather than `self`
    /// precisely because the two differ in lifetime.
    fn owned<B: Serialize>(borrowed: &B, p: &mut Parser<'_, '_>) -> R<Self> {
        Content::convert(borrowed).or_else(|e| p.err(e.0))
    }

    /// 照 [`FORMAT`](Self::FORMAT) 写出去 —— `#[mlir::op]` 生成的 [`Print`] 走这里。
    fn print_by_format(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        if !Self::CUSTOM {
            return self.print_generic(p);
        }
        Format::of::<Self>().map_err(|_| fmt::Error)?.print(self, p)
    }

    /// 照 [`FORMAT`](Self::FORMAT) 读回来 —— `#[mlir::op]` 生成的 [`Parse`] 走这里。
    fn parse_by_format(p: &mut Parser<'_, '_>) -> R<Self> {
        if !Self::CUSTOM {
            return p.err(format!("`{}` has no custom form", Self::NAME));
        }
        Format::of::<Self>().or_else(|e| p.err(e.0))?.parse(p)
    }

    /// ⭐ The op's blueprint: an empty template to inject into an [`MlirOpt`](crate::MlirOpt).
    fn template() -> Template
    where
        Self: 'static,
    {
        Template::of::<Self>()
    }
}

/// A typed op with its type erased: what an [`MlirOpt`](crate::MlirOpt) keeps in its op table.
#[derive(Clone, Copy)]
pub struct Template {
    pub name: &'static str,
    /// Whether the typed op has a custom assembly format; `false` ⇒ it only ever prints generic
    /// (ODS syntax the format engine cannot express, e.g. a C++ `print` / `parse`).
    pub custom: bool,
    /// Custom form (after the name) → op.
    pub parse: for<'a> fn(&mut Parser<'a, '_>) -> R<Operation<'a>>,
    /// Op → custom form; `None` when the op does not fit the typed op (it then prints generic).
    pub print: fn(&Operation<'_>, &mut Printer<'_, '_>) -> Option<fmt::Result>,
}

/// ⭐ A dialect: a namespace and its op table. `#[mlir::dialect]` writes one from an enum of
/// `#[mlir::op]` structs; register it with `MlirOpt::register::<D>()`.
pub trait Dialect {
    /// Namespace, e.g. `"func"` for `func.call`, `!func.x`, `#func.x`.
    const NAMESPACE: &'static str;

    /// The op table.
    fn ops() -> Vec<Template>;

    /// Structures the body of `!ns.name<...>` / `#ns.name<...>`, positioned at its opening
    /// delimiter; `None` keeps it raw.
    fn parse_params<'a>(kind: SymKind, name: &str, p: &mut Parser<'a, '_>) -> Option<R<Vec<Attribute<'a>>>> {
        let _ = (kind, name, p);
        None
    }
}

// ---- the serde data model ----------------------------------------------------------------

/// ⭐ One value of the serde data model: typed op ⇄ [`Operation`] goes through it. It keeps
/// integer widths and enum / variant / field names: enough to tell a `Type` from an `Attribute`
/// from a plain Rust value.
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
    /// `(enum, variant index, variant, payload)`.
    Variant(&'static str, u32, &'static str, Box<Payload>),
    /// An attribute read off an op: deserializes as whatever the field asks for — `bool` (unit
    /// attribute present), an integer / float / string, a user enum (case value or name), or the
    /// `Attribute` itself.
    Attr(Attribute<'static>),
}

/// What an enum variant carries.
#[derive(Debug, Clone, PartialEq)]
pub enum Payload {
    Unit,
    Newtype(Content),
    Tuple(Vec<Content>),
    Struct(Vec<(&'static str, Content)>),
}

// ---- field roles -------------------------------------------------------------------------

/// How a type variable the custom form does not spell is recovered.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Infer {
    /// Exactly `i1` (`cf.cond_br`'s condition).
    I1,
    /// `i1` shaped like type variable `.0` (`arith.cmpi`'s result).
    I1Like(&'static str),
    /// The type of attribute `.0` (`arith.constant`'s result).
    TypeOf(&'static str),
    /// The same type(s) as type variable `.0` (`arith.mulsi_extended`'s high half).
    Same(&'static str),
    /// Always type `.0` (`index`'s operands and results).
    Is(&'static str),
    /// The element type of type variable `.0`: `complex<T>`, a tensor / vector / memref of `T` (`complex.re`'s result).
    ElemOf(&'static str),
}

/// A field's MLIR role. `#[mlir::op]` spells it in the field's serde name:
///
/// ```text
/// %name[*]:T                      operand(s); their type is type variable `T`
/// !name[*][=k][~i1|~i1:T|~of:a|~eq:T|~is:ty|~el:T]   type variable; `=k`: result #k; `~`: how custom form infers it
/// #name[?][:iN][@dialect.attr][|default]
///                                 property; `?`: unit (a `bool`); `:iN`: integer type of an enum's
///                                 case value (default `i64`); `@`: a dialect attribute spelled
///                                 without its prefix in custom form; `|`: default body, omitted there
/// ^name[*]   region(s)      >name[*]   successor(s)      {}   discardable attributes      @   location
/// ```
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Role {
    Operand { ty: &'static str },
    /// `strip`: a dialect type `type($x)` prints without its `!ns.name` (`<f32>`), unless `qualified`.
    Type { result: Option<usize>, infer: Option<Infer>, strip: Option<&'static str> },
    Prop { unit: bool, int: Option<&'static str>, dialect: Option<&'static str>, default: Option<&'static str>, dense: Option<&'static str>, symbol: bool, bits: Option<&'static str> },
    Region,
    Successor,
    Attrs,
    Loc,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Field {
    /// The serde key: the whole encoded role.
    pub key: &'static str,
    /// The MLIR-facing name (`$name` in the format, the property name).
    pub name: &'static str,
    pub variadic: bool,
    pub role: Role,
}

/// A typed op's shape: its name (the struct's serde name) and fields.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Schema {
    pub name: &'static str,
    pub fields: Vec<Field>,
}

impl TryFrom<&'static str> for Field {
    type Error = Error;

    fn try_from(key: &'static str) -> Result<Self, Error> {
        let bad = || Error(format!("not an op field key: `{key}`"));
        let split = |s: &'static str, c: char| s.split_once(c).map_or((s, None), |(a, b)| (a, Some(b)));
        let star = |s: &'static str| s.strip_suffix('*').map_or((s, false), |n| (n, true));
        let rest = key.get(1..).ok_or_else(bad)?;
        let (name, variadic, role) = match key.as_bytes()[0] {
            b'%' => {
                let (head, ty) = split(rest, ':');
                let (name, variadic) = star(head);
                (name, variadic, Role::Operand { ty: ty.ok_or_else(bad)? })
            }
            b'!' => {
                let (head, infer) = split(rest, '~');
                let (head, strip) = split(head, '@');
                let (head, result) = split(head, '=');
                let (name, variadic) = star(head);
                let infer = match infer.map(|i| split(i, ':')) {
                    None => None,
                    Some(("i1", None)) => Some(Infer::I1),
                    Some(("i1", Some(var))) => Some(Infer::I1Like(var)),
                    Some(("of", Some(attr))) => Some(Infer::TypeOf(attr)),
                    Some(("eq", Some(var))) => Some(Infer::Same(var)),
                    Some(("is", Some(ty))) => Some(Infer::Is(ty)),
                    Some(("el", Some(var))) => Some(Infer::ElemOf(var)),
                    Some(_) => return Err(bad()),
                };
                (name, variadic, Role::Type { result: result.map(str::parse).transpose().map_err(|_| bad())?, infer, strip })
            }
            b'#' => {
                // `%`: a bit enum, last since its separator may be a `|`.
                let (rest, bits) = split(rest, '%');
                let (head, default) = split(rest, '|');
                let (head, dialect) = split(head, '@');
                let (name, int) = split(head, ':');
                let (name, dense) = split(name, '&');
                // `$`: a `SymbolNameAttr`, a string the custom form spells `@name`.
                let (name, symbol) = name.strip_suffix('$').map_or((name, false), |n| (n, true));
                let (name, unit) = name.strip_suffix('?').map_or((name, false), |n| (n, true));
                (name, false, Role::Prop { unit, int, dialect, default, dense, symbol, bits })
            }
            b'^' => {
                let (name, variadic) = star(rest);
                (name, variadic, Role::Region)
            }
            b'>' => {
                let (name, variadic) = star(rest);
                (name, variadic, Role::Successor)
            }
            b'{' if rest == "}" => ("", false, Role::Attrs),
            b'@' => ("", false, Role::Loc),
            _ => return Err(bad()),
        };
        Ok(Self { key, name, variadic, role })
    }
}

impl Schema {
    pub fn field(&self, name: &str) -> Option<&Field> {
        self.fields.iter().find(|f| f.name == name && !matches!(f.role, Role::Attrs | Role::Loc))
    }

    pub fn of_role(&self, pick: impl Fn(&Role) -> bool) -> impl Iterator<Item = &Field> {
        self.fields.iter().filter(move |f| pick(&f.role))
    }
}

impl Field {
    /// The element type of a dense array property, which the custom form does not print.
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

    /// A bit enum property's cases (`overflow<nsw, nuw>`).
    pub fn bit_enum(&self) -> Option<BitEnum> {
        let Role::Prop { bits: Some(b), .. } = self.role else { return None };
        let mut parts = b.splitn(3, '/');
        let (mnemonic, sep, cases) = (parts.next()?, parts.next()?, parts.next()?);
        let cases = cases.split(';').filter_map(|c| c.split_once('=')).filter_map(|(k, v)| Some((k, v.parse().ok()?))).collect();
        Some(BitEnum { mnemonic, sep, cases })
    }

    /// A property's default value (`#dialect.attr<default>`, or an integer `0 : i64`).
    pub fn default_attr(&self) -> Option<Attribute<'static>> {
        if let Role::Prop { int: Some(t), default: Some(v), dialect: None, .. } = self.role {
            return Some(Attribute::Int { lit: Cow::Borrowed(v), ty: Type::try_from(t).ok() });
        }
        let Role::Prop { dialect: Some(d), default: Some(body), .. } = self.role else { return None };
        let body = (!body.is_empty()).then_some(Cow::Borrowed(body));
        Some(Attribute::Extended { ext: Extended { name: Cow::Borrowed(d), body, params: Vec::new() }, ty: None })
    }
}

/// A bit enum property (`NamedEnumProp<IntegerOverflowFlags, "overflow">`, `EnumProp<GEPNoWrapFlags>`):
/// stored as its integer, spelled as its set cases.
pub struct BitEnum {
    /// `overflow` ⇒ `overflow<...>`; empty: the cases alone.
    pub mnemonic: &'static str,
    pub sep: &'static str,
    /// `(keyword, value)`; a group's value has several bits.
    pub cases: Vec<(&'static str, u64)>,
}

impl BitEnum {
    /// The cases of `value`, groups first (`printBitEnumPrimaryGroups`): `inbounds|nuw`.
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

    /// The value of case `word`.
    pub fn value(&self, word: &str) -> Option<u64> {
        self.cases.iter().find(|(k, _)| *k == word).map(|(_, v)| *v)
    }
}

impl Module<'_> {
    /// The attribute aliases the module defines, each as `(name, the attribute's text)`. An op
    /// whose custom form has to look inside an alias — an `affine` memory op and its `#map` —
    /// reads it back from here, through [`Printer::alias`](crate::Printer::alias) or
    /// [`Parser::alias`](crate::Parser::alias).
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

// ---- assembly formats --------------------------------------------------------------------

/// One element of an ODS-style assembly format.
///
/// ```text
/// `lit`                     literal (keyword or punctuation; `` `` `` suppresses the next space, `` ` ` `` writes one)
/// $x                        a field: operand(s), type variable, property, successor, region
/// type($x)                  the type(s) of operand group `x` (or type variable `x`)
/// functional-type($a, $b)   `(types of a) -> types of b`
/// attr-dict                 discardable attributes and the properties the format does not spell
/// ( ... $x^ ... )?          optional group, present when anchor `x` is (non-empty / true / not default)
/// custom<X>($a, $b)         a directive declared in [`crate::syntax`], expanded here and now
/// ```
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Elem<'f> {
    Lit(&'f str),
    Var(&'f str),
    /// `type($x)`; `true` inside `qualified(...)`.
    TypeOf(&'f str, bool),
    FnType(&'f str, &'f str),
    AttrDict,
    Group { anchor: &'f str, elems: Vec<Elem<'f>> },
    /// One list, two co-indexed fields: `integers` holds each static item, and the `kDynamic`
    /// sentinel wherever the item is the next operand of `values` instead. ODS has no way to
    /// say this, which is why upstream drops to C++ for it — see [`crate::syntax`].
    Zip { integers: &'f str, values: &'f str },
    /// What a `custom<X>(...)` call site stands for. It stays one element, because that is what
    /// ODS spaces it as: the parts inside are written tight, however they are declared.
    Custom { name: &'f str, parts: Vec<Elem<'f>> },
}

/// A tokenized assembly format with its op's schema.
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

    pub fn of<O: Op>() -> Result<Format<'static>, Error> {
        Format::new(O::FORMAT, Schema::of::<O>()?)
    }

    pub fn field(&self, name: &str) -> Result<&Field, Error> {
        self.schema.field(name).ok_or_else(|| format!("{}: format names no field `{name}`", self.schema.name).into())
    }

    /// `type($x)`: `x` if it is a type variable, else its operand group's type variable.
    pub fn type_var(&self, name: &str) -> Result<&Field, Error> {
        let f = self.field(name)?;
        match f.role {
            Role::Operand { ty } => self.field(ty),
            Role::Type { .. } => Ok(f),
            _ => Err(format!("`type(${name})`: not an operand or type variable").into()),
        }
    }

    /// Is variable `name` followed by a `:` literal (`attr-dict` aside)? Its attribute then
    /// carries no `: type` suffix.
    pub fn before_colon(&self, name: &str) -> bool {
        let mut flat = Vec::new();
        Elem::flatten(&self.elems, &mut flat);
        let mut after = flat.into_iter().skip_while(|e| **e != Elem::Var(name)).skip(1);
        after.find(|e| **e != Elem::AttrDict) == Some(&Elem::Lit(":"))
    }

    /// Is `word` one of the format's literals?
    pub fn literal(&self, word: &str) -> bool {
        let mut flat = Vec::new();
        Elem::flatten(&self.elems, &mut flat);
        flat.contains(&&Elem::Lit(word))
    }

    /// Fields the format spells by name (the other properties go through `attr-dict`).
    pub fn spelled(&self) -> Vec<&'f str> {
        let mut out = Vec::new();
        Elem::names(&self.elems, &mut out);
        out
    }
}

impl<'f> Elem<'f> {
    /// Elements up to the end of the input or a group's closing `)`.
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
            let (elem, tail) = match rest.chars().next() {
                None | Some(')') => return Ok((out, rest)),
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
                    // `$x^`, or `type($x)^`, outside any nested group: the anchor is `x`.
                    let anchor = Self::anchor(&rest[1..]).ok_or_else(|| bad("a group needs an anchor `$x^`".into()))?;
                    (Self::Group { anchor, elems }, tail.strip_prefix(")?").ok_or_else(|| bad("a group must end with `)?`".into()))?)
                }
                _ if rest.starts_with("attr-dict") => (Self::AttrDict, &rest["attr-dict".len()..]),
                // `qualified(x)`: types and attributes always print with their dialect prefix here.
                _ if rest.starts_with("qualified(") => {
                    let (mut inner, tail) = Self::list(&rest["qualified(".len()..], op)?;
                    let (Some(elem), true) = (inner.pop(), inner.is_empty()) else { return Err(bad("`qualified(...)` takes one element".into())) };
                    let elem = if let Self::TypeOf(n, _) = elem { Self::TypeOf(n, true) } else { elem };
                    (elem, close(tail, ')')?)
                }
                _ if rest.starts_with("type(") => {
                    let (name, tail) = var(&rest["type(".len()..])?;
                    let tail = close(tail, ')')?;
                    (Self::TypeOf(name, false), tail.strip_prefix('^').unwrap_or(tail))
                }
                _ if rest.starts_with("functional-type(") => {
                    let (a, tail) = var(&rest["functional-type(".len()..])?;
                    let (b, tail) = var(close(tail, ',')?)?;
                    (Self::FnType(a, b), close(tail, ')')?)
                }
                _ => return Err(bad(format!("unexpected `{rest}`"))),
            };
            out.push(elem);
            rest = tail;
        }
    }

    /// The `^` of a group's own elements (`group` past its `(`), not of a group nested in it.
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

    /// Elements in order, groups opened.
    fn flatten<'x>(elems: &'x [Self], out: &mut Vec<&'x Self>) {
        for e in elems {
            match e {
                Self::Group { elems, .. } | Self::Custom { parts: elems, .. } => Self::flatten(elems, out),
                e => out.push(e),
            }
        }
    }

    fn names(elems: &[Self], out: &mut Vec<&'f str>) {
        for e in elems {
            match e {
                Self::Var(n) => out.push(n),
                // Both halves are spelled by the list, so neither goes through `attr-dict`.
                Self::Zip { integers, values } => out.extend([integers, values]),
                Self::Group { elems, .. } | Self::Custom { parts: elems, .. } => Self::names(elems, out),
                _ => {}
            }
        }
    }

    /// Tokenizes without a schema: what `mlirformat tblgen` asks before it keeps a format, so
    /// an unknown directive or a wrong argument count makes the op generic instead of broken.
    pub fn check(src: &'f str, op: &str) -> Result<(), Error> {
        let (_, rest) = Self::list(src, op)?;
        if rest.trim().is_empty() { Ok(()) } else { Err(Error(format!("{op}: format: unexpected `{rest}`"))) }
    }

    /// `custom<Name>(a, b)`, past the `custom<` ⇒ what the rule stands for, and the rest.
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

    /// Where the `)` closing the paren we are inside sits; literals may hold parens of their own.
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

    /// The argument list's top-level pieces.
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
