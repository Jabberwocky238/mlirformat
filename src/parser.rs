//! ⭐ Text → IR: the recursive-descent parser, the serde `Deserializer` that builds typed ops out
//! of a [`Content`], and the runtime assembly-format reader.

use alloc::borrow::Cow;
use alloc::boxed::Box;
use alloc::format;
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;

use core::fmt;

use serde::{Deserialize, Serialize};
use serde::de::{self, DeserializeOwned, DeserializeSeed, EnumAccess, IntoDeserializer, MapAccess, SeqAccess, VariantAccess, Visitor};

use crate::common::*;
use crate::generator::IntoStatic;
use crate::mliropt::MlirOpt;

pub type R<T> = Result<T, ParseError>;

/// Recursive-descent, scannerless parser over borrowed source text. Its public methods are the
/// combinators hand-written ops and dialect parameter parsers build on.
pub struct Parser<'a, 'd> {
    src: &'a str,
    pos: usize,
    opt: &'d MlirOpt,
    /// Dialect bare op names resolve against (`return` in `func.func`).
    default_ns: Option<&'static str>,
    /// The next attribute is parsed without its `: type` suffix.
    bare: bool,
    /// Attribute aliases seen so far, so an op's custom form can look inside one.
    aliases: Vec<(String, String)>,
    /// Type aliases seen so far (`!t = memref<?xf32>`): a use reads as the type it names, as
    /// `mlir-opt` reads it, so a custom form can infer from it.
    type_aliases: Vec<(&'a str, Type<'a>)>,
    /// How many values the op being read defines (`%0:2 = ` ⇒ 2): a variadic result whose
    /// types the custom form leaves out (`vector.to_elements`) has that many.
    results: usize,
    /// Regions a typed op read is lent (see [`Parser::lend`]), and whether lending is on.
    lent: Vec<Region<'a>>,
    lending: bool,
    /// Reads the ops of the first block in parallel, once ([`MlirOpt::parse_in`]).
    fork: Option<&'d dyn for<'x> Fork<'x>>,
}

/// Reads one run of a block's ops ([`Parser::forked`]).
pub(crate) type Chunk<'a, 't> = Box<dyn FnOnce() -> R<Vec<Operation<'a>>> + Send + 't>;

/// An [`Executor`](moremath::Executor) as the parser holds it: without its generic method, so
/// it fits behind a reference.
pub(crate) trait Fork<'a>: Sync {
    fn threads(&self) -> usize;

    /// The runs live for `'t` (they borrow the parser), the ops they read for `'a` (the source),
    /// which outlives them.
    fn fork<'t>(&self, chunks: Vec<Chunk<'a, 't>>) -> Vec<R<Vec<Operation<'a>>>>
    where
        'a: 't;
}

impl<'a, X: moremath::Executor + Sync> Fork<'a> for X {
    #[inline]
    fn threads(&self) -> usize {
        moremath::Executor::threads(self)
    }

    #[inline]
    fn fork<'t>(&self, chunks: Vec<Chunk<'a, 't>>) -> Vec<R<Vec<Operation<'a>>>>
    where
        'a: 't,
    {
        self.execute(chunks)
    }
}

/// IR nodes a [`Parser`] reads whole — the dual of [`Emit`](crate::Emit), which writes them.
/// Together they say what a node is: something the text has a shape for in both directions.
pub trait Read<'a>: Sized {
    fn read(p: &mut Parser<'a, '_>) -> R<Self>;
}

/// [`Read`] and the `TryFrom<&str>` entry point (no dialects: the whole input is one node).
macro_rules! entry {
    ($($ty:ident => $m:ident),* $(,)?) => {$(
        impl<'a> Read<'a> for $ty<'a> {
            #[inline]
            fn read(p: &mut Parser<'a, '_>) -> R<Self> {
                p.$m()
            }
        }

        impl<'a> TryFrom<&'a str> for $ty<'a> {
            type Error = ParseError;
            #[inline]
            fn try_from(src: &'a str) -> R<Self> {
                Parser::read(src, |p| Self::read(p))
            }
        }
    )*};
}

