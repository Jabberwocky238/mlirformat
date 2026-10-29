//! `quant` dialect types as values.
//!
//! The body of `!quant.uniform<...>` stays text in [`Extended`]; [`UniformQuantized`] reads and
//! writes it as `mlir-opt` prints it.

use alloc::borrow::Cow;
use alloc::format;
use alloc::string::String;
use alloc::vec::Vec;

use crate::{Content, Extended, MlirOpt, Parser, Signedness, Str, Type};

/// `UniformQuantizedType` (one scale for the whole tensor):
/// `!quant.uniform<i8<-127:127>:f32, 0.5:-3>`.
#[derive(Debug, Clone, PartialEq)]
pub struct UniformQuantized<'a> {
    /// `i` (signed) or `u` storage.
    pub signed: bool,
    pub width: u32,
    /// `<min:max>`: a storage range narrower than the type's.
    pub range: Option<(i64, i64)>,
    pub expressed: Type<'a>,
    /// The scale as written.
    pub scale: Str<'a>,
    pub zero_point: i64,
}

impl<'a> UniformQuantized<'a> {
    /// `getStorageElementTypeFromQuantized` (TOSA): the storage integer type, unsigned for
    /// `u` storage (`getStorageType` alone is signless).
    #[inline]
    pub fn storage_type(&self) -> Type<'a> {
        if self.signed { Type::int(self.width) } else { Type::Integer { width: self.width, signedness: Signedness::Unsigned } }
    }
}

impl TryFrom<&Type<'_>> for UniformQuantized<'static> {
    type Error = ();

    /// A per-layer `!quant.uniform`; a per-axis one (`{...}` scales) is not one.
    fn try_from(t: &Type<'_>) -> Result<Self, ()> {
        let Type::Extended(e) = t else { return Err(()) };
        let body = e.body.as_deref().filter(|b| e.name == "quant.uniform" && !b.contains('{')).ok_or(())?;
        let inner = body.trim().strip_prefix('<').and_then(|b| b.strip_suffix('>')).ok_or(())?;
        let (storage, rest) = inner.split_once(':').ok_or(())?;
        let (storage, rest) = match storage.split_once('<') {
            // `i8<-127:127>`: the range's own `:` was taken for the storage's.
            Some((s, min)) => {
                let (max, rest) = rest.split_once('>').ok_or(())?;
                (s, (Some((min.trim().parse().map_err(|_| ())?, max.trim().parse().map_err(|_| ())?)), rest.trim_start().strip_prefix(':').ok_or(())?))
            }
            None => (storage, (None, rest)),
        };
        let (range, rest) = rest;
        let storage = storage.trim();
        let signed = match storage.chars().next() {
            Some('i') => true,
            Some('u') => false,
            _ => return Err(()),
        };
        let width = storage[1..].parse().map_err(|_| ())?;
        let (expressed, params) = rest.split_once(',').ok_or(())?;
        let opt = MlirOpt::new();
        let expressed = Parser::new(expressed.trim(), &opt).ty().ok().and_then(|t| Content::convert(&t).ok()).ok_or(())?;
        let (scale, zero_point) = match params.split_once(':') {
            Some((s, z)) => (s.trim(), z.trim().parse().map_err(|_| ())?),
            None => (params.trim(), 0),
        };
        Ok(UniformQuantized { signed, width, range, expressed, scale: Cow::Owned(String::from(scale)), zero_point })
    }
}

impl<'a> From<UniformQuantized<'a>> for Type<'a> {
    /// A zero zero-point left out, as MLIR prints it.
    fn from(q: UniformQuantized<'a>) -> Self {
        let range = q.range.map_or_else(String::new, |(lo, hi)| format!("<{lo}:{hi}>"));
        let zp = if q.zero_point == 0 { String::new() } else { format!(":{}", q.zero_point) };
        let body = format!("<{}{}{range}:{}, {}{zp}>", if q.signed { 'i' } else { 'u' }, q.width, q.expressed, q.scale);
        Type::Extended(Extended { name: Cow::Borrowed("quant.uniform"), body: Some(Cow::Owned(body)), params: Vec::new() })
    }
}
