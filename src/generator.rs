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
use serde::ser;

use crate::common::*;
use crate::mliropt::MlirOpt;
use crate::parser::{Bound, SEGMENTS, Shape, View};

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

/// `(inputs) -> results` out of two borrowed lists: a function type, printed without building one.
pub struct Signature<'s, 'a>(pub &'s [Type<'a>], pub &'s [Type<'a>]);

impl Display for Signature<'_, '_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "({}) -> ", Sep(self.0, ", "))?;
        match self.1 {
            [t] if !matches!(t, Type::Function(_)) => t.fmt(f),
            ts => write!(f, "({})", Sep(ts, ", ")),
        }
    }
}

impl Display for FunctionType<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        Signature(&self.inputs, &self.results).fmt(f)
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

/// An attribute without its `: type` suffix, printed in place ([`Attribute::untyped`] borrowed).
pub struct Untyped<'s, 'a>(pub &'s Attribute<'a>);

impl Display for Untyped<'_, '_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        match self.0 {
            Attribute::Int { lit, .. } | Attribute::Float { lit, .. } => f.write_str(lit),
            Attribute::Str { lit, .. } => write!(f, "\"{lit}\""),
            Attribute::Builtin { name, body, .. } => write!(f, "{name}{body}"),
            Attribute::Extended { ext, .. } => write!(f, "#{ext}"),
            other => other.fmt(f),
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

    /// A region as itself, by move ([`Content::Region`]).
    pub fn region(r: Region<'_>) -> Self {
        Self::Region(Box::new(r.into_static()))
    }

    /// Regions, one [`Content::Region`] each.
    pub fn regions(rs: Vec<Region<'_>>) -> Self {
        Self::Seq(rs.into_iter().map(Self::region).collect())
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

/// `Cow::Borrowed` text made owned.
fn own(s: &Str<'_>) -> Str<'static> {
    Cow::Owned(String::from(&**s))
}

/// ⭐ The same value borrowing nothing, by move: owned text moves, only borrowed text is copied.
/// A region that crosses [`Content`] goes through it, not through serde — an op's regions
/// hold every op nested in them, and copying them through the data model at every level of
/// nesting made printing and parsing quadratic in the depth.
pub trait IntoStatic {
    type Static;
    fn into_static(self) -> Self::Static;
}

impl IntoStatic for Str<'_> {
    type Static = Str<'static>;
    fn into_static(self) -> Str<'static> {
        Cow::Owned(self.into_owned())
    }
}

impl<T: IntoStatic> IntoStatic for Option<T> {
    type Static = Option<T::Static>;
    fn into_static(self) -> Option<T::Static> {
        self.map(T::into_static)
    }
}

impl<T: IntoStatic> IntoStatic for Vec<T> {
    type Static = Vec<T::Static>;
    fn into_static(self) -> Vec<T::Static> {
        self.into_iter().map(T::into_static).collect()
    }
}

impl<T: IntoStatic> IntoStatic for Box<T> {
    type Static = Box<T::Static>;
    fn into_static(self) -> Box<T::Static> {
        Box::new((*self).into_static())
    }
}

/// Plain data: itself.
macro_rules! static_as_is {
    ($($t:ty),*) => {$(
        impl IntoStatic for $t {
            type Static = $t;
            fn into_static(self) -> $t {
                self
            }
        }
    )*};
}

static_as_is!(u32, bool, Signedness, FloatKind, ShapedKind, Dim);

/// A struct field by field, or an enum variant by variant (`Variant { fields }` / `Variant(x)` / `Variant`).
macro_rules! static_fields {
    ($($name:ident { $($f:ident),* })*) => {$(
        impl IntoStatic for $name<'_> {
            type Static = $name<'static>;
            fn into_static(self) -> $name<'static> {
                $name { $($f: self.$f.into_static()),* }
            }
        }
    )*};
    (@enum $($name:ident { $($v:ident $({ $($f:ident),* })? $(($x:ident))?),* })*) => {$(
        impl IntoStatic for $name<'_> {
            type Static = $name<'static>;
            fn into_static(self) -> $name<'static> {
                match self {
                    $($name::$v $({ $($f),* })? $(($x))? => $name::$v $({ $($f: $f.into_static()),* })? $(($x.into_static()))?),*
                }
            }
        }
    )*};
}

