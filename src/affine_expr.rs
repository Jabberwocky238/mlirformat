//! Affine expressions, maps and integer sets — the sub-language inside `affine_map<...>`,
//! `affine_set<...>` and, through them, the `affine` dialect's own op syntax.
//!
//! This is the one place where MLIR's assembly holds a language rather than a shape, which is why
//! upstream describes none of it in ODS: 11 of the `affine` dialect's 14 ops print themselves from
//! C++. An op's custom form reads its map and prints the map's results with the dimensions and
//! symbols replaced by the operands it was given — `affine.load %A[%i + 1]` is the map
//! `(d0) -> (d0 + 1)` shown against `%i`. [`Expr::show`] is that substitution.
//!
//! The tree is kept as written, not normalised: MLIR stores `a - b` as `a + b * -1` and prints the
//! subtraction back, so a tool that converts text to text and back has no reason to take the
//! detour, and keeping the surface form is what makes the round trip exact.
//!
//! The canonical form, for folding and simplifying, is [`AffineMap`](crate::AffineMap) /
//! [`IntegerSet`](crate::IntegerSet), built from this one.

use crate::common::Error;
use alloc::boxed::Box;
use alloc::vec::Vec;
use core::fmt::{self, Display, Formatter, Write};

/// A binary affine operator, loosest binding first.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Op {
    Add,
    Sub,
    Mul,
    FloorDiv,
    CeilDiv,
    Mod,
}

impl Op {
    /// How tightly it binds; a child that binds less tightly needs parentheses.
    fn binds(self) -> u8 {
        match self {
            Self::Add | Self::Sub => 1,
            _ => 2,
        }
    }

    /// How tightly each side must bind to go without parentheses. `*`, `floordiv`, `ceildiv` and
    /// `mod` do not associate with one another — MLIR writes `(d0 floordiv 32) * 16` — while
    /// `+` / `-` take them bare (`d0 - d0 mod 4`) and are left associative.
    fn sides(self) -> (u8, u8) {
        match self.binds() {
            1 => (1, 2),
            _ => (3, 3),
        }
    }

    fn word(self) -> &'static str {
        match self {
            Self::Add => "+",
            Self::Sub => "-",
            Self::Mul => "*",
            Self::FloorDiv => "floordiv",
            Self::CeilDiv => "ceildiv",
            Self::Mod => "mod",
        }
    }

    fn of(word: &str) -> Option<Self> {
        Some(match word {
            "+" => Self::Add,
            "-" => Self::Sub,
            "*" => Self::Mul,
            "floordiv" => Self::FloorDiv,
            "ceildiv" => Self::CeilDiv,
            "mod" => Self::Mod,
            _ => return None,
        })
    }
}

/// One affine expression. Dimensions and symbols are held by the name the map declares them
/// under, so substituting operands for them is a lookup, not arithmetic.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Expr<'a> {
    /// A dimension or symbol, by the name its map declares.
    Id(&'a str),
    Const(i64),
    Neg(Box<Expr<'a>>),
    Bin(Op, Box<Expr<'a>>, Box<Expr<'a>>),
    /// `symbol(...)`: marks its operand as a symbol rather than a dimension.
    Symbol(Box<Expr<'a>>),
}

impl<'a> Expr<'a> {
    fn binds(&self) -> u8 {
        match self {
            Self::Bin(op, ..) => op.binds(),
            // `-s0 + 1` goes bare, `(-s0) floordiv 4` does not: a negation binds like a product.
            Self::Neg(_) => 2,
            _ => 4,
        }
    }

    /// The expression with each name replaced by what `args` pairs it with, for an op that prints
    /// its map against its operands: `(d0) -> (d0 + 1)` against `[("d0", "%i")]` is `%i + 1`.
    /// A name `args` does not mention stays as it is.
    #[inline]
    pub fn show<'s>(&'s self, args: &'s [(&'s str, &'s str)]) -> Shown<'s, 'a> {
        Shown { expr: self, args }
    }

    fn write(&self, f: &mut Formatter<'_>, args: &[(&str, &str)], outer: u8) -> fmt::Result {
        let paren = self.binds() < outer;
        if paren {
            f.write_char('(')?;
        }
        match self {
            Self::Id(n) => f.write_str(args.iter().find(|(name, _)| name == n).map_or(*n, |(_, text)| text))?,
            Self::Const(v) => write!(f, "{v}")?,
            Self::Symbol(e) => {
                f.write_str("symbol(")?;
                e.write(f, args, 0)?;
                f.write_char(')')?;
            }
            Self::Neg(e) => {
                f.write_char('-')?;
                e.write(f, args, 3)?;
            }
            Self::Bin(op, a, b) => {
                let (l, r) = op.sides();
                a.write(f, args, l)?;
                write!(f, " {} ", op.word())?;
                b.write(f, args, r)?;
            }
        }
        if paren {
            f.write_char(')')?;
        }
        Ok(())
    }
}

/// An [`Expr`] being written with its names replaced.
pub struct Shown<'s, 'a> {
    expr: &'s Expr<'a>,
    args: &'s [(&'s str, &'s str)],
}

impl Display for Shown<'_, '_> {
    #[inline]
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        self.expr.write(f, self.args, 0)
    }
}

