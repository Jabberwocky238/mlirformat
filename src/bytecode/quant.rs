use alloc::format;
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;

use crate::{Attribute, Error, FloatKind, IntoStatic, Signedness, Type};

use super::entity::{Entities, Piece};

/// The quant dialect's type codes (`QuantDialectTypes`)
#[derive(Clone, Copy)]
pub enum Q {
    Any = 1,
    AnyWithExpressedType = 2,
    Calibrated = 3,
    Uniform = 4,
    UniformPerAxis = 5,
    UniformSubChannel = 6,
    Quantile = 7,
}

impl From<Q> for Piece {
    fn from(q: Q) -> Self {
        Piece::Var(q as u64)
    }
}

/// `QuantizationFlags::Signed`
pub const SIGNED: u64 = 1;

/// The float storage types and their default bound (`QuantStorageTypeInterface`), the range
/// being `-bound..=bound`
pub const FLOAT_STORAGE: &[(FloatKind, i64)] = &[(FloatKind::F8E5M2, 57344), (FloatKind::F8E4M3FN, 448), (FloatKind::F4E2M1FN, 6)];

/// Reads a quant type's body: whitespace, punctuation, numbers and type names
struct Scan<'s> {
    s: &'s str,
    at: usize,
}

impl<'s> Scan<'s> {
    fn ws(&mut self) {
        while self.s[self.at..].starts_with(char::is_whitespace) {
            self.at += 1;
        }
    }

    fn eat(&mut self, p: &str) -> bool {
        self.ws();
        if self.s[self.at..].starts_with(p) {
            self.at += p.len();
            return true;
        }
        false
    }

    fn expect(&mut self, p: &str) -> Result<(), Error> {
        if self.eat(p) { Ok(()) } else { Err(self.err()) }
    }

    fn err(&self) -> Error {
        Error(format!("bytecode: quant type `{}` at {}", self.s, self.at))
    }

    /// A run of name characters: a type name, a number
    fn word(&mut self) -> &'s str {
        self.ws();
        let start = self.at;
        let b = self.s.as_bytes();
        while self.at < b.len() && (b[self.at].is_ascii_alphanumeric() || matches!(b[self.at], b'_' | b'.' | b'-' | b'+')) {
            self.at += 1;
        }
        &self.s[start..self.at]
    }

    fn int(&mut self) -> Result<i64, Error> {
        let w = self.word();
        w.parse().map_err(|_| self.err())
    }

    fn float(&mut self) -> Result<f64, Error> {
        let w = self.word();
        match w.strip_prefix("0x") {
            Some(h) => u64::from_str_radix(h, 16).map(f64::from_bits).map_err(|_| self.err()),
            None => w.parse().map_err(|_| self.err()),
        }
    }

    fn ty(&mut self) -> Result<Type<'static>, Error> {
        let w = self.word();
        Type::try_from(w).map(|t| t.into_static()).map_err(|_| self.err())
    }

    /// `scale` or `scale:zero_point`
    fn params(&mut self) -> Result<(f64, i64), Error> {
        let scale = self.float()?;
        let zero = if self.eat(":") { self.int()? } else { 0 };
        Ok((scale, zero))
    }
}

/// A storage type, whether it is signed, and its default range
struct Storage {
    ty: Type<'static>,
    signed: bool,
    min: i64,
    max: i64,
}

