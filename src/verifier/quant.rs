//! `quant` types as `mlir-opt` reads them: `QuantDialect::parseType` (`Quant/IR/TypeParser.cpp`)
//! and each type's `verifyInvariants` (`QuantTypes.cpp`).

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::{FloatKind, MlirOpt, Parser, R, Signedness, Type};

keywords! {
    /// The `quant` types.
    enum Kind {
        Uniform = "uniform",
        Any = "any",
        Calibrated = "calibrated",
        Quantile = "quantile",
    }
}

/// `QuantizedType::MaxStorageBits`.
const MAX_STORAGE_BITS: u32 = 32;

/// A storage type (`QuantStorageTypeInterface`): its width and default range.
#[derive(Clone, Copy)]
struct Storage {
    width: u32,
    min: i64,
    max: i64,
}

impl Storage {
    /// An integer of `width` bits: `getDefaultMinimum` / `getDefaultMaximum`.
    #[inline]
    fn int(width: u32, signed: bool) -> Self {
        let w = width.clamp(1, 64);
        let (min, max) = match signed {
            true => (i64::MIN >> (64 - w), i64::MAX >> (64 - w)),
            false => (0, (u64::MAX >> (64 - w)) as i64),
        };
        Self { width, min, max }
    }

    /// The float storage types: `f8E5M2`, `f8E4M3FN`, `f4E2M1FN` (their largest finite value).
    #[inline]
    fn float(k: FloatKind) -> Option<Self> {
        let (width, max) = match k {
            FloatKind::F8E5M2 => (8, 57344),
            FloatKind::F8E4M3FN => (8, 448),
            FloatKind::F4E2M1FN => (4, 6),
            _ => return None,
        };
        Some(Self { width, min: -max, max })
    }

    /// `(min, max)`.
    #[inline]
    fn range(self) -> (i64, i64) {
        (self.min, self.max)
    }
}

/// The smallest and largest finite value of a float type (`APFloat::getSmallest` / `getLargest`):
/// the range a scale must lie in. `None` for a type whose range is not checked here.
fn scale_range(k: FloatKind) -> Option<(f64, f64)> {
    Some(match k {
        FloatKind::F16 => (5.960_464_477_539_063e-8, 65504.0),
        FloatKind::BF16 => (9.183_549_615_799_121e-41, 3.389_531_389_251_535_5e38),
        FloatKind::TF32 => (1.148_691_910_257_993_1e-40, 3.401_822_861_487_166_6e38),
        FloatKind::F32 => (1.401_298_464_324_817e-45, f64::from(f32::MAX)),
        FloatKind::F64 => (4.940_656_458_412_465_4e-324, f64::MAX),
        _ => return None,
    })
}

/// A cursor over one `quant` type's body.
struct QuantText<'a, 'd> {
    p: Parser<'a, 'd>,
}

impl<'a, 'd> QuantText<'a, 'd> {
    /// `parseInteger`: an optional `-`, then digits.
    fn integer(&mut self) -> R<i64> {
        let neg = self.p.eat("-");
        let n: i64 = self.p.number()?;
        Ok(if neg { -n } else { n })
    }

    /// `parseFloat`: a decimal integer or float literal, maybe negative.
    fn float(&mut self) -> R<f64> {
        self.p.ws();
        let text = self.p.rest();
        // `0x...`: the bits of an `f64` (`parseFloat` reads a hex literal so).
        if let Some(hex) = text.strip_prefix("0x") {
            let n = hex.bytes().take_while(u8::is_ascii_hexdigit).count();
            let bits = u64::from_str_radix(&hex[..n], 16).or_else(|_| self.p.err("hexadecimal float constant out of range for type"))?;
            self.p.skip(2 + n);
            return Ok(f64::from_bits(bits));
        }
        let mut end = usize::from(text.starts_with('-'));
        let digits = |s: &str| s.bytes().take_while(u8::is_ascii_digit).count();
        let int = digits(&text[end..]);
        if int == 0 {
            return self.p.err("expected floating point literal");
        }
        end += int;
        if text[end..].starts_with('.') {
            end += 1 + digits(&text[end + 1..]);
        }
        if text[end..].starts_with(['e', 'E']) {
            let sign = usize::from(text[end + 1..].starts_with(['+', '-']));
            let exp = digits(&text[end + 1 + sign..]);
            if exp > 0 {
                end += 1 + sign + exp;
            }
        }
        let v = text[..end].parse::<f64>().or_else(|_| self.p.err("expected floating point literal"))?;
        self.p.skip(end);
        Ok(v)
    }

