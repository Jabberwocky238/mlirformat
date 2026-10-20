//! ⭐ IR → text: the printer, the serde `Serializer` that flattens typed ops into a [`Content`],
//! typed op → [`Operation`], and the runtime assembly-format writer.

use alloc::borrow::Cow;
use alloc::boxed::Box;
use alloc::format;
use alloc::string::{String, ToString};
use alloc::vec;
use alloc::vec::Vec;
use core::fmt::{self, Display, Formatter, Write};

use serde::Serialize;
use serde::de::DeserializeOwned;
use serde::ser;

use crate::common::*;
use crate::mliropt::MlirOpt;
use crate::parser::{Bound, SEGMENTS};

/// `items` joined by `sep`.
pub struct Sep<'x, T>(pub &'x [T], pub &'x str);

impl<T: Display> Display for Sep<'_, T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        for (i, x) in self.0.iter().enumerate() {
            if i > 0 {
                f.write_str(self.1)?;
            }
            x.fmt(f)?;
        }
        Ok(())
    }
}

/// Indentation-aware MLIR writer; typed ops print through it.
pub struct Printer<'p, 'd> {
    out: &'p mut dyn Write,
    indent: usize,
    opt: &'d MlirOpt,
    /// Dialect whose op names print without their prefix (`return` in `func.func`).
    default_ns: Option<&'static str>,
    /// The enclosing module's attribute aliases; empty when printing an op on its own.
    aliases: Vec<(String, String)>,
}

impl Write for Printer<'_, '_> {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        self.out.write_str(s)
    }
}

impl<'p, 'd> Printer<'p, 'd> {
    pub fn new(out: &'p mut dyn Write, opt: &'d MlirOpt) -> Self {
        Self { out, indent: 0, opt, default_ns: Some("builtin"), aliases: Vec::new() }
    }