impl Display for Expr<'_> {
    #[inline]
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        self.write(f, &[], 0)
    }
}

/// `(d0, d1)[s0] -> (d0 + s0, d1)`: the body of an `affine_map<...>`.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Map<'a> {
    pub dims: Vec<&'a str>,
    /// `None` when the map writes no `[...]` at all, which MLIR prints back as written.
    pub syms: Option<Vec<&'a str>>,
    pub results: Vec<Expr<'a>>,
}

/// How a constraint compares against zero.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Cmp {
    Eq,
    Ge,
}

/// `(d0)[s0] : (d0 - 1 >= 0, s0 - d0 == 0)`: the body of an `affine_set<...>`.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Set<'a> {
    pub dims: Vec<&'a str>,
    pub syms: Option<Vec<&'a str>>,
    pub constraints: Vec<(Expr<'a>, Cmp)>,
}

/// A cursor over the body text.
struct Cur<'a> {
    src: &'a str,
    at: usize,
}

impl<'a> Cur<'a> {
    #[inline]
    fn new(src: &'a str) -> Self {
        Self { src, at: 0 }
    }

    #[inline]
    fn ws(&mut self) {
        self.at += self.src[self.at..].len() - self.src[self.at..].trim_start().len();
    }

    #[inline]
    fn rest(&mut self) -> &'a str {
        self.ws();
        &self.src[self.at..]
    }

    #[inline]
    fn eat(&mut self, s: &str) -> bool {
        let hit = self.rest().starts_with(s);
        self.at += if hit { s.len() } else { 0 };
        hit
    }

    #[inline]
    fn expect(&mut self, s: &str) -> Result<(), Error> {
        if self.eat(s) { Ok(()) } else { Err(Error(alloc::format!("affine: expected `{s}` at `{}`", self.rest()))) }
    }

    /// A bare identifier or keyword.
    fn word(&mut self) -> &'a str {
        let rest = self.rest();
        let end = rest.find(|c: char| !(c.is_ascii_alphanumeric() || matches!(c, '_' | '$' | '.'))).unwrap_or(rest.len());
        self.at += end;
        &rest[..end]
    }

    /// A comma-separated name list inside `open` / `close`.
    fn names(&mut self, open: &str, close: &str) -> Result<Vec<&'a str>, Error> {
        self.expect(open)?;
        let mut out: Vec<&'a str> = Vec::new();
        if self.eat(close) {
            return Ok(out);
        }
        loop {
            let w = self.word();
            if w.is_empty() {
                return Err(Error(alloc::format!("affine: expected a name at `{}`", self.rest())));
            }
            out.push(w);
            if !self.eat(",") {
                self.expect(close)?;
                return Ok(out);
            }
        }
    }

    fn expr(&mut self) -> Result<Expr<'a>, Error> {
        let mut lhs = self.term()?;
        loop {
            let Some(op) = ["+", "-"].into_iter().find(|o| self.eat(o)).and_then(Op::of) else { return Ok(lhs) };
            lhs = Expr::Bin(op, Box::new(lhs), Box::new(self.term()?));
        }
    }

    fn term(&mut self) -> Result<Expr<'a>, Error> {
        let mut lhs = self.factor()?;
        loop {
            let save = self.at;
            self.ws();
            let op = if self.eat("*") {
                Op::Mul
            } else {
                match Op::of(self.word()) {
                    Some(op @ (Op::FloorDiv | Op::CeilDiv | Op::Mod)) => op,
                    _ => {
                        self.at = save;
                        return Ok(lhs);
                    }
                }
            };
            lhs = Expr::Bin(op, Box::new(lhs), Box::new(self.factor()?));
        }
    }

    fn factor(&mut self) -> Result<Expr<'a>, Error> {
        if self.eat("-") {
            // `-3` is a literal, `-d0` a negation: MLIR prints the first without a space.
            let rest = self.rest();
            if rest.starts_with(|c: char| c.is_ascii_digit()) {
                let w = self.word();
                return w.parse().map(|v: i64| Expr::Const(-v)).map_err(|_| Error(alloc::format!("affine: bad number `-{w}`")));
            }
            return Ok(Expr::Neg(Box::new(self.factor()?)));
        }
        if self.eat("(") {
            let e = self.expr()?;
            self.expect(")")?;
            return Ok(e);
        }
        let w = self.word();
        // `symbol(x)` says `x` is a symbol, not a dimension; it is one term, not two.
        if w == "symbol" && self.rest().starts_with('(') {
            self.expect("(")?;
            let e = self.expr()?;
            self.expect(")")?;
            return Ok(Expr::Symbol(Box::new(e)));
        }
        match (w.is_empty(), w.starts_with(|c: char| c.is_ascii_digit())) {
            (true, _) => Err(Error(alloc::format!("affine: expected a term at `{}`", self.rest()))),
            (_, true) => w.parse().map(Expr::Const).map_err(|_| Error(alloc::format!("affine: bad number `{w}`"))),
            _ => Ok(Expr::Id(w)),
        }
    }

    /// `(d0, d1)` then an optional `[s0]`.
    #[inline]
    fn header(&mut self) -> Result<(Vec<&'a str>, Option<Vec<&'a str>>), Error> {
        let dims = self.names("(", ")")?;
        let syms = self.rest().starts_with('[').then(|| self.names("[", "]")).transpose()?;
        Ok((dims, syms))
    }

    /// A parenthesised, comma-separated list, each item read by `item`.
    fn list<T>(&mut self, mut item: impl FnMut(&mut Self) -> Result<T, Error>) -> Result<Vec<T>, Error> {
        self.expect("(")?;
        let mut out = Vec::new();
        if self.eat(")") {
            return Ok(out);
        }
        // Items are separated by `,`: `(-1*i j, j)` is not two of them.
        loop {
            out.push(item(self)?);
            if !self.eat(",") {
                self.expect(")")?;
                return Ok(out);
            }
        }
    }

    #[inline]
    fn done(&mut self) -> Result<(), Error> {
        if self.rest().is_empty() { Ok(()) } else { Err(Error(alloc::format!("affine: trailing `{}`", self.rest()))) }
    }
}