    /// `parseStorageType`: a `QuantStorageTypeInterface` type (an integer type `i8` / `ui8`,
    /// `f8E5M2`, `f8E4M3FN`, `f4E2M1FN`, a `!quant.quantile<..>`) or `u<width>`, 1 to 32 bits.
    fn storage(&mut self) -> R<Storage> {
        self.p.ws();
        let start = self.p.pos();
        let s = match self.p.ty() {
            Ok(Type::Integer { signedness, width }) => Storage::int(width, signedness != Signedness::Unsigned),
            Ok(Type::Float(k)) => match Storage::float(k) {
                Some(s) => s,
                None => return self.p.err("illegal storage type prefix"),
            },
            Ok(Type::Extended(e)) if e.name == "quant.quantile" => {
                let body = e.body.as_deref().unwrap_or("");
                let mut q = QuantText { p: Parser::new(body, self.p.opt()) };
                q.quantile().map_err(|e| e.placed(body))?
            }
            Ok(_) => return self.p.err("illegal storage type prefix"),
            Err(_) => {
                self.p.seek(start);
                let word = self.p.ident()?;
                match word.strip_prefix('u') {
                    Some(w) => Storage::int(w.parse::<u32>().or_else(|_| self.p.err("expected storage type width"))?, false),
                    None => return self.p.err("illegal storage type prefix"),
                }
            }
        };
        if s.width == 0 || s.width > MAX_STORAGE_BITS {
            return self.p.err(alloc::format!("illegal storage type size: {}", s.width));
        }
        Ok(s)
    }

    /// `parseQuantileType` after `quantile`, and `QuantileType::verifyInvariants`:
    /// `<storage:quantile, {q, ..}(, <min:max>)?>`, one finite quantile per storage value. Its
    /// storage range (`QuantileType::getDefaultMinimum` / `Maximum`) as a storage type itself.
    fn quantile(&mut self) -> R<Storage> {
        self.p.expect("<")?;
        let (width, signed) = match self.p.ty()? {
            Type::Integer { signedness, width } => (width, signedness != Signedness::Unsigned),
            t @ Type::Float(_) => (t.bit_width().unwrap_or(0), true),
            _ => return self.p.err("storage type must be an integer or float type"),
        };
        self.p.expect(":")?;
        if !matches!(self.p.ty()?, Type::Float(_)) {
            return self.p.err("quantile type must be a float type");
        }
        self.p.expect(",")?;
        self.p.expect("{")?;
        let mut quantiles = Vec::new();
        if !self.p.eat("}") {
            loop {
                quantiles.push(self.float()?);
                if !self.p.eat(",") {
                    break;
                }
            }
            self.p.expect("}")?;
        }
        let explicit = match self.p.eat(",") {
            true => {
                self.p.expect("<")?;
                let min = self.integer()?;
                self.p.expect(":")?;
                let max = self.integer()?;
                self.p.expect(">")?;
                Some((min, max))
            }
            false => None,
        };
        self.p.expect(">")?;
        if quantiles.is_empty() {
            return self.p.err("quantile values must not be empty");
        }
        if explicit.is_some_and(|(min, max)| min >= max) {
            return self.p.err("storage min must be less than storage max");
        }
        let int = Storage::int(width, signed);
        let (min, max) = explicit.unwrap_or((int.min, int.max));
        let expected = i128::from(max) - i128::from(min) + 1;
        if quantiles.len() as i128 != expected {
            return self.p.err(alloc::format!("quantile LUT size ({}) must equal the number of representable storage values ({expected})", quantiles.len()));
        }
        if quantiles.iter().any(|v| !v.is_finite()) {
            return self.p.err("quantile values must be finite (no NaN or infinity)");
        }
        Ok(Storage { width, min, max })
    }