    /// A printer into `out` in the same state (indentation, default dialect, dialects).
    pub fn fork<'q>(&self, out: &'q mut dyn Write) -> Printer<'q, 'd> {
        Printer { out, indent: self.indent, opt: self.opt, default_ns: self.default_ns, aliases: self.aliases.clone() }
    }

    /// Prints with `f` into `out`, no dialects registered.
    pub fn write(out: &mut dyn Write, f: impl FnOnce(&mut Printer<'_, '_>) -> fmt::Result) -> fmt::Result {
        f(&mut Printer::new(out, &MlirOpt::new()))
    }

    /// An op name in custom form: without its prefix in its own dialect's regions.
    pub fn op_name(&mut self, name: &str) -> fmt::Result {
        let short = name.split_once('.').filter(|(ns, _)| Some(*ns) == self.default_ns).map_or(name, |(_, n)| n);
        self.write_str(short)
    }

    /// Runs `f` one indentation level deeper (multi-line custom syntax: `cf.switch`'s cases).
    pub fn nested(&mut self, f: impl FnOnce(&mut Self) -> fmt::Result) -> fmt::Result {
        self.indent += 2;
        let done = f(self);
        self.indent -= 2;
        done
    }

    /// Newline followed by the current indentation.
    pub fn nl(&mut self) -> fmt::Result {
        write!(self.out, "\n{:1$}", "", self.indent)
    }

    /// What attribute alias `name` stands for, as text (`map` ⇒ `affine_map<(d0) -> (d0)>`).
    pub fn alias(&self, name: &str) -> Option<&str> {
        self.aliases.iter().find(|(n, _)| n == name).map(|(_, v)| &**v)
    }

    /// Prints with the module's aliases already in scope, for one op out of a module.
    pub fn write_in(out: &mut dyn Write, opt: &MlirOpt, aliases: &[(String, String)], f: impl FnOnce(&mut Printer<'_, '_>) -> fmt::Result) -> fmt::Result {
        let mut p = Printer::new(out, opt);
        p.aliases = aliases.to_vec();
        f(&mut p)
    }

    pub fn module(&mut self, m: &Module<'_>) -> fmt::Result {
        self.aliases = m.aliases();
        for item in &m.items {
            match item {
                Item::AttrAlias { name, value } => write!(self, "#{name} = {value}")?,
                Item::TypeAlias { name, ty } => write!(self, "!{name} = {ty}")?,
                Item::Metadata { body } => write!(self, "{{-#{body}#-}}")?,
                Item::Op(op) => self.op(op)?,
            }
            self.write_char('\n')?;
        }
        Ok(())
    }

    pub fn op(&mut self, op: &Operation<'_>) -> fmt::Result {
        if !op.results.is_empty() {
            write!(self, "{} = ", Sep(&op.results, ", "))?;
        }
        if let Some(pieces) = &op.raw {
            self.write_str(&op.name)?;
            return pieces.iter().try_for_each(|piece| match piece {
                Piece::Text(t) => self.write_str(t),
                Piece::Region(r) => self.region(r, true),
            });
        }
        match self.opt.template(&op.name).and_then(|t| (t.print)(op, self)) {
            Some(r) => r,
            None => self.generic(op),
        }
    }

    /// The generic form (after `%results = `).
    pub fn generic(&mut self, g: &Operation<'_>) -> fmt::Result {
        write!(self, "\"{}\"({})", g.name, Sep(&g.operands, ", "))?;
        if !g.successors.is_empty() {
            self.write_char('[')?;
            for (i, s) in g.successors.iter().enumerate() {
                write!(self, "{}^{s}", if i > 0 { ", " } else { "" })?;
            }
            self.write_char(']')?;
        }
        if let Some(p) = &g.properties {
            write!(self, " <{p}>")?;
        }
        if !g.regions.is_empty() {
            self.write_str(" (")?;
            for (i, r) in g.regions.iter().enumerate() {
                if i > 0 {
                    self.write_str(", ")?;
                }
                self.region(r, true)?;
            }
            self.write_char(')')?;
        }
        self.attr_dict("", &g.attributes, &[])?;
        write!(self, " : {}", g.ty)?;
        self.loc(&g.loc)
    }

    /// `@name`, quoted unless it is a bare identifier.
    pub fn sym_name(&mut self, name: &str) -> fmt::Result {
        let bare = name.starts_with(|c: char| c.is_ascii_alphabetic() || c == '_') && name.bytes().all(|c| c.is_ascii_alphanumeric() || b"_$.-".contains(&c));
        if bare { write!(self, "@{name}") } else { write!(self, "@{}", Attribute::str(name)) }
    }

    pub fn loc(&mut self, loc: &Option<Str<'_>>) -> fmt::Result {
        match loc {
            Some(l) => write!(self, " loc({l})"),
            None => Ok(()),
        }
    }

    /// ` {prefix}{a = 1, b}` with `elide`d names skipped; nothing if no attribute remains.
    pub fn attr_dict(&mut self, prefix: &str, attrs: &[NamedAttr<'_>], elide: &[&str]) -> fmt::Result {
        let mut kept = attrs.iter().filter(|a| !elide.contains(&&*a.name)).peekable();
        if kept.peek().is_none() {
            return Ok(());
        }
        write!(self, " {prefix}{{")?;
        for (i, a) in kept.enumerate() {
            write!(self, "{}{a}", if i > 0 { ", " } else { "" })?;
        }
        self.write_char('}')
    }

    /// `{ blocks }` of an op that sets no default dialect; the entry block label is omitted
    /// unless `entry_label`.
    pub fn region(&mut self, r: &Region<'_>, entry_label: bool) -> fmt::Result {
        self.region_in(None, r, entry_label)
    }

    /// `{ blocks }` whose op names of dialect `ns` print without their prefix.
    pub fn region_in(&mut self, ns: Option<&'static str>, r: &Region<'_>, entry_label: bool) -> fmt::Result {
        let saved = core::mem::replace(&mut self.default_ns, ns);
        let done = self.blocks(r, entry_label);
        self.default_ns = saved;
        done
    }

    /// `{ blocks }` the way an op that spells its body's shape in its own header writes it: no
    /// entry block label, because the header already names its arguments, and no trailing
    /// terminator when that terminator carries nothing (`affine.for %i = 0 to 10 { ... }` writes
    /// neither `^bb0(%i: index)` nor `affine.yield`). A terminator with operands is still written.
    pub fn region_body(&mut self, r: &Region<'_>, terminator: &str) -> fmt::Result {
        // Like `region`, the body sets no default dialect: an op inside it that happens to be of
        // the enclosing dialect must still print its full name, or it will not read back.
        let saved = self.default_ns.take();
        let done = self.blocks_eliding(r, false, Some(terminator));
        self.default_ns = saved;
        done
    }

    fn blocks(&mut self, r: &Region<'_>, entry_label: bool) -> fmt::Result {
        self.blocks_eliding(r, entry_label, None)
    }

    /// Does `op` say nothing beyond being there? Such a terminator is implied by its region.
    fn bare_terminator(op: &Operation<'_>, name: &str) -> bool {
        op.name == name && op.operands.is_empty() && op.results.is_empty() && op.attributes.is_empty() && op.regions.is_empty()
    }

    fn blocks_eliding(&mut self, r: &Region<'_>, entry_label: bool, elide: Option<&str>) -> fmt::Result {
        self.write_char('{')?;
        for (i, b) in r.blocks.iter().enumerate() {
            if let Some(label) = b.label.as_ref().filter(|_| i > 0 || entry_label) {
                self.nl()?;
                write!(self, "^{label}")?;
                if !b.args.is_empty() {
                    write!(self, "({})", Sep(&b.args, ", "))?;
                }
                self.write_char(':')?;
            }
            self.indent += 2;
            let last = b.ops.len().saturating_sub(1);
            for (k, op) in b.ops.iter().enumerate() {
                if k == last && elide.is_some_and(|t| Self::bare_terminator(op, t)) {
                    break;
                }
                self.nl()?;
                self.op(op)?;
            }
            self.indent -= 2;
        }
        self.nl()?;
        self.write_char('}')
    }
}

/// IR nodes a [`Printer`] writes whole.
pub trait Emit {
    fn emit(&self, p: &mut Printer<'_, '_>) -> fmt::Result;
}

/// `x` printed with an [`MlirOpt`]'s dialects (`opt.show(&module)`).
pub struct Shown<'x, T: ?Sized>(pub &'x MlirOpt, pub &'x T);

impl<T: Emit + ?Sized> Display for Shown<'_, T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        self.1.emit(&mut Printer::new(f, self.0))
    }
}