entry!(Module => module, Operation => op, Type => ty, Attribute => attr, Region => region);

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
    /// The context this parser reads against (an op's custom form may need its ODS facts).
    #[inline]
    pub fn opt(&self) -> &'d MlirOpt {
        self.opt
    }

    #[inline]
    pub fn new(src: &'a str, opt: &'d MlirOpt) -> Self {
        Self { src, pos: 0, opt, default_ns: None, bare: false, aliases: Vec::new(), type_aliases: Vec::new(), results: 0, lent: Vec::new(), lending: false, fork: None }
    }

    /// ⭐ A region handed to a typed op without copying it. The op holds `Region<'static>`, so
    /// a borrowed region would be copied whole — and again at every op around it. While a
    /// [`Template`](crate::Template) reads an op, the region waits here and the op gets an empty
    /// stand-in, swapped back by [`Parser::reclaim`] once the op is an [`Operation`]. Read any
    /// other way (`O::parse` called directly), the region is copied as before.
    pub fn lend(&mut self, r: Region<'a>) -> Region<'static> {
        if !self.lending {
            return r.into_static();
        }
        self.lent.push(r);
        Region { blocks: alloc::vec![Block { label: Some(Cow::Owned(alloc::format!("{LENT}{}", self.lent.len() - 1))), args: Vec::new(), ops: Vec::new() }] }
    }

    /// The index a stand-in from [`Parser::lend`] stands for.
    fn lent_index(r: &Region<'_>) -> Option<usize> {
        match r.blocks.as_slice() {
            [Block { label: Some(l), args, ops }] if args.is_empty() && ops.is_empty() => l.strip_prefix(LENT)?.parse().ok(),
            _ => None,
        }
    }

    /// Reads one op with lending on: its stand-in regions (those lent since `from`) swapped back.
    pub(crate) fn lending<T>(&mut self, read: impl FnOnce(&mut Self) -> R<T>, into: impl FnOnce(T) -> Result<Operation<'a>, Error>) -> R<Operation<'a>> {
        let (from, was) = (self.lent.len(), core::mem::replace(&mut self.lending, true));
        let read = read(self);
        self.lending = was;
        let r = read.and_then(|t| into(t).or_else(|e| self.err(e.0))).map(|mut op| {
            for region in &mut op.regions {
                if let Some(i) = Self::lent_index(region).filter(|i| *i >= from) {
                    *region = core::mem::replace(&mut self.lent[i], Region { blocks: Vec::new() });
                }
            }
            op
        });
        self.lent.truncate(from);
        r
    }

    /// Parses all of `src` with `f`, no dialects registered.
    #[inline]
    pub fn read<T>(src: &'a str, f: impl FnOnce(&mut Parser<'a, '_>) -> R<T>) -> R<T> {
        Parser::new(src, &MlirOpt::new()).all(f)
    }

    /// Reads the ops of the first block on `fork`'s threads (see [`Parser::forked`]).
    #[inline]
    pub(crate) fn with_fork(mut self, fork: &'d dyn for<'x> Fork<'x>) -> Self {
        self.fork = (fork.threads() > 1).then_some(fork);
        self
    }

    /// What attribute alias `name` stands for, as text (`map` ⇒ `affine_map<(d0) -> (d0)>`).
    #[inline]
    pub fn alias(&self, name: &str) -> Option<&str> {
        self.aliases.iter().find(|(n, _)| n == name).map(|(_, v)| &**v)
    }

    /// Which alias spells `text`, if one does — the way back from an attribute an op rebuilt
    /// out of its custom form to the `#map` the module already names it by.
    #[inline]
    pub fn alias_named(&self, text: &str) -> Option<&str> {
        self.aliases.iter().find(|(_, v)| v == text).map(|(n, _)| &**n)
    }

    /// The same parser with a module's attribute aliases already in scope, for an op read on
    /// its own out of a module.
    #[must_use]
    #[inline]
    pub fn with_aliases(mut self, aliases: &[(String, String)]) -> Self {
        self.aliases = aliases.to_vec();
        self
    }

    /// The op name of a typed op's custom form: `name` itself or its short form.
    #[inline]
    pub fn op_name(&mut self, name: &str) -> R<()> {
        let id = self.ident()?;
        if id == name || name.split_once('.').is_some_and(|(_, short)| short == id) { Ok(()) } else { self.err(format!("expected `{name}`")) }
    }

    /// Runs `f` and requires it to consume the whole input.
    #[inline]
    pub fn all<T>(mut self, f: impl FnOnce(&mut Self) -> R<T>) -> R<T> {
        let v = f(&mut self).map_err(|e| e.placed(self.src))?;
        self.ws();
        if self.pos == self.src.len() { Ok(v) } else { self.err::<T>("unexpected trailing input").map_err(|e| e.placed(self.src)) }
    }

    // ---- low level -------------------------------------------------------

    #[inline]
    pub fn pos(&self) -> usize {
        self.pos
    }

    /// Rewinds (or advances) to a byte offset previously returned by [`Self::pos`].
    #[inline]
    pub fn seek(&mut self, pos: usize) {
        self.pos = pos;
    }

    #[inline]
    pub fn peek(&self) -> Option<u8> {
        self.src.as_bytes().get(self.pos).copied()
    }

    #[inline]
    fn peek_at(&self, k: usize) -> Option<u8> {
        self.src.as_bytes().get(self.pos + k).copied()
    }

    /// Unconsumed input.
    #[inline]
    pub fn rest(&self) -> &'a str {
        &self.src[self.pos..]
    }

    /// Source text between `start` and the current position.
    #[inline]
    pub fn since(&self, start: usize) -> &'a str {
        &self.src[start..self.pos]
    }

    /// An error here; its line is filled in only if it is the one the parse returns ([`all`](Self::all)).
    #[inline]
    pub fn err<T>(&self, msg: impl Into<String>) -> R<T> {
        Err(ParseError::unplaced(self.pos, msg))
    }

    /// Skips whitespace (including newlines) and `//` comments.
    pub fn ws(&mut self) {
        loop {
            match self.peek() {
                // MLIR's lexer skips a NUL byte as whitespace (`IR/zero_whitespace.mlir`).
                Some(c) if c.is_ascii_whitespace() || c == 0 => self.pos += 1,
                Some(b'/') if self.peek_at(1) == Some(b'/') => self.skip_line(),
                _ => break,
            }
        }
    }

    #[inline]
    fn skip_line(&mut self) {
        self.pos = self.rest().find('\n').map_or(self.src.len(), |i| self.pos + i);
    }

    /// Moves `n` bytes on (a token the caller measured in [`Parser::rest`]).
    #[inline]
    pub(crate) fn skip(&mut self, n: usize) {
        self.pos = (self.pos + n).min(self.src.len());
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

    #[inline]
    pub fn expect(&mut self, s: &str) -> R<()> {
        if self.eat(s) { Ok(()) } else { self.err(format!("expected `{s}`")) }
    }

    /// Assembly-format literal: keyword if it starts with a letter or `_`, else punctuation.
    #[inline]
    pub fn eat_lit(&mut self, s: &str) -> bool {
        if s.starts_with(|c: char| c.is_ascii_alphabetic() || c == '_') { self.eat_kw(s) } else { self.eat(s) }
    }

    #[inline]
    pub fn expect_lit(&mut self, s: &str) -> R<()> {
        if self.eat_lit(s) { Ok(()) } else { self.err(format!("expected `{s}`")) }
    }

    /// Is the next non-blank byte `c`?
    #[inline]
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

    #[inline]
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
    #[inline]
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
    #[inline]
    pub fn symbol(&mut self) -> R<&'a str> {
        self.expect("@")?;
        if self.peek() == Some(b'"') { self.skip_string() } else { self.nonempty("symbol", is_suffix) }
    }

    /// A symbol name `@name` / `@"name"`, unescaped.
    pub fn sym_name(&mut self) -> R<String> {
        let s = self.symbol()?;
        match s.strip_prefix('"') {
            Some(q) => Attribute::Str { lit: q[..q.len() - 1].into(), ty: None }.text().or_else(|e| self.err(e.0)),
            None => Ok(s.into()),
        }
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
    #[inline]
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

    /// `elem (, elem)* close`, assuming the opener was consumed. Read on the stack, up to four,
    /// then allocated once at its length: a `Vec` grown by pushing starts at four and doubles,
    /// and giving the rest back afterwards (`shrink_to_fit`) costs a reallocation per list.
    pub fn list<T>(&mut self, close: &str, mut f: impl FnMut(&mut Self) -> R<T>) -> R<Vec<T>> {
        if self.eat(close) {
            return Ok(Vec::new());
        }
        let mut out = smallvec::SmallVec::<[T; 4]>::new();
        loop {
            out.push(f(self)?);
            if !self.eat(",") {
                self.expect(close)?;
                return Ok(Self::exact(out));
            }
        }
    }

    /// `xs` in a `Vec` of exactly its length: one allocation when it is still inline.
    fn exact<T, const N: usize>(xs: smallvec::SmallVec<[T; N]>) -> Vec<T> {
        match xs.spilled() {
            true => {
                let mut v = xs.into_vec();
                v.shrink_to_fit();
                v
            }
            false => {
                let mut v = Vec::with_capacity(xs.len());
                v.extend(xs);
                v
            }
        }
    }

    /// `open elem (, elem)* close` if `open` follows, else empty.
    #[inline]
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

    /// Parses a region whose bare op names resolve against dialect `ns` (`func.func`'s body).
    /// Every op sets this for its own regions: plain [`Self::region`] means none.
    pub fn region_in(&mut self, ns: Option<&'static str>) -> R<Region<'a>> {
        let saved = core::mem::replace(&mut self.default_ns, ns);
        let r = self.region_body();
        self.default_ns = saved;
        r
    }

    /// Lets the owning dialect structure an extended type/attribute body.
    #[inline]
    fn extended(&mut self, kind: SymKind) -> R<Extended<'a>> {
        let name = self.sigil(kind.sigil())?;
        self.extended_body(kind, name)
    }

    /// A dialect type printed stripped (`<f32>` for `!emitc.lvalue<f32>`): ODS's `type($x)` of
    /// one dialect type.
    #[inline]
    pub fn stripped_ty(&mut self, name: &'a str) -> R<Type<'a>> {
        self.ws();
        self.extended_body(SymKind::Type, name).map(Type::Extended)
    }

    /// What follows the name `name` of a dialect type / attribute.
    fn extended_body(&mut self, kind: SymKind, name: &'a str) -> R<Extended<'a>> {
        let start = self.pos;
        // A dialect type / attribute body is angle bracketed (`#ns.name<...>`) and an alias has
        // none at all. Whatever follows belongs to the reader: `affine.apply #map(%i)` puts the
        // op's operand list right after the alias, and it is not part of the attribute.
        let body = (self.peek() == Some(b'<')).then(|| self.group()).transpose()?;
        let mut params = Vec::new();
        let opt = self.opt;
        if let (Some(_), Some(dialect)) = (body, name.split_once('.').and_then(|(ns, _)| opt.dialect(ns))) {
            let end = self.pos;
            self.pos = start;
            match dialect.parse_params(kind, name, self) {
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
            Some(b'!') => self.extended(SymKind::Type).map(|e| match &e {
                Extended { name, body: None, params } if params.is_empty() && let Some((_, t)) = self.type_aliases.iter().find(|(n, _)| *n == &**name) => t.clone(),
                _ => Type::Extended(e),
            }),
            _ => self.keyword_ty(),
        }
    }

    /// Does `id` name a scalar builtin type (`i32`, `ui8`, `f16`, `bf16`, `index`)? A bare word in
    /// an attribute position is then a type attribute (`pdl.type : i32`), not an enum case;
    /// `none` stays a word: enums use it as a case.
    #[inline]
    fn scalar_type_word(id: &str) -> bool {
        let split = id.find(|c: char| c.is_ascii_digit()).unwrap_or(id.len());
        id == "index" || FloatKind::try_from(id).is_ok() || (Signedness::try_from(&id[..split]).is_ok() && id[split..].parse::<u32>().is_ok())
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
    #[inline]
    pub fn results_ty(&mut self) -> R<Vec<Type<'a>>> {
        if self.eat("(") { self.list(")", Self::ty) } else { Ok(vec![self.ty()?]) }
    }

    // ---- attributes ------------------------------------------------------

    pub fn attr(&mut self) -> R<Attribute<'a>> {
        let bare = core::mem::take(&mut self.bare);
        self.ws();
        let Some(c) = self.peek() else { return self.err("expected attribute") };
        Ok(match c {
            b'[' => {
                self.pos += 1;
                Attribute::Array(self.list("]", Self::attr)?)
            }
            b'{' => Attribute::Dict(self.dict()?),
            b'"' => Attribute::Str { lit: self.string()?.into(), ty: self.suffix(bare)? },
            b'@' => Attribute::SymbolRef(self.symbol_ref()?),
            b'#' => Attribute::Extended { ext: self.extended(SymKind::Attr)?, ty: self.suffix(bare)? },
            b'-' | b'+' | b'0'..=b'9' => self.number_attr(bare)?,
            b'!' | b'(' => Attribute::Type(self.ty()?),
            _ => self.keyword_attr(bare)?,
        })
    }

    /// An attribute without its `: type` suffix: an assembly-format variable followed by `:`.
    pub fn bare_attr(&mut self) -> R<Attribute<'a>> {
        self.bare = true;
        let a = self.attr();
        self.bare = false;
        a
    }

    /// An attribute's optional `: type`, unless parsing a bare one.
    #[inline]
    fn suffix(&mut self, bare: bool) -> R<Option<Type<'a>>> {
        if bare { Ok(None) } else { self.opt_ty() }
    }

    fn keyword_attr(&mut self, bare: bool) -> R<Attribute<'a>> {
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
                // `affine_map<...>` / `affine_set<...>` are one group each: an `affine.apply`
                // writes its operand list right after the map, and that is not part of it.
                let body = match name {
                    "affine_map" | "affine_set" => self.group()?.into(),
                    _ => self.groups()?.unwrap_or_default().into(),
                };
                let typed = matches!(name, "dense" | "dense_resource" | "sparse" | "opaque");
                let ty = if typed { self.suffix(bare)? } else { None };
                Attribute::Builtin { name: name.into(), body, ty }
            }
            _ => {
                self.pos = start;
                Attribute::Type(self.ty()?)
            }
        })
    }

    fn number_attr(&mut self, bare: bool) -> R<Attribute<'a>> {
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
        let ty = self.suffix(bare)?;
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
    #[inline]
    /// `{...}`, or an attribute alias standing for one (`linalg.generic #trait ins(..)`).
    pub fn dict_or_alias(&mut self) -> R<Vec<NamedAttr<'a>>> {
        self.ws();
        if !self.at(b'#') {
            return self.dict();
        }
        let name = self.sigil('#')?;
        let Some(text) = self.alias(name).map(String::from) else { return self.err(format!("undefined attribute alias `#{name}`")) };
        let inner = Parser::new(&text, self.opt).with_aliases(&self.aliases);
        match inner.all(Parser::dict) {
            Ok(d) => Ok(d.into_static()),
            Err(e) => self.err(format!("`#{name}` is not a dictionary: {e}")),
        }
    }

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
                    let name: Str<'a> = self.sigil('#')?.into();
                    self.expect("=")?;
                    let value = self.attr()?;
                    self.aliases.push((String::from(&*name), alloc::format!("{value}")));
                    Item::AttrAlias { name, value }
                }
                Some(b'!') => {
                    let name = self.sigil('!')?;
                    self.expect("=")?;
                    let ty = self.ty()?;
                    self.type_aliases.push((name, ty.clone()));
                    Item::TypeAlias { name: name.into(), ty }
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
        let mut results = smallvec::SmallVec::<[ResultDef<'a>; 2]>::new();
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
        self.results = results.iter().map(|r| r.count.unwrap_or(1)).sum::<u32>().try_into().unwrap_or(0);
        let op = if self.at(b'"') { self.generic()? } else { self.custom()? };
        let mut op = Operation { results: Self::exact(results), ..op };
        op.shrink_to_fit();
        Ok(op)
    }

    /// `%name` or `%name#index`.
    pub fn value(&mut self) -> R<Value<'a>> {
        let name = self.sigil('%')?.into();
        let index = if self.peek() == Some(b'#') {
            self.pos += 1;
            Some(self.number()?)
        } else {
            None
        };
        Ok(Value { name, index })
    }

    fn generic(&mut self) -> R<Operation<'a>> {
        let name = self.string()?.into();
        self.expect("(")?;
        let operands = self.list(")", Self::value)?;
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
        Ok(Operation { name, operands, successors, properties, regions, attributes, ty, loc, ..Operation::default() })
    }

    /// A custom op: the op table's template for its name (explicit, default dialect, builtin),
    /// else raw text. A template that fails to read the text leaves it raw too.
    fn custom(&mut self) -> R<Operation<'a>> {
        let name = self.ident()?;
        let start = self.pos;
        let opt = self.opt;
        // The name as written first; the prefixed ones are spelled only when it is not an op.
        let qualified = || [self.default_ns, Some("builtin")].into_iter().flatten().filter_map(move |ns| opt.template(&format!("{ns}.{name}")));
        let written = name.contains('.').then(|| opt.template(name)).flatten();
        let templates: Vec<&Template> = match written {
            Some(t) => alloc::vec![t],
            None => qualified().collect(),
        };
        for t in templates {
            match (t.parse)(self) {
                Ok(op) => return Ok(op),
                Err(_) => self.pos = start,
            }
        }
        self.raw_custom(name)
    }

    /// Unknown custom op: raw text up to the end of the line (at bracket depth 0) or an
    /// unmatched closer; a `{` that ends its line opens a structurally parsed region.
    fn raw_custom(&mut self, name: &'a str) -> R<Operation<'a>> {
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
                // A left arrow (`omp.tile (%a, %b) <- (%loop)`), not a bracket: `<-` and a space.
                b'<' if self.peek_at(1) == Some(b'-') && self.peek_at(2).is_some_and(|c| c.is_ascii_whitespace()) => self.pos += 2,
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
        Ok(Operation { name: name.into(), raw: Some(pieces), ..Operation::default() })
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
            // A string starts a generic op only as its name, `"ns.op"(`; else it is an operand of
            // this one (`llvm.inline_asm asm_dialect = intel` and, on the next line, `"vaddps $0"`).
            b'"' => {
                let b = next.as_bytes();
                let mut i = 1;
                while i < b.len() && b[i] != b'"' {
                    i += if b[i] == b'\\' { 2 } else { 1 };
                }
                !next.get(i + 1..).is_some_and(|r| r.starts_with('('))
            }
            // `#a = ...` / `!t = ...` define an alias; any other attribute or type continues the
            // op (`spirv.module Logical Vulkan requires` and, next, `#spirv.vce<...>`).
            b'#' | b'!' => {
                let name = next[1..].bytes().position(|c| !is_id(c)).map_or(&next[1..], |n| &next[1..1 + n]);
                !next[1 + name.len()..].trim_start().strip_prefix('=').is_some_and(|r| !r.starts_with('='))
            }
            _ => !matches!(c, b'^' | b'}'),
        }
    }

    /// Does `%a, %b:2 =` (an op's result list) start at `pos`?
    fn results_ahead(&self, pos: usize) -> bool {
        let mut p = Parser { src: self.src, pos, opt: self.opt, default_ns: None, bare: false, aliases: Vec::new(), type_aliases: Vec::new(), results: 0, lent: Vec::new(), lending: false, fork: None };
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

    #[inline]
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
        let mut probe = Parser { src: self.src, pos: self.pos + 1 + line_end, opt: self.opt, default_ns: None, bare: false, aliases: Vec::new(), type_aliases: Vec::new(), results: 0, lent: Vec::new(), lending: false, fork: None };
        probe.ws();
        match probe.peek() {
            Some(b'%' | b'^' | b'}') => true,
            Some(b'"') => probe.skip_string().is_ok() && probe.at(b'('),
            _ => probe.ident().is_ok() && { probe.ws(); !matches!(probe.peek(), Some(b'=' | b',' | b'}')) },
        }
    }

    /// A region of an op that sets no default dialect.
    #[inline]
    pub fn region(&mut self) -> R<Region<'a>> {
        self.region_in(None)
    }

    fn region_body(&mut self) -> R<Region<'a>> {
        self.expect("{")?;
        let mut blocks = Vec::new();
        while !self.eat("}") {
            if self.peek().is_none() {
                return self.err("unterminated region");
            }
            blocks.push(self.block()?);
        }
        blocks.shrink_to_fit();
        Ok(Region { blocks })
    }

    /// `%name : type loc(...)?` — a block argument or function-signature entry.
    #[inline]
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
        // The block's ops are read with `fork` off: only `forked`'s runs split further, so a
        // nested block is never scanned twice.
        let fork = self.fork.take();
        let mut ops = fork.and_then(|f| self.forked(f)).unwrap_or_default();
        let read = loop {
            self.ws();
            if matches!(self.peek(), None | Some(b'}' | b'^')) {
                ops.shrink_to_fit();
                break Ok(Block { label, args, ops });
            }
            match self.op() {
                Ok(op) => ops.push(op),
                Err(e) => break Err(e),
            }
        };
        self.fork = fork;
        read
    }

    /// ⭐ The ops of the block starting here, read in runs on `fork`'s threads: the runs are cut
    /// where [`Parser::op_starts`] finds an op, each read by a parser of its own with this one's
    /// aliases. An op as big as a run is a run alone, and its parser keeps `fork`: its own
    /// blocks split again, as tasks of their own, down to blocks too small to be worth it.
    /// `None` (nothing consumed) when the block is small or a run does not read as exactly its
    /// ops; the block is then read serially, with the serial reading's errors.
    fn forked(&mut self, fork: &'d dyn for<'x> Fork<'x>) -> Option<Vec<Operation<'a>>> {
        self.ws();
        let starts = self.op_starts()?;
        let (&first, &end) = (starts.first()?, starts.last()?);
        if end - first < MlirOpt::PARALLEL_BYTES {
            return None;
        }
        // About four runs per thread, cut at op starts; an op of a run's size or more alone.
        let step = (end - first) / (fork.threads() * 4) + 1;
        let mut runs: Vec<(usize, usize, bool)> = Vec::new();
        let mut from = first;
        for w in starts.windows(2) {
            let (s, e) = (w[0], w[1]);
            if e - s >= step {
                if s > from {
                    runs.push((from, s, false));
                }
                runs.push((s, e, e - s >= MlirOpt::PARALLEL_BYTES));
                from = e;
            } else if e - from >= step || e == end {
                runs.push((from, e, false));
                from = e;
            }
        }
        let (src, opt, ns, aliases, types) = (self.src, self.opt, self.default_ns, &self.aliases, &self.type_aliases);
        let chunks: Vec<Chunk<'a, '_>> = runs
            .into_iter()
            .map(|(from, to, alone)| {
                Box::new(move || {
                    let mut p = Parser { pos: from, default_ns: ns, aliases: aliases.clone(), type_aliases: types.clone(), fork: alone.then_some(fork), ..Parser::new(src, opt) };
                    let mut ops = Vec::new();
                    loop {
                        p.ws();
                        if p.pos >= to {
                            return if p.pos == to { Ok(ops) } else { p.err("an op runs past its run") };
                        }
                        ops.push(p.op()?);
                    }
                }) as Chunk<'a, '_>
            })
            .collect();
        let runs: Vec<Vec<Operation<'a>>> = fork.fork(chunks).into_iter().collect::<R<_>>().ok()?;
        let mut ops = Vec::with_capacity(runs.iter().map(Vec::len).sum());
        runs.into_iter().for_each(|r| ops.extend(r));
        self.pos = end;
        Some(ops)
    }

    /// Where each op of the block starting here begins, then where the block ends (its `}` or
    /// the next block's `^`): a scan that follows only `()[]{}`, strings and `//` comments. An
    /// op starts a line of the block's own depth with `%`, `"` or a dotted name (`func.func`);
    /// a guess the runs check ([`Parser::forked`]). `None` if the brackets do not close.
    fn op_starts(&self) -> Option<Vec<usize>> {
        let b = self.src.as_bytes();
        let starts_op = |j: usize| match b.get(j) {
            Some(b'%' | b'"') => true,
            Some(c) if c.is_ascii_alphabetic() => {
                let word = b[j..].iter().take_while(|c| is_id(**c)).count();
                b[j..j + word].contains(&b'.')
            }
            _ => false,
        };
        let mut starts = Vec::new();
        if !starts_op(self.pos) {
            return None;
        }
        starts.push(self.pos);
        let (mut i, mut depth) = (self.pos, 0usize);
        while let Some(&c) = b.get(i) {
            match c {
                b'"' => {
                    i += 1;
                    while *b.get(i)? != b'"' {
                        i += if b[i] == b'\\' { 2 } else { 1 };
                    }
                }
                b'/' if b.get(i + 1) == Some(&b'/') => {
                    while b.get(i + 1).is_some_and(|c| *c != b'\n') {
                        i += 1;
                    }
                }
                b'(' | b'[' | b'{' => depth += 1,
                b'}' if depth == 0 => {
                    starts.push(i);
                    return Some(starts);
                }
                b')' | b']' | b'}' => depth = depth.checked_sub(1)?,
                b'\n' if depth == 0 => {
                    let j = i + 1 + b[i + 1..].iter().take_while(|c| matches!(c, b' ' | b'\t' | b'\r')).count();
                    if b.get(j) == Some(&b'^') {
                        starts.push(j);
                        return Some(starts);
                    }
                    if starts_op(j) {
                        starts.push(j);
                    }
                    i = j;
                    continue;
                }
                _ => {}
            }
            i += 1;
        }
        None
    }
}