impl Storage {
    fn read(s: &mut Scan<'_>) -> Result<Self, Error> {
        let w = s.word();
        let (ty, signed) = match w.strip_prefix('u').and_then(|n| n.parse::<u32>().ok()) {
            Some(width) => (Type::Integer { signedness: Signedness::Signless, width }, false),
            None => {
                let ty = Type::try_from(w).map(|t| t.into_static()).map_err(|_| s.err())?;
                let signed = !matches!(ty, Type::Integer { signedness: Signedness::Unsigned, .. });
                (ty, signed)
            }
        };
        let (min, max) = match &ty {
            Type::Integer { width, .. } if signed => (-(1i64 << (width - 1)), (1i64 << (width - 1)) - 1),
            Type::Integer { width, .. } => (0, ((1u64 << width) - 1) as i64),
            Type::Float(k) => {
                let b = FLOAT_STORAGE.iter().find(|(f, _)| f == k).map(|(_, b)| *b).ok_or_else(|| s.err())?;
                (-b, b)
            }
            _ => return Err(s.err()),
        };
        let mut st = Storage { ty, signed, min, max };
        if s.eat("<") {
            st.min = s.int()?;
            s.expect(":")?;
            st.max = s.int()?;
            s.expect(">")?;
        }
        Ok(st)
    }

    fn flags(&self) -> u64 {
        if self.signed { SIGNED } else { 0 }
    }
}

impl Entities {
    /// A quant dialect type, by its custom encoding
    pub fn quant(&mut self, name: &str, body: &str) -> Result<Vec<Piece>, Error> {
        let mut s = Scan { s: body, at: 0 };
        s.expect("<")?;
        let p = match name {
            "quant.any" => {
                let st = Storage::read(&mut s)?;
                let expressed = if s.eat(":") { Some(s.ty()?) } else { None };
                let mut p = vec![if expressed.is_some() { Q::AnyWithExpressedType } else { Q::Any }.into(), Piece::Var(st.flags()), Piece::Type(self.ty(&st.ty)?)];
                if let Some(e) = expressed {
                    p.push(Piece::Type(self.ty(&e)?));
                }
                p.extend([Piece::SVar(st.min), Piece::SVar(st.max)]);
                p
            }
            "quant.calibrated" => {
                let e = s.ty()?;
                s.expect("<")?;
                let min = s.float()?;
                s.expect(":")?;
                let max = s.float()?;
                s.expect(">")?;
                vec![Q::Calibrated.into(), Piece::Type(self.ty(&e)?), Self::double(min), Self::double(max)]
            }
            "quant.uniform" => self.uniform(&mut s)?,
            "quant.quantile" => {
                let storage = s.ty()?;
                s.expect(":")?;
                let quantile = s.ty()?;
                s.expect(",")?;
                s.expect("{")?;
                let mut qs = Vec::new();
                if !s.eat("}") {
                    loop {
                        qs.push(s.float()?);
                        if !s.eat(",") {
                            break;
                        }
                    }
                    s.expect("}")?;
                }
                let range = if s.eat(",") {
                    s.expect("<")?;
                    let min = s.int()?;
                    s.expect(":")?;
                    let max = s.int()?;
                    s.expect(">")?;
                    Some((min, max))
                } else {
                    None
                };
                let mut p = vec![Q::Quantile.into(), Piece::Type(self.ty(&storage)?), Piece::Type(self.ty(&quantile)?), Piece::Var(qs.len() as u64)];
                p.extend(qs.into_iter().map(Self::double));
                match range {
                    Some((min, max)) => p.extend([Piece::Byte(1), Piece::SVar(min), Piece::Byte(1), Piece::SVar(max)]),
                    None => p.extend([Piece::Byte(0), Piece::Byte(0)]),
                }
                p
            }
            _ => return Err(s.err()),
        };
        s.expect(">")?;
        Ok(p)
    }

    /// A double as `writeAPFloatWithKnownSemantics(APFloat(double))` writes it
    fn double(x: f64) -> Piece {
        Piece::SVar(x.to_bits() as i64)
    }