/// Like [`Shown`], but with a module's attribute aliases in scope, so an op printed on its own
/// can still read one (`opt.show_in(&m.aliases(), &op)`).
pub struct ShownIn<'x, T: ?Sized>(pub &'x MlirOpt, pub &'x [(String, String)], pub &'x T);

impl<T: Emit + ?Sized> Display for ShownIn<'_, T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        Printer::write_in(f, self.0, self.1, |p| self.2.emit(p))
    }
}

macro_rules! emit {
    ($($ty:ident => $m:ident),* $(,)?) => {$(
        impl Emit for $ty<'_> {
            fn emit(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
                p.$m(self)
            }
        }

        impl Display for $ty<'_> {
            fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
                Printer::write(f, |p| p.$m(self))
            }
        }
    )*};
}

emit!(Module => module, Operation => op);

impl Display for ResultDef<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "%{}", self.name)?;
        self.count.map_or(Ok(()), |n| write!(f, ":{n}"))
    }
}

impl Display for Value<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "%{}", self.name)?;
        self.index.map_or(Ok(()), |n| write!(f, "#{n}"))
    }
}

impl Display for BlockArg<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "%{}: {}", self.name, self.ty)?;
        self.loc.as_ref().map_or(Ok(()), |l| write!(f, " loc({l})"))
    }
}

impl Display for NamedAttr<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        f.write_str(&self.name)?;
        self.value.as_ref().map_or(Ok(()), |v| write!(f, " = {v}"))
    }
}

impl Display for FunctionType<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "({}) -> ", Sep(&self.inputs, ", "))?;
        match self.results.as_slice() {
            [t] if !matches!(t, Type::Function(_)) => t.fmt(f),
            ts => write!(f, "({})", Sep(ts, ", ")),
        }
    }
}

impl Display for Dim {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        match self {
            Self::Static(n) => write!(f, "{n}"),
            Self::Dynamic => f.write_str("?"),
            Self::Scalable(n) => write!(f, "[{n}]"),
        }
    }
}

impl Display for Shaped<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "{}<", self.kind)?;
        match &self.shape {
            None => f.write_str("*x")?,
            Some(dims) => dims.iter().try_for_each(|d| write!(f, "{d}x"))?,
        }
        self.elem.fmt(f)?;
        self.extras.iter().try_for_each(|a| write!(f, ", {a}"))?;
        f.write_char('>')
    }
}

impl Display for Extended<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        f.write_str(&self.name)?;
        match &self.body {
            Some(b) => f.write_str(b),
            None if !self.params.is_empty() => write!(f, "<{}>", Sep(&self.params, ", ")),
            None => Ok(()),
        }
    }
}

impl Display for Type<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        match self {
            Self::Integer { signedness, width } => write!(f, "{signedness}{width}"),
            Self::Float(k) => k.fmt(f),
            Self::Index => f.write_str("index"),
            Self::NoneType => f.write_str("none"),
            Self::Complex(t) => write!(f, "complex<{t}>"),
            Self::Tuple(ts) => write!(f, "tuple<{}>", Sep(ts, ", ")),
            Self::Function(ft) => ft.fmt(f),
            Self::Shaped(s) => s.fmt(f),
            Self::Extended(e) => write!(f, "!{e}"),
        }
    }
}

/// ` : type` suffix.
struct TySuffix<'x, 'a>(&'x Option<Type<'a>>);

impl Display for TySuffix<'_, '_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        self.0.as_ref().map_or(Ok(()), |t| write!(f, " : {t}"))
    }
}

impl Display for Attribute<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        match self {
            Self::Unit => f.write_str("unit"),
            Self::Bool(b) => b.fmt(f),
            Self::Int { lit, ty } | Self::Float { lit, ty } => write!(f, "{lit}{}", TySuffix(ty)),
            Self::Str { lit, ty } => write!(f, "\"{lit}\"{}", TySuffix(ty)),
            Self::Type(t) => t.fmt(f),
            Self::Array(xs) => write!(f, "[{}]", Sep(xs, ", ")),
            Self::Dict(xs) => write!(f, "{{{}}}", Sep(xs, ", ")),
            Self::SymbolRef(path) => {
                for (i, s) in path.iter().enumerate() {
                    write!(f, "{}@{s}", if i > 0 { "::" } else { "" })?;
                }
                Ok(())
            }
            Self::DenseArray { ty, values } if values.is_empty() => write!(f, "array<{ty}>"),
            Self::DenseArray { ty, values } => write!(f, "array<{ty}: {}>", Sep(values, ", ")),
            Self::Builtin { name, body, ty } => write!(f, "{name}{body}{}", TySuffix(ty)),
            Self::Extended { ext, ty } => write!(f, "#{ext}{}", TySuffix(ty)),
        }
    }
}

// ---- serializing into Content --------------------------------------------------------------

/// The `Serializer` producing a [`Content`].
struct Serializer;

/// Collects a sequence / tuple (variant).
struct SeqBuilder(Vec<Content>, Option<(&'static str, u32, &'static str)>);

/// Collects a map.
struct MapBuilder(Vec<(Content, Content)>, Option<Content>);

