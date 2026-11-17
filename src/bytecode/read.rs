use alloc::collections::BTreeMap;
use alloc::format;
use alloc::string::{String, ToString};
use alloc::vec;
use alloc::vec::Vec;

use crate::{AffineBin, AffineExpr, AffineMap, ApFloat, ApInt, Attribute, Block, BlockArg, Const, Dim, Error, FloatKind, FunctionType, IntegerSet, IntoStatic, NamedAttr, Operation, Region, ResultDef, Scalar, Shaped, ShapedKind, Signedness, Type, Value, WideFloat};

use super::emit::{Cursor, Section};
use super::entity::{FLOAT_BITS, FLOAT_CODES};
use super::{MAGIC, Mask, PropKind, VERSION};

/// An attribute or type as stored: its dialect, whether by the dialect's encoding, and its bytes
struct Entry<'b> {
    dialect: usize,
    custom: bool,
    data: &'b [u8],
}

struct ROp {
    name: usize,
    loc: usize,
    attrs: Option<usize>,
    props: Option<usize>,
    results: Vec<usize>,
    operands: Vec<usize>,
    successors: Vec<u64>,
    regions: Vec<RRegion>,
}

#[derive(Default)]
struct RRegion {
    blocks: Vec<RBlock>,
}

#[derive(Default)]
struct RBlock {
    args: Vec<(usize, Option<usize>)>,
    ops: Vec<ROp>,
}

/// The values an isolated region and the regions within it number: each slot the value defined
/// there, or the uses still waiting for it
#[derive(Default)]
struct Scope {
    slots: Vec<Option<usize>>,
    pending: BTreeMap<usize, Vec<usize>>,
}

fn bad(what: &str) -> Error {
    Error(format!("bytecode: malformed {what}"))
}

/// Reads bytecode the way `BytecodeReader` does, into a generic op named the way the printer names
pub struct Reader<'b> {
    strings: Vec<&'b str>,
    dialects: Vec<&'b str>,
    names: Vec<(String, bool)>,
    attrs: Vec<Entry<'b>>,
    types: Vec<Entry<'b>>,
    attr_cache: Vec<Option<Attribute<'static>>>,
    type_cache: Vec<Option<Type<'static>>>,
    props: Vec<&'b [u8]>,
    resources: Vec<String>,
    ir: &'b [u8],
    distinct: u64,
    /// Each value's type, and the value each use stands for
    value_types: Vec<usize>,
    uses: Vec<Option<usize>>,
    /// Each value's name, once given
    value_names: Vec<(String, Option<u32>)>,
}

impl<'b> Reader<'b> {
    /// The value of a varint's flag bit that marks a dialect with a version
    const ID_WITH_VERSION: u64 = 1;
    /// The elements past which a dense attribute prints as hex (`elementsAttrHexElementLimit`)
    const HEX_LIMIT: usize = 100;
    const UNKNOWN: &'static str = "unknown";

    pub fn new(bytes: &'b [u8]) -> Result<Self, Error> {
        let mut c = Cursor::new(bytes);
        if c.take(MAGIC.len()) != Some(MAGIC) {
            return Err(bad("header: not bytecode"));
        }
        let version = c.var().ok_or_else(|| bad("header"))?;
        if version != VERSION {
            return Err(Error(format!("bytecode: version {version}, only {VERSION} is read")));
        }
        c.cstr().ok_or_else(|| bad("producer"))?;
        let mut sections: BTreeMap<u8, &'b [u8]> = BTreeMap::new();
        while !c.done() {
            let (id, data) = c.section().ok_or_else(|| bad("section"))?;
            sections.insert(id, data);
        }
        let get = |s: Section| sections.get(&(s as u8)).copied().unwrap_or_default();
        let mut r = Reader {
            strings: Vec::new(),
            dialects: Vec::new(),
            names: Vec::new(),
            attrs: Vec::new(),
            types: Vec::new(),
            attr_cache: Vec::new(),
            type_cache: Vec::new(),
            props: Vec::new(),
            resources: Vec::new(),
            ir: get(Section::Ir),
            distinct: 0,
            value_types: Vec::new(),
            uses: Vec::new(),
            value_names: Vec::new(),
        };
        r.read_strings(get(Section::String))?;
        r.read_dialects(get(Section::Dialect))?;
        r.read_attr_types(get(Section::AttrTypeOffset), get(Section::AttrType))?;
        r.read_resources(get(Section::ResourceOffset))?;
        r.read_props(get(Section::Properties))?;
        Ok(r)
    }

    fn read_strings(&mut self, data: &'b [u8]) -> Result<(), Error> {
        let mut c = Cursor::new(data);
        let n = c.var().ok_or_else(|| bad("strings"))? as usize;
        let mut lens = Vec::with_capacity(n);
        for _ in 0..n {
            lens.push(c.var().ok_or_else(|| bad("strings"))? as usize);
        }
        for len in lens.into_iter().rev() {
            let s = c.take(len).ok_or_else(|| bad("strings"))?;
            self.strings.push(core::str::from_utf8(&s[..len.saturating_sub(1)]).map_err(|_| bad("string"))?);
        }
        Ok(())
    }

    fn string(&self, i: u64) -> Result<&'b str, Error> {
        self.strings.get(i as usize).copied().ok_or_else(|| bad("string reference"))
    }

    fn read_dialects(&mut self, data: &'b [u8]) -> Result<(), Error> {
        let mut c = Cursor::new(data);
        let n = c.var().ok_or_else(|| bad("dialects"))?;
        for _ in 0..n {
            let (id, versioned) = c.var_flag().ok_or_else(|| bad("dialects"))?;
            self.dialects.push(self.string(id)?);
            if u64::from(versioned) == Self::ID_WITH_VERSION {
                c.section().ok_or_else(|| bad("dialect version"))?;
            }
        }
        c.var().ok_or_else(|| bad("op names"))?;
        while !c.done() {
            let d = c.var().ok_or_else(|| bad("op names"))? as usize;
            let k = c.var().ok_or_else(|| bad("op names"))?;
            let dialect = *self.dialects.get(d).ok_or_else(|| bad("op name dialect"))?;
            for _ in 0..k {
                let (id, registered) = c.var_flag().ok_or_else(|| bad("op names"))?;
                let bare = self.string(id)?;
                let full = if bare.is_empty() { String::from(dialect) } else { format!("{dialect}.{bare}") };
                self.names.push((full, registered));
            }
        }
        Ok(())
    }

    fn read_attr_types(&mut self, offsets: &'b [u8], data: &'b [u8]) -> Result<(), Error> {
        let mut c = Cursor::new(offsets);
        let na = c.var().ok_or_else(|| bad("attribute offsets"))? as usize;
        let nt = c.var().ok_or_else(|| bad("attribute offsets"))? as usize;
        let mut at = 0;
        for (total, is_attr) in [(na, true), (nt, false)] {
            let mut read = 0;
            while read < total {
                let dialect = c.var().ok_or_else(|| bad("attribute offsets"))? as usize;
                let k = c.var().ok_or_else(|| bad("attribute offsets"))? as usize;
                for _ in 0..k {
                    let (size, custom) = c.var_flag().ok_or_else(|| bad("attribute offsets"))?;
                    let end = at + size as usize;
                    let e = Entry { dialect, custom, data: data.get(at..end).ok_or_else(|| bad("attribute data"))? };
                    at = end;
                    if is_attr { self.attrs.push(e) } else { self.types.push(e) }
                }
                read += k;
            }
        }
        self.attr_cache = vec![None; na];
        self.type_cache = vec![None; nt];
        Ok(())
    }

    /// The dialect resources' keys, in handle order (no data is kept)
    fn read_resources(&mut self, data: &'b [u8]) -> Result<(), Error> {
        if data.is_empty() {
            return Ok(());
        }
        let mut c = Cursor::new(data);
        let external = c.var().ok_or_else(|| bad("resources"))?;
        let mut group = 0;
        while !c.done() {
            c.var().ok_or_else(|| bad("resources"))?;
            let n = c.var().ok_or_else(|| bad("resources"))?;
            for _ in 0..n {
                let key = c.var().ok_or_else(|| bad("resources"))?;
                c.var().ok_or_else(|| bad("resources"))?;
                c.byte().ok_or_else(|| bad("resources"))?;
                if group >= external {
                    self.resources.push(String::from(self.string(key)?));
                }
            }
            group += 1;
        }
        Ok(())
    }

    fn read_props(&mut self, data: &'b [u8]) -> Result<(), Error> {
        if data.is_empty() {
            return Ok(());
        }
        let mut c = Cursor::new(data);
        let n = c.var().ok_or_else(|| bad("properties"))?;
        for _ in 0..n {
            let len = c.var().ok_or_else(|| bad("properties"))? as usize;
            self.props.push(c.take(len).ok_or_else(|| bad("properties"))?);
        }
        Ok(())
    }
}