impl Expr<'_> {
    /// Does it hold no dimension (`syms` are the symbols)? What `isSymbolicOrConstant` asks.
    fn symbolic(&self, syms: &[&str]) -> bool {
        match self {
            Self::Id(n) => syms.contains(n),
            Self::Const(_) | Self::Symbol(_) => true,
            Self::Neg(e) => e.symbolic(syms),
            Self::Bin(_, a, b) => a.symbolic(syms) && b.symbolic(syms),
        }
    }

    /// Is it affine, as `AffineParser` requires: a product with a symbolic or constant side, a
    /// `floordiv` / `ceildiv` / `mod` by a symbolic or constant right side.
    fn affine(&self, syms: &[&str]) -> Result<(), Error> {
        match self {
            Self::Id(_) | Self::Const(_) => Ok(()),
            Self::Neg(e) | Self::Symbol(e) => e.affine(syms),
            Self::Bin(op, a, b) => {
                a.affine(syms)?;
                b.affine(syms)?;
                match op {
                    Op::Mul if !a.symbolic(syms) && !b.symbolic(syms) => Err(Error("non-affine expression: at least one of the multiply operands has to be either a constant or symbolic".into())),
                    Op::FloorDiv | Op::CeilDiv | Op::Mod if !b.symbolic(syms) => Err(Error(alloc::format!("non-affine expression: right operand of {} has to be either a constant or symbolic", op.word()))),
                    _ => Ok(()),
                }
            }
        }
    }
}

/// The declared names: none twice (`redefinition of identifier`).
fn distinct(dims: &[&str], syms: Option<&Vec<&str>>) -> Result<(), Error> {
    let all: Vec<&str> = dims.iter().chain(syms.into_iter().flatten()).copied().collect();
    match all.iter().enumerate().find(|(i, n)| all[..*i].contains(n)) {
        Some((_, n)) => Err(Error(alloc::format!("redefinition of identifier '{n}'"))),
        None => Ok(()),
    }
}