/// Collects a struct (variant).
struct StructBuilder(&'static str, Vec<(&'static str, Content)>, Option<(u32, &'static str)>);

impl Content {
    /// ⭐ Serializes any value into a `Content`.
    pub fn of<T: Serialize + ?Sized>(value: &T) -> Result<Self, Error> {
        value.serialize(Serializer)
    }
}

macro_rules! scalars {
    ($($m:ident($t:ty) => $v:ident),* $(,)?) => {$(
        fn $m(self, v: $t) -> Result<Content, Error> {
            Ok(Content::$v(v.into()))
        }
    )*};
}

impl ser::Serializer for Serializer {
    type Ok = Content;
    type Error = Error;
    type SerializeSeq = SeqBuilder;
    type SerializeTuple = SeqBuilder;
    type SerializeTupleStruct = SeqBuilder;
    type SerializeTupleVariant = SeqBuilder;
    type SerializeMap = MapBuilder;
    type SerializeStruct = StructBuilder;
    type SerializeStructVariant = StructBuilder;

    scalars! {
        serialize_bool(bool) => Bool, serialize_i8(i8) => I8, serialize_i16(i16) => I16, serialize_i32(i32) => I32,
        serialize_i64(i64) => I64, serialize_u8(u8) => U8, serialize_u16(u16) => U16, serialize_u32(u32) => U32,
        serialize_u64(u64) => U64, serialize_f32(f32) => F32, serialize_f64(f64) => F64, serialize_char(char) => Char,
        serialize_str(&str) => Str, serialize_bytes(&[u8]) => Bytes,
    }

    fn serialize_none(self) -> Result<Content, Error> {
        Ok(Content::None)
    }
    fn serialize_some<T: Serialize + ?Sized>(self, v: &T) -> Result<Content, Error> {
        Ok(Content::Some(Box::new(Content::of(v)?)))
    }
    fn serialize_unit(self) -> Result<Content, Error> {
        Ok(Content::Unit)
    }
    fn serialize_unit_struct(self, name: &'static str) -> Result<Content, Error> {
        Ok(Content::UnitStruct(name))
    }
    fn serialize_unit_variant(self, name: &'static str, index: u32, variant: &'static str) -> Result<Content, Error> {
        Ok(Content::Variant(name, index, variant, Box::new(Payload::Unit)))
    }
    fn serialize_newtype_struct<T: Serialize + ?Sized>(self, name: &'static str, v: &T) -> Result<Content, Error> {
        Ok(Content::Newtype(name, Box::new(Content::of(v)?)))
    }
    fn serialize_newtype_variant<T: Serialize + ?Sized>(self, name: &'static str, index: u32, variant: &'static str, v: &T) -> Result<Content, Error> {
        Ok(Content::Variant(name, index, variant, Box::new(Payload::Newtype(Content::of(v)?))))
    }
    fn serialize_seq(self, len: Option<usize>) -> Result<SeqBuilder, Error> {
        Ok(SeqBuilder(Vec::with_capacity(len.unwrap_or(0)), None))
    }
    fn serialize_tuple(self, len: usize) -> Result<SeqBuilder, Error> {
        self.serialize_seq(Some(len))
    }
    fn serialize_tuple_struct(self, _: &'static str, len: usize) -> Result<SeqBuilder, Error> {
        self.serialize_seq(Some(len))
    }
    fn serialize_tuple_variant(self, name: &'static str, index: u32, variant: &'static str, len: usize) -> Result<SeqBuilder, Error> {
        Ok(SeqBuilder(Vec::with_capacity(len), Some((name, index, variant))))
    }
    fn serialize_map(self, _: Option<usize>) -> Result<MapBuilder, Error> {
        Ok(MapBuilder(Vec::new(), None))
    }
    fn serialize_struct(self, name: &'static str, _: usize) -> Result<StructBuilder, Error> {
        Ok(StructBuilder(name, Vec::new(), None))
    }
    fn serialize_struct_variant(self, name: &'static str, index: u32, variant: &'static str, _: usize) -> Result<StructBuilder, Error> {
        Ok(StructBuilder(name, Vec::new(), Some((index, variant))))
    }
}

macro_rules! seq_impls {
    ($($tr:ident :: $m:ident),*) => {$(
        impl ser::$tr for SeqBuilder {
            type Ok = Content;
            type Error = Error;
            fn $m<T: Serialize + ?Sized>(&mut self, v: &T) -> Result<(), Error> {
                Ok(self.0.push(Content::of(v)?))
            }
            fn end(self) -> Result<Content, Error> {
                Ok(match self.1 {
                    Some((name, index, variant)) => Content::Variant(name, index, variant, Box::new(Payload::Tuple(self.0))),
                    None => Content::Seq(self.0),
                })
            }
        }
    )*};
}

seq_impls!(SerializeSeq::serialize_element, SerializeTuple::serialize_element, SerializeTupleStruct::serialize_field, SerializeTupleVariant::serialize_field);

impl ser::SerializeMap for MapBuilder {
    type Ok = Content;
    type Error = Error;
    fn serialize_key<T: Serialize + ?Sized>(&mut self, k: &T) -> Result<(), Error> {
        self.1 = Some(Content::of(k)?);
        Ok(())
    }
    fn serialize_value<T: Serialize + ?Sized>(&mut self, v: &T) -> Result<(), Error> {
        let k = self.1.take().ok_or_else(|| Error("map value without a key".into()))?;
        Ok(self.0.push((k, Content::of(v)?)))
    }
    fn end(self) -> Result<Content, Error> {
        Ok(Content::Map(self.0))
    }
}

macro_rules! struct_impls {
    ($($tr:ident),*) => {$(
        impl ser::$tr for StructBuilder {
            type Ok = Content;
            type Error = Error;
            fn serialize_field<T: Serialize + ?Sized>(&mut self, key: &'static str, v: &T) -> Result<(), Error> {
                Ok(self.1.push((key, Content::of(v)?)))
            }
            fn end(self) -> Result<Content, Error> {
                Ok(match self.2 {
                    Some((index, variant)) => Content::Variant(self.0, index, variant, Box::new(Payload::Struct(self.1))),
                    None => Content::Struct(self.0, self.1),
                })
            }
        }
    )*};
}

struct_impls!(SerializeStruct, SerializeStructVariant);

// ---- Rust values as attributes -------------------------------------------------------------

impl Attribute<'_> {
    /// `n : ty`.
    pub fn of_int(value: i128, ty: Type<'static>) -> Attribute<'static> {
        Attribute::Int { lit: Cow::Owned(value.to_string()), ty: Some(ty) }
    }

    /// A string attribute, escaped as MLIR does (`llvm::printEscapedString`).
    pub fn str(s: &str) -> Attribute<'static> {
        let mut lit = String::with_capacity(s.len());
        for b in s.bytes() {
            match b {
                b'\\' => lit.push_str("\\\\"),
                b' '..=b'~' if b != b'"' => lit.push(b as char),
                b => lit.push_str(&format!("\\{b:02X}")),
            }
        }
        Attribute::Str { lit: Cow::Owned(lit), ty: None }
    }
}

