use alloc::borrow::Cow;
use alloc::boxed::Box;
use alloc::format;
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;

use crate::ast::*;
use crate::dialect::{Dialect, Dialects, SymKind};
use crate::error::ParseError;

pub type R<T> = Result<T, ParseError>;

/// Recursive-descent, scannerless parser over borrowed source text.
///
/// The public methods are the combinators [`Dialect`] plugins build custom syntax from.
pub struct Parser<'a, 'd> {
    src: &'a str,
    pos: usize,
    dialects: Dialects<'d>,
    default_ns: Option<&'d str>,
}

/// `TryFrom<&str>` entry points (no plugins): parse the whole input as one node.
macro_rules! entry {
    ($($ty:ident => $m:ident),* $(,)?) => {$(
        impl<'a> TryFrom<&'a str> for $ty<'a> {
            type Error = ParseError;
            fn try_from(src: &'a str) -> R<Self> {
                Parser::new(src, &[]).all(|p| p.$m())
            }
        }
    )*};
}

entry!(Module => module, Operation => op, Type => ty, Attribute => attr);

impl<'a> Module<'a> {
    /// Parses with dialect plugins; `Module::try_from(src)` parses without any.
    pub fn parse(src: &'a str, dialects: Dialects<'_>) -> R<Self> {
        Parser::new(src, dialects).all(Parser::module)
    }
}

const fn is_id(c: u8) -> bool {
    c.is_ascii_alphanumeric() || matches!(c, b'_' | b'$' | b'.')
}

const fn is_suffix(c: u8) -> bool {
    is_id(c) || c == b'-'
}

/// Clause keywords that may start a continuation line of a custom op.
const CLAUSES: &[&str] = &[
    "attributes", "ins", "outs", "to", "step", "iter_args", "else", "do", "into", "from", "by",
    "at", "inits", "shared_outs", "init", "with", "then", "in", "on", "dimensions", "permutation",
];

const fn closer(c: u8) -> u8 {
    match c {
        b'<' => b'>',
        b'(' => b')',
        b'[' => b']',
        _ => b'}',
    }
}

impl<'a, 'd> Parser<'a, 'd> {
    pub fn new(src: &'a str, dialects: Dialects<'d>) -> Self {
        Self { src, pos: 0, dialects, default_ns: None }
    }

    /// Runs `f` and requires it to consume the whole input.
    pub fn all<T>(mut self, f: impl FnOnce(&mut Self) -> R<T>) -> R<T> {
        let v = f(&mut self)?;
        self.ws();
        if self.pos == self.src.len() { Ok(v) } else { self.err("unexpected trailing input") }
    }

    // ---- low level -------------------------------------------------------

    pub fn pos(&self) -> usize {
        self.pos
    }

    /// Rewinds (or advances) to a byte offset previously returned by [`Self::pos`].
    pub fn seek(&mut self, pos: usize) {
        self.pos = pos;
    }

    pub fn peek(&self) -> Option<u8> {
        self.src.as_bytes().get(self.pos).copied()
    }

    fn peek_at(&self, k: usize) -> Option<u8> {
        self.src.as_bytes().get(self.pos + k).copied()
    }