// ---- attribute values ----------------------------------------------------------------------

impl Attribute<'_> {
    /// An integer literal's value (decimal or `0x` hex, optional sign).
    pub fn int(&self) -> Result<i128, Error> {
        let Attribute::Int { lit, .. } = self else { return Err(format!("expected an integer, found `{self}`").into()) };
        let (neg, digits) = lit.strip_prefix('-').map_or((false, lit.trim_start_matches('+')), |d| (true, d));
        let v = match digits.strip_prefix("0x") {
            Some(hex) => i128::from_str_radix(hex, 16),
            None => digits.parse(),
        }
        .map_err(|_| Error(format!("not an integer: `{lit}`")))?;
        Ok(if neg { -v } else { v })
    }

    /// A string literal's unescaped text.
    pub fn text(&self) -> Result<String, Error> {
        let Attribute::Str { lit, .. } = self else { return Err(format!("expected a string, found `{self}`").into()) };
        let (mut out, mut bytes) = (Vec::with_capacity(lit.len()), lit.bytes());
        while let Some(b) = bytes.next() {
            let byte = match (b, bytes.clone().next()) {
                (b'\\', Some(n @ (b'"' | b'\\'))) => n,
                (b'\\', Some(b'n')) => b'\n',
                (b'\\', Some(b't')) => b'\t',
                (b'\\', Some(_)) => {
                    let hex = [bytes.next(), bytes.next()];
                    let digit = |c: Option<u8>| (c.unwrap_or(b'0') as char).to_digit(16).unwrap_or(0) as u8;
                    out.push(digit(hex[0]) << 4 | digit(hex[1]));
                    continue;
                }
                (b, _) => {
                    out.push(b);
                    continue;
                }
            };
            bytes.next();
            out.push(byte);
        }
        String::from_utf8(out).map_err(|_| Error(format!("not UTF-8: `{lit}`")))
    }

    /// The type a typed attribute carries (`arith.constant`'s result).
    pub fn type_of(&self) -> Option<Type<'static>> {
        let ty = match self {
            Attribute::Bool(_) => return Some(Type::I1),
            Attribute::Int { ty, .. } | Attribute::Float { ty, .. } | Attribute::Str { ty, .. } | Attribute::Builtin { ty, .. } | Attribute::Extended { ty, .. } => ty.as_ref()?,
            _ => return None,
        };
        Some(ty.clone().into_static())
    }
}

impl<'a> Type<'a> {
    /// `i1`, or a shaped `i1` like `self` (`arith.cmpi`'s result).
    pub fn i1_like(&self) -> Type<'a> {
        match self {
            Type::Shaped(s) => Type::Shaped(Shaped { kind: s.kind, shape: s.shape.clone(), elem: Box::new(Type::I1), extras: s.extras.clone() }),
            _ => Type::I1,
        }
    }
}

// ---- deserializing out of Content ----------------------------------------------------------

impl Content {
    /// Deserializes a `T` out of it.
    #[inline]
    pub fn to<T: DeserializeOwned>(self) -> Result<T, Error> {
        T::deserialize(self)
    }

    /// A region: moved out of [`Content::Region`], else deserialized.
    pub fn into_region(self) -> Result<Region<'static>, Error> {
        match self {
            Content::Region(r) => Ok(*r),
            c => c.to(),
        }
    }

    /// Any serializable value as another type of the same shape (borrowed AST → owned AST).
    #[inline]
    pub fn convert<T: Serialize + ?Sized, U: DeserializeOwned>(value: &T) -> Result<U, Error> {
        Content::of(value)?.to()
    }
}

macro_rules! forward {
    ($($m:ident),*) => {$(
        fn $m<V: Visitor<'de>>(self, v: V) -> Result<V::Value, Error> {
            self.deserialize_any(v)
        }
    )*};
}

/// Integer requests of an attribute read its literal; everything else as usual.
macro_rules! ints {
    ($($m:ident => $visit:ident($t:ty)),* $(,)?) => {$(
        fn $m<V: Visitor<'de>>(self, v: V) -> Result<V::Value, Error> {
            match self {
                Self::Attr(a @ Attribute::Int { .. }) => v.$visit(<$t>::try_from(a.int()?).map_err(|_| Error(format!("`{a}` is out of range")))?),
                other => other.deserialize_any(v),
            }
        }
    )*};
}

impl<'de> de::Deserializer<'de> for Content {
    type Error = Error;