/// Printing helpers, as MLIR's printer spells things
struct Spell;

impl Spell {
    /// `printEscapedString`: `\` doubled, printable characters but `"` as they are, the rest as `\XX`
    fn escaped(s: &str) -> String {
        let mut out = String::new();
        for b in s.bytes() {
            if b == b'\\' {
                out.push_str("\\\\");
            } else if (0x20..0x7f).contains(&b) && b != b'"' {
                out.push(b as char);
            } else {
                out.push_str(&format!("\\{b:02X}"));
            }
        }
        out
    }

    fn quoted(s: &str) -> String {
        format!("\"{}\"", Self::escaped(s))
    }

    /// A bare identifier: a letter or `_`, then letters, digits, `_`, `$`, `.`
    fn bare(s: &str) -> bool {
        let mut cs = s.chars();
        cs.next().is_some_and(|c| c.is_ascii_alphabetic() || c == '_') && cs.all(|c| c.is_ascii_alphanumeric() || matches!(c, '_' | '$' | '.'))
    }

    fn keyword_or_string(s: &str) -> String {
        if Self::bare(s) { String::from(s) } else { Self::quoted(s) }
    }

    /// `raw_ostream << double`: `%e`
    fn double(x: f64) -> String {
        if x.is_nan() {
            return String::from("nan");
        }
        if x.is_infinite() {
            return String::from(if x < 0.0 { "-INF" } else { "INF" });
        }
        let s = format!("{x:.6e}");
        let (m, e) = s.split_once('e').unwrap_or((&s, "0"));
        let e: i32 = e.parse().unwrap_or(0);
        format!("{m}e{}{:02}", if e < 0 { '-' } else { '+' }, e.abs())
    }

    fn dim(d: i64) -> String {
        if d == super::entity::DYNAMIC { String::from("?") } else { format!("{d}") }
    }
}