    /// Unconsumed input.
    pub fn rest(&self) -> &'a str {
        &self.src[self.pos..]
    }

    /// Source text between `start` and the current position.
    pub fn since(&self, start: usize) -> &'a str {
        &self.src[start..self.pos]
    }

    pub fn err<T>(&self, msg: impl Into<String>) -> R<T> {
        Err(ParseError::at(self.src, self.pos, msg))
    }

    /// Skips whitespace (including newlines) and `//` comments.
    pub fn ws(&mut self) {
        loop {
            match self.peek() {
                Some(c) if c.is_ascii_whitespace() => self.pos += 1,
                Some(b'/') if self.peek_at(1) == Some(b'/') => self.skip_line(),
                _ => break,
            }
        }
    }

    fn skip_line(&mut self) {
        self.pos = self.rest().find('\n').map_or(self.src.len(), |i| self.pos + i);
    }

    /// Consumes punctuation `s` after whitespace.
    pub fn eat(&mut self, s: &str) -> bool {
        self.ws();
        let hit = self.rest().starts_with(s);
        if hit {
            self.pos += s.len();
        }
        hit
    }

    /// Consumes keyword `kw` (not followed by an identifier character).
    pub fn eat_kw(&mut self, kw: &str) -> bool {
        self.ws();
        let hit = self.rest().starts_with(kw) && !self.rest().as_bytes().get(kw.len()).is_some_and(|&c| is_suffix(c));
        if hit {
            self.pos += kw.len();
        }
        hit
    }

    pub fn expect(&mut self, s: &str) -> R<()> {
        if self.eat(s) { Ok(()) } else { self.err(format!("expected `{s}`")) }
    }

    /// Assembly-format literal: keyword if it starts with a letter or `_`, else punctuation.
    pub fn eat_lit(&mut self, s: &str) -> bool {
        if s.starts_with(|c: char| c.is_ascii_alphabetic() || c == '_') { self.eat_kw(s) } else { self.eat(s) }
    }

    pub fn expect_lit(&mut self, s: &str) -> R<()> {
        if self.eat_lit(s) { Ok(()) } else { self.err(format!("expected `{s}`")) }
    }

    /// Is the next non-blank byte `c`?
    pub fn at(&mut self, c: u8) -> bool {
        self.ws();
        self.peek() == Some(c)
    }

    fn take_while(&mut self, f: impl Fn(u8) -> bool) -> &'a str {
        let start = self.pos;
        while self.peek().is_some_and(&f) {
            self.pos += 1;
        }
        self.since(start)
    }

    fn nonempty(&mut self, what: &str, f: impl Fn(u8) -> bool) -> R<&'a str> {
        match self.take_while(f) {
            "" => self.err(format!("expected {what}")),
            s => Ok(s),
        }
    }

    pub fn number<T: core::str::FromStr>(&mut self) -> R<T> {
        self.ws();
        let s = self.nonempty("integer", |c| c.is_ascii_digit())?;
        s.parse().or_else(|_| self.err("integer out of range"))
    }

    /// Bare identifier: `(letter|_)(letter|digit|[_$.])*`.
    pub fn ident(&mut self) -> R<&'a str> {
        self.ws();
        match self.peek() {
            Some(c) if c.is_ascii_alphabetic() || c == b'_' => Ok(self.take_while(is_id)),
            _ => self.err("expected identifier"),
        }
    }

    /// Name after a sigil: `%x`, `^bb0`, `@sym`, `#map`, `!t` → `x`, `bb0`, ...
    pub fn sigil(&mut self, c: char) -> R<&'a str> {
        self.expect(c.encode_utf8(&mut [0; 4]))?;
        self.nonempty("name", is_suffix)
    }

    /// Skips a string literal starting at `"`, returning the raw text including quotes.
    fn skip_string(&mut self) -> R<&'a str> {
        let start = self.pos;
        self.pos += 1;
        loop {
            match self.peek() {
                None => return self.err("unterminated string"),
                Some(b'\\') => self.pos += 2,
                Some(b'"') => break self.pos += 1,
                _ => self.pos += 1,
            }
        }
        Ok(self.since(start))
    }

    /// String literal, returning the raw (still escaped) contents between the quotes.
    pub fn string(&mut self) -> R<&'a str> {
        if !self.at(b'"') {
            return self.err("expected string");
        }
        self.skip_string().map(|s| &s[1..s.len() - 1])
    }

    /// `@name` or `@"name"`; quoted names keep their quotes.
    pub fn symbol(&mut self) -> R<&'a str> {
        self.expect("@")?;
        if self.peek() == Some(b'"') { self.skip_string() } else { self.nonempty("symbol", is_suffix) }
    }

    /// Raw balanced group starting at `<`, `(`, `[` or `{`, including delimiters.
    pub fn group(&mut self) -> R<&'a str> {
        let start = self.pos;
        let mut stack = Vec::new();
        loop {
            let Some(c) = self.peek() else { return self.err("unbalanced group") };
            match c {
                b'"' => drop(self.skip_string()?),
                b'-' if self.peek_at(1) == Some(b'>') => self.pos += 2,
                b'<' if self.peek_at(1) == Some(b'=') => self.pos += 2,
                b'<' | b'(' | b'[' | b'{' => {
                    stack.push(closer(c));
                    self.pos += 1;
                }
                b'>' | b')' | b']' | b'}' if stack.last() == Some(&c) => {
                    stack.pop();
                    self.pos += 1;
                    if stack.is_empty() {
                        return Ok(self.since(start));
                    }
                }
                b'>' => self.pos += 1,
                b')' | b']' | b'}' => return self.err("mismatched delimiter"),
                _ => self.pos += 1,
            }
        }
    }

    /// Is a balanced group next (after whitespace)?
    fn at_group(&mut self) -> bool {
        self.ws();
        matches!(self.peek(), Some(b'<' | b'(' | b'['))
    }

    /// Consecutive balanced groups (`distinct[0]<...>`), or `None` if none follow.
    fn groups(&mut self) -> R<Option<&'a str>> {
        let start = self.pos;
        while matches!(self.peek(), Some(b'<' | b'(' | b'[' | b'{')) {
            self.group()?;
        }
        Ok((self.pos > start).then(|| self.since(start)))
    }

    /// `elem (, elem)* close`, assuming the opener was consumed.
    pub fn list<T>(&mut self, close: &str, mut f: impl FnMut(&mut Self) -> R<T>) -> R<Vec<T>> {
        let mut out = Vec::new();
        if self.eat(close) {
            return Ok(out);
        }
        loop {
            out.push(f(self)?);
            if !self.eat(",") {
                self.expect(close)?;
                return Ok(out);
            }
        }
    }

    /// `open elem (, elem)* close` if `open` follows, else empty.
    pub fn opt_list<T>(&mut self, open: &str, close: &str, f: impl FnMut(&mut Self) -> R<T>) -> R<Vec<T>> {
        if self.eat(open) { self.list(close, f) } else { Ok(Vec::new()) }
    }

    /// Optional `loc(...)`, returning its raw contents.
    pub fn opt_loc(&mut self) -> R<Option<Str<'a>>> {
        let save = self.pos;
        if self.eat_kw("loc") && self.peek() == Some(b'(') {
            let g = self.group()?;
            return Ok(Some(Cow::Borrowed(&g[1..g.len() - 1])));
        }
        self.pos = save;
        Ok(None)
    }

    /// Optional `: type` (not `::`).
    pub fn opt_ty(&mut self) -> R<Option<Type<'a>>> {
        let save = self.pos;
        if self.eat(":") && self.peek() != Some(b':') {
            return self.ty().map(Some);
        }
        self.pos = save;
        Ok(None)
    }

    // ---- dialect plumbing ------------------------------------------------

    pub fn dialect(&self, ns: &str) -> Option<&'d dyn Dialect> {
        self.dialects.iter().copied().find(|d| d.namespace() == ns)
    }

    /// Parses a region whose bare op names resolve against dialect `ns` (like `func.func`).
    pub fn region_in(&mut self, ns: &str) -> R<Region<'a>> {
        let ns = self.dialect(ns).map(|d| d.namespace());
        let saved = core::mem::replace(&mut self.default_ns, ns);
        let r = self.region();
        self.default_ns = saved;
        r
    }

    /// Lets the owning dialect structure an extended type/attribute body.
    fn extended(&mut self, kind: SymKind) -> R<Extended<'a>> {
        let name = self.sigil(kind.sigil())?;
        let start = self.pos;
        let body = self.groups()?;
        let mut params = Vec::new();
        if let (Some(_), Some(d)) = (body, name.split_once('.').and_then(|(ns, _)| self.dialect(ns))) {
            let end = self.pos;
            self.pos = start;
            match d.parse_params(kind, name, self) {
                Some(r) => {
                    params = r?;
                    if self.pos != end {
                        return self.err(format!("dialect plugin did not consume the body of `{name}`"));
                    }
                }
                None => self.pos = end,
            }
        }
        Ok(Extended { name: name.into(), body: body.map(Cow::Borrowed), params })
    }

    // ---- types -----------------------------------------------------------

    pub fn ty(&mut self) -> R<Type<'a>> {
        self.ws();
        match self.peek() {
            Some(b'(') => self.fn_ty().map(Type::Function),
            Some(b'!') => self.extended(SymKind::Type).map(Type::Extended),
            _ => self.keyword_ty(),
        }
    }

    fn keyword_ty(&mut self) -> R<Type<'a>> {
        let start = self.pos;
        let id = self.ident()?;
        Ok(match id {
            "index" => Type::Index,
            "none" => Type::NoneType,
            "complex" => {
                self.expect("<")?;
                let t = self.ty()?;
                self.expect(">")?;
                Type::Complex(Box::new(t))
            }
            "tuple" => {
                self.expect("<")?;
                Type::Tuple(self.list(">", Self::ty)?)
            }
            _ => {
                if let Ok(kind) = ShapedKind::try_from(id) {
                    return self.shaped(kind).map(Type::Shaped);
                }
                if let Ok(k) = FloatKind::try_from(id) {
                    return Ok(Type::Float(k));
                }
                let split = id.find(|c: char| c.is_ascii_digit()).unwrap_or(id.len());
                match (Signedness::try_from(&id[..split]), id[split..].parse()) {
                    (Ok(signedness), Ok(width)) => Type::Integer { signedness, width },
                    _ => {
                        self.pos = start;
                        return self.err(format!("unknown type `{id}`"));
                    }
                }
            }
        })
    }

    fn shaped(&mut self, kind: ShapedKind) -> R<Shaped<'a>> {
        self.expect("<")?;
        let shape = if self.eat("*") {
            self.expect("x")?;
            None
        } else {
            Some(self.dims()?)
        };
        let elem = Box::new(self.ty()?);
        let mut extras = Vec::new();
        while self.eat(",") {
            extras.push(self.attr()?);
        }
        self.expect(">")?;
        Ok(Shaped { kind, shape, elem, extras })
    }

    /// Dimension list `4x?x[8]x` (each dim must be followed by `x`).
    pub fn dims(&mut self) -> R<Vec<Dim>> {
        let mut dims = Vec::new();
        loop {
            self.ws();
            let save = self.pos;
            let dim = match self.peek() {
                Some(b'?') => {
                    self.pos += 1;
                    Dim::Dynamic
                }
                Some(b'[') => {
                    self.pos += 1;
                    let n = self.number()?;
                    self.expect("]")?;
                    Dim::Scalable(n)
                }
                Some(c) if c.is_ascii_digit() => Dim::Static(self.number()?),
                _ => return Ok(dims),
            };
            // `x` before the element type, e.g. `4xf32` or `4 x f32`.
            if !self.eat("x") {
                self.pos = save;
                return Ok(dims);
            }
            dims.push(dim);
        }
    }

    pub fn fn_ty(&mut self) -> R<FunctionType<'a>> {
        self.expect("(")?;
        let inputs = self.list(")", Self::ty)?;
        self.expect("->")?;
        Ok(FunctionType { inputs, results: self.results_ty()? })
    }

    /// `type` or `(type, ...)` — the right-hand side of `->`.
    pub fn results_ty(&mut self) -> R<Vec<Type<'a>>> {
        if self.eat("(") { self.list(")", Self::ty) } else { Ok(vec![self.ty()?]) }
    }

    // ---- attributes ------------------------------------------------------

    pub fn attr(&mut self) -> R<Attribute<'a>> {
        self.ws();
        let Some(c) = self.peek() else { return self.err("expected attribute") };
        Ok(match c {
            b'[' => {
                self.pos += 1;
                Attribute::Array(self.list("]", Self::attr)?)
            }
            b'{' => Attribute::Dict(self.dict()?),
            b'"' => Attribute::Str { lit: self.string()?.into(), ty: self.opt_ty()? },
            b'@' => Attribute::SymbolRef(self.symbol_ref()?),
            b'#' => Attribute::Extended { ext: self.extended(SymKind::Attr)?, ty: self.opt_ty()? },
            b'-' | b'+' | b'0'..=b'9' => self.number_attr()?,
            b'!' | b'(' => Attribute::Type(self.ty()?),
            _ => self.keyword_attr()?,
        })
    }

    fn keyword_attr(&mut self) -> R<Attribute<'a>> {
        let start = self.pos;
        Ok(match self.ident()? {
            "true" => Attribute::Bool(true),
            "false" => Attribute::Bool(false),
            "unit" => Attribute::Unit,
            "array" if self.peek() == Some(b'<') => {
                self.pos += 1;
                let ty = self.ty()?;
                let values = if self.eat(":") {
                    self.list(">", |p| {
                        p.ws();
                        p.nonempty("array element", |c| is_id(c) || matches!(c, b'-' | b'+')).map(Cow::Borrowed)
                    })?
                } else {
                    self.expect(">")?;
                    Vec::new()
                };
                Attribute::DenseArray { ty, values }
            }
            name @ ("dense" | "dense_resource" | "sparse" | "opaque" | "affine_map" | "affine_set"
            | "strided" | "distinct" | "loc")
                if self.at_group() =>
            {
                let body = self.groups()?.unwrap_or_default().into();
                let typed = matches!(name, "dense" | "dense_resource" | "sparse" | "opaque");
                let ty = if typed { self.opt_ty()? } else { None };
                Attribute::Builtin { name: name.into(), body, ty }
            }
            _ => {
                self.pos = start;
                Attribute::Type(self.ty()?)
            }
        })
    }

    fn number_attr(&mut self) -> R<Attribute<'a>> {
        let start = self.pos;
        if matches!(self.peek(), Some(b'-' | b'+')) {
            self.pos += 1;
        }
        let float = if self.rest().starts_with("0x") {
            self.pos += 2;
            self.nonempty("hex digits", |c| c.is_ascii_hexdigit())?;
            false
        } else {
            self.nonempty("digits", |c| c.is_ascii_digit())?;
            let float = self.peek() == Some(b'.');
            if float {
                self.pos += 1;
                self.take_while(|c| c.is_ascii_digit());
                if matches!(self.peek(), Some(b'e' | b'E')) {
                    self.pos += 1;
                    if matches!(self.peek(), Some(b'-' | b'+')) {
                        self.pos += 1;
                    }
                    self.nonempty("exponent", |c| c.is_ascii_digit())?;
                }
            }
            float
        };
        let lit = Cow::Borrowed(self.since(start));
        let ty = self.opt_ty()?;
        Ok(if float { Attribute::Float { lit, ty } } else { Attribute::Int { lit, ty } })
    }

    fn symbol_ref(&mut self) -> R<Vec<Str<'a>>> {
        let mut out = vec![self.symbol()?.into()];
        while self.rest().starts_with("::") {
            self.pos += 2;
            out.push(self.symbol()?.into());
        }
        Ok(out)
    }

    /// `{name = attr, name, ...}`
    pub fn dict(&mut self) -> R<Vec<NamedAttr<'a>>> {
        self.expect("{")?;
        self.list("}", |p| {
            p.ws();
            let name = if p.peek() == Some(b'"') { p.skip_string()? } else { p.ident()? };
            let value = if p.eat("=") { Some(p.attr()?) } else { None };
            Ok(NamedAttr { name: name.into(), value })
        })
    }

    /// Optional attribute dictionary.
    pub fn opt_dict(&mut self) -> R<Vec<NamedAttr<'a>>> {
        if self.at(b'{') { self.dict() } else { Ok(Vec::new()) }
    }

    // ---- operations ------------------------------------------------------

    pub fn module(&mut self) -> R<Module<'a>> {
        let mut items = Vec::new();
        loop {
            self.ws();
            let item = match self.peek() {
                None => return Ok(Module { items }),
                Some(b'#') => {
                    let name = self.sigil('#')?.into();
                    self.expect("=")?;
                    Item::AttrAlias { name, value: self.attr()? }
                }
                Some(b'!') => {
                    let name = self.sigil('!')?.into();
                    self.expect("=")?;
                    Item::TypeAlias { name, ty: self.ty()? }
                }
                Some(b'{') if self.rest().starts_with("{-#") => {
                    self.pos += 3;
                    let Some(end) = self.rest().find("#-}") else {
                        return self.err("unterminated `{-#`");
                    };
                    let body = Cow::Borrowed(&self.rest()[..end]);
                    self.pos += end + 3;
                    Item::Metadata { body }
                }
                Some(_) => Item::Op(self.op()?),
            };
            items.push(item);
        }
    }

    pub fn op(&mut self) -> R<Operation<'a>> {
        let mut results = Vec::new();
        if self.at(b'%') {
            loop {
                let name = self.sigil('%')?.into();
                let count = if self.peek() == Some(b':') && self.peek_at(1).is_some_and(|c| c.is_ascii_digit()) {
                    self.pos += 1;
                    Some(self.number()?)
                } else {
                    None
                };
                results.push(ResultDef { name, count });
                if !self.eat(",") {
                    break;
                }
            }
            self.expect("=")?;
        }
        let body = if self.at(b'"') { OpBody::Generic(self.generic()?) } else { self.custom()? };
        Ok(Operation { results, body })
    }

    /// `%name` or `%name#index`.
    pub fn value_ref(&mut self) -> R<ValueRef<'a>> {
        let name = self.sigil('%')?.into();
        let index = if self.peek() == Some(b'#') {
            self.pos += 1;
            Some(self.number()?)
        } else {
            None
        };
        Ok(ValueRef { name, index })
    }

    fn generic(&mut self) -> R<GenericOp<'a>> {
        let name = self.string()?.into();
        self.expect("(")?;
        let operands = self.list(")", Self::value_ref)?;
        let successors = self.opt_list("[", "]", |p| p.sigil('^').map(Cow::Borrowed))?;
        let properties = if self.eat("<") {
            let a = self.attr()?;
            self.expect(">")?;
            Some(a)
        } else {
            None
        };
        let regions = self.opt_list("(", ")", Self::region)?;
        let attributes = self.opt_dict()?;
        self.expect(":")?;
        let ty = self.fn_ty()?;
        let loc = self.opt_loc()?;
        Ok(GenericOp { name, operands, successors, properties, regions, attributes, ty, loc })
    }

    /// Candidate full names for a custom op name: explicit namespace, default dialect, builtin.
    fn resolve(&self, name: &str) -> Vec<(&'d dyn Dialect, String)> {
        let qualified = |ns: &str| self.dialect(ns).map(|d| (d, format!("{ns}.{name}")));
        match name.split_once('.') {
            Some((ns, _)) => self.dialect(ns).map(|d| (d, name.into())).into_iter().chain(self.default_ns.and_then(qualified)).collect(),
            None => self.default_ns.and_then(qualified).into_iter().chain(qualified("builtin")).collect(),
        }
    }

    fn custom(&mut self) -> R<OpBody<'a>> {
        let name = self.ident()?;
        let start = self.pos;
        for (d, full) in self.resolve(name) {
            match d.parse_op(&full, self) {
                Some(r) => return r.map(OpBody::Generic),
                None => self.pos = start,
            }
        }
        self.raw_custom(name).map(OpBody::Custom)
    }

    /// Unknown custom op: raw text up to the end of the line (at bracket depth 0) or an
    /// unmatched closer; a `{` that ends its line opens a structurally parsed region.
    fn raw_custom(&mut self, name: &'a str) -> R<CustomOp<'a>> {
        let mut pieces = Vec::new();
        let mut stack = Vec::new();
        let mut start = self.pos;
        loop {
            let Some(c) = self.peek() else { break };
            match c {
                b'\n' if stack.is_empty() && !self.continues(start) => break,
                b'/' if self.peek_at(1) == Some(b'/') => {
                    let line_start = self.pos;
                    self.skip_line();
                    if stack.is_empty() && !self.continues(start) {
                        self.pos = line_start;
                        break;
                    }
                }
                b'"' => drop(self.skip_string()?),
                b'{' if self.region_ahead() => {
                    Self::push_text(&mut pieces, self.since(start));
                    pieces.push(Piece::Region(self.region()?));
                    start = self.pos;
                }
                b'-' if self.peek_at(1) == Some(b'>') => self.pos += 2,
                b'<' if self.peek_at(1) == Some(b'=') => self.pos += 2,
                b'<' | b'(' | b'[' | b'{' => {
                    stack.push(closer(c));
                    self.pos += 1;
                }
                b'>' | b')' | b']' | b'}' if stack.last() == Some(&c) => {
                    stack.pop();
                    self.pos += 1;
                }
                b'>' => self.pos += 1,
                b')' | b']' | b'}' if stack.is_empty() => break,
                b')' | b']' | b'}' => return self.err("mismatched delimiter in custom op"),
                _ => self.pos += 1,
            }
        }
        Self::push_text(&mut pieces, self.since(start).trim_end());
        Ok(CustomOp { name: name.into(), pieces })
    }

    /// At a depth-0 line end inside a custom op: does the op continue on the next line?
    fn continues(&self, start: usize) -> bool {
        let mut prev = self.src[start..self.pos].trim_end();
        while let Some((head, last)) = prev.rsplit_once('\n')
            && last.trim_start().starts_with("//")
        {
            prev = head.trim_end();
        }
        if [",", "->", "=", ":", "("].iter().any(|t| prev.ends_with(t)) {
            return true;
        }
        let mut next = self.rest();
        loop {
            next = next.trim_start();
            match next.strip_prefix("//") {
                Some(c) => next = c.split_once('\n').map_or("", |(_, r)| r),
                None => break,
            }
        }
        let Some(&c) = next.as_bytes().first() else { return false };
        if c.is_ascii_alphabetic() || c == b'_' {
            // A bare word continues the op when it is a clause keyword (`ins(`, `attributes {`).
            let word = &next[..next.bytes().position(|c| !is_id(c)).unwrap_or(next.len())];
            let after = &next[word.len()..];
            let assign = after.trim_start().strip_prefix('=').is_some_and(|r| !r.starts_with('='));
            return !word.contains('.') && (after.starts_with('(') || assign || CLAUSES.contains(&word));
        }
        match c {
            b'%' => !self.results_ahead(self.src.len() - next.len()),
            _ => !matches!(c, b'^' | b'}' | b'"' | b'#' | b'!'),
        }
    }

    /// Does `%a, %b:2 =` (an op's result list) start at `pos`?
    fn results_ahead(&self, pos: usize) -> bool {
        let mut p = Parser::new(self.src, &[]);
        p.pos = pos;
        loop {
            if p.sigil('%').is_err() {
                return false;
            }
            if p.peek() == Some(b':') && p.peek_at(1).is_some_and(|c| c.is_ascii_digit()) {
                p.pos += 1;
                p.take_while(|c| c.is_ascii_digit());
            }
            if !p.eat(",") {
                return p.eat("=") && p.peek() != Some(b'=');
            }
        }
    }

    fn push_text(pieces: &mut Vec<Piece<'a>>, text: &'a str) {
        if !text.is_empty() {
            pieces.push(Piece::Text(text.into()));
        }
    }

    /// At `{` inside a custom op: does a region (rather than an attribute dict) start here?
    /// The brace must end its line, and the next token must be able to start an op/block.
    fn region_ahead(&self) -> bool {
        let rest = &self.rest()[1..];
        let line_end = rest.find('\n').unwrap_or(rest.len());
        let tail = rest[..line_end].trim();
        if !(tail.is_empty() || tail.starts_with("//")) || line_end == rest.len() {
            return false;
        }
        let mut probe = Parser::new(self.src, &[]);
        probe.pos = self.pos + 1 + line_end;
        probe.ws();
        match probe.peek() {
            Some(b'%' | b'^' | b'}') => true,
            Some(b'"') => probe.skip_string().is_ok() && probe.at(b'('),
            _ => probe.ident().is_ok() && { probe.ws(); !matches!(probe.peek(), Some(b'=' | b',' | b'}')) },
        }
    }

    pub fn region(&mut self) -> R<Region<'a>> {
        self.expect("{")?;
        let mut blocks = Vec::new();
        while !self.eat("}") {
            if self.peek().is_none() {
                return self.err("unterminated region");
            }
            blocks.push(self.block()?);
        }
        Ok(Region { blocks })
    }

    /// `%name : type loc(...)?` — a block argument or function-signature entry.
    pub fn block_arg(&mut self) -> R<BlockArg<'a>> {
        let name = self.sigil('%')?.into();
        self.expect(":")?;
        Ok(BlockArg { name, ty: self.ty()?, loc: self.opt_loc()? })
    }

    fn block(&mut self) -> R<Block<'a>> {
        let (mut label, mut args) = (None, Vec::new());
        if self.at(b'^') {
            label = Some(self.sigil('^')?.into());
            args = self.opt_list("(", ")", Self::block_arg)?;
            self.expect(":")?;
        }
        let mut ops = Vec::new();
        loop {
            self.ws();
            if matches!(self.peek(), None | Some(b'}' | b'^')) {
                return Ok(Block { label, args, ops });
            }
            ops.push(self.op()?);
        }
    }
}