static_fields! {
    Operation { results, name, operands, successors, properties, regions, attributes, ty, loc, raw }
    ResultDef { name, count }
    Value { name, index }
    Region { blocks }
    Block { label, args, ops }
    BlockArg { name, ty, loc }
    NamedAttr { name, value }
    FunctionType { inputs, results }
    Shaped { kind, shape, elem, extras }
    Extended { name, body, params }
}

static_fields! {
    @enum
    Piece { Text(x), Region(x) }
    Type { Integer { signedness, width }, Float(x), Index, NoneType, Complex(x), Tuple(x), Function(x), Shaped(x), Extended(x) }
    Attribute {
        Unit, Bool(x), Int { lit, ty }, Float { lit, ty }, Str { lit, ty }, Type(x), Array(x), Dict(x),
        SymbolRef(x), DenseArray { ty, values }, Builtin { name, body, ty }, Extended { ext, ty }
    }
}

impl Extended<'_> {
    /// A deep copy that borrows nothing.
    pub fn owned(&self) -> Extended<'static> {
        Extended { name: own(&self.name), body: self.body.as_ref().map(own), params: self.params.iter().map(Attribute::owned).collect() }
    }
}

impl Type<'_> {
    /// A deep copy that borrows nothing.
    pub fn owned(&self) -> Type<'static> {
        match self {
            Type::Integer { signedness, width } => Type::Integer { signedness: *signedness, width: *width },
            Type::Float(k) => Type::Float(*k),
            Type::Index => Type::Index,
            Type::NoneType => Type::NoneType,
            Type::Complex(e) => Type::Complex(e.owned().into()),
            Type::Tuple(ts) => Type::Tuple(ts.iter().map(Type::owned).collect()),
            Type::Function(f) => Type::Function(FunctionType { inputs: f.inputs.iter().map(Type::owned).collect(), results: f.results.iter().map(Type::owned).collect() }),
            Type::Shaped(s) => Type::Shaped(Shaped { kind: s.kind, shape: s.shape.clone(), elem: s.elem.owned().into(), extras: s.extras.iter().map(Attribute::owned).collect() }),
            Type::Extended(e) => Type::Extended(e.owned()),
        }
    }
}