    fn deserialize_any<V: Visitor<'de>>(self, v: V) -> Result<V::Value, Error> {
        match self {
            Self::Bool(x) => v.visit_bool(x),
            Self::I8(x) => v.visit_i8(x),
            Self::I16(x) => v.visit_i16(x),
            Self::I32(x) => v.visit_i32(x),
            Self::I64(x) => v.visit_i64(x),
            Self::U8(x) => v.visit_u8(x),
            Self::U16(x) => v.visit_u16(x),
            Self::U32(x) => v.visit_u32(x),
            Self::U64(x) => v.visit_u64(x),
            Self::F32(x) => v.visit_f32(x),
            Self::F64(x) => v.visit_f64(x),
            Self::Char(x) => v.visit_char(x),
            Self::Str(x) => v.visit_string(x),
            Self::Bytes(x) => v.visit_byte_buf(x),
            Self::None => v.visit_none(),
            Self::Some(x) => v.visit_some(*x),
            Self::Unit | Self::UnitStruct(_) => v.visit_unit(),
            Self::Newtype(_, x) => v.visit_newtype_struct(*x),
            Self::Seq(xs) => v.visit_seq(Items(xs.into_iter())),
            Self::Map(xs) => v.visit_map(Pairs(xs.into_iter(), None)),
            Self::Struct(_, xs) => v.visit_map(Pairs(xs.into_iter(), None)),
            Self::Variant(..) => v.visit_enum(self),
            // Asked for generically, a region is its serialized form after all.
            Self::Region(r) => Self::of(&*r)?.deserialize_any(v),
            Self::Attr(a) => match a {
                Attribute::Unit => v.visit_bool(true),
                Attribute::Bool(b) => v.visit_bool(b),
                // a float's bits (`0x7FF0000000000000 : f64`: an inf or a NaN, as MLIR prints one)
                Attribute::Int { ref lit, ty: Some(Type::Float(kind)) } => v.visit_f64(crate::ApFloat::parse(kind, lit).ok_or_else(|| Error(format!("not a float: `{a}`")))?.to_f64()),
                Attribute::Int { .. } => v.visit_i64(i64::try_from(a.int()?).map_err(|_| Error(format!("`{a}` is out of range")))?),
                // MLIR's spellings of a float (its type's: an f32 reads as one), not only Rust's
                Attribute::Float { ref lit, ref ty } => {
                    let kind = match ty {
                        Some(Type::Float(k)) => *k,
                        _ => FloatKind::F64,
                    };
                    v.visit_f64(crate::ApFloat::parse(kind, lit).ok_or_else(|| Error(format!("not a float: `{lit}`")))?.to_f64())
                }
                Attribute::Str { .. } => v.visit_string(a.text()?),
                Attribute::Array(xs) => v.visit_seq(Items(xs.into_iter().map(Self::Attr).collect::<Vec<_>>().into_iter())),
                Attribute::DenseArray { ty, values } => {
                    let elem = |lit| if matches!(ty, Type::Float(_)) { Attribute::Float { lit, ty: None } } else { Attribute::Int { lit, ty: None } };
                    v.visit_seq(Items(values.into_iter().map(|lit| Self::Attr(elem(lit))).collect::<Vec<_>>().into_iter()))
                }
                other => Self::of(&other)?.deserialize_any(v),
            },
        }
    }

    ints! {
        deserialize_i8 => visit_i8(i8), deserialize_i16 => visit_i16(i16), deserialize_i32 => visit_i32(i32), deserialize_i64 => visit_i64(i64),
        deserialize_i128 => visit_i128(i128), deserialize_u8 => visit_u8(u8), deserialize_u16 => visit_u16(u16), deserialize_u32 => visit_u32(u32),
        deserialize_u64 => visit_u64(u64), deserialize_u128 => visit_u128(u128),
    }

    fn deserialize_option<V: Visitor<'de>>(self, v: V) -> Result<V::Value, Error> {
        match self {
            // `Unit`: what a self-describing format's `null` reads back as.
            Self::None | Self::Unit => v.visit_none(),
            Self::Some(x) => v.visit_some(*x),
            other => v.visit_some(other),
        }
    }

    fn deserialize_newtype_struct<V: Visitor<'de>>(self, _: &'static str, v: V) -> Result<V::Value, Error> {
        match self {
            Self::Newtype(_, x) => v.visit_newtype_struct(*x),
            other => v.visit_newtype_struct(other),
        }
    }

    fn deserialize_enum<V: Visitor<'de>>(self, name: &'static str, cases: &'static [&'static str], v: V) -> Result<V::Value, Error> {
        match (self, name) {
            (Self::Attr(Attribute::Type(t)), "Type") => Self::of(&t)?.deserialize_enum(name, cases, v),
            (Self::Attr(a), "Attribute" | "Type") => Self::of(&a)?.deserialize_enum(name, cases, v),
            // A user enum: an MLIR integer case value (= variant index) or the case name.
            (Self::Attr(a @ Attribute::Int { .. }), _) => v.visit_enum(Named(Self::U64(u64::try_from(a.int()?).map_err(|_| Error("negative enum case".into()))?))),
            (Self::Attr(a @ Attribute::Str { .. }), _) => v.visit_enum(Named(Self::Str(a.text()?))),
            (Self::Attr(Attribute::Bool(b)), _) => v.visit_enum(Named(Self::Str(if b { "true" } else { "false" }.into()))),
            // A bare name (or index) picks a unit variant: how custom syntax spells an enum keyword.
            (this @ (Self::Str(_) | Self::U32(_) | Self::U64(_)), _) => v.visit_enum(Named(this)),
            // `{variant: payload}`: an enum as a self-describing format writes it, and as
            // [`Content`]'s own `Deserialize` reads one back.
            (Self::Map(mut xs), _) if xs.len() == 1 => {
                let (k, x) = xs.remove(0);
                v.visit_enum(Tagged(k, x))
            }
            (other, _) => v.visit_enum(other),
        }
    }

    forward!(
        deserialize_bool, deserialize_f32, deserialize_f64, deserialize_char, deserialize_str, deserialize_string,
        deserialize_bytes, deserialize_byte_buf, deserialize_unit, deserialize_seq, deserialize_map,
        deserialize_ignored_any
    );

    #[inline]
    fn deserialize_unit_struct<V: Visitor<'de>>(self, _: &'static str, v: V) -> Result<V::Value, Error> {
        self.deserialize_any(v)
    }
    #[inline]
    fn deserialize_tuple<V: Visitor<'de>>(self, _: usize, v: V) -> Result<V::Value, Error> {
        self.deserialize_any(v)
    }
    #[inline]
    fn deserialize_tuple_struct<V: Visitor<'de>>(self, _: &'static str, _: usize, v: V) -> Result<V::Value, Error> {
        self.deserialize_any(v)
    }
    // ⭐ 标识符与结构体只派发它们真会收到的形状，别经 `deserialize_any`：那样每个 op 的
    // 字段 visitor 与结构体 visitor 都会把全部 `visit_*` 单态化一遍（九百个 op 乘下来）。
    // 其余形状派生的 visitor 本来也只会报 invalid type。
    fn deserialize_identifier<V: Visitor<'de>>(self, v: V) -> Result<V::Value, Error> {
        match self {
            Self::Str(x) => v.visit_string(x),
            Self::U8(x) => v.visit_u64(x.into()),
            Self::U16(x) => v.visit_u64(x.into()),
            Self::U32(x) => v.visit_u64(x.into()),
            Self::U64(x) => v.visit_u64(x),
            Self::Bytes(x) => v.visit_byte_buf(x),
            Self::Attr(a @ Attribute::Str { .. }) => v.visit_string(a.text()?),
            other => Err(de::Error::invalid_type(other.unexpected(), &v)),
        }
    }
    fn deserialize_struct<V: Visitor<'de>>(self, name: &'static str, fields: &'static [&'static str], v: V) -> Result<V::Value, Error> {
        match self {
            Self::Struct(_, xs) => v.visit_map(Pairs(xs.into_iter(), None)),
            Self::Map(xs) => v.visit_map(Pairs(xs.into_iter(), None)),
            Self::Attr(a) => Self::of(&a)?.deserialize_struct(name, fields, v),
            Self::Region(r) => Self::of(&*r)?.deserialize_struct(name, fields, v),
            other => Err(de::Error::invalid_type(other.unexpected(), &v)),
        }
    }
}

impl Content {
    /// What [`de::Error::invalid_type`] names.
    fn unexpected(&self) -> de::Unexpected<'_> {
        use de::Unexpected as U;
        match self {
            Self::Bool(x) => U::Bool(*x),
            Self::I8(_) | Self::I16(_) | Self::I32(_) | Self::I64(_) => U::Other("a signed integer"),
            Self::U8(_) | Self::U16(_) | Self::U32(_) | Self::U64(_) => U::Other("an unsigned integer"),
            Self::F32(_) | Self::F64(_) => U::Other("a float"),
            Self::Char(x) => U::Char(*x),
            Self::Str(x) => U::Str(x),
            Self::Bytes(x) => U::Bytes(x),
            Self::None | Self::Some(_) => U::Option,
            Self::Unit | Self::UnitStruct(_) => U::Unit,
            Self::Newtype(..) => U::NewtypeStruct,
            Self::Seq(_) => U::Seq,
            Self::Map(_) | Self::Struct(..) | Self::Region(_) => U::Map,
            Self::Variant(..) => U::Enum,
            Self::Attr(_) => U::Other("an attribute"),
        }
    }
}

impl IntoDeserializer<'_, Error> for Content {
    type Deserializer = Self;
    #[inline]
    fn into_deserializer(self) -> Self {
        self
    }
}

struct Items(alloc::vec::IntoIter<Content>);

impl<'de> SeqAccess<'de> for Items {
    type Error = Error;
    #[inline]
    fn next_element_seed<T: DeserializeSeed<'de>>(&mut self, seed: T) -> Result<Option<T::Value>, Error> {
        self.0.next().map(|x| seed.deserialize(x)).transpose()
    }
}

/// Map entries; `K` is the key type (`Content` for maps, field names for structs).
struct Pairs<K>(alloc::vec::IntoIter<(K, Content)>, Option<Content>);

impl<'de, K: IntoDeserializer<'de, Error>> MapAccess<'de> for Pairs<K> {
    type Error = Error;
    #[inline]
    fn next_key_seed<S: DeserializeSeed<'de>>(&mut self, seed: S) -> Result<Option<S::Value>, Error> {
        let Some((k, v)) = self.0.next() else { return Ok(None) };
        self.1 = Some(v);
        seed.deserialize(k.into_deserializer()).map(Some)
    }
    #[inline]
    fn next_value_seed<S: DeserializeSeed<'de>>(&mut self, seed: S) -> Result<S::Value, Error> {
        seed.deserialize(self.1.take().ok_or_else(|| Error("value before key".into()))?)
    }
}

impl<'de> EnumAccess<'de> for Content {
    type Error = Error;
    type Variant = Payload;
    #[inline]
    fn variant_seed<T: DeserializeSeed<'de>>(self, seed: T) -> Result<(T::Value, Payload), Error> {
        let Self::Variant(_, _, variant, payload) = self else { return Err("expected an enum".into()) };
        Ok((seed.deserialize(de::value::StrDeserializer::<Error>::new(variant))?, *payload))
    }
}

impl<'de> VariantAccess<'de> for Payload {
    type Error = Error;
    fn unit_variant(self) -> Result<(), Error> {
        match self {
            Self::Unit | Self::Newtype(Content::Unit) => Ok(()),
            _ => Err("expected a unit variant".into()),
        }
    }
    fn newtype_variant_seed<T: DeserializeSeed<'de>>(self, seed: T) -> Result<T::Value, Error> {
        match self {
            Self::Newtype(x) => seed.deserialize(x),
            // Read as newtypes by [`Content`]'s `Deserialize`, which cannot know the kind.
            Self::Unit => seed.deserialize(Content::Unit),
            Self::Tuple(xs) => seed.deserialize(Content::Seq(xs)),
            Self::Struct(xs) => seed.deserialize(Content::Struct("", xs)),
        }
    }
    fn tuple_variant<V: Visitor<'de>>(self, _: usize, v: V) -> Result<V::Value, Error> {
        match self {
            Self::Tuple(xs) | Self::Newtype(Content::Seq(xs)) => v.visit_seq(Items(xs.into_iter())),
            _ => Err("expected a tuple variant".into()),
        }
    }
    fn struct_variant<V: Visitor<'de>>(self, _: &'static [&'static str], v: V) -> Result<V::Value, Error> {
        match self {
            Self::Struct(xs) | Self::Newtype(Content::Struct(_, xs)) => v.visit_map(Pairs(xs.into_iter(), None)),
            Self::Newtype(Content::Map(xs)) => v.visit_map(Pairs(xs.into_iter(), None)),
            _ => Err("expected a struct variant".into()),
        }
    }
}

/// `{variant: payload}`.
struct Tagged(Content, Content);

impl<'de> EnumAccess<'de> for Tagged {
    type Error = Error;
    type Variant = Payload;
    #[inline]
    fn variant_seed<T: DeserializeSeed<'de>>(self, seed: T) -> Result<(T::Value, Payload), Error> {
        Ok((seed.deserialize(self.0)?, Payload::Newtype(self.1)))
    }
}

/// A unit variant picked by name or index.
struct Named(Content);

impl<'de> EnumAccess<'de> for Named {
    type Error = Error;
    type Variant = Payload;
    #[inline]
    fn variant_seed<T: DeserializeSeed<'de>>(self, seed: T) -> Result<(T::Value, Payload), Error> {
        Ok((seed.deserialize(self.0)?, Payload::Unit))
    }
}

// ---- any self-describing format into Content -----------------------------------------------

/// Reads whatever the format holds, as it holds it.
struct Capture;

macro_rules! capture {
    ($($m:ident($t:ty) => $v:ident),* $(,)?) => {$(
        fn $m<E: de::Error>(self, x: $t) -> Result<Content, E> {
            Ok(Content::$v(x.into()))
        }
    )*};
}

impl<'de> Visitor<'de> for Capture {
    type Value = Content;

    #[inline]
    fn expecting(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("any value")
    }

    capture! {
        visit_bool(bool) => Bool, visit_i8(i8) => I8, visit_i16(i16) => I16, visit_i32(i32) => I32, visit_i64(i64) => I64,
        visit_u8(u8) => U8, visit_u16(u16) => U16, visit_u32(u32) => U32, visit_u64(u64) => U64, visit_f32(f32) => F32,
        visit_f64(f64) => F64, visit_char(char) => Char, visit_str(&str) => Str, visit_string(String) => Str,
        visit_bytes(&[u8]) => Bytes, visit_byte_buf(Vec<u8>) => Bytes,
    }

    #[inline]
    fn visit_none<E: de::Error>(self) -> Result<Content, E> {
        Ok(Content::None)
    }
    #[inline]
    fn visit_unit<E: de::Error>(self) -> Result<Content, E> {
        Ok(Content::Unit)
    }
    #[inline]
    fn visit_some<D: de::Deserializer<'de>>(self, d: D) -> Result<Content, D::Error> {
        Content::deserialize(d).map(|x| Content::Some(Box::new(x)))
    }
    #[inline]
    fn visit_newtype_struct<D: de::Deserializer<'de>>(self, d: D) -> Result<Content, D::Error> {
        Content::deserialize(d)
    }
    fn visit_seq<A: SeqAccess<'de>>(self, mut a: A) -> Result<Content, A::Error> {
        let mut xs = Vec::new();
        while let Some(x) = a.next_element()? {
            xs.push(x);
        }
        Ok(Content::Seq(xs))
    }
    fn visit_map<A: MapAccess<'de>>(self, mut a: A) -> Result<Content, A::Error> {
        let mut xs = Vec::new();
        while let Some(kv) = a.next_entry()? {
            xs.push(kv);
        }
        Ok(Content::Map(xs))
    }
    /// `{variant: payload}`; the payload read as a newtype, the kind being unknown here.
    #[inline]
    fn visit_enum<A: EnumAccess<'de>>(self, a: A) -> Result<Content, A::Error> {
        let (k, v): (Content, _) = a.variant()?;
        Ok(Content::Map(vec![(k, v.newtype_variant()?)]))
    }
}