    /// `parseStorageRange`: `<min:max>` inside the storage type's range, `min < max`
    /// (`QuantizedType::verifyInvariants`).
    fn storage_range(&mut self, s: Storage) -> R<()> {
        let (lo, hi) = s.range();
        let (min, max) = match self.p.eat("<") {
            true => {
                let min = self.integer()?;
                self.p.expect(":")?;
                let max = self.integer()?;
                self.p.expect(">")?;
                if min < lo {
                    return self.p.err(alloc::format!("illegal storage type minimum: {min}"));
                }
                if max > hi {
                    return self.p.err(alloc::format!("illegal storage type maximum: {max}"));
                }
                (min, max)
            }
            false => (lo, hi),
        };
        if max - min <= 0 {
            return self.p.err(alloc::format!("illegal storage min and storage max: ({min}:{max})"));
        }
        Ok(())
    }

    /// An expressed type: a float type.
    fn expressed(&mut self) -> R<FloatKind> {
        match self.p.ty()? {
            Type::Float(k) => Ok(k),
            _ => self.p.err("expressed type must be floating point"),
        }
    }

    /// `parseQuantParams`: `scale[:zeroPoint]`, the scale in the expressed type's range.
    fn params(&mut self, k: FloatKind) -> R<()> {
        let scale = self.float()?;
        if let Some((lo, hi)) = scale_range(k)
            && !(lo..=hi).contains(&scale)
        {
            return self.p.err(alloc::format!("scale {scale} out of expressed type range [{lo}, {hi}]"));
        }
        if self.p.eat(":") {
            self.integer()?;
        }
        Ok(())
    }

    /// `parseQuantParamListUntilRBrace` after its `{`: params or nested lists, every element of
    /// the same shape; its shape.
    fn param_list(&mut self, k: FloatKind) -> R<Vec<usize>> {
        let mut shape: Option<Vec<usize>> = None;
        let mut size = 0;
        loop {
            let this = if self.p.eat("{") { self.param_list(k)? } else { self.params(k).map(|()| Vec::new())? };
            size += 1;
            match &shape {
                Some(s) if *s != this => return self.p.err("tensor literal is invalid; ranks are not consistent between elements"),
                Some(_) => {}
                None => shape = Some(this),
            }
            if !self.p.eat(",") {
                break;
            }
        }
        self.p.expect("}")?;
        let mut out = alloc::vec![size];
        out.extend(shape.unwrap_or_default());
        Ok(out)
    }

    /// `parseUniformType` after `uniform`.
    fn uniform(&mut self) -> R<()> {
        self.p.expect("<")?;
        let s = self.storage()?;
        self.storage_range(s)?;
        self.p.expect(":")?;
        let k = self.expressed()?;
        // `:dim` (per axis) or `:{dim:block, ..}` (sub-channel), then a list of params.
        let listed = match self.p.eat(":") {
            true if self.p.eat("{") => {
                if !self.p.eat("}") {
                    loop {
                        let dim = self.integer()?;
                        self.p.expect(":")?;
                        let block = self.integer()?;
                        if dim < 0 {
                            return self.p.err(alloc::format!("illegal quantized dimension: {dim}"));
                        }
                        if block <= 0 {
                            return self.p.err(alloc::format!("illegal block size: {block}"));
                        }
                        if !self.p.eat(",") {
                            break;
                        }
                    }
                    self.p.expect("}")?;
                }
                true
            }
            true => {
                let dim = self.integer()?;
                if dim < 0 {
                    return self.p.err(alloc::format!("illegal quantized dimension: {dim}"));
                }
                true
            }
            false => false,
        };
        self.p.expect(",")?;
        match listed {
            true => {
                self.p.expect("{")?;
                self.param_list(k)?;
            }
            false => self.params(k)?,
        }
        self.p.expect(">")
    }