impl Map<'_> {
    /// What `mlir-opt` refuses of a map that reads: a name declared twice, a non-affine result.
    pub fn check(&self) -> Result<(), Error> {
        distinct(&self.dims, self.syms.as_ref())?;
        let syms = self.syms.as_deref().unwrap_or(&[]);
        self.results.iter().try_for_each(|e| e.affine(syms))
    }
}

impl Set<'_> {
    /// As [`Map::check`].
    pub fn check(&self) -> Result<(), Error> {
        distinct(&self.dims, self.syms.as_ref())?;
        let syms = self.syms.as_deref().unwrap_or(&[]);
        self.constraints.iter().try_for_each(|(e, _)| e.affine(syms))
    }
}

impl<'a> TryFrom<&'a str> for Map<'a> {
    type Error = Error;

    /// The body of an `affine_map<...>`, without the brackets.
    fn try_from(body: &'a str) -> Result<Self, Error> {
        let mut c = Cur::new(body);
        let (dims, syms) = c.header()?;
        c.expect("->")?;
        let results = c.list(Cur::expr)?;
        c.done()?;
        Ok(Self { dims, syms, results })
    }
}

impl<'a> TryFrom<&'a str> for Set<'a> {
    type Error = Error;

    /// The body of an `affine_set<...>`, without the brackets.
    fn try_from(body: &'a str) -> Result<Self, Error> {
        let mut c = Cur::new(body);
        let (dims, syms) = c.header()?;
        c.expect(":")?;
        // `lhs >= rhs`, `lhs <= rhs`, `lhs == rhs`, kept as `e >= 0` / `e == 0` as MLIR keeps it:
        // `lhs - rhs`, `rhs - lhs` for `<=`; a `0` right side leaves `lhs` as written.
        let constraints = c.list(|c| {
            let lhs = c.expr()?;
            let (cmp, flip) = if c.eat(">=") {
                (Cmp::Ge, false)
            } else if c.eat("<=") {
                (Cmp::Ge, true)
            } else if c.eat("==") {
                (Cmp::Eq, false)
            } else {
                return Err(Error(alloc::format!("affine: expected `== affine-expr` or `>= affine-expr` at end of affine constraint, at `{}`", c.rest())));
            };
            let rhs = c.expr()?;
            let e = match (flip, rhs) {
                (false, Expr::Const(0)) => lhs,
                (true, Expr::Const(0)) => Expr::Neg(Box::new(lhs)),
                (false, rhs) => Expr::Bin(Op::Sub, Box::new(lhs), Box::new(rhs)),
                (true, rhs) => Expr::Bin(Op::Sub, Box::new(rhs), Box::new(lhs)),
            };
            Ok((e, cmp))
        })?;
        c.done()?;
        Ok(Self { dims, syms, constraints })
    }
}

/// `a, b, c`.
fn commas<T: Display>(f: &mut Formatter<'_>, xs: &[T]) -> fmt::Result {
    for (i, x) in xs.iter().enumerate() {
        if i > 0 {
            f.write_str(", ")?;
        }
        write!(f, "{x}")?;
    }
    Ok(())
}

/// `(dims)[syms]`, the symbols only when the source wrote them.
fn header(f: &mut Formatter<'_>, dims: &[&str], syms: Option<&Vec<&str>>) -> fmt::Result {
    f.write_char('(')?;
    commas(f, dims)?;
    f.write_char(')')?;
    match syms {
        Some(syms) => {
            f.write_char('[')?;
            commas(f, syms)?;
            f.write_char(']')
        }
        None => Ok(()),
    }
}

impl Display for Map<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        header(f, &self.dims, self.syms.as_ref())?;
        f.write_str(" -> (")?;
        commas(f, &self.results)?;
        f.write_char(')')
    }
}

impl Display for Set<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        header(f, &self.dims, self.syms.as_ref())?;
        f.write_str(" : (")?;
        for (i, (e, cmp)) in self.constraints.iter().enumerate() {
            if i > 0 {
                f.write_str(", ")?;
            }
            write!(f, "{e} {} 0", if *cmp == Cmp::Ge { ">=" } else { "==" })?;
        }
        f.write_char(')')
    }
}