impl Reader<'_> {
    fn attr(&mut self, i: u64) -> Result<Attribute<'static>, Error> {
        let k = i as usize;
        if let Some(a) = self.attr_cache.get(k).ok_or_else(|| bad("attribute reference"))? {
            return Ok(a.clone());
        }
        let a = self.decode_attr(k)?;
        self.attr_cache[k] = Some(a.clone());
        Ok(a)
    }

    fn ty(&mut self, i: u64) -> Result<Type<'static>, Error> {
        let k = i as usize;
        if let Some(t) = self.type_cache.get(k).ok_or_else(|| bad("type reference"))? {
            return Ok(t.clone());
        }
        let t = self.decode_type(k)?;
        self.type_cache[k] = Some(t.clone());
        Ok(t)
    }

    fn text(data: &[u8]) -> Result<&str, Error> {
        core::str::from_utf8(data.strip_suffix(&[0]).unwrap_or(data)).map_err(|_| bad("attribute text"))
    }

    fn decode_attr(&mut self, k: usize) -> Result<Attribute<'static>, Error> {
        let e = &self.attrs[k];
        let (data, custom, dialect) = (e.data, e.custom, self.dialects.get(e.dialect).copied().unwrap_or_default());
        if !custom {
            let t = self.fresh_distinct(Self::text(data)?);
            return Attribute::try_from(&*t).map(IntoStatic::into_static).map_err(|e| Error(format!("bytecode: attribute `{t}`: {e}")));
        }
        if dialect != super::entity::BUILTIN {
            return Err(Error(format!("bytecode: the {dialect} dialect's own attribute encoding is not read")));
        }
        self.builtin_attr(&mut Cursor::new(data))
    }

    /// An attribute's text with its `distinct` attributes made new ones, as parsing it makes them
    fn fresh_distinct(&mut self, text: &str) -> String {
        const DISTINCT: &str = "distinct[";
        let (mut out, mut rest, mut seen) = (String::new(), text, Vec::<(String, u64)>::new());
        while let Some(at) = rest.find(DISTINCT) {
            let after = &rest[at + DISTINCT.len()..];
            let Some(end) = after.find(']') else { break };
            let id = String::from(&after[..end]);
            let n = match seen.iter().find(|(x, _)| *x == id) {
                Some((_, n)) => *n,
                None => {
                    self.distinct += 1;
                    seen.push((id, self.distinct - 1));
                    self.distinct - 1
                }
            };
            out.push_str(&rest[..at + DISTINCT.len()]);
            out.push_str(&format!("{n}"));
            rest = &after[end..];
        }
        out.push_str(rest);
        out
    }

    fn decode_type(&mut self, k: usize) -> Result<Type<'static>, Error> {
        let e = &self.types[k];
        let (data, custom, dialect) = (e.data, e.custom, self.dialects.get(e.dialect).copied().unwrap_or_default());
        if !custom {
            let t = Self::text(data)?;
            return Type::try_from(t).map(IntoStatic::into_static).map_err(|e| Error(format!("bytecode: type `{t}`: {e}")));
        }
        let mut c = Cursor::new(data);
        match dialect {
            super::entity::BUILTIN => self.builtin_type(&mut c),
            "quant" => {
                let t = self.quant_text(&mut c)?;
                Type::try_from(&*t).map(IntoStatic::into_static).map_err(|e| Error(format!("bytecode: type `{t}`: {e}")))
            }
            _ => Err(Error(format!("bytecode: the {dialect} dialect's own type encoding is not read"))),
        }
    }

    fn var(c: &mut Cursor<'_>) -> Result<u64, Error> {
        c.var().ok_or_else(|| bad("attribute"))
    }

    fn svar(c: &mut Cursor<'_>) -> Result<i64, Error> {
        c.svar().ok_or_else(|| bad("attribute"))
    }

    fn byte(c: &mut Cursor<'_>) -> Result<u8, Error> {
        c.byte().ok_or_else(|| bad("attribute"))
    }

    /// `readAPIntWithKnownWidth`
    fn apint(c: &mut Cursor<'_>, width: u32) -> Result<u128, Error> {
        if width <= 8 {
            return Ok(u128::from(Self::byte(c)?));
        }
        if width <= 64 {
            let v = Self::svar(c)? as u64;
            return Ok(u128::from(v) & ((1u128 << width) - 1));
        }
        let words = Self::var(c)?;
        let mut bits = 0u128;
        for w in 0..words {
            let word = Self::svar(c)? as u64;
            if w < 2 {
                bits |= u128::from(word) << (64 * w);
            }
        }
        Ok(bits)
    }

    fn float_scalar(kind: FloatKind, bits: u128) -> Result<Scalar, Error> {
        if ApFloat::supported(kind) {
            return ApFloat::from_bits(kind, bits as u64).map(Scalar::Float).ok_or_else(|| bad("float"));
        }
        if WideFloat::wide(kind) {
            return WideFloat::of(kind, Self::wide_to_f64(kind, bits)).map(Scalar::Wide).ok_or_else(|| bad("float"));
        }
        Err(Error(format!("bytecode: floats of type {kind} are not read")))
    }

    /// An `f80` or `f128` as the nearest double below
    fn wide_to_f64(kind: FloatKind, bits: u128) -> f64 {
        let (exp_bits, frac_bits, explicit) = if kind == FloatKind::F80 { (15u32, 63u32, true) } else { (15, 112, false) };
        let sign = (bits >> (exp_bits + frac_bits + u32::from(explicit))) & 1;
        let exp = ((bits >> (frac_bits + u32::from(explicit))) & ((1 << exp_bits) - 1)) as i64;
        let frac = bits & ((1u128 << frac_bits) - 1);
        let bias = (1i64 << (exp_bits - 1)) - 1;
        let value = if exp == 0 && frac == 0 {
            0.0
        } else {
            let lead = if explicit || exp != 0 { 1.0 } else { 0.0 };
            let m = lead + (frac as f64) * Self::pow2(-(frac_bits as i64));
            m * Self::pow2(exp.max(1) - bias)
        };
        if sign == 1 { -value } else { value }
    }

    /// `2^e`, without the standard library
    fn pow2(e: i64) -> f64 {
        let (mut x, step) = (1.0f64, if e < 0 { 0.5 } else { 2.0 });
        for _ in 0..e.unsigned_abs() {
            x *= step;
        }
        x
    }

    fn element_scalar(elem: &Type<'_>, bits: u128) -> Result<Scalar, Error> {
        match elem {
            Type::Integer { width, .. } => Ok(Scalar::Int(ApInt::from_bits(*width, bits))),
            Type::Index => Ok(Scalar::Int(ApInt::from_bits(super::entity::INDEX_BITS, bits))),
            Type::Float(k) => Self::float_scalar(*k, bits),
            _ => Err(Error(format!("bytecode: elements of type {elem} are not read"))),
        }
    }

    fn width(elem: &Type<'_>) -> Result<u32, Error> {
        match elem {
            Type::Integer { width, .. } => Ok(*width),
            Type::Index => Ok(super::entity::INDEX_BITS),
            Type::Float(k) => FLOAT_BITS.iter().find(|(f, _)| f == k).map(|(_, b)| *b).ok_or_else(|| bad("float type")),
            Type::Complex(p) => Ok(2 * Self::width(p)?.div_ceil(8) * 8),
            _ => Err(Error(format!("bytecode: elements of type {elem} are not read"))),
        }
    }

    /// One element as it prints, by itself
    fn literal(elem: &Type<'_>, v: Scalar) -> String {
        match Attribute::from(Const::scalar(v, elem.clone().into_static())) {
            Attribute::Int { lit, .. } | Attribute::Float { lit, .. } => lit.to_string(),
            Attribute::Bool(b) => format!("{b}"),
            other => other.to_string(),
        }
    }

    /// Where the printer may leave a type out (`AttrTypeElision::May`): an `i64` integer's, an
    /// `f64` float's unless it prints as hex
    fn elided(a: Attribute<'static>) -> Attribute<'static> {
        const I64: Type<'static> = Type::Integer { signedness: Signedness::Signless, width: 64 };
        match a {
            Attribute::Int { lit, ty: Some(I64) } => Attribute::Int { lit, ty: None },
            Attribute::Float { lit, ty: Some(Type::Float(FloatKind::F64)) } => Attribute::Float { lit, ty: None },
            other => other,
        }
    }

    fn loc_attr(text: String) -> Attribute<'static> {
        Attribute::Builtin { name: "loc".into(), body: format!("({text})").into(), ty: None }
    }

    /// What a location attribute holds inside `loc(...)`
    fn loc_text(a: &Attribute<'_>) -> String {
        match a {
            Attribute::Builtin { name, body, .. } if name == "loc" => String::from(body.strip_prefix('(').and_then(|b| b.strip_suffix(')')).unwrap_or(body)),
            other => other.to_string(),
        }
    }

    fn string_attr(&mut self, i: u64) -> Result<String, Error> {
        match self.attr(i)? {
            a @ Attribute::Str { .. } => a.text(),
            _ => Err(bad("string attribute")),
        }
    }

    fn builtin_attr(&mut self, c: &mut Cursor<'_>) -> Result<Attribute<'static>, Error> {
        use super::entity::A;
        let code = Self::var(c)?;
        let is = |a: A| code == a as u64;
        if is(A::Array) {
            let n = Self::var(c)?;
            let mut xs = Vec::new();
            for _ in 0..n {
                let i = Self::var(c)?;
                xs.push(Self::elided(self.attr(i)?));
            }
            return Ok(Attribute::Array(xs));
        }
        if is(A::Dictionary) {
            let n = Self::var(c)?;
            let mut xs = Vec::new();
            for _ in 0..n {
                let name = Self::var(c)?;
                let name = self.string_attr(name)?;
                let v = Self::var(c)?;
                let v = self.attr(v)?;
                xs.push(NamedAttr { name: Spell::keyword_or_string(&name).into(), value: if v == Attribute::Unit { None } else { Some(v) } });
            }
            return Ok(Attribute::Dict(xs));
        }
        if is(A::String) || is(A::StringWithType) {
            let s = self.string(Self::var(c)?)?;
            let ty = if is(A::StringWithType) { Some(self.ty(Self::var(c)?)?) } else { None };
            return Ok(Attribute::Str { lit: Spell::escaped(s).into(), ty });
        }
        if is(A::FlatSymbolRef) || is(A::SymbolRef) {
            let root = Self::var(c)?;
            let mut path = vec![Spell::keyword_or_string(&self.string_attr(root)?).into()];
            if is(A::SymbolRef) {
                for _ in 0..Self::var(c)? {
                    let leaf = Self::var(c)?;
                    match self.attr(leaf)? {
                        Attribute::SymbolRef(p) => path.extend(p),
                        _ => return Err(bad("symbol reference")),
                    }
                }
            }
            return Ok(Attribute::SymbolRef(path));
        }
        if is(A::Type) {
            return Ok(Attribute::Type(self.ty(Self::var(c)?)?));
        }
        if is(A::Unit) {
            return Ok(Attribute::Unit);
        }
        if is(A::Integer) {
            let ty = self.ty(Self::var(c)?)?;
            let width = Self::width(&ty)?;
            let bits = Self::apint(c, width)?;
            return Ok(Attribute::from(Const::int(ApInt::from_bits(width, bits), ty)));
        }
        if is(A::Float) {
            let ty = self.ty(Self::var(c)?)?;
            let Type::Float(k) = ty else { return Err(bad("float attribute")) };
            let bits = Self::apint(c, Self::width(&ty)?)?;
            return Ok(Attribute::from(Const::scalar(Self::float_scalar(k, bits)?, ty)));
        }
        if is(A::UnknownLoc) {
            return Ok(Self::loc_attr(String::from(Self::UNKNOWN)));
        }
        if is(A::FileLineColLoc) || is(A::FileLineColRange) {
            let file = Self::var(c)?;
            let file = Spell::quoted(&self.string_attr(file)?);
            let nums: Vec<u64> = if is(A::FileLineColLoc) {
                vec![Self::var(c)?, Self::var(c)?]
            } else {
                (0..Self::var(c)?).map(|_| Self::var(c)).collect::<Result<_, _>>()?
            };
            let (l, col, el, ec) = match nums[..] {
                [] => (0, 0, 0, 0),
                [l] => (l, 0, l, 0),
                [l, c] => (l, c, l, c),
                [l, c, e] => (l, c, l, e),
                [l, c, el, ec] => (l, c, el, ec),
                _ => return Err(bad("location")),
            };
            let text = if ec == col && el == l {
                format!("{file}:{l}:{col}")
            } else if el == l {
                format!("{file}:{l}:{col} to :{ec}")
            } else {
                format!("{file}:{l}:{col} to {el}:{ec}")
            };
            return Ok(Self::loc_attr(text));
        }
        if is(A::NameLoc) {
            let name = Self::var(c)?;
            let name = Spell::quoted(&self.string_attr(name)?);
            let child = Self::var(c)?;
            let child = Self::loc_text(&self.attr(child)?);
            return Ok(Self::loc_attr(if child == Self::UNKNOWN { name } else { format!("{name}({child})") }));
        }
        if is(A::CallSiteLoc) {
            let (callee, caller) = (Self::var(c)?, Self::var(c)?);
            let (callee, caller) = (Self::loc_text(&self.attr(callee)?), Self::loc_text(&self.attr(caller)?));
            return Ok(Self::loc_attr(format!("callsite({callee} at {caller})")));
        }
        if is(A::FusedLoc) || is(A::FusedLocWithMetadata) {
            let n = Self::var(c)?;
            let mut parts = Vec::new();
            for _ in 0..n {
                let l = Self::var(c)?;
                parts.push(Self::loc_text(&self.attr(l)?));
            }
            let meta = if is(A::FusedLocWithMetadata) { format!("<{}>", self.attr(Self::var(c)?)?) } else { String::new() };
            return Ok(Self::loc_attr(format!("fused{meta}[{}]", parts.join(", "))));
        }
        if is(A::DenseArray) {
            let ty = self.ty(Self::var(c)?)?;
            let n = Self::var(c)? as usize;
            let len = Self::var(c)? as usize;
            let blob = c.take(len).ok_or_else(|| bad("dense array"))?;
            let w = if ty == Type::I1 { 1 } else { Self::width(&ty)?.div_ceil(8) as usize };
            let mut values = Vec::new();
            for k in 0..n {
                let bits = Self::le(&blob[k * w..(k + 1) * w]);
                values.push(if ty == Type::I1 { String::from(if bits != 0 { "true" } else { "false" }) } else { Self::literal(&ty, Self::element_scalar(&ty, bits)?) }.into());
            }
            return Ok(Attribute::DenseArray { ty, values: values.into_boxed_slice() });
        }
        if is(A::DenseTypedElements) {
            let ty = self.ty(Self::var(c)?)?;
            let len = Self::var(c)? as usize;
            let blob = c.take(len).ok_or_else(|| bad("dense elements"))?;
            return self.dense(ty, blob);
        }
        if is(A::DenseStringElements) {
            let ty = self.ty(Self::var(c)?)?;
            let splat = Self::var(c)? != 0;
            let count = if splat { 1 } else { ty.element_count().ok_or_else(|| bad("dense strings"))? };
            let mut strings = Vec::new();
            for _ in 0..count {
                strings.push(Spell::quoted(self.string(Self::var(c)?)?));
            }
            let body = if splat { strings.swap_remove(0) } else { Self::nest(&Self::dims(&ty), &strings) };
            return Ok(Attribute::Builtin { name: "dense".into(), body: format!("<{body}>").into(), ty: Some(ty) });
        }
        if is(A::SparseElements) {
            let ty = self.ty(Self::var(c)?)?;
            let (i, v) = (Self::var(c)?, Self::var(c)?);
            let (indices, values) = (self.attr(i)?, self.attr(v)?);
            let inner = |a: &Attribute<'_>| match a {
                Attribute::Builtin { body, .. } => String::from(body.strip_prefix('<').and_then(|b| b.strip_suffix('>')).unwrap_or(body)),
                other => other.to_string(),
            };
            let empty = matches!(&indices, Attribute::Builtin { ty: Some(t), .. } if t.element_count() == Some(0));
            let body = if empty { String::from("<>") } else { format!("<{}, {}>", inner(&indices), inner(&values)) };
            return Ok(Attribute::Builtin { name: "sparse".into(), body: body.into(), ty: Some(ty) });
        }
        if is(A::Distinct) {
            let r = self.attr(Self::var(c)?)?;
            let n = self.distinct;
            self.distinct += 1;
            let shown = if r == Attribute::Unit { String::new() } else { r.to_string() };
            return Ok(Attribute::Builtin { name: "distinct".into(), body: format!("[{n}]<{shown}>").into(), ty: None });
        }
        if is(A::AffineMap) {
            return Ok(Attribute::from(&Self::affine_map(c)?));
        }
        if is(A::IntegerSet) {
            let (dims, syms) = (Self::var(c)? as u32, Self::var(c)? as u32);
            let n = Self::var(c)?;
            let exprs = (0..n).map(|_| Self::affine_expr(c)).collect::<Result<Vec<_>, _>>()?;
            let eqs = (0..n).map(|_| Self::byte(c).map(|b| b != 0)).collect::<Result<Vec<_>, _>>()?;
            return Ok(Attribute::from(&IntegerSet { dims, syms, constraints: exprs.into_iter().zip(eqs).collect() }));
        }
        if is(A::StridedLayout) {
            let offset = Self::svar(c)?;
            let n = Self::var(c)?;
            let strides = (0..n).map(|_| Self::svar(c).map(Spell::dim)).collect::<Result<Vec<_>, _>>()?;
            let off = if offset == 0 { String::new() } else { format!(", offset: {}", Spell::dim(offset)) };
            return Ok(Attribute::Builtin { name: "strided".into(), body: format!("<[{}]{off}>", strides.join(", ")).into(), ty: None });
        }
        if code == super::entity::DENSE_RESOURCE {
            let ty = self.ty(Self::var(c)?)?;
            let key = self.resources.get(Self::var(c)? as usize).cloned().ok_or_else(|| bad("resource handle"))?;
            return Ok(Attribute::Builtin { name: "dense_resource".into(), body: format!("<{key}>").into(), ty: Some(ty) });
        }
        Err(Error(format!("bytecode: builtin attribute code {code} is not read")))
    }

    fn le(b: &[u8]) -> u128 {
        let mut buf = [0u8; 16];
        buf[..b.len().min(16)].copy_from_slice(&b[..b.len().min(16)]);
        u128::from_le_bytes(buf)
    }

    fn dims(ty: &Type<'_>) -> Vec<usize> {
        ty.dims().map(|d| d.into_iter().map(|x| x.max(0) as usize).collect()).unwrap_or_default()
    }

    /// Flat literals nested by `dims`
    fn nest(dims: &[usize], flat: &[String]) -> String {
        fn go(dims: &[usize], flat: &[String], at: &mut usize, out: &mut String) {
            let Some((first, rest)) = dims.split_first() else {
                out.push_str(&flat[*at]);
                *at += 1;
                return;
            };
            out.push('[');
            for i in 0..*first {
                if i > 0 {
                    out.push_str(", ");
                }
                go(rest, flat, at, out);
            }
            out.push(']');
        }
        let mut out = String::new();
        go(dims, flat, &mut 0, &mut out);
        out
    }

    fn dense(&mut self, ty: Type<'static>, blob: &[u8]) -> Result<Attribute<'static>, Error> {
        let view = Self::shaped_view(&ty).ok_or_else(|| Error(format!("bytecode: dense elements of type {ty}")))?;
        let elem = view.element_type().clone();
        let count = view.element_count().ok_or_else(|| bad("dense elements"))?;
        let raw: Vec<u8>;
        let (data, splat, w) = if elem == Type::I1 {
            let packed = count.div_ceil(8);
            if blob.len() == 1 && blob[0] == super::entity::SPLAT_TRUE {
                raw = vec![1];
                (&raw[..], true, 1)
            } else if blob.len() == packed && blob.len() != count {
                raw = (0..count).map(|i| (blob[i / 8] >> (i % 8)) & 1).collect();
                (&raw[..], false, 1)
            } else {
                (blob, blob.len() == 1, 1)
            }
        } else {
            let w = (Self::width(&elem)?.div_ceil(8)) as usize;
            (blob, blob.len() == w && count != 1 || blob.len() == w, w)
        };
        let body = if !splat && count > Self::HEX_LIMIT {
            let hex: String = data.iter().map(|b| format!("{b:02X}")).collect();
            format!("<\"0x{hex}\">")
        } else {
            let mut values = Vec::new();
            for chunk in data.chunks(w) {
                values.push(match &elem {
                    Type::Complex(p) => {
                        let h = w / 2;
                        Scalar::complex(Self::element_scalar(p, Self::le(&chunk[..h]))?, Self::element_scalar(p, Self::le(&chunk[h..]))?).ok_or_else(|| bad("complex element"))?
                    }
                    e => Self::element_scalar(e, Self::le(chunk))?,
                });
            }
            match Attribute::from(Const { ty: view.clone(), values, elements: true }) {
                Attribute::Builtin { body, .. } => body.to_string(),
                _ => return Err(bad("dense elements")),
            }
        };
        Ok(Attribute::Builtin { name: "dense".into(), body: body.into(), ty: Some(ty) })
    }

    fn shaped_view(t: &Type<'_>) -> Option<Type<'static>> {
        match t {
            Type::Shaped(_) => Some(t.clone().into_static()),
            Type::Extended(e) => {
                let inner = e.inner()?;
                let head = inner.split(',').next()?;
                Type::try_from(&*format!("tensor<{}>", head.trim())).ok().map(IntoStatic::into_static)
            }
            _ => None,
        }
    }

    fn affine_map(c: &mut Cursor<'_>) -> Result<AffineMap, Error> {
        use super::entity::M;
        let header = Self::var(c)?;
        let (kind, dims) = (header & 3, (header >> 2) as u32);
        let results = if kind == M::Identity as u64 {
            (0..dims).map(AffineExpr::Dim).collect()
        } else if kind == M::Permutation as u64 {
            (0..dims).map(|_| Self::var(c).map(|d| AffineExpr::Dim(d as u32))).collect::<Result<_, _>>()?
        } else if kind == M::ProjectedPermutation as u64 {
            let n = Self::var(c)?;
            (0..n).map(|_| Self::var(c).map(|d| AffineExpr::Dim(d as u32))).collect::<Result<_, _>>()?
        } else {
            let syms = Self::var(c)? as u32;
            let n = Self::var(c)?;
            let results = (0..n).map(|_| Self::affine_expr(c)).collect::<Result<_, _>>()?;
            return Ok(AffineMap { dims, syms, results });
        };
        Ok(AffineMap { dims, syms: 0, results })
    }

    fn affine_expr(c: &mut Cursor<'_>) -> Result<AffineExpr, Error> {
        use super::entity::E;
        let k = Self::var(c)?;
        let bin = |b: AffineBin, c: &mut Cursor<'_>| -> Result<AffineExpr, Error> {
            let l = Self::affine_expr(c)?;
            let r = Self::affine_expr(c)?;
            Ok(AffineExpr::Bin(b, l.into(), r.into()))
        };
        Ok(match k {
            x if x == E::Dim as u64 => AffineExpr::Dim(Self::var(c)? as u32),
            x if x == E::Symbol as u64 => AffineExpr::Sym(Self::var(c)? as u32),
            x if x == E::Constant as u64 => AffineExpr::Const(Self::svar(c)?),
            x if x == E::Add as u64 => bin(AffineBin::Add, c)?,
            x if x == E::Mul as u64 => bin(AffineBin::Mul, c)?,
            x if x == E::Mod as u64 => bin(AffineBin::Mod, c)?,
            x if x == E::FloorDiv as u64 => bin(AffineBin::FloorDiv, c)?,
            x if x == E::CeilDiv as u64 => bin(AffineBin::CeilDiv, c)?,
            _ => return Err(bad("affine expression")),
        })
    }

    fn shape(c: &mut Cursor<'_>) -> Result<Vec<Dim>, Error> {
        let n = Self::var(c)?;
        (0..n).map(|_| Self::svar(c).map(|d| if d == super::entity::DYNAMIC { Dim::Dynamic } else { Dim::Static(d) })).collect()
    }

    fn types(&mut self, c: &mut Cursor<'_>) -> Result<Vec<Type<'static>>, Error> {
        let n = Self::var(c)?;
        (0..n).map(|_| Self::var(c).and_then(|i| self.ty(i))).collect()
    }

    fn builtin_type(&mut self, c: &mut Cursor<'_>) -> Result<Type<'static>, Error> {
        use super::entity::T;
        let code = Self::var(c)?;
        let is = |t: T| code == t as u64;
        if let Some((k, _)) = FLOAT_CODES.iter().find(|(_, c)| *c == code) {
            return Ok(Type::Float(*k));
        }
        let shaped = |kind: ShapedKind, shape: Option<Vec<Dim>>, elem: Type<'static>, extras: Vec<Attribute<'static>>| Type::Shaped(Shaped { kind, shape, elem: elem.into(), extras }.into());
        Ok(if is(T::Integer) {
            let v = Self::var(c)?;
            let signedness = match v & 3 {
                0 => Signedness::Signless,
                1 => Signedness::Signed,
                _ => Signedness::Unsigned,
            };
            Type::Integer { signedness, width: (v >> 2) as u32 }
        } else if is(T::Index) {
            Type::Index
        } else if is(T::None) {
            Type::NoneType
        } else if is(T::Token) {
            Type::Token
        } else if is(T::Function) {
            let inputs = self.types(c)?;
            let results = self.types(c)?;
            Type::Function(FunctionType { inputs, results }.into())
        } else if is(T::Complex) {
            Type::Complex(self.ty(Self::var(c)?)?.into())
        } else if is(T::Tuple) {
            Type::Tuple(self.types(c)?.into_boxed_slice())
        } else if is(T::MemRef) || is(T::MemRefWithMemSpace) {
            let space = if is(T::MemRefWithMemSpace) { Some(Self::elided(self.attr(Self::var(c)?)?)) } else { None };
            let shape = Self::shape(c)?;
            let elem = self.ty(Self::var(c)?)?;
            let layout = Self::elided(self.attr(Self::var(c)?)?);
            let mut extras = Vec::new();
            if !layout.is_identity_map() {
                extras.push(layout);
            }
            extras.extend(space);
            shaped(ShapedKind::MemRef, Some(shape), elem, extras)
        } else if is(T::UnrankedMemRef) || is(T::UnrankedMemRefWithMemSpace) {
            let space = if is(T::UnrankedMemRefWithMemSpace) { Some(Self::elided(self.attr(Self::var(c)?)?)) } else { None };
            let elem = self.ty(Self::var(c)?)?;
            shaped(ShapedKind::MemRef, None, elem, space.into_iter().collect())
        } else if is(T::RankedTensor) || is(T::RankedTensorWithEncoding) {
            let enc = if is(T::RankedTensorWithEncoding) { Some(self.attr(Self::var(c)?)?) } else { None };
            let shape = Self::shape(c)?;
            let elem = self.ty(Self::var(c)?)?;
            shaped(ShapedKind::Tensor, Some(shape), elem, enc.into_iter().collect())
        } else if is(T::UnrankedTensor) {
            let elem = self.ty(Self::var(c)?)?;
            shaped(ShapedKind::Tensor, None, elem, Vec::new())
        } else if is(T::Vector) || is(T::VectorWithScalableDims) {
            let scalable: Vec<bool> = if is(T::VectorWithScalableDims) { (0..Self::var(c)?).map(|_| Self::byte(c).map(|b| b != 0)).collect::<Result<_, _>>()? } else { Vec::new() };
            let mut shape = Self::shape(c)?;
            for (d, s) in shape.iter_mut().zip(&scalable) {
                if let (Dim::Static(n), true) = (&*d, *s) {
                    *d = Dim::Scalable(*n);
                }
            }
            let elem = self.ty(Self::var(c)?)?;
            shaped(ShapedKind::Vector, Some(shape), elem, Vec::new())
        } else {
            return Err(Error(format!("bytecode: builtin type code {code} is not read")));
        })
    }

    /// A quant type's text, as the quant dialect prints it
    fn quant_text(&mut self, c: &mut Cursor<'_>) -> Result<String, Error> {
        use super::quant::{FLOAT_STORAGE, Q, SIGNED};
        let code = Self::var(c)?;
        let is = |q: Q| code == q as u64;
        let storage = |me: &mut Self, flags: u64, ty: &Type<'_>, min: i64, max: i64| -> String {
            let signed = flags & SIGNED != 0;
            let (name, dmin, dmax) = match ty {
                Type::Integer { signedness: Signedness::Signless, width } => {
                    let w = *width;
                    (format!("{}{w}", if signed { 'i' } else { 'u' }), if signed { -(1i64 << (w - 1)) } else { 0 }, if signed { (1i64 << (w - 1)) - 1 } else { ((1u64 << w) - 1) as i64 })
                }
                Type::Integer { width, .. } => {
                    let w = *width;
                    (ty.to_string(), if signed { -(1i64 << (w - 1)) } else { 0 }, if signed { (1i64 << (w - 1)) - 1 } else { ((1u64 << w) - 1) as i64 })
                }
                Type::Float(k) => {
                    let b = FLOAT_STORAGE.iter().find(|(f, _)| f == k).map_or(0, |(_, b)| *b);
                    (ty.to_string(), -b, b)
                }
                other => (other.to_string(), min, max),
            };
            let _ = me;
            if (min, max) == (dmin, dmax) { name } else { format!("{name}<{min}:{max}>") }
        };
        let params = |scale: f64, zero: i64| if zero == 0 { Spell::double(scale) } else { format!("{}:{zero}", Spell::double(scale)) };
        let double = |c: &mut Cursor<'_>| Self::svar(c).map(|v| f64::from_bits(v as u64));
        Ok(if is(Q::Any) || is(Q::AnyWithExpressedType) {
            let flags = Self::var(c)?;
            let st = self.ty(Self::var(c)?)?;
            let expressed = if is(Q::AnyWithExpressedType) { Some(self.ty(Self::var(c)?)?) } else { None };
            let (min, max) = (Self::svar(c)?, Self::svar(c)?);
            let s = storage(self, flags, &st, min, max);
            match expressed {
                Some(e) => format!("!quant.any<{s}:{e}>"),
                None => format!("!quant.any<{s}>"),
            }
        } else if is(Q::Calibrated) {
            let e = self.ty(Self::var(c)?)?;
            let (min, max) = (double(c)?, double(c)?);
            format!("!quant.calibrated<{e}<{}:{}>>", Spell::double(min), Spell::double(max))
        } else if is(Q::Uniform) {
            let flags = Self::var(c)?;
            let st = self.ty(Self::var(c)?)?;
            let e = self.ty(Self::var(c)?)?;
            let scale = double(c)?;
            let (zero, min, max) = (Self::svar(c)?, Self::svar(c)?, Self::svar(c)?);
            format!("!quant.uniform<{}:{e}, {}>", storage(self, flags, &st, min, max), params(scale, zero))
        } else if is(Q::UniformPerAxis) {
            let flags = Self::var(c)?;
            let st = self.ty(Self::var(c)?)?;
            let e = self.ty(Self::var(c)?)?;
            let dim = Self::var(c)?;
            let (min, max) = (Self::svar(c)?, Self::svar(c)?);
            let scales = (0..Self::var(c)?).map(|_| double(c)).collect::<Result<Vec<_>, _>>()?;
            let zeros = (0..Self::var(c)?).map(|_| Self::svar(c)).collect::<Result<Vec<_>, _>>()?;
            let ps: Vec<String> = scales.iter().zip(&zeros).map(|(s, z)| params(*s, *z)).collect();
            format!("!quant.uniform<{}:{e}:{dim}, {{{}}}>", storage(self, flags, &st, min, max), ps.join(","))
        } else if is(Q::UniformSubChannel) {
            let flags = Self::var(c)?;
            let st = self.ty(Self::var(c)?)?;
            let e = self.ty(Self::var(c)?)?;
            let (min, max) = (Self::svar(c)?, Self::svar(c)?);
            let dims = (0..Self::var(c)?).map(|_| Self::svar(c)).collect::<Result<Vec<_>, _>>()?;
            let blocks = (0..Self::var(c)?).map(|_| Self::svar(c)).collect::<Result<Vec<_>, _>>()?;
            let (sa, za) = (Self::var(c)?, Self::var(c)?);
            let (scales, zeros) = (self.attr(sa)?, self.attr(za)?);
            let elems = |a: &Attribute<'_>| -> Result<(Vec<usize>, Vec<String>), Error> {
                let k = Const::try_from(a).map_err(|_| bad("sub-channel parameters"))?;
                let shape = Self::dims(&k.ty);
                let count = k.ty.element_count().unwrap_or(k.values.len());
                let elem = k.ty.element_type().clone();
                Ok((shape, (0..count).map(|i| Self::literal(&elem, k.values[if k.values.len() == 1 { 0 } else { i }])).collect()))
            };
            let (shape, ss) = elems(&scales)?;
            let (_, zs) = elems(&zeros)?;
            let flat: Vec<String> = ss.iter().zip(&zs).map(|(s, z)| if z == "0" { s.clone() } else { format!("{s}:{z}") }).collect();
            let info: Vec<String> = dims.iter().zip(&blocks).map(|(d, b)| format!("{d}:{b}")).collect();
            let nested = Self::nest(&shape, &flat).replace('[', "{").replace(']', "}");
            format!("!quant.uniform<{}:{e}:{{{}}}, {nested}>", storage(self, flags, &st, min, max), info.join(", "))
        } else if is(Q::Quantile) {
            let st = self.ty(Self::var(c)?)?;
            let q = self.ty(Self::var(c)?)?;
            let qs = (0..Self::var(c)?).map(|_| double(c).map(Spell::double)).collect::<Result<Vec<_>, _>>()?;
            let min = if Self::byte(c)? != 0 { Some(Self::svar(c)?) } else { None };
            let max = if Self::byte(c)? != 0 { Some(Self::svar(c)?) } else { None };
            let range = match (min, max) {
                (Some(a), Some(b)) => format!(", <{a}:{b}>"),
                _ => String::new(),
            };
            format!("!quant.quantile<{st}:{q}, {{{}}}{range}>", qs.join(","))
        } else {
            return Err(Error(format!("bytecode: quant type code {code} is not read")));
        })
    }
}