/// ⭐ Any self-describing format (JSON, …) into the data model: how a typed op deserializes
/// ([`Fields::read`]) without a visitor of its own.
impl<'de> Deserialize<'de> for Content {
    #[inline]
    fn deserialize<D: de::Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        d.deserialize_any(Capture)
    }
}

/// An op's fields as keyed by `keys`; other keys are skipped.
struct Keyed(&'static [&'static str]);

impl<'de> Visitor<'de> for Keyed {
    type Value = Fields;

    #[inline]
    fn expecting(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("an op")
    }

    fn visit_map<A: MapAccess<'de>>(self, mut a: A) -> Result<Fields, A::Error> {
        let mut xs = Vec::new();
        while let Some(k) = a.next_key::<String>()? {
            match self.0.iter().find(|key| **key == k) {
                Some(key) => xs.push((*key, a.next_value()?)),
                None => drop(a.next_value::<de::IgnoredAny>()?),
            }
        }
        Ok(Fields(xs))
    }
}

/// ⭐ An op's serialized fields, taken one by one into the struct ([`Op::from_fields`]).
pub struct Fields(Vec<(&'static str, Content)>);

impl TryFrom<Content> for Fields {
    type Error = Error;

    fn try_from(c: Content) -> Result<Self, Error> {
        match c {
            Content::Struct(_, xs) => Ok(Self(xs)),
            _ => Err("an op must be a struct".into()),
        }
    }
}

impl Fields {
    #[inline]
    fn pop(&mut self, key: &str) -> Option<Content> {
        self.0.iter().position(|(k, _)| *k == key).map(|i| self.0.swap_remove(i).1)
    }

    /// Field `key`; a missing one is an `Option`'s `None`, else an error.
    pub fn take<T: DeserializeOwned>(&mut self, key: &str) -> Result<T, Error> {
        match self.pop(key) {
            Some(c) => c.to(),
            None => Content::None.to().map_err(|_| Error(format!("missing field `{key}`"))),
        }
    }

    /// ⭐ An op's fields out of any deserializer: what `#[mlir::op]`'s `Deserialize` reads
    /// before [`Op::from_fields`] — generic in the format only, shared by every op.
    #[inline]
    pub fn read<'de, D: de::Deserializer<'de>>(d: D, name: &'static str, keys: &'static [&'static str]) -> Result<Self, D::Error> {
        d.deserialize_struct(name, keys, Keyed(keys))
    }

    /// Region field `key`, moved out when it was carried as itself.
    #[inline]
    pub fn region(&mut self, key: &str) -> Result<Region<'static>, Error> {
        self.pop(key).ok_or_else(|| Error(format!("missing field `{key}`")))?.into_region()
    }

    /// Variadic region field `key`.
    pub fn regions(&mut self, key: &str) -> Result<Vec<Region<'static>>, Error> {
        match self.pop(key) {
            Some(Content::Seq(xs)) => xs.into_iter().map(Content::into_region).collect(),
            Some(c) => c.to(),
            None => Err(format!("missing field `{key}`").into()),
        }
    }

    /// Field `key`, its default when missing.
    #[inline]
    pub fn or_default<T: DeserializeOwned + Default>(&mut self, key: &str) -> Result<T, Error> {
        self.pop(key).map_or_else(|| Ok(T::default()), Content::to)
    }
}

// ---- schemas -------------------------------------------------------------------------------

impl Schema {
    /// ⭐ `O`'s op name and fields, as `#[mlir::op]` writes them.
    #[inline]
    pub fn of<O: Op>() -> Self {
        Self { name: O::NAME, fields: O::FIELDS }
    }
}

// ---- Operation → typed op ------------------------------------------------------------------

pub(crate) const SEGMENTS: &str = "operandSegmentSizes";

/// A type variable's value: one type, or one per operand / result.
#[derive(Debug, Clone, PartialEq)]
pub(crate) enum Bound<'a> {
    One(Type<'a>),
    Many(Vec<Type<'a>>),
}

/// ⭐ What one field of an op holds, borrowed from the op (`'o`) whose text lives for `'a`: the
/// op read through a typed op's schema without building the typed op.
#[derive(Debug)]
pub(crate) enum Slot<'o, 'a> {
    /// An operand group.
    Values(&'o [Value<'a>]),
    /// A type variable's types: one per value, or the one type of a single variable. Owned only
    /// for a fixed type the op does not spell (`index` of an empty group).
    Types(Cow<'o, [Type<'a>]>),
    /// A property as the op holds it: `Unit` for a valueless one, owned only for a default
    /// filled in.
    Prop(Cow<'o, Attribute<'a>>),
    Regions(&'o [Region<'a>]),
    Successors(&'o [Str<'a>]),
    Attrs(&'o [NamedAttr<'a>]),
    Loc(Option<&'o Str<'a>>),
}

/// How a property's typed field shows its value: the custom form spells a user enum by its case
/// and a Rust number without its type.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) enum Shape {
    Case(&'static str),
    Number,
    Attr,
}

/// ⭐ An op through a schema: every field a [`Slot`] borrowed from the op, checked the way the
/// typed op would check it — an op that does not fit has no view (and stays generic).
pub(crate) struct View<'o, 'a> {
    /// `(field, its Rust type, what it holds)`; an absent property has no entry.
    pub(crate) slots: Vec<(&'static Field, Slot<'o, 'a>)>,
}

impl<'o, 'a> View<'o, 'a> {
    #[inline]
    fn slot(&self, f: &Field) -> Option<&Slot<'o, 'a>> {
        self.slots.iter().find(|(g, _)| g.name == f.name).map(|(_, s)| s)
    }

    pub(crate) fn values(&self, f: &Field) -> Result<&'o [Value<'a>], Error> {
        match self.slot(f) {
            Some(Slot::Values(vs)) => Ok(vs),
            _ => Err(format!("`{}` is not an operand group", f.name).into()),
        }
    }

    pub(crate) fn types(&self, f: &Field) -> Result<&[Type<'a>], Error> {
        match self.slot(f) {
            Some(Slot::Types(ts)) => Ok(ts),
            _ => Err(format!("`{}` is not a type variable", f.name).into()),
        }
    }

    pub(crate) fn regions(&self, f: &Field) -> Result<&'o [Region<'a>], Error> {
        match self.slot(f) {
            Some(Slot::Regions(rs)) => Ok(rs),
            _ => Err(format!("`{}` is not a region", f.name).into()),
        }
    }

    pub(crate) fn successors(&self, f: &Field) -> Result<&'o [Str<'a>], Error> {
        match self.slot(f) {
            Some(Slot::Successors(ss)) => Ok(ss),
            _ => Err(format!("`{}` is not a successor", f.name).into()),
        }
    }

    #[inline]
    pub(crate) fn attrs(&self) -> &'o [NamedAttr<'a>] {
        self.slots.iter().find_map(|(_, s)| if let Slot::Attrs(a) = s { Some(*a) } else { None }).unwrap_or(&[])
    }

    #[inline]
    pub(crate) fn loc(&self) -> Option<&'o Str<'a>> {
        self.slots.iter().find_map(|(_, s)| if let Slot::Loc(l) = s { *l } else { None })
    }

    /// ⭐ A property as the custom form shows it — `None`: absent — with what its typed field
    /// made of it. An `Attribute` field is borrowed as it is (an integer of a declared type
    /// retyped); a field of another Rust type goes through that type, and only this field does.
    pub(crate) fn shown(&self, f: &Field) -> Result<(Option<Cow<'_, Attribute<'a>>>, Shape), Error> {
        let Some((g, Slot::Prop(a))) = self.slots.iter().find(|(g, _)| g.name == f.name) else { return Ok((None, Shape::Attr)) };
        match g.ty {
            FieldType::Attr { .. } => Ok((Some(match (&**a, f.role) {
                (Attribute::Int { lit, ty }, Role::Prop { int: Some(t), .. }) if let want = Type::try_from(t).ok() && *ty != want => Cow::Owned(Attribute::Int { lit: lit.clone(), ty: want }),
                (Attribute::Float { lit, ty }, Role::Prop { int: Some(t), .. }) if let want = Type::try_from(t).ok() && *ty != want => Cow::Owned(Attribute::Float { lit: lit.clone(), ty: want }),
                _ => Cow::Borrowed(&**a),
            }), Shape::Attr)),
            FieldType::Typed(through) => {
                let c = through(Content::Attr((**a).clone().into_static()))?;
                let shape = match c.looked_through() {
                    Content::Variant(e, _, case, _) if !matches!(*e, "Attribute" | "Type") => Shape::Case(case),
                    Content::I8(_) | Content::I16(_) | Content::I32(_) | Content::I64(_) | Content::U8(_) | Content::U16(_) | Content::U32(_) | Content::U64(_) | Content::F32(_) | Content::F64(_) => Shape::Number,
                    _ => Shape::Attr,
                };
                Ok((f.attr(c)?.map(Cow::Owned), shape))
            }
        }
    }

    /// The property as the custom form shows it, `None` when absent or its default.
    #[inline]
    pub(crate) fn prop(&self, f: &Field) -> Result<Option<Cow<'_, Attribute<'a>>>, Error> {
        let (a, _) = self.shown(f)?;
        Ok(a.filter(|a| Some(&**a) != f.default_attr().as_ref()))
    }

    /// The struct's [`Content`]: what the typed op deserializes. Text is copied here, regions
    /// cloned — the price of a typed op, which owns its fields.
    pub(crate) fn content(&self, name: &'static str) -> Result<Content, Error> {
        let mut fields = Vec::with_capacity(self.slots.len());
        for (f, s) in &self.slots {
            let c = match s {
                Slot::Values(vs) if f.variadic => Content::of(vs)?,
                Slot::Values(vs) => Content::of(&vs[0])?,
                Slot::Types(ts) if f.variadic => Content::of(&**ts)?,
                Slot::Types(ts) => Content::of(&ts[0])?,
                Slot::Prop(a) => Content::Attr((**a).clone().into_static()),
                Slot::Regions(rs) if f.variadic => Content::regions(rs.to_vec()),
                Slot::Regions(rs) => Content::region(rs[0].clone()),
                Slot::Successors(ss) if f.variadic => Content::of(ss)?,
                Slot::Successors(ss) => Content::of(&ss[0])?,
                Slot::Attrs(a) => Content::of(a)?,
                Slot::Loc(l) => Content::of(l)?,
            };
            fields.push((f.name, c));
        }
        Ok(Content::Struct(name, fields))
    }
}

impl Content {
    /// An `Option`'s `Some` (or a newtype) looked through.
    pub(crate) fn looked_through(&self) -> &Content {
        match self {
            Self::Some(x) | Self::Newtype(_, x) => x.looked_through(),
            c => c,
        }
    }
}

impl<'a> Operation<'a> {
    /// ⭐ This op as the typed op `O`; an error if it does not fit (it then stays generic).
    #[inline]
    pub fn to_op<O: Op>(&self) -> Result<O, Error> {
        let schema = Schema::of::<O>();
        O::from_content(self.view(&schema)?.content(schema.name)?)
    }