    fn uniform(&mut self, s: &mut Scan<'_>) -> Result<Vec<Piece>, Error> {
        let st = Storage::read(s)?;
        s.expect(":")?;
        let expressed = s.ty()?;
        enum Kind {
            PerTensor,
            PerAxis(i64),
            SubChannel(Vec<(i64, i64)>),
        }
        let kind = if s.eat(":") {
            if s.eat("{") {
                let mut blocks = Vec::new();
                if !s.eat("}") {
                    loop {
                        let d = s.int()?;
                        s.expect(":")?;
                        blocks.push((d, s.int()?));
                        if !s.eat(",") {
                            break;
                        }
                    }
                    s.expect("}")?;
                }
                Kind::SubChannel(blocks)
            } else {
                Kind::PerAxis(s.int()?)
            }
        } else {
            Kind::PerTensor
        };
        s.expect(",")?;
        let head = |q: Q, me: &mut Self| -> Result<Vec<Piece>, Error> { Ok(vec![q.into(), Piece::Var(st.flags()), Piece::Type(me.ty(&st.ty)?), Piece::Type(me.ty(&expressed)?)]) };
        Ok(match kind {
            Kind::PerTensor => {
                let (scale, zero) = s.params()?;
                let mut p = head(Q::Uniform, self)?;
                p.extend([Self::double(scale), Piece::SVar(zero), Piece::SVar(st.min), Piece::SVar(st.max)]);
                p
            }
            Kind::PerAxis(dim) => {
                s.expect("{")?;
                let mut params = Vec::new();
                loop {
                    params.push(s.params()?);
                    if !s.eat(",") {
                        break;
                    }
                }
                s.expect("}")?;
                let mut p = head(Q::UniformPerAxis, self)?;
                p.extend([Piece::Var(dim as u64), Piece::SVar(st.min), Piece::SVar(st.max), Piece::Var(params.len() as u64)]);
                p.extend(params.iter().map(|(sc, _)| Self::double(*sc)));
                p.push(Piece::Var(params.len() as u64));
                p.extend(params.iter().map(|(_, z)| Piece::SVar(*z)));
                p
            }
            Kind::SubChannel(blocks) => {
                let (mut flat, mut dims) = (Vec::new(), Vec::new());
                Self::nested(s, 0, &mut flat, &mut dims)?;
                let dense = |vals: Vec<String>, elem: &Type<'_>| -> Result<Attribute<'static>, Error> {
                    let shape: String = dims.iter().map(|d| format!("{d}x")).collect();
                    let text = format!("dense<[{}]> : tensor<{shape}{elem}>", vals.join(", "));
                    Attribute::try_from(&*text).map(|a| a.into_static()).map_err(|e| Error(format!("bytecode: {e}")))
                };
                let scales = dense(flat.iter().map(|(sc, _)| format!("{:e}", sc)).collect(), &expressed)?;
                let zeros = dense(flat.iter().map(|(_, z)| format!("{z}")).collect(), &st.ty)?;
                let mut p = head(Q::UniformSubChannel, self)?;
                p.extend([Piece::SVar(st.min), Piece::SVar(st.max), Piece::Var(blocks.len() as u64)]);
                p.extend(blocks.iter().map(|(d, _)| Piece::SVar(*d)));
                p.push(Piece::Var(blocks.len() as u64));
                p.extend(blocks.iter().map(|(_, b)| Piece::SVar(*b)));
                p.push(Piece::Attr(self.attr(&scales)?));
                p.push(Piece::Attr(self.attr(&zeros)?));
                p
            }
        })
    }

    /// Nested `{...}` lists of `scale:zero_point`, flattened, with the size of each level
    fn nested(s: &mut Scan<'_>, depth: usize, flat: &mut Vec<(f64, i64)>, dims: &mut Vec<usize>) -> Result<(), Error> {
        s.expect("{")?;
        let mut n = 0;
        loop {
            s.ws();
            if s.s[s.at..].starts_with('{') {
                Self::nested(s, depth + 1, flat, dims)?;
            } else {
                flat.push(s.params()?);
            }
            n += 1;
            if !s.eat(",") {
                break;
            }
        }
        s.expect("}")?;
        if dims.len() <= depth {
            dims.resize(depth + 1, 0);
        }
        dims[depth] = n;
        Ok(())
    }
}