impl Scope {
    fn define(&mut self, slot: usize, key: usize, uses: &mut [Option<usize>]) -> Result<(), Error> {
        *self.slots.get_mut(slot).ok_or_else(|| bad("value numbering"))? = Some(key);
        for cell in self.pending.remove(&slot).unwrap_or_default() {
            uses[cell] = Some(key);
        }
        Ok(())
    }

    fn reserve(&mut self, n: usize) -> usize {
        let base = self.slots.len();
        self.slots.resize(base + n, None);
        base
    }

    fn release(&mut self, base: usize) {
        self.slots.truncate(base);
        self.pending.retain(|s, _| *s < base);
    }
}

impl Reader<'_> {
    /// The root op
    pub fn read(mut self) -> Result<Operation<'static>, Error> {
        let mut c = Cursor::new(self.ir);
        c.var_flag().ok_or_else(|| bad("IR section"))?;
        let mut scope = Scope::default();
        let mut next = scope.reserve(0);
        let root = self.read_op(&mut c, &mut scope, &mut next)?;
        self.name_all(&root);
        self.convert(root)
    }

    fn new_value(&mut self, ty: usize) -> usize {
        self.value_types.push(ty);
        self.value_names.push((String::new(), None));
        self.value_types.len() - 1
    }

    fn skip_use_lists(c: &mut Cursor<'_>, values: usize) -> Result<(), Error> {
        let n = if values == 1 { 1 } else { Self::var(c)? };
        for _ in 0..n {
            if values != 1 {
                Self::var(c)?;
            }
            let (count, _) = c.var_flag().ok_or_else(|| bad("use-list order"))?;
            for _ in 0..count {
                Self::var(c)?;
            }
        }
        Ok(())
    }

    fn read_op(&mut self, c: &mut Cursor<'_>, scope: &mut Scope, next: &mut usize) -> Result<ROp, Error> {
        let name = Self::var(c)? as usize;
        let mask = Self::byte(c)?;
        let loc = Self::var(c)? as usize;
        let has = |m: u8| mask & m != 0;
        let attrs = if has(Mask::ATTRS) { Some(Self::var(c)? as usize) } else { None };
        let props = if has(Mask::PROPERTIES) { Some(Self::var(c)? as usize) } else { None };
        let mut results = Vec::new();
        if has(Mask::RESULTS) {
            for _ in 0..Self::var(c)? {
                let t = Self::var(c)? as usize;
                results.push(self.new_value(t));
            }
        }
        let mut operands = Vec::new();
        if has(Mask::OPERANDS) {
            for _ in 0..Self::var(c)? {
                let id = Self::var(c)? as usize;
                self.uses.push(None);
                let cell = self.uses.len() - 1;
                match scope.slots.get(id) {
                    Some(Some(k)) => self.uses[cell] = Some(*k),
                    _ => scope.pending.entry(id).or_default().push(cell),
                }
                operands.push(cell);
            }
        }
        let mut successors = Vec::new();
        if has(Mask::SUCCESSORS) {
            for _ in 0..Self::var(c)? {
                successors.push(Self::var(c)?);
            }
        }
        if has(Mask::USE_LIST_ORDERS) {
            Self::skip_use_lists(c, results.len())?;
        }
        for r in &results {
            scope.define(*next, *r, &mut self.uses)?;
            *next += 1;
        }
        let mut regions = Vec::new();
        if has(Mask::INLINE_REGIONS) {
            let (n, isolated) = c.var_flag().ok_or_else(|| bad("regions"))?;
            if isolated {
                let (_, data) = c.section().ok_or_else(|| bad("isolated regions"))?;
                let mut inner = Cursor::new(data);
                let mut own = Scope::default();
                for _ in 0..n {
                    regions.push(self.read_region(&mut inner, &mut own)?);
                }
            } else {
                for _ in 0..n {
                    regions.push(self.read_region(c, scope)?);
                }
            }
        }
        Ok(ROp { name, loc, attrs, props, results, operands, successors, regions })
    }

    fn read_region(&mut self, c: &mut Cursor<'_>, scope: &mut Scope) -> Result<RRegion, Error> {
        let blocks = Self::var(c)?;
        let mut region = RRegion::default();
        if blocks == 0 {
            return Ok(region);
        }
        let values = Self::var(c)? as usize;
        let base = scope.reserve(values);
        let mut next = base;
        for _ in 0..blocks {
            let (ops, has_args) = c.var_flag().ok_or_else(|| bad("block"))?;
            let mut block = RBlock::default();
            if has_args {
                let n = Self::var(c)? as usize;
                for _ in 0..n {
                    let (ty, has_loc) = c.var_flag().ok_or_else(|| bad("block argument"))?;
                    let loc = if has_loc { Some(Self::var(c)? as usize) } else { None };
                    let key = self.new_value(ty as usize);
                    scope.define(next, key, &mut self.uses)?;
                    next += 1;
                    block.args.push((key, loc));
                }
                if Self::byte(c)? & Mask::USE_LIST_ORDERS != 0 {
                    Self::skip_use_lists(c, n)?;
                }
            }
            for _ in 0..ops {
                block.ops.push(self.read_op(c, scope, &mut next)?);
            }
            region.blocks.push(block);
        }
        scope.release(base);
        Ok(region)
    }

    // Names, as the generic printer gives them (`SSANameState` with unique ids: one count for
    // the whole module, regions taken from a stack)

    fn name_all(&mut self, root: &ROp) {
        let (mut values, mut args) = (0u64, 0u64);
        let mut work: Vec<&RRegion> = root.regions.iter().collect();
        while let Some(r) = work.pop() {
            for (k, b) in r.blocks.iter().enumerate() {
                for (key, _) in &b.args {
                    self.value_names[*key] = if k == 0 {
                        args += 1;
                        (format!("arg{}", args - 1), None)
                    } else {
                        values += 1;
                        (format!("{}", values - 1), None)
                    };
                }
                for o in &b.ops {
                    if o.results.is_empty() {
                        continue;
                    }
                    let multi = o.results.len() > 1;
                    for (i, key) in o.results.iter().enumerate() {
                        self.value_names[*key] = (format!("{values}"), multi.then_some(i as u32));
                    }
                    values += 1;
                }
            }
            for b in &r.blocks {
                for o in &b.ops {
                    work.extend(o.regions.iter());
                }
            }
        }
    }

    fn convert(&mut self, op: ROp) -> Result<Operation<'static>, Error> {
        let (name, registered) = self.names.get(op.name).cloned().ok_or_else(|| bad("op name"))?;
        let mut results = Vec::new();
        let mut result_types = Vec::new();
        if let Some(first) = op.results.first() {
            let count = (op.results.len() > 1).then_some(op.results.len() as u32);
            results.push(ResultDef { name: self.value_names[*first].0.clone().into(), count });
            for r in &op.results {
                result_types.push(self.ty(self.value_types[*r] as u64)?);
            }
        }
        let mut operands = Vec::new();
        let mut inputs = Vec::new();
        for cell in &op.operands {
            let key = self.uses[*cell].ok_or_else(|| bad("use of a value never defined"))?;
            let (n, i) = self.value_names[key].clone();
            operands.push(Value { name: n.into(), index: i });
            inputs.push(self.ty(self.value_types[key] as u64)?);
        }
        let properties = match op.props {
            Some(p) => Some(self.properties(&name, registered, p)?).filter(|a| !(registered && matches!(a, Attribute::Dict(xs) if xs.is_empty()))),
            None => None,
        };
        let attributes = match op.attrs {
            Some(a) => match self.attr(a as u64)? {
                Attribute::Dict(xs) => xs,
                _ => return Err(bad("attribute dictionary")),
            },
            None => Vec::new(),
        };
        let loc = Self::loc_text(&self.attr(op.loc as u64)?);
        let successors = op.successors.iter().map(|s| format!("bb{s}").into()).collect();
        let mut regions = Vec::new();
        for r in op.regions {
            let mut blocks = Vec::new();
            for (k, b) in r.blocks.into_iter().enumerate() {
                let mut args = Vec::new();
                for (key, l) in &b.args {
                    let loc = match l {
                        Some(l) => Self::loc_text(&self.attr(*l as u64)?),
                        None => String::from(Self::UNKNOWN),
                    };
                    args.push(BlockArg { name: self.value_names[*key].0.clone().into(), ty: self.ty(self.value_types[*key] as u64)?, loc: Some(loc.into()) });
                }
                let label = if k == 0 && args.is_empty() && !b.ops.is_empty() { None } else { Some(format!("bb{k}").into()) };
                let ops = b.ops.into_iter().map(|o| self.convert(o)).collect::<Result<Vec<_>, _>>()?;
                blocks.push(Block { label, args, ops });
            }
            regions.push(Region { blocks });
        }
        Ok(Operation { results, name: name.into(), operands, successors, properties, regions, attributes, ty: FunctionType { inputs, results: result_types }, loc: Some(loc.into()), raw: None })
    }

    /// An op's properties as the attribute the generic form shows
    fn properties(&mut self, name: &str, registered: bool, index: usize) -> Result<Attribute<'static>, Error> {
        let data = *self.props.get(index).ok_or_else(|| bad("properties reference"))?;
        let mut c = Cursor::new(data);
        let table = if registered { super::write::Writer::registered(name).flatten() } else { None };
        let Some(table) = table else { return self.attr(Self::var(&mut c)?) };
        let mut named: Vec<(String, Attribute<'static>)> = Vec::new();
        let int = |bits: u8, v: u64| Attribute::from(Const::int(ApInt::from_bits(u32::from(bits), u128::from(v)), Type::Integer { signedness: Signedness::Signless, width: u32::from(bits) }));
        for p in table {
            let n = String::from(p.name);
            match p.kind {
                PropKind::Attr => {
                    let i = Self::var(&mut c)?;
                    named.push((n, self.attr(i)?));
                }
                PropKind::OptAttr => {
                    let (i, present) = c.var_flag().ok_or_else(|| bad("properties"))?;
                    if present {
                        named.push((n, self.attr(i)?));
                    }
                }
                PropKind::Segments(count) => {
                    let mut sizes = vec![0u64; usize::from(count)];
                    let (v, sparse) = c.var_flag().ok_or_else(|| bad("segment sizes"))?;
                    if sparse {
                        if v > 0 {
                            let bits = Self::var(&mut c)?;
                            for _ in 0..v {
                                let x = Self::var(&mut c)?;
                                let at = (x & ((1 << bits) - 1)) as usize;
                                *sizes.get_mut(at).ok_or_else(|| bad("segment sizes"))? = x >> bits;
                            }
                        }
                    } else {
                        sizes = (0..v).map(|_| Self::var(&mut c)).collect::<Result<_, _>>()?;
                    }
                    let values = sizes.iter().map(|s| format!("{s}").into()).collect();
                    named.push((n, Attribute::DenseArray { ty: Type::Integer { signedness: Signedness::Signless, width: 32 }, values }));
                }
                PropKind::VarInt(bits) => {
                    let v = Self::var(&mut c)?;
                    named.push((n, int(bits, v)));
                }
                PropKind::SignedVarInt(bits) => {
                    let v = Self::svar(&mut c)? as u64;
                    named.push((n, int(bits, v)));
                }
                PropKind::Bool => {
                    let b = Self::byte(&mut c)? != 0;
                    named.push((n, if b { Attribute::Unit } else { Attribute::Bool(false) }));
                }
                PropKind::OptVarInt(bits) => {
                    let xs = if Self::byte(&mut c)? != 0 { vec![int(bits, Self::var(&mut c)?)] } else { Vec::new() };
                    named.push((n, Attribute::Array(xs)));
                }
                PropKind::VarInts(bits) => {
                    let k = Self::var(&mut c)?;
                    let xs = (0..k).map(|_| Self::var(&mut c).map(|v| int(bits, v))).collect::<Result<_, _>>()?;
                    named.push((n, Attribute::Array(xs)));
                }
                PropKind::String => {
                    let s = self.string(Self::var(&mut c)?)?;
                    named.push((n, Attribute::Str { lit: Spell::escaped(s).into(), ty: None }));
                }
            }
        }
        named.sort_by(|a, b| a.0.cmp(&b.0));
        Ok(Attribute::Dict(named.into_iter().map(|(n, v)| NamedAttr { name: Spell::keyword_or_string(&n).into(), value: if v == Attribute::Unit { None } else { Some(v) } }).collect()))
    }
}