    /// ⭐ This op through `schema`, every field borrowed: an error if it does not fit, the way
    /// the typed op would not.
    pub(crate) fn view<'o>(&'o self, schema: &Schema) -> Result<View<'o, 'a>, Error> {
        if self.name != schema.name || self.raw.is_some() {
            return Err(format!("`{}` is not `{}`", self.name, schema.name).into());
        }
        let mut props: Vec<&'o NamedAttr<'a>> = match &self.properties {
            None => Vec::new(),
            Some(Attribute::Dict(ps)) => ps.iter().collect(),
            Some(other) => return Err(format!("properties must be a dictionary, found `{other}`").into()),
        };
        let groups: Vec<&'static Field> = schema.of_role(|r| matches!(r, Role::Operand { .. })).collect();
        let sizes: Vec<usize> = match props.iter().position(|p| p.name == SEGMENTS) {
            Some(i) => match &props.remove(i).value {
                Some(Attribute::DenseArray { values, .. }) => values.iter().map(|v| v.parse().map_err(|_| Error("bad segment size".into()))).collect::<Result<_, _>>()?,
                _ => return Err("bad operandSegmentSizes".into()),
            },
            None => {
                let singles = groups.iter().filter(|f| !f.variadic).count();
                let rest = self.operands.len().checked_sub(singles).ok_or_else(|| Error("too few operands".into()))?;
                match groups.iter().filter(|f| f.variadic).count() {
                    0 if rest > 0 => return Err("too many operands".into()),
                    0 | 1 => groups.iter().map(|f| if f.variadic { rest } else { 1 }).collect(),
                    _ => return Err("several variadic operand groups need operandSegmentSizes".into()),
                }
            }
        };
        if sizes.len() != groups.len() || sizes.iter().sum::<usize>() != self.operands.len() || self.ty.inputs.len() != self.operands.len() {
            return Err("operands do not match the op's operand groups".into());
        }
        let mut slots: Vec<(&'static Field, Slot<'o, 'a>)> = Vec::with_capacity(schema.fields.len());
        // Each type variable's types, borrowed from the operands' and results' types.
        let mut bound: Vec<(&'static str, &'o [Type<'a>])> = Vec::new();
        let mut bind = |name: &'static str, ts: &'o [Type<'a>]| -> Result<(), Error> {
            match bound.iter().find(|(n, _)| *n == name) {
                Some((_, old)) if *old != ts => Err(format!("type variable `{name}` bound twice to different types").into()),
                Some(_) => Ok(()),
                None => Ok(bound.push((name, ts))),
            }
        };
        let mut at = 0;
        for (f, &n) in groups.iter().zip(&sizes) {
            let Role::Operand { ty } = f.role else { continue };
            let (ops, tys) = (&self.operands[at..at + n], &self.ty.inputs[at..at + n]);
            at += n;
            if !f.variadic && n != 1 {
                return Err(format!("`{}` takes exactly one operand", f.name).into());
            }
            slots.push((*f, Slot::Values(ops)));
            let var = schema.field(ty).ok_or_else(|| Error(format!("no type variable `{ty}`")))?;
            if var.variadic {
                bind(var.name, tys)?;
            } else {
                tys.chunks(1).try_for_each(|t| bind(var.name, t))?;
            }
        }
        let mut results: Vec<&Field> = schema.of_role(|r| matches!(r, Role::Type { result: Some(_), .. })).collect();
        results.sort_by_key(|f| match f.role {
            Role::Type { result, .. } => result,
            _ => None,
        });
        let rest = self.ty.results.len().checked_sub(results.iter().filter(|f| !f.variadic).count()).ok_or_else(|| Error("too few results".into()))?;
        let mut at = 0;
        for f in results {
            let n = if f.variadic { rest } else { 1 };
            bind(f.name, &self.ty.results[at..at + n])?;
            at += n;
        }
        if at != self.ty.results.len() {
            return Err("too many results".into());
        }
        for f in schema.of_role(|r| matches!(r, Role::Type { .. })) {
            let ts = match bound.iter().find(|(n, _)| *n == f.name) {
                Some((_, ts)) => Cow::Borrowed(*ts),
                // A variadic variable of an empty variadic group: no types.
                None if f.variadic => Cow::Borrowed(&[][..]),
                // A fixed type whose only operand groups are empty.
                None if let Role::Type { infer: Some(Infer::Is(ty)), .. } = f.role => Cow::Owned(vec![Type::try_from(ty).map_err(|e| Error(e.msg))?.owned()]),
                _ => return Err(format!("type variable `{}` is not determined", f.name).into()),
            };
            slots.push((f, Slot::Types(ts)));
        }
        for f in schema.of_role(|r| matches!(r, Role::Prop { .. })) {
            let ty = f.ty;
            let a = match props.iter().position(|p| p.name == f.name) {
                Some(i) => Some(props.remove(i).value.as_ref().map_or(Cow::Owned(Attribute::Unit), Cow::Borrowed)),
                None => f.default_attr().map(Cow::Owned),
            };
            match (a, ty) {
                (Some(a), _) => slots.push((f, Slot::Prop(a))),
                // Absent: fine for an `Option` (and a unit attribute's `bool`), not for a
                // required field.
                (None, FieldType::Attr { required: true }) => return Err(format!("`{}` needs `{}`", schema.name, f.name).into()),
                (None, FieldType::Typed(through)) if !matches!(f.role, Role::Prop { unit: true, .. }) => {
                    through(Content::None).map_err(|_| Error(format!("`{}` needs `{}`", schema.name, f.name)))?;
                }
                (None, _) => {}
            }
        }
        if let Some(p) = props.first() {
            return Err(format!("`{}` has no property `{}`", schema.name, p.name).into());
        }
        let mut at = 0;
        for f in schema.of_role(|r| *r == Role::Region) {
            let n = if f.variadic { self.regions.len().saturating_sub(at) } else { 1 };
            let rs = self.regions.get(at..at + n).ok_or_else(|| Error("too few regions".into()))?;
            at += n;
            slots.push((f, Slot::Regions(rs)));
        }
        if at < self.regions.len() {
            return Err("too many regions".into());
        }
        let succ: Vec<&Field> = schema.of_role(|r| *r == Role::Successor).collect();
        let rest = self.successors.len().checked_sub(succ.iter().filter(|f| !f.variadic).count()).ok_or_else(|| Error("too few successors".into()))?;
        if rest > 0 && !succ.iter().any(|f| f.variadic) {
            return Err("too many successors".into());
        }
        let mut at = 0;
        for f in succ {
            let n = if f.variadic { rest } else { 1 };
            let ss = self.successors.get(at..at + n).ok_or_else(|| Error("too few successors".into()))?;
            at += n;
            slots.push((f, Slot::Successors(ss)));
        }
        match schema.of_role(|r| *r == Role::Attrs).next() {
            Some(f) => slots.push((f, Slot::Attrs(&self.attributes))),
            None if !self.attributes.is_empty() => return Err("discardable attributes on an op without an attribute dictionary".into()),
            None => {}
        }
        if let Some(f) = schema.of_role(|r| *r == Role::Loc).next() {
            slots.push((f, Slot::Loc(self.loc.as_ref())));
        }
        Ok(View { slots })
    }
}

// ---- reading the custom form ---------------------------------------------------------------

/// A field read off the text. What [`Format::to_operation`] puts straight into the op stays as
/// read, borrowing the text; only a typed op ([`Format::finish`]) or a typed property makes it
/// a [`Content`], and only then is it copied.
enum Got<'a> {
    Attr(Attribute<'a>),
    /// A successor label without its `^`.
    Str(Str<'a>),
    /// The discardable attributes.
    Attrs(Vec<NamedAttr<'a>>),
    Other(Content),
}

impl From<Content> for Got<'_> {
    #[inline]
    fn from(c: Content) -> Self {
        match c {
            Content::Attr(a) => Got::Attr(a),
            c => Got::Other(c),
        }
    }
}

impl<'a> From<Attribute<'a>> for Got<'a> {
    #[inline]
    fn from(a: Attribute<'a>) -> Self {
        Got::Attr(a)
    }
}

impl TryFrom<Got<'_>> for Content {
    type Error = Error;

    fn try_from(g: Got<'_>) -> Result<Content, Error> {
        Ok(match g {
            Got::Attr(a) => Content::Attr(a.into_static()),
            Got::Str(s) => Content::Str(s.into_owned()),
            Got::Attrs(v) => Content::of(&v)?,
            Got::Other(c) => c,
        })
    }
}

/// Fields read so far.
#[derive(Default)]
struct Slots<'a> {
    fields: Vec<(&'static str, Got<'a>)>,
    /// Operand groups read: (name, values), as written.
    values: Vec<(&'static str, Vec<Value<'a>>)>,
    /// Type variables bound by the text: (name, types).
    types: Vec<(&'static str, Vec<Type<'a>>)>,
}

impl<'a> Slots<'a> {
    #[inline]
    fn set(&mut self, f: &Field, v: impl Into<Got<'a>>) {
        self.fields.push((f.name, v.into()));
    }

    #[inline]
    fn bind(&mut self, name: &'static str, ts: Vec<Type<'a>>) {
        self.types.push((name, ts));
    }

    #[inline]
    fn bound(&self, name: &str) -> Option<&[Type<'a>]> {
        self.types.iter().rev().find(|(n, _)| *n == name).map(|(_, t)| &**t)
    }

    #[inline]
    fn set_values(&mut self, f: &Field, vs: Vec<Value<'a>>) {
        self.values.push((f.name, vs));
    }

    #[inline]
    fn values(&self, name: &str) -> Option<&[Value<'a>]> {
        self.values.iter().find(|(k, _)| *k == name).map(|(_, v)| v.as_slice())
    }

    #[inline]
    fn get(&self, f: &Field) -> Option<&Got<'a>> {
        self.fields.iter().find(|(k, _)| *k == f.name).map(|(_, v)| v)
    }

    #[inline]
    fn get_mut(&mut self, f: &Field) -> Option<&mut Got<'a>> {
        self.fields.iter_mut().find(|(k, _)| *k == f.name).map(|(_, v)| v)
    }
}

/// `ShapedType::kDynamic`: the item is in the value list, not the integer list.
pub(crate) const SENTINEL: &str = "-9223372036854775808";

/// The label of a lent region's stand-in ([`Parser::lend`]): a NUL, which no source label holds.
const LENT: &str = "\0lent";

/// Words that start an attribute, not a user enum case.
const ATTR_WORDS: &[&str] = &["true", "false", "unit", "dense", "dense_resource", "array", "affine_map", "affine_set", "sparse", "strided", "distinct", "opaque", "loc"];