    /// `parseAnyType` after `any`.
    fn any(&mut self) -> R<()> {
        self.p.expect("<")?;
        let s = self.storage()?;
        self.storage_range(s)?;
        if self.p.eat(":") {
            self.expressed()?;
        }
        self.p.expect(">")
    }

    /// `parseCalibratedType` after `calibrated`: `<f32<min:max>>`, `min < max`.
    fn calibrated(&mut self) -> R<()> {
        self.p.expect("<")?;
        self.expressed()?;
        self.p.expect("<")?;
        let min = self.float()?;
        self.p.expect(":")?;
        let max = self.float()?;
        self.p.expect(">")?;
        if max <= min {
            return self.p.err(alloc::format!("illegal min and max: ({min}:{max})"));
        }
        self.p.expect(">")
    }
}

/// The `quant` dialect's rules.
pub(super) struct Quant;

impl Quant {
    /// `text` (no whitespace) with each `!quant.uniform<..>`'s scales as the `f64` they are and
    /// a zero point of `0` left out: `1.0:0` and `1.000000e+00` are one scale.
    pub(super) fn canonical(text: &str) -> String {
        let Some(at) = text.find("!quant.uniform<") else { return text.into() };
        let mut out = String::from(&text[..at]);
        let mut rest = &text[at..];
        while !rest.is_empty() {
            let c = rest.as_bytes()[0];
            let after_word = out.as_bytes().last().is_some_and(|b| b.is_ascii_alphanumeric() || *b == b'_');
            let number = (c.is_ascii_digit() || (c == b'-' && rest.as_bytes().get(1).is_some_and(u8::is_ascii_digit))) && !after_word;
            if !number {
                out.push(char::from(c));
                rest = &rest[1..];
                continue;
            }
            let end = 1 + rest[1..].find(|ch: char| !(ch.is_ascii_alphanumeric() || matches!(ch, '.' | '+' | '-'))).unwrap_or(rest.len() - 1);
            let lit = &rest[..end];
            rest = &rest[end..];
            match lit.contains(['.', 'e', 'E']).then(|| lit.parse::<f64>().ok()).flatten() {
                Some(v) => {
                    out.push_str(&alloc::format!("{v:e}"));
                    // `:0` after a scale: the default zero point.
                    if let Some(tail) = rest.strip_prefix(":0")
                        && !tail.starts_with(|ch: char| ch.is_ascii_digit())
                    {
                        rest = tail;
                    }
                }
                None => out.push_str(lit),
            }
        }
        out
    }

    /// `!quant.<mnemonic><body>`: why `mlir-opt` would not read it.
    fn why(opt: &MlirOpt, mnemonic: &str, body: Option<&str>) -> Result<(), String> {
        let kind = Kind::try_from(mnemonic).map_err(|()| alloc::format!("unknown quantized type {mnemonic}"))?;
        let body = body.ok_or_else(|| alloc::format!("`quant.{mnemonic}` needs `<...>`"))?;
        let mut q = QuantText { p: Parser::new(body, opt) };
        let r = match kind {
            Kind::Uniform => q.uniform(),
            Kind::Any => q.any(),
            Kind::Calibrated => q.calibrated(),
            Kind::Quantile => q.quantile().map(drop),
        };
        r.and_then(|()| {
            q.p.ws();
            if q.p.rest().is_empty() { Ok(()) } else { q.p.err("expected end of the type") }
        })
        .map_err(|e| e.placed(body).to_string())
    }
}

impl DialectRules for Quant {
    #[inline]
    fn namespace(&self) -> &'static str {
        "quant"
    }

    fn ty(&self, v: &Verifier<'_>, t: &Type<'_>) -> Result<(), Invalid> {
        let Type::Extended(e) = t else { return Ok(()) };
        Self::why(v.opt, e.mnemonic(), e.body.as_deref()).map_err(|why| Invalid::DialectType { ty: t.to_string(), why })
    }
}