impl<'a> Attribute<'a> {
    /// Without its `: type` suffix.
    pub fn untyped(self) -> Self {
        match self {
            Self::Int { lit, .. } => Self::Int { lit, ty: None },
            Self::Float { lit, .. } => Self::Float { lit, ty: None },
            Self::Str { lit, .. } => Self::Str { lit, ty: None },
            Self::Builtin { name, body, .. } => Self::Builtin { name, body, ty: None },
            Self::Extended { ext, .. } => Self::Extended { ext, ty: None },
            other => other,
        }
    }
}

impl TryFrom<Content> for Option<Attribute<'static>> {
    type Error = Error;

    /// The MLIR attribute a property field's value stands for (`None`: absent): `bool` is a unit
    /// attribute's presence, numbers / strings the attribute of that kind, a user enum its case
    /// value, `Attribute` / `Type` themselves.
    fn try_from(c: Content) -> Result<Self, Error> {
        let int = Attribute::of_int;
        Ok(Some(match c {
            Content::None | Content::Bool(false) => return Ok(None),
            Content::Some(x) | Content::Newtype(_, x) => return (*x).try_into(),
            Content::Bool(true) | Content::Unit => Attribute::Unit,
            Content::I8(v) => int(v.into(), Type::int(8)),
            Content::I16(v) => int(v.into(), Type::int(16)),
            Content::I32(v) => int(v.into(), Type::int(32)),
            Content::I64(v) => int(v.into(), Type::int(64)),
            Content::U8(v) => int(v.into(), Type::int(8)),
            Content::U16(v) => int(v.into(), Type::int(16)),
            Content::U32(v) => int(v.into(), Type::int(32)),
            Content::U64(v) => int(v.into(), Type::int(64)),
            Content::F32(v) => Attribute::Float { lit: Cow::Owned(format!("{v:e}")), ty: Some(Type::Float(FloatKind::F32)) },
            Content::F64(v) => Attribute::Float { lit: Cow::Owned(format!("{v:e}")), ty: Some(Type::Float(FloatKind::F64)) },
            Content::Str(s) => Attribute::str(&s),
            Content::Attr(a) => a,
            // A sequence of one kind of number is a dense array (`Vec<i32>` ⇄ `array<i32: 1, 2>`).
            Content::Seq(xs) if !xs.is_empty() && xs.iter().all(|x| x.dense_type() == xs[0].dense_type() && x.dense_type().is_some()) => {
                let ty = xs[0].dense_type().unwrap_or(Type::I1);
                let values = xs.into_iter().map(|x| Self::try_from(x).map(|a| Cow::Owned(a.map_or(String::new(), |a| a.untyped().to_string())))).collect::<Result<_, _>>()?;
                Attribute::DenseArray { ty, values }
            }
            Content::Seq(xs) => Attribute::Array(xs.into_iter().filter_map(|x| Self::try_from(x).transpose()).collect::<Result<_, _>>()?),
            c @ Content::Variant("Attribute", ..) => c.to()?,
            c @ Content::Variant("Type", ..) => Attribute::Type(c.to()?),
            Content::Variant(_, index, _, payload) if *payload == Payload::Unit => int(index.into(), Type::int(64)),
            Content::Struct(_, xs) => Attribute::Dict(
                xs.into_iter().filter_map(|(k, v)| Self::try_from(v).map(|v| v.map(|v| NamedAttr::of(k, v))).transpose()).collect::<Result<_, _>>()?,
            ),
            other => return Err(format!("no MLIR attribute for {other:?}").into()),
        }))
    }
}

