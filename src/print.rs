use core::fmt::{self, Display, Formatter, Write};

use crate::ast::*;
use crate::dialect::Dialects;

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

/// Indentation-aware MLIR writer; [`crate::Dialect::print_op`] plugins write through it.
pub struct Printer<'p, 'd> {
    out: &'p mut dyn Write,
    indent: usize,
    dialects: Dialects<'d>,
}

impl Write for Printer<'_, '_> {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        self.out.write_str(s)
    }
}

impl<'p, 'd> Printer<'p, 'd> {
    pub fn new(out: &'p mut dyn Write, dialects: Dialects<'d>) -> Self {
        Self { out, indent: 0, dialects }
    }

    /// Newline followed by the current indentation.
    pub fn nl(&mut self) -> fmt::Result {
        write!(self.out, "\n{:1$}", "", self.indent)
    }

    pub fn module(&mut self, m: &Module<'_>) -> fmt::Result {
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
        match &op.body {
            OpBody::Generic(g) => {
                let plugin = g.name.split_once('.').and_then(|(ns, _)| self.dialects.iter().find(|d| d.namespace() == ns));
                match plugin.and_then(|d| d.print_op(g, self)) {
                    Some(r) => r,
                    None => self.generic(g),
                }
            }
            OpBody::Custom(c) => {
                self.write_str(&c.name)?;
                c.pieces.iter().try_for_each(|piece| match piece {
                    Piece::Text(t) => self.write_str(t),
                    Piece::Region(r) => self.region(r, true),
                })
            }
        }
    }

    pub fn generic(&mut self, g: &GenericOp<'_>) -> fmt::Result {
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

    /// `{ blocks }`; the entry block label is omitted unless `entry_label`.
    pub fn region(&mut self, r: &Region<'_>, entry_label: bool) -> fmt::Result {
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
            for op in &b.ops {
                self.nl()?;
                self.op(op)?;
            }
            self.indent -= 2;
        }
        self.nl()?;
        self.write_char('}')
    }
}

/// Display via [`Printer`] with dialect plugins: `module.display(&[&MyDialect])`.
pub struct WithDialects<'x, 'd, T>(&'x T, Dialects<'d>);

macro_rules! printable {
    ($($ty:ident => $m:ident),* $(,)?) => {$(
        impl<'a> $ty<'a> {
            pub fn display<'x, 'd>(&'x self, dialects: Dialects<'d>) -> WithDialects<'x, 'd, Self> {
                WithDialects(self, dialects)
            }
        }

        impl Display for WithDialects<'_, '_, $ty<'_>> {
            fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
                Printer::new(f, self.1).$m(self.0)
            }
        }

        impl Display for $ty<'_> {
            fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
                Printer::new(f, &[]).$m(self)
            }
        }
    )*};
}

printable!(
    Module => module, 
    Operation => op, 
    GenericOp => generic
);

impl Display for ResultDef<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "%{}", self.name)?;
        self.count.map_or(Ok(()), |n| write!(f, ":{n}"))
    }
}

impl Display for ValueRef<'_> {
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