impl Attribute<'_> {
    /// A deep copy that borrows nothing.
    pub fn owned(&self) -> Attribute<'static> {
        let ty = |t: &Option<Type<'_>>| t.as_ref().map(Type::owned);
        match self {
            Attribute::Unit => Attribute::Unit,
            Attribute::Bool(b) => Attribute::Bool(*b),
            Attribute::Int { lit, ty: t } => Attribute::Int { lit: own(lit), ty: ty(t) },
            Attribute::Float { lit, ty: t } => Attribute::Float { lit: own(lit), ty: ty(t) },
            Attribute::Str { lit, ty: t } => Attribute::Str { lit: own(lit), ty: ty(t) },
            Attribute::Type(t) => Attribute::Type(t.owned()),
            Attribute::Array(xs) => Attribute::Array(xs.iter().map(Attribute::owned).collect()),
            Attribute::Dict(d) => Attribute::Dict(d.iter().map(|n| NamedAttr { name: own(&n.name), value: n.value.as_ref().map(Attribute::owned) }).collect()),
            Attribute::SymbolRef(p) => Attribute::SymbolRef(p.iter().map(own).collect()),
            Attribute::DenseArray { ty: t, values } => Attribute::DenseArray { ty: t.owned(), values: values.iter().map(own).collect() },
            Attribute::Builtin { name, body, ty: t } => Attribute::Builtin { name: own(name), body: own(body), ty: ty(t) },
            Attribute::Extended { ext, ty: t } => Attribute::Extended { ext: ext.owned(), ty: ty(t) },
        }
    }

    /// `#name<body>` (`#name` when `body` is empty): an enum or other dialect attribute.
    pub fn dialect(name: &str, body: &str) -> Attribute<'static> {
        let body = (!body.is_empty()).then(|| Cow::Owned(String::from(body)));
        Attribute::Extended { ext: Extended { name: Cow::Owned(name.into()), body, params: Vec::new() }, ty: None }
    }

    /// `v : i64`, how ODS stores an integer enum.
    pub fn i64(v: i64) -> Attribute<'static> {
        Attribute::of_int(v.into(), Type::int(64))
    }

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
    pub fn of_op<O: Op>(op: &O) -> Result<Operation<'static>, Error> {
        Self::of_content(&Schema::of::<O>(), Content::of(op)?)
    }

    /// [`of_op`](Self::of_op) by move: the typed op's regions become the op's without a copy.
    pub fn of_owned_op<O: Op>(op: O) -> Result<Operation<'static>, Error> {
        Self::of_content(&Schema::of::<O>(), op.into_content()?)
    }

    /// [`of_op`](Self::of_op) from the op's [`Content`]: everything that does not depend on `O`,
    /// built once rather than once per op.
    fn of_content(schema: &Schema, content: Content) -> Result<Operation<'static>, Error> {
        let Content::Struct(name, mut values) = content else { return Err("an op must serialize as a struct".into()) };
        // Regions first, by move: the rest is small and read by clone (a type variable may be read twice).
        let mut regions = Vec::new();
        for f in schema.of_role(|r| *r == Role::Region) {
            let at = values.iter().position(|(k, _)| *k == f.name).ok_or_else(|| Error(format!("missing field `{}`", f.name)))?;
            match values.swap_remove(at).1 {
                Content::Seq(xs) if f.variadic => regions.extend(xs.into_iter().map(Content::into_region).collect::<Result<Vec<_>, _>>()?),
                c if f.variadic => regions.extend(c.to::<Vec<Region<'static>>>()?),
                c => regions.push(c.into_region()?),
            }
        }
        let take = |key: &str| values.iter().find(|(k, _)| *k == key).map(|(_, v)| v.clone()).ok_or_else(|| Error(format!("missing field `{key}`")));
        let ty_of = |name: &str| -> Result<Bound<'static>, Error> {
            let f = schema.field(name).filter(|f| matches!(f.role, Role::Type { .. })).ok_or_else(|| Error(format!("no type variable `{name}`")))?;
            Ok(if f.variadic { Bound::Many(take(f.name)?.to()?) } else { Bound::One(take(f.name)?.to()?) })
        };
        let (mut operands, mut inputs, mut sizes) = (Vec::new(), Vec::new(), Vec::new());
        for f in schema.of_role(|r| matches!(r, Role::Operand { .. })) {
            let Role::Operand { ty } = f.role else { continue };
            let group: Vec<Value<'static>> = if f.variadic { take(f.name)?.to()? } else { vec![take(f.name)?.to()?] };
            match ty_of(ty)? {
                Bound::One(t) => inputs.extend(group.iter().map(|_| t.clone())),
                Bound::Many(ts) if ts.len() == group.len() => inputs.extend(ts),
                Bound::Many(_) => return Err(format!("`{}`: one type per operand", f.name).into()),
            }
            sizes.push(group.len());
            operands.extend(group);
        }
        let mut results: Vec<(usize, Bound<'static>)> = Vec::new();
        for f in schema.fields {
            if let Role::Type { result: Some(k), .. } = f.role {
                results.push((k, ty_of(f.name)?));
            }
        }
        results.sort_by_key(|(k, _)| *k);
        let mut props: Vec<NamedAttr<'static>> = Vec::new();
        for f in schema.of_role(|r| matches!(r, Role::Prop { .. })) {
            props.extend(f.attr(take(f.name)?)?.map(|a| NamedAttr::of(f.name, a)));
        }
        if schema.of_role(|r| matches!(r, Role::Operand { .. })).filter(|f| f.variadic).count() > 1 {
            let values = sizes.iter().map(|n| Cow::Owned(n.to_string())).collect();
            props.push(NamedAttr::of(SEGMENTS, Attribute::DenseArray { ty: Type::int(32), values }));
        }
        props.sort_by(|a, b| a.name.cmp(&b.name));
        let one = |role: Role| schema.of_role(move |r| *r == role).next().map(|f| take(f.name)).transpose();
        Ok(Operation {
            name: Cow::Borrowed(name),
            operands,
            successors: schema
                .of_role(|r| *r == Role::Successor)
                .map(|f| if f.variadic { take(f.name)?.to() } else { take(f.name)?.to().map(|s| vec![s]) })
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

impl Format<'_> {
    /// ⭐ Prints a typed op in custom form: the op name, then the format.
    pub fn print<O: Op>(&self, op: &O, p: &mut Printer<'_, '_>) -> fmt::Result {
        self.print_op(&Operation::of_op(op).map_err(|_| fmt::Error)?, p)
    }

    /// ⭐ Prints `op` in this custom form, reading every field in place (no typed op built);
    /// an error if `op` does not fit the form's schema.
    pub fn print_op(&self, op: &Operation<'_>, p: &mut Printer<'_, '_>) -> fmt::Result {
        let v = op.view(&self.schema).map_err(|_| fmt::Error)?;
        p.op_name(self.schema.name)?;
        self.write(&self.elems, &v, &mut Spacer::default(), p).map_err(|_| fmt::Error)?;
        match v.loc() {
            Some(l) => write!(p, " loc({l})"),
            None => Ok(()),
        }
    }

    fn present(&self, f: &Field, v: &View<'_, '_>) -> Result<bool, Error> {
        Ok(match f.role {
            Role::Prop { .. } => v.prop(f)?.is_some(),
            // An optional region is there when it has blocks.
            Role::Region if f.variadic => return Err(format!("`{}`: a region list as an anchor", f.name).into()),
            Role::Region => v.regions(f)?.iter().any(|r| !r.blocks.is_empty()),
            Role::Operand { .. } => !v.values(f)?.is_empty(),
            Role::Type { .. } => !v.types(f)?.is_empty(),
            Role::Successor => !v.successors(f)?.is_empty(),
            Role::Attrs => !v.attrs().is_empty(),
            Role::Loc => v.loc().is_some(),
        })
    }

    /// A type variable's types as `type($x)` prints them: one for a single variable.
    fn shown_types<'v, 'a>(f: &Field, v: &'v View<'_, 'a>) -> Result<&'v [Type<'a>], Error> {
        let ts = v.types(f)?;
        Ok(if f.variadic { ts } else { ts.get(..1).ok_or_else(|| Error(format!("no type for `{}`", f.name)))? })
    }

    fn write(&self, elems: &[Elem<'_>], v: &View<'_, '_>, s: &mut Spacer, p: &mut Printer<'_, '_>) -> Result<(), Error> {
        let io = |_| Error("write failed".into());
        for e in elems {
            match e {
                Elem::Lit(l) => s.lit(p, l).map_err(io)?,
                Elem::Group { anchor, elems } => {
                    if self.present(self.field(anchor)?, v)? {
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
                            let vs = v.values(f)?;
                            let vs = if f.variadic { vs } else { vs.get(..1).ok_or_else(|| Error(format!("no operand `{}`", f.name)))? };
                            write!(p, "{}", Sep(vs, ", ")).map_err(io)?;
                        }
                        Role::Type { .. } => write!(p, "{}", Sep(Self::shown_types(f, v)?, ", ")).map_err(io)?,
                        Role::Prop { unit: true, .. } | Role::Attrs | Role::Loc => {}
                        Role::Prop { bits: Some(_), .. } => {
                            if let (Some(e), Some(a)) = (f.bit_enum(), v.prop(f)?) {
                                p.write_str(&e.show(u64::try_from(a.int()?).unwrap_or(0))).map_err(io)?;
                            }
                        }
                        Role::Prop { symbol: true, .. } => match v.prop(f)?.as_deref() {
                            Some(a @ Attribute::Str { .. }) => p.sym_name(&a.text()?).map_err(io)?,
                            Some(a) => write!(p, "{a}").map_err(io)?,
                            None => {}
                        },
                        Role::Prop { dialect, int, .. } => {
                            let (_, shape) = v.shown(f)?;
                            match (shape, v.prop(f)?.as_deref()) {
                                // A user enum prints its case name.
                                (Shape::Case(case), _) => p.write_str(case).map_err(io)?,
                                // A Rust number: its type is the field's, so the custom form leaves it out (`index.constant 1`).
                                (Shape::Number, Some(a)) => write!(p, "{}", Untyped(a)).map_err(io)?,
                                (_, Some(Attribute::Extended { ext, .. })) if dialect == Some(&*ext.name) => p.write_str(ext.body.as_deref().unwrap_or("")).map_err(io)?,
                                // `#gpu<dim x>` ⇒ ` x`: the attribute's own printer puts a space before
                                // its case, so `mlir-opt` shows two (`gpu.thread_id  x`).
                                (_, Some(Attribute::Extended { ext, .. }))
                                    if let Some((ns, m)) = f.keyword_dialect()
                                        && ext.name == ns
                                        && let Some(case) = ext.body.as_deref().and_then(|b| b.strip_prefix('<')?.strip_prefix(m)?.strip_prefix(' ')?.strip_suffix('>')) =>
                                {
                                    write!(p, " {case}").map_err(io)?
                                }
                                // A dense array prints as a list: `[30, 70]`.
                                (_, Some(Attribute::DenseArray { values, .. })) => write!(p, "[{}]", Sep(values, ", ")).map_err(io)?,
                                // Before a `:`, or of a buildable type (`I64Attr`): ODS leaves the type out.
                                (_, Some(a)) if self.before_colon(n) || int.is_some() => write!(p, "{}", Untyped(a)).map_err(io)?,
                                (_, Some(a)) => write!(p, "{a}").map_err(io)?,
                                (_, None) => {}
                            }
                        }
                        Role::Successor if f.variadic => return Err(format!("`{n}`: a successor list in a format").into()),
                        Role::Successor => {
                            let ss = v.successors(f)?;
                            write!(p, "^{}", ss.first().ok_or_else(|| Error(format!("no successor `{}`", f.name)))?).map_err(io)?
                        }
                        // ODS prints a region variable with its entry block's arguments
                        // (`OpFormatGen.cpp`: `printEntryBlockArgs=true`); an op that binds
                        // those arguments in its header writes its own form by hand instead.
                        Role::Region if f.variadic => return Err(format!("`{n}`: a region list in a format").into()),
                        Role::Region => {
                            let r = v.regions(f)?.first().ok_or_else(|| Error(format!("no region `{}`", f.name)))?;
                            p.region(r, true).map_err(io)?
                        }
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
                    let list = v.prop(self.field(integers)?)?;
                    let items: Vec<Cow<'_, str>> = match list.as_deref() {
                        Some(Attribute::DenseArray { values, .. }) => values.iter().map(|x| Cow::Borrowed(&**x)).collect(),
                        Some(Attribute::Array(a)) => a.iter().map(|x| Cow::Owned(Untyped(x).to_string())).collect(),
                        _ => return Err(format!("`{integers}`: a zipped list needs an integer array").into()),
                    };
                    let mut ops = v.values(self.field(values)?)?.iter();
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
                    let ts = Self::shown_types(f, v)?;
                    match f.role {
                        Role::Type { strip: Some(d), .. } if !*qualified => {
                            for (i, t) in ts.iter().enumerate() {
                                let full = t.to_string();
                                let shown = full.strip_prefix('!').and_then(|r| r.strip_prefix(d)).filter(|r| r.starts_with('<')).unwrap_or(&full);
                                write!(p, "{}{shown}", if i > 0 { ", " } else { "" }).map_err(io)?;
                            }
                        }
                        _ => write!(p, "{}", Sep(ts, ", ")).map_err(io)?,
                    }
                }
                Elem::FnType(a, b) => {
                    s.elem(p).map_err(io)?;
                    let sig = Signature(Self::shown_types(self.type_var(a)?, v)?, Self::shown_types(self.type_var(b)?, v)?);
                    write!(p, "{sig}").map_err(io)?;
                }
                Elem::AttrDict(keyword) => {
                    let spelled = self.spelled();
                    let mut shown: Vec<(&str, Cow<'_, Attribute<'_>>)> = Vec::new();
                    for f in self.schema.of_role(|r| matches!(r, Role::Prop { .. })).filter(|f| !spelled.contains(&f.name)) {
                        shown.extend(v.prop(f)?.map(|a| (f.name, a)));
                    }
                    // One dictionary, sorted by name, the discardable ones among the properties:
                    // what `Operation::getAttrDictionary` hands the generated printer. A unit
                    // attribute is its name alone.
                    let mut attrs: Vec<(&str, Option<&Attribute<'_>>)> = shown.iter().map(|(n, a)| (*n, Some(&**a).filter(|a| **a != Attribute::Unit))).collect();
                    attrs.extend(v.attrs().iter().map(|a| (&*a.name, a.value.as_ref())));
                    attrs.sort_by(|a, b| a.0.cmp(b.0));
                    if !attrs.is_empty() {
                        write!(p, " {}{{", if *keyword { "attributes " } else { "" }).map_err(io)?;
                        for (i, (name, value)) in attrs.iter().enumerate() {
                            write!(p, "{}{name}", if i > 0 { ", " } else { "" }).map_err(io)?;
                            if let Some(a) = value {
                                write!(p, " = {a}").map_err(io)?;
                            }
                        }
                        p.write_char('}').map_err(io)?;
                    }
                    s.dict();
                }
            }
        }
        Ok(())
    }
}