impl Content {
    /// The element type of a dense array this number belongs in.
    fn dense_type(&self) -> Option<Type<'static>> {
        Some(match self {
            Self::I8(_) | Self::U8(_) => Type::int(8),
            Self::I16(_) | Self::U16(_) => Type::int(16),
            Self::I32(_) | Self::U32(_) => Type::int(32),
            Self::I64(_) | Self::U64(_) => Type::int(64),
            Self::F32(_) => Type::Float(FloatKind::F32),
            Self::F64(_) => Type::Float(FloatKind::F64),
            _ => return None,
        })
    }
}

impl Field {
    /// A property field's value as an attribute (`None`: absent), enum case values typed `:iN`.
    pub fn attr(&self, c: Content) -> Result<Option<Attribute<'static>>, Error> {
        let a = Option::<Attribute>::try_from(c)?;
        Ok(match (a, self.role) {
            (Some(Attribute::Int { lit, .. }), Role::Prop { int: Some(ty), .. }) => {
                Some(Attribute::Int { lit, ty: Some(Type::try_from(ty).map_err(|e| Error(e.msg))?) })
            }
            (a, _) => a,
        })
    }
}

impl NamedAttr<'_> {
    pub fn of(name: &str, value: Attribute<'static>) -> NamedAttr<'static> {
        NamedAttr { name: Cow::Owned(name.into()), value: (value != Attribute::Unit).then_some(value) }
    }
}

// ---- typed op → Operation ------------------------------------------------------------------