impl Format<'_> {
    /// ⭐ Parses the custom form after the op name into `O`.
    pub fn parse<O: Op>(&self, p: &mut Parser<'_, '_>) -> R<O> {
        // Taken before the body: an op inside a region resets it.
        let results = p.results;
        let mut r = Slots::default();
        self.read(&self.elems, &mut r, p)?;
        let loc = p.opt_loc()?;
        self.finish(r, loc, results).and_then(O::from_content).or_else(|e| p.err(e.0))
    }

    /// ⭐ Parses the custom form after the op name straight into an [`Operation`]
    /// ([`Format::to_operation`]): what [`Format::parse`] then `Operation::of_owned_op` give.
    pub fn parse_op<'a>(&self, p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        let results = p.results;
        let mut r = Slots::default();
        self.read(&self.elems, &mut r, p)?;
        let loc = p.opt_loc()?;
        self.to_operation(r, loc, results).or_else(|e| p.err(e.0))
    }

    fn read<'a>(&self, elems: &[Elem<'_>], r: &mut Slots<'a>, p: &mut Parser<'a, '_>) -> R<()> {
        let field = |p: &Parser<'a, '_>, n: &str| self.field(n).copied().or_else(|e| p.err(e.0));
        let ty_var = |p: &Parser<'a, '_>, n: &str| self.type_var(n).copied().or_else(|e| p.err(e.0));
        for (i, e) in elems.iter().enumerate() {
            match e {
                Elem::Lit(l) if l.trim().is_empty() => {}
                Elem::Lit(l) => p.expect_lit(l)?,
                Elem::Group { anchor, elems } => {
                    if self.group_ahead(elems, p).or_else(|e| p.err(e.0))? {
                        self.read(elems, r, p)?;
                    } else {
                        self.absent(anchor, elems, r, p)?;
                    }
                }
                // Clauses in any order, each at most once; the ones not written are absent.
                Elem::OiList(clauses) => {
                    let mut read = alloc::vec![false; clauses.len()];
                    loop {
                        let mut next = None;
                        for (k, c) in clauses.iter().enumerate() {
                            if let Elem::Group { elems, .. } = c
                                && !read[k]
                                && self.group_ahead(elems, p).or_else(|e| p.err(e.0))?
                            {
                                next = Some((k, elems));
                                break;
                            }
                        }
                        let Some((k, elems)) = next else { break };
                        read[k] = true;
                        self.read(elems, r, p)?;
                    }
                    for (c, _) in clauses.iter().zip(&read).filter(|(_, done)| !**done) {
                        if let Elem::Group { anchor, elems } = c {
                            self.absent(anchor, elems, r, p)?;
                        }
                    }
                }
                Elem::Var(n) => {
                    let f = field(p, n)?;
                    let c = match f.role {
                        Role::Operand { .. } if f.variadic => {
                            // Followed by a `,` literal, the group is an ODS `Optional`: one operand
                            // at most (`arm_sme.tile_load`'s `$padding `,` $mask`). A variadic list
                            // there could not be read upstream either: its parser is greedy.
                            let one = matches!(elems.get(i + 1), Some(Elem::Lit(",")));
                            let mut vs = Vec::new();
                            while p.at(b'%') {
                                vs.push(p.value()?);
                                if one {
                                    break;
                                }
                                if !p.rest().trim_start().strip_prefix(',').is_some_and(|r| r.trim_start().starts_with('%')) {
                                    break;
                                }
                                p.expect(",")?;
                            }
                            r.set_values(&f, vs);
                            continue;
                        }
                        Role::Operand { .. } => {
                            let v = p.value()?;
                            r.set_values(&f, alloc::vec![v]);
                            continue;
                        }
                        Role::Type { .. } => {
                            let ts = self.types(&f, p)?;
                            r.bind(f.name, ts);
                            continue;
                        }
                        Role::Prop { unit: true, .. } => Got::Attr(Attribute::Unit),
                        Role::Prop { bits: Some(_), int, .. } => {
                            let Some(e) = f.bit_enum() else { return p.err("a bad bit enum") };
                            p.ws();
                            if !e.mnemonic.is_empty() {
                                p.expect(e.mnemonic)?;
                                p.expect("<")?;
                            }
                            let mut value = 0;
                            loop {
                                p.ws();
                                let word = p.ident()?;
                                value |= e.value(word).map_or_else(|| p.err(format!("`{word}` is not a case")), Ok)?;
                                if !p.eat(e.sep.trim()) {
                                    break;
                                }
                            }
                            if !e.mnemonic.is_empty() {
                                p.expect(">")?;
                            }
                            Got::Attr(Attribute::Int { lit: Str::Owned(format!("{value}")), ty: int.and_then(|t| Type::try_from(t).ok()) })
                        }
                        Role::Prop { symbol: true, .. } => {
                            p.ws();
                            Got::Attr(Attribute::str(&p.sym_name()?))
                        }
                        // An alias (`#di_label`) stands for the whole attribute.
                        Role::Prop { dialect: Some(_), .. } if { p.ws(); p.at(b'#') } => {
                            Got::Attr(p.attr()?)
                        }
                        Role::Prop { dialect: Some(_), .. } if let Some((ns, m)) = f.keyword_dialect() => {
                            p.ws();
                            let body = Some(Cow::Owned(format!("<{m} {}>", p.ident()?)));
                            Got::Attr(Attribute::Extended { ext: Extended { name: Cow::Borrowed(ns), body, params: Vec::new() }, ty: None })
                        }
                        Role::Prop { dialect: Some(d), .. } => {
                            p.ws();
                            let body = Some(Cow::Owned(p.group()?.into()));
                            Got::Attr(Attribute::Extended { ext: Extended { name: Cow::Borrowed(d), body, params: Vec::new() }, ty: None })
                        }
                        Role::Prop { .. } => {
                            // A bare keyword is a user enum case; anything else is an attribute.
                            let save = p.pos();
                            match p.ident() {
                                Ok(word) if !ATTR_WORDS.contains(&word) && !p.rest().starts_with(['<', '(', '[']) && !Parser::scalar_type_word(word) => Got::Other(Content::Str(word.into())),
                                _ => {
                                    p.seek(save);
                                    let a = if self.before_colon(n) || matches!(f.role, Role::Prop { int: Some(_), .. }) { p.bare_attr()? } else { p.attr()? };
                                    // A dense array printed as a bare list: put its type back.
                                    let a = match (f.dense_ty(), a) {
                                        (Some(ty), Attribute::Array(xs)) => Attribute::DenseArray { ty, values: xs.into_iter().map(|x| Str::Owned(format!("{}", x.untyped()))).collect() },
                                        // An integer of a declared width: so is its type.
                                        (_, Attribute::Int { lit, ty: None }) if let Role::Prop { int: Some(t), .. } = f.role => Attribute::Int { lit, ty: Type::try_from(t).ok() },
                                        (_, Attribute::Float { lit, ty: None }) if let Role::Prop { int: Some(t), .. } = f.role => Attribute::Float { lit, ty: Type::try_from(t).ok() },
                                        (_, a) => a,
                                    };
                                    Got::Attr(a)
                                }
                            }
                        }
                        Role::Successor => Got::Str(Cow::Borrowed(p.sigil('^')?)),
                        // `$regions` of a variadic region: `{..}, {..}`, maybe none (`scf.reduce`).
                        Role::Region if f.variadic => {
                            let mut rs = Vec::new();
                            while { p.ws(); p.at(b'{') } {
                                let region = p.region()?;
                            rs.push(p.lend(region));
                                if !p.eat(",") {
                                    break;
                                }
                            }
                            Content::regions(rs).into()
                        }
                        Role::Region => {
                            let region = p.region()?;
                            Content::region(p.lend(region)).into()
                        }
                        Role::Attrs | Role::Loc => continue,
                    };
                    r.set(&f, c);
                }
                Elem::Custom { parts, .. } => self.read(parts, r, p)?,
                // One list, two fields: a static item goes to `integers`, a `%value` goes to
                // `values` and leaves the sentinel behind in its place.
                Elem::Zip { integers, values } => {
                    let (ints, vals) = (field(p, integers)?, field(p, values)?);
                    let (mut statics, mut ops, mut types) = (Vec::new(), Vec::new(), Vec::new());
                    while !p.at(b']') && !p.at(b')') {
                        if p.at(b'%') {
                            ops.push(p.value()?);
                            statics.push(Str::Borrowed(SENTINEL));
                            types.push(if p.eat(":") { p.ty()? } else { Type::Index });
                        } else {
                            let lit = p.nonempty("a list item", |c| c.is_ascii_digit() || c == b'-')?;
                            statics.push(Str::Owned(String::from(lit)));
                        }
                        if !p.eat(",") {
                            break;
                        }
                    }
                    let ty = Type::Integer { signedness: Signedness::Signless, width: 64 };
                    r.set(&ints, Attribute::DenseArray { ty, values: statics });
                    r.set_values(&vals, ops);
                    if let Role::Operand { ty } = vals.role
                        && let Ok(t) = self.field(ty)
                        && t.variadic
                    {
                        r.bind(t.name, types);
                    }
                }
                Elem::TypeOf(n, qualified) => {
                    let var = ty_var(p, n)?;
                    let one = |p: &mut Parser<'a, '_>| match var.role {
                        Role::Type { strip: Some(d), .. } if !*qualified && { p.ws(); p.at(b'<') } => p.stripped_ty(d).map(|t| vec![t]),
                        _ => self.types(&var, p),
                    };
                    let ts = one(p)?;
                    // `type($indices)` of a variadic group sharing one type variable: a type per
                    // operand (`i32, i32`), all of them the one type.
                    for _ in 1..self.shared_count(n, &var, |f| r.values(f.name).map_or(0, <[_]>::len)) {
                        p.expect(",")?;
                        if one(p)? != ts {
                            return p.err(format!("`type(${n})`: the types differ"));
                        }
                    }
                    r.bind(var.name, ts);
                }
                Elem::FnType(a, b) => {
                    let (a, b) = (ty_var(p, a)?, ty_var(p, b)?);
                    let ty = p.fn_ty()?;
                    r.bind(a.name, ty.inputs);
                    r.bind(b.name, ty.results);
                }
                Elem::AttrDict(keyword) => {
                    let spelled = self.spelled();
                    let mut rest = Vec::new();
                    let dict = match keyword {
                        true if p.eat_kw("attributes") => p.dict()?,
                        true => Vec::new(),
                        false => p.opt_dict()?,
                    };
                    for a in dict {
                        match self.schema.field(&a.name).filter(|f| matches!(f.role, Role::Prop { .. }) && !spelled.contains(&f.name)) {
                            Some(&f) => r.set(&f, a.value.unwrap_or(Attribute::Unit)),
                            None => rest.push(a),
                        }
                    }
                    match self.schema.of_role(|r| *r == Role::Attrs).next() {
                        Some(&f) => r.set(&f, Got::Attrs(rest)),
                        None if !rest.is_empty() => return p.err("this op takes no discardable attributes"),
                        None => {}
                    }
                }
            }
        }
        Ok(())
    }

    /// Types for a type variable: one, or a comma-separated list (maybe empty) for a variadic one.
    fn types<'a>(&self, f: &Field, p: &mut Parser<'a, '_>) -> R<Vec<Type<'a>>> {
        let save = p.pos();
        let mut ts = match p.ty() {
            Ok(t) => vec![t],
            Err(_) if f.variadic => {
                p.seek(save);
                return Ok(Vec::new());
            }
            Err(e) => return Err(e),
        };
        while f.variadic && p.eat(",") {
            ts.push(p.ty()?);
        }
        Ok(ts)
    }

    /// An absent group: its anchor, and the anchors of the groups nested in it, are left empty —
    /// once, since an operand and its type may sit in two groups
    /// (`(`,` $v^)? … (`,` type($v)^)?`), both absent; an anchored region is an empty region.
    fn absent<'a>(&self, anchor: &str, elems: &[Elem<'_>], r: &mut Slots<'a>, p: &mut Parser<'a, '_>) -> R<()> {
        // Every variadic operand the group spells is empty, not only its anchor
        // (`arm_sme.tile_load`'s `(`,` $padding `,` $mask^)?`: `padding` too).
        let vars = elems.iter().filter_map(|e| if let Elem::Var(n) = e { Some(*n) } else { None });
        for name in core::iter::once(anchor).chain(vars) {
            if let Ok(f) = self.field(name)
                && let Role::Operand { ty } = f.role
                && f.variadic
            {
                if r.values(f.name).is_none() {
                    r.set_values(f, Vec::new());
                }
                if let Ok(t) = self.field(ty)
                    && t.variadic
                    && r.bound(t.name).is_none()
                {
                    r.bind(t.name, Vec::new());
                }
            } else if name == anchor
                && let Ok(f) = self.field(anchor)
                && f.role == Role::Region
                && r.get(f).is_none()
            {
                r.set(f, Content::region(Region { blocks: Vec::new() }));
            }
        }
        for e in elems {
            match e {
                Elem::Group { anchor, elems } => self.absent(anchor, elems, r, p)?,
                Elem::OiList(clauses) => self.absent(anchor, clauses, r, p)?,
                _ => {}
            }
        }
        Ok(())
    }

    /// Does an optional group start here? Decided by its first element.
    fn group_ahead(&self, elems: &[Elem<'_>], p: &mut Parser<'_, '_>) -> Result<bool, Error> {
        let save = p.pos();
        // An empty literal only suppresses a space; it is not syntax, so it cannot decide a group.
        let hit = match elems.iter().find(|e| !matches!(e, Elem::Lit(l) if l.trim().is_empty())) {
            Some(Elem::Lit(l)) => p.eat_lit(l),
            Some(Elem::Var(n)) => match self.field(n)?.role {
                Role::Prop { bits: Some(_), .. } => self.field(n)?.bit_enum().is_some_and(|e| {
                    p.ws();
                    if e.mnemonic.is_empty() { p.ident().is_ok_and(|w| e.value(w).is_some()) } else { p.rest().starts_with(e.mnemonic) }
                }),
                Role::Operand { .. } => p.at(b'%'),
                Role::Successor => p.at(b'^'),
                Role::Region => p.at(b'{'),
                Role::Prop { symbol: true, .. } => p.at(b'@'),
                Role::Prop { dialect: Some(d), .. } if d.contains('<') => p.at(b'#') || p.ident().is_ok_and(|w| !self.literal(w)),
                Role::Prop { dialect: Some(_), .. } => p.at(b'<') || p.at(b'#'),
                // An enum keyword: any word the format does not spell as a literal; or an array
                // attribute (`($targets^)?` ⇒ `[#nvvm.target]`).
                Role::Prop { int: None, .. } if p.at(b'[') => true,
                Role::Prop { .. } => p.ident().is_ok_and(|w| !self.literal(w) && !(w == "attributes" && self.keyword_dict())),
                _ => false,
            },
            _ => false,
        };
        p.seek(save);
        Ok(hit)
    }

    /// How many values variadic type variable `f` types: its results (those the other result
    /// variables leave), or its operand group as read.
    fn arity(&self, f: &Field, r: &Slots<'_>, results: usize) -> usize {
        if let Role::Type { result: Some(_), .. } = f.role {
            let fixed = self.schema.of_role(|x| matches!(x, Role::Type { result: Some(_), .. })).filter(|g| !g.variadic).count();
            return results.saturating_sub(fixed);
        }
        let group = self.schema.of_role(|x| matches!(x, Role::Operand { ty } if *ty == f.name)).next();
        group.and_then(|g| r.values(g.name)).map_or(1, <[_]>::len)
    }

    /// Fills property defaults; every type variable's types, as the text bound them or as
    /// inferred.
    fn complete<'a>(&self, r: &mut Slots<'a>, results: usize) -> Result<Vec<(&'static str, Vec<Type<'a>>)>, Error> {
        let mut types = Vec::new();
        for f in self.schema.of_role(|r| matches!(r, Role::Prop { .. })) {
            if r.get(f).is_none()
                && let Some(d) = f.default_attr()
            {
                r.set(f, d);
            }
        }
        for f in self.schema.of_role(|r| matches!(r, Role::Type { .. })) {
            let undetermined = || Error(format!("type variable `{}` is not determined", f.name));
            let ts: Vec<Type<'a>> = match (r.bound(f.name), f.role) {
                // Moved out below, once no other variable can still read it.
                (Some(_), _) => {
                    types.push((f, None));
                    continue;
                }
                (None, Role::Type { infer: Some(Infer::I1), .. }) => vec![Type::I1],
                // One per operand of a variadic group (none for an absent optional one: `arm_sme.tile_load`'s mask).
                (None, Role::Type { infer: Some(Infer::I1Like(var)), .. }) => vec![r.bound(var).and_then(|t| t.first()).ok_or_else(undetermined)?.i1_like(); if f.variadic { self.arity(f, &r, results) } else { 1 }],
                (None, Role::Type { infer: Some(Infer::ElemOf(var)), .. }) => {
                    let elem: Type<'a> = match r.bound(var).and_then(|t| t.first()) {
                        Some(Type::Complex(elem) | Type::Shaped(Shaped { elem, .. })) => (**elem).clone(),
                        Some(Type::Extended(ext)) => ext.shaped_elem().ok_or_else(undetermined)?,
                        _ => return Err(undetermined()),
                    };
                    // A variadic variable has one type per value (`tensor.from_elements`'s
                    // operands, `vector.to_elements`'s results).
                    vec![elem; if f.variadic { self.arity(f, &r, results) } else { 1 }]
                }
                (None, Role::Type { infer: Some(Infer::Width(var)), .. }) => match r.bound(var).and_then(|t| t.first()) {
                    Some(Type::Shaped(Shaped { shape: Some(shape), .. })) => match shape.first() {
                        Some(Dim::Static(n)) => vec![Type::int(u32::try_from(*n).map_err(|_| undetermined())?)],
                        _ => return Err(undetermined()),
                    },
                    _ => return Err(undetermined()),
                },
                (None, Role::Type { infer: Some(Infer::Svbool(var)), .. }) => match r.bound(var).and_then(|t| t.first()) {
                    Some(Type::Shaped(sh @ Shaped { shape: Some(shape), .. })) if let Some((last, outer)) = shape.split_last() => {
                        let last = match last {
                            Dim::Scalable(_) => Dim::Scalable(16),
                            _ => Dim::Static(16),
                        };
                        let shape = outer.iter().cloned().chain([last]).collect();
                        vec![Type::Shaped(Shaped { shape: Some(shape), ..sh.clone() })]
                    }
                    _ => return Err(undetermined()),
                },
                (None, Role::Type { infer: Some(Infer::OuterTile(var)), .. }) => match r.bound(var).and_then(|t| t.first()) {
                    Some(Type::Shaped(sh @ Shaped { shape: Some(shape), .. })) if let Some(Dim::Scalable(n) | Dim::Static(n)) = shape.first() => {
                        vec![Type::Shaped(Shaped { shape: Some(alloc::vec![Dim::Scalable(*n), Dim::Scalable(*n)]), ..sh.clone() })]
                    }
                    _ => return Err(undetermined()),
                },
                (None, Role::Type { infer: Some(Infer::Is(ty)), .. }) => vec![Type::try_from(ty).map_err(|e| Error(e.msg))?],
                (None, Role::Type { infer: Some(Infer::Same(var)), .. }) => r.bound(var).ok_or_else(undetermined)?.to_vec(),
                (None, Role::Type { infer: Some(Infer::TypeOf(attr)), .. }) => {
                    // A number written without its type is MLIR's default: `i64`, `f64`
                    // (`arith.constant 10`); the attribute takes it too, as `mlir-opt` builds it.
                    match self.schema.field(attr).and_then(|af| r.get_mut(af)) {
                        Some(Got::Attr(Attribute::Int { ty: t @ None, .. })) => *t = Some(Type::Integer { signedness: Signedness::Signless, width: 64 }),
                        Some(Got::Attr(Attribute::Float { ty: t @ None, .. })) => *t = Some(Type::Float(FloatKind::F64)),
                        _ => {}
                    }
                    let a = self.schema.field(attr).and_then(|f| r.get(f));
                    vec![if let Some(Got::Attr(a)) = a { a.type_of() } else { None }.ok_or_else(undetermined)?]
                }
                (None, _) if f.variadic => Vec::new(),
                (None, _) => return Err(undetermined()),
            };
            if !f.variadic && ts.is_empty() {
                return Err(undetermined());
            }
            types.push((f, Some(ts)));
        }
        // What the text bound, taken over: the last binding of each name, as `Slots::bound` reads.
        types
            .into_iter()
            .map(|(f, ts)| {
                let ts = match ts {
                    Some(ts) => ts,
                    None => r.types.iter_mut().rev().find(|(n, _)| *n == f.name).map(|(_, ts)| core::mem::take(ts)).unwrap_or_default(),
                };
                if !f.variadic && ts.is_empty() {
                    return Err(Error(format!("type variable `{}` is not determined", f.name)));
                }
                Ok((f.name, ts))
            })
            .collect()
    }

    /// Fills defaults and inferred types, then builds the struct's [`Content`].
    fn finish(&self, mut r: Slots<'_>, loc: Option<Str<'_>>, results: usize) -> Result<Content, Error> {
        for (name, vs) in core::mem::take(&mut r.values) {
            let Some(f) = self.schema.field(name) else { continue };
            let c = if f.variadic { Content::of(&vs)? } else { Content::of(vs.first().ok_or_else(|| Error(format!("missing field `{name}`")))?)? };
            r.set(f, c);
        }
        for (name, ts) in self.complete(&mut r, results)? {
            let Some(f) = self.schema.field(name) else { continue };
            let c = if f.variadic { Content::of(&ts)? } else { Content::of(&ts[0])? };
            r.set(f, c);
        }
        if let Some(f) = self.schema.of_role(|r| *r == Role::Loc).next() {
            r.set(f, Content::of(&loc)?);
        }
        if let Some(f) = self.schema.of_role(|r| *r == Role::Attrs).next()
            && r.get(f).is_none()
        {
            r.set(f, Content::Seq(Vec::new()));
        }
        let fields = r.fields.into_iter().map(|(k, g)| Content::try_from(g).map(|c| (k, c))).collect::<Result<_, _>>()?;
        Ok(Content::Struct(self.schema.name, fields))
    }

    /// ⭐ The op read straight into an [`Operation`], no typed op in between: what
    /// `O::from_content` then `Operation::of_owned_op` make of the same fields (`of_content`),
    /// its types and regions kept as read.
    fn to_operation<'a>(&self, mut r: Slots<'a>, loc: Option<Str<'a>>, results: usize) -> Result<Operation<'a>, Error> {
        let types = self.complete(&mut r, results)?;
        let missing = |name: &str| Error(format!("missing field `{name}`"));
        let mut take = |name: &str| r.fields.iter().position(|(k, _)| *k == name).map(|i| r.fields.swap_remove(i).1);
        let ty_of = |name: &str| types.iter().find(|(n, _)| *n == name).map(|(_, ts)| ts.as_slice()).ok_or_else(|| Error(format!("no type variable `{name}`")));
        let mut regions = Vec::new();
        for f in self.schema.of_role(|r| *r == Role::Region) {
            match Content::try_from(take(f.name).ok_or_else(|| missing(f.name))?)? {
                Content::Seq(xs) if f.variadic => regions.extend(xs.into_iter().map(Content::into_region).collect::<Result<Vec<_>, _>>()?),
                c if f.variadic => regions.extend(c.to::<Vec<Region<'static>>>()?),
                c => regions.push(c.into_region()?),
            }
        }
        let (mut operands, mut inputs, mut sizes) = (Vec::new(), Vec::new(), Vec::new());
        for f in self.schema.of_role(|r| matches!(r, Role::Operand { .. })) {
            let Role::Operand { ty } = f.role else { continue };
            let group = match r.values.iter().position(|(k, _)| *k == f.name) {
                Some(i) => r.values.swap_remove(i).1,
                None => return Err(missing(f.name)),
            };
            if !f.variadic && group.len() != 1 {
                return Err(missing(f.name));
            }
            let var = self.schema.field(ty).ok_or_else(|| Error(format!("no type variable `{ty}`")))?;
            match ty_of(ty)? {
                [t] if !var.variadic => inputs.extend(group.iter().map(|_| t.clone())),
                ts if var.variadic && ts.len() == group.len() => inputs.extend(ts.iter().cloned()),
                _ => return Err(format!("`{}`: one type per operand", f.name).into()),
            }
            sizes.push(group.len());
            operands.extend(group);
        }
        let mut result_vars: Vec<(usize, &str)> = self.schema.fields.iter().filter_map(|f| if let Role::Type { result: Some(k), .. } = f.role { Some((k, f.name)) } else { None }).collect();
        result_vars.sort_by_key(|(k, _)| *k);
        let mut result_tys = Vec::new();
        for (_, name) in result_vars {
            result_tys.extend(ty_of(name)?.iter().cloned());
        }
        // On the stack, then one allocation of its length: one property pushed into a `Vec`
        // takes room for four (4 × 184 B), held for the life of the op.
        let mut props = smallvec::SmallVec::<[NamedAttr<'a>; 4]>::new();
        for f in self.schema.of_role(|r| matches!(r, Role::Prop { .. })) {
            // As `Fields::take` reads a field the text left out: an `Option`'s `None`, else none.
            // An attribute field keeps what was read, borrowing the text; only a typed one goes
            // through its Rust type (and so through a `Content`).
            let a: Option<Attribute<'a>> = match (take(f.name), f.ty) {
                // A unit attribute left out is `false` (`Fields::or_default`): not there.
                (None, _) if matches!(f.role, Role::Prop { unit: true, .. }) => continue,
                (Some(g), FieldType::Typed(through)) => through(Content::try_from(g)?)?.try_into()?,
                (Some(Got::Attr(a)), FieldType::Attr { .. }) => Some(a),
                (Some(g), FieldType::Attr { .. }) => Content::try_from(g)?.try_into()?,
                (None, FieldType::Typed(through)) => through(Content::None).map_err(|_| missing(f.name))?.try_into()?,
                (None, FieldType::Attr { required: true }) => return Err(missing(f.name)),
                (None, FieldType::Attr { required: false }) => continue,
            };
            props.extend(f.retype(a)?.map(|a| NamedAttr::of(f.name, a)));
        }
        if self.schema.of_role(|r| matches!(r, Role::Operand { .. })).filter(|f| f.variadic).count() > 1 {
            let values = sizes.iter().map(|n| Cow::Owned(format!("{n}"))).collect();
            props.push(NamedAttr::of(SEGMENTS, Attribute::DenseArray { ty: Type::int(32), values }));
        }
        props.sort_by(|a, b| a.name.cmp(&b.name));
        let mut successors = Vec::new();
        for f in self.schema.of_role(|r| *r == Role::Successor) {
            match take(f.name).ok_or_else(|| missing(f.name))? {
                Got::Str(s) if !f.variadic => successors.push(s),
                g if f.variadic => successors.extend(Content::try_from(g)?.to::<Vec<Str<'static>>>()?),
                g => successors.push(Content::try_from(g)?.to::<Str<'static>>()?),
            }
        }
        let attributes = match self.schema.of_role(|r| *r == Role::Attrs).next().and_then(|f| take(f.name)) {
            Some(Got::Attrs(v)) => v,
            Some(g) => Content::try_from(g)?.to::<Vec<NamedAttr<'static>>>()?,
            None => Vec::new(),
        };
        Ok(Operation {
            name: Cow::Borrowed(self.schema.name),
            operands,
            successors,
            properties: (!props.is_empty()).then(|| Attribute::Dict(Parser::exact(props))),
            regions,
            attributes,
            ty: FunctionType { inputs, results: result_tys },
            loc,
            ..Operation::default()
        })
    }
}