impl Operation<'_> {
    /// ⭐ A typed op as an op.
    pub fn of_op<O: Serialize + DeserializeOwned>(op: &O) -> Result<Operation<'static>, Error> {
        let schema = Schema::of::<O>()?;
        let Content::Struct(name, values) = Content::of(op)? else { return Err("an op must serialize as a struct".into()) };
        let take = |key: &str| values.iter().find(|(k, _)| *k == key).map(|(_, v)| v.clone()).ok_or_else(|| Error(format!("missing field `{key}`")));
        let ty_of = |name: &str| -> Result<Bound<'static>, Error> {
            let f = schema.field(name).filter(|f| matches!(f.role, Role::Type { .. })).ok_or_else(|| Error(format!("no type variable `{name}`")))?;
            Ok(if f.variadic { Bound::Many(take(f.key)?.to()?) } else { Bound::One(take(f.key)?.to()?) })
        };
        let (mut operands, mut inputs, mut sizes) = (Vec::new(), Vec::new(), Vec::new());
        for f in schema.of_role(|r| matches!(r, Role::Operand { .. })) {
            let Role::Operand { ty } = f.role else { continue };
            let group: Vec<Value<'static>> = if f.variadic { take(f.key)?.to()? } else { vec![take(f.key)?.to()?] };
            match ty_of(ty)? {
                Bound::One(t) => inputs.extend(group.iter().map(|_| t.clone())),
                Bound::Many(ts) if ts.len() == group.len() => inputs.extend(ts),
                Bound::Many(_) => return Err(format!("`{}`: one type per operand", f.name).into()),
            }
            sizes.push(group.len());
            operands.extend(group);
        }
        let mut results: Vec<(usize, Bound<'static>)> = Vec::new();
        for f in &schema.fields {
            if let Role::Type { result: Some(k), .. } = f.role {
                results.push((k, ty_of(f.name)?));
            }
        }
        results.sort_by_key(|(k, _)| *k);
        let mut props: Vec<NamedAttr<'static>> = Vec::new();
        for f in schema.of_role(|r| matches!(r, Role::Prop { .. })) {
            props.extend(f.attr(take(f.key)?)?.map(|a| NamedAttr::of(f.name, a)));
        }
        if schema.of_role(|r| matches!(r, Role::Operand { .. })).filter(|f| f.variadic).count() > 1 {
            let values = sizes.iter().map(|n| Cow::Owned(n.to_string())).collect();
            props.push(NamedAttr::of(SEGMENTS, Attribute::DenseArray { ty: Type::int(32), values }));
        }
        props.sort_by(|a, b| a.name.cmp(&b.name));
        let mut regions = Vec::new();
        for f in schema.of_role(|r| *r == Role::Region) {
            if f.variadic { regions.extend(take(f.key)?.to::<Vec<Region<'static>>>()?) } else { regions.push(take(f.key)?.to()?) }
        }
        let one = |role: Role| schema.of_role(move |r| *r == role).next().map(|f| take(f.key)).transpose();
        Ok(Operation {
            name: Cow::Borrowed(name),
            operands,
            successors: schema
                .of_role(|r| *r == Role::Successor)
                .map(|f| if f.variadic { take(f.key)?.to() } else { take(f.key)?.to().map(|s| vec![s]) })
                .collect::<Result<Vec<Vec<_>>, _>>()?
                .concat(),
            properties: (!props.is_empty()).then_some(Attribute::Dict(props)),
            regions,
            attributes: one(Role::Attrs)?.map(Content::to).transpose()?.unwrap_or_default(),
            ty: FunctionType { inputs, results: results.into_iter().flat_map(|(_, b)| match b {
                Bound::One(t) => vec![t],
                Bound::Many(ts) => ts,
            }).collect() },
            loc: one(Role::Loc)?.map(Content::to).transpose()?.flatten(),
            ..Operation::default()
        })
    }
}

// ---- writing the custom form ---------------------------------------------------------------

/// ODS spacing rules between assembly-format elements (`OpFormatGen.cpp`).
pub struct Spacer {
    space: bool,
    punct: bool,
}

impl Default for Spacer {
    fn default() -> Self {
        Self { space: true, punct: false }
    }
}

impl Spacer {
    /// `` `lit` ``; the empty literal suppresses the next space, `` ` ` `` writes one.
    pub fn lit(&mut self, p: &mut Printer<'_, '_>, s: &str) -> fmt::Result {
        let Some(&c) = s.as_bytes().first() else {
            (self.space, self.punct) = (false, true);
            return Ok(());
        };
        // `` ` ` ``: an explicit space, and none of its own after it.
        if s == " " {
            (self.space, self.punct) = (false, true);
            return p.write_char(' ');
        }
        let before = match (s.len() != 1 && s != "->", self.punct) {
            (true, _) => true,
            (false, true) => !b">)}],".contains(&c),
            (false, false) => !b"<>(){}[],".contains(&c),
        };
        if self.space && before {
            p.write_char(' ')?;
        }
        p.write_str(s)?;
        self.space = s.len() != 1 || !b"<({[".contains(&c);
        self.punct = c != b'_' && !c.is_ascii_alphabetic();
        Ok(())
    }

    /// Before a variable / directive.
    pub fn elem(&mut self, p: &mut Printer<'_, '_>) -> fmt::Result {
        if self.space || !self.punct {
            p.write_char(' ')?;
        }
        (self.space, self.punct) = (true, false);
        Ok(())
    }

    /// After `attr-dict` (which writes its own leading space).
    pub fn dict(&mut self) {
        self.punct = false;
    }
}

/// The serialized fields of the op being printed.
struct Values(Vec<(&'static str, Content)>);

impl Values {
    /// A field's value; an `Option`'s `Some` is looked through.
    fn raw(&self, f: &Field) -> Option<&Content> {
        self.0.iter().find(|(k, _)| *k == f.key).map(|(_, v)| match v {
            Content::Some(x) => &**x,
            v => v,
        })
    }

    fn get<T: DeserializeOwned>(&self, f: &Field) -> Result<T, Error> {
        self.raw(f).cloned().ok_or_else(|| Error(format!("missing field `{}`", f.key)))?.to()
    }

    /// The property as an attribute (`None`: absent or default).
    fn prop(&self, f: &Field) -> Result<Option<Attribute<'static>>, Error> {
        let a = self.raw(f).cloned().map(|c| f.attr(c)).transpose()?.flatten();
        Ok(a.filter(|a| Some(a) != f.default_attr().as_ref()))
    }

    fn present(&self, f: &Field) -> Result<bool, Error> {
        Ok(match f.role {
            Role::Prop { .. } => self.prop(f)?.is_some(),
            _ => !matches!(self.raw(f), None | Some(Content::None | Content::Bool(false))) && !matches!(self.raw(f), Some(Content::Seq(xs)) if xs.is_empty()),
        })
    }

    fn types(&self, f: &Field) -> Result<Vec<Type<'static>>, Error> {
        if f.variadic { self.get(f) } else { Ok(vec![self.get(f)?]) }
    }
}

impl Format<'_> {
    /// ⭐ Prints `op` in custom form: the op name, then the format.
    pub fn print<O: Serialize + ?Sized>(&self, op: &O, p: &mut Printer<'_, '_>) -> fmt::Result {
        let Ok(Content::Struct(_, values)) = Content::of(op) else { return Err(fmt::Error) };
        let v = Values(values);
        p.op_name(self.schema.name)?;
        self.write(&self.elems, &v, &mut Spacer::default(), p).map_err(|_| fmt::Error)?;
        match self.schema.of_role(|r| *r == Role::Loc).next() {
            Some(f) => p.loc(&v.get(f).map_err(|_| fmt::Error)?),
            None => Ok(()),
        }
    }

    fn write(&self, elems: &[Elem<'_>], v: &Values, s: &mut Spacer, p: &mut Printer<'_, '_>) -> Result<(), Error> {
        let io = |_| Error("write failed".into());
        for e in elems {
            match e {
                Elem::Lit(l) => s.lit(p, l).map_err(io)?,
                Elem::Group { anchor, elems } => {
                    if v.present(self.field(anchor)?)? {
                        self.write(elems, v, s, p)?;
                    }
                }
                Elem::Var(n) => {
                    let f = self.field(n)?;
                    if !matches!(f.role, Role::Prop { unit: true, .. }) {
                        s.elem(p).map_err(io)?;
                    }
                    match f.role {
                        Role::Operand { .. } => {
                            let vs: Vec<Value<'static>> = if f.variadic { v.get(f)? } else { vec![v.get(f)?] };
                            write!(p, "{}", Sep(&vs, ", ")).map_err(io)?;
                        }
                        Role::Type { .. } => write!(p, "{}", Sep(&v.types(f)?, ", ")).map_err(io)?,
                        Role::Prop { unit: true, .. } | Role::Attrs | Role::Loc => {}
                        Role::Prop { bits: Some(_), .. } => {
                            if let (Some(e), Some(a)) = (f.bit_enum(), v.prop(f)?) {
                                p.write_str(&e.show(u64::try_from(a.int()?).unwrap_or(0))).map_err(io)?;
                            }
                        }
                        Role::Prop { symbol: true, .. } => match v.prop(f)? {
                            Some(a @ Attribute::Str { .. }) => p.sym_name(&a.text()?).map_err(io)?,
                            Some(a) => write!(p, "{a}").map_err(io)?,
                            None => {}
                        },
                        Role::Prop { dialect, int, .. } => match (v.raw(f), v.prop(f)?) {
                            // A user enum prints its case name.
                            (Some(Content::Variant(e, _, case, _)), _) if !matches!(*e, "Attribute" | "Type") => p.write_str(case).map_err(io)?,
                            // A Rust number: its type is the field's, so the custom form leaves it out (`index.constant 1`).
                            (Some(Content::I8(_) | Content::I16(_) | Content::I32(_) | Content::I64(_) | Content::U8(_) | Content::U16(_) | Content::U32(_) | Content::U64(_) | Content::F32(_) | Content::F64(_)), Some(a)) => {
                                write!(p, "{}", a.untyped()).map_err(io)?;
                            }
                            (_, Some(Attribute::Extended { ext, .. })) if dialect == Some(&*ext.name) => p.write_str(ext.body.as_deref().unwrap_or("")).map_err(io)?,
                            // A dense array prints as a list: `[30, 70]`.
                            (_, Some(Attribute::DenseArray { values, .. })) => write!(p, "[{}]", Sep(&values, ", ")).map_err(io)?,
                            // Before a `:`, or of a buildable type (`I64Attr`): ODS leaves the type out.
                            (_, Some(a)) if self.before_colon(n) || int.is_some() => write!(p, "{}", a.untyped()).map_err(io)?,
                            (_, Some(a)) => write!(p, "{a}").map_err(io)?,
                            (_, None) => {}
                        },
                        Role::Successor => write!(p, "^{}", v.get::<String>(f)?).map_err(io)?,
                        // ODS prints a region variable with its entry block's arguments
                        // (`OpFormatGen.cpp`: `printEntryBlockArgs=true`); an op that binds
                        // those arguments in its header writes its own form by hand instead.
                        Role::Region => p.region(&v.get(f)?, true).map_err(io)?,
                    }
                }
                // ODS spaces a whole directive as one element; inside, the parts are tight.
                Elem::Custom { parts, .. } => {
                    s.elem(p).map_err(io)?;
                    self.write(parts, v, &mut Spacer::default(), p)?;
                }
                // The integer list drives: each item is its own static value, except where the
                // sentinel says the item is the next operand instead.
                Elem::Zip { integers, values } => {
                    s.elem(p).map_err(io)?;
                    let items = match v.prop(self.field(integers)?)? {
                        Some(Attribute::DenseArray { values, .. }) => values,
                        Some(Attribute::Array(a)) => a.into_iter().map(|x| Str::Owned(x.untyped().to_string())).collect(),
                        _ => return Err(format!("`{integers}`: a zipped list needs an integer array").into()),
                    };
                    let mut ops = v.get::<Vec<Value<'static>>>(self.field(values)?)?.into_iter();
                    for (k, item) in items.iter().enumerate() {
                        if k > 0 {
                            p.write_str(", ").map_err(io)?;
                        }
                        match (&**item == crate::parser::SENTINEL, ops.next()) {
                            (true, Some(d)) => write!(p, "{d}").map_err(io)?,
                            (true, None) => return Err(format!("`{values}`: too few values for `{integers}`").into()),
                            (false, _) => p.write_str(item).map_err(io)?,
                        }
                    }
                }
                Elem::TypeOf(n, qualified) => {
                    s.elem(p).map_err(io)?;
                    let f = self.type_var(n)?;
                    let ts = v.types(f)?;
                    match f.role {
                        Role::Type { strip: Some(d), .. } if !*qualified => {
                            let shown: Vec<String> = ts.iter().map(|t| {
                                let full = t.to_string();
                                full.strip_prefix('!').and_then(|r| r.strip_prefix(d)).filter(|r| r.starts_with('<')).map_or(full.clone(), String::from)
                            }).collect();
                            write!(p, "{}", Sep(&shown, ", ")).map_err(io)?;
                        }
                        _ => write!(p, "{}", Sep(&ts, ", ")).map_err(io)?,
                    }
                }
                Elem::FnType(a, b) => {
                    s.elem(p).map_err(io)?;
                    let ty = FunctionType { inputs: v.types(self.type_var(a)?)?, results: v.types(self.type_var(b)?)? };
                    write!(p, "{ty}").map_err(io)?;
                }
                Elem::AttrDict => {
                    let spelled = self.spelled();
                    let mut attrs: Vec<NamedAttr<'static>> = Vec::new();
                    for f in self.schema.of_role(|r| matches!(r, Role::Prop { .. })).filter(|f| !spelled.contains(&f.name)) {
                        attrs.extend(v.prop(f)?.map(|a| NamedAttr::of(f.name, a)));
                    }
                    // The properties as their dictionary (sorted by name), then the discardable ones.
                    attrs.sort_by(|a, b| a.name.cmp(&b.name));
                    if let Some(f) = self.schema.of_role(|r| *r == Role::Attrs).next() {
                        attrs.extend(v.get::<Vec<NamedAttr<'static>>>(f)?);
                    }
                    p.attr_dict("", &attrs, &[]).map_err(io)?;
                    s.dict();
                }
            }
        }
        Ok(())
    }
}
