use crate::Str;
use alloc::vec::Vec;
use core::fmt::Display;

use crate::common::{Dim, Extended, FloatKind, ShapedKind, Type};

pub struct EmitcType;

impl EmitcType {
    #[inline]
    fn named<'a>(name: &'static str) -> Type<'a> {
        Type::Extended(alloc::boxed::Box::new(Extended { name: Str::Borrowed(name), body: None, params: Vec::new() }))
    }

    #[inline]
    pub fn size_t<'a>() -> Type<'a> {
        Self::named("emitc.size_t")
    }

    #[inline]
    pub fn ptrdiff_t<'a>() -> Type<'a> {
        Self::named("emitc.ptrdiff_t")
    }

    #[inline]
    fn wrapped<'a>(name: &'static str, body: alloc::string::String) -> Type<'a> {
        Type::Extended(alloc::boxed::Box::new(Extended { name: Str::Borrowed(name), body: Some(Str::Owned(body)), params: Vec::new() }))
    }

    #[inline]
    pub fn lvalue<'a>(ty: impl Display) -> Type<'a> {
        Self::wrapped("emitc.lvalue", alloc::format!("<{ty}>"))
    }

    #[inline]
    pub fn ptr<'a>(ty: impl Display) -> Type<'a> {
        Self::wrapped("emitc.ptr", alloc::format!("<{ty}>"))
    }

    #[inline]
    pub fn void_ptr<'a>() -> Type<'a> {
        Self::ptr("!emitc.opaque<\"void\">")
    }

    pub fn array<'a>(dims: &[i64], elem: &Type<'_>) -> Type<'a> {
        let mut body = alloc::string::String::from("<");
        for d in dims {
            body.push_str(&alloc::format!("{d}x"));
        }
        Self::wrapped("emitc.array", alloc::format!("{body}{elem}>"))
    }

    pub fn array_parts<'x>(t: &'x Type<'_>) -> Option<(usize, &'x str)> {
        let Type::Extended(e) = t else { return None };
        if e.name != "emitc.array" {
            return None;
        }
        let mut rest = e.inner()?;
        let mut rank = 0;
        while let Some((_, tail)) = rest.split_once('x').filter(|(d, _)| !d.is_empty() && d.bytes().all(|c| c.is_ascii_digit())) {
            rank += 1;
            rest = tail;
        }
        Some((rank, rest))
    }

    pub fn kind<'x>(t: &'x Type<'_>) -> Option<&'x str> {
        match t {
            Type::Extended(e) => e.name.strip_prefix("emitc."),
            _ => None,
        }
    }

    #[inline]
    pub fn pointer_wide(t: &Type<'_>) -> bool {
        matches!(Self::kind(t), Some("size_t" | "ssize_t" | "ptrdiff_t"))
    }

    #[inline]
    pub fn integral(t: &Type<'_>) -> bool {
        matches!(t, Type::Integer { .. }) || Self::pointer_wide(t)
    }

    #[inline]
    pub fn supported_int(t: &Type<'_>) -> bool {
        matches!(t, Type::Integer { width: 1 | 8 | 16 | 32 | 64, .. })
    }

    #[inline]
    pub fn supported_float(t: &Type<'_>) -> bool {
        matches!(t, Type::Float(FloatKind::F16 | FloatKind::BF16 | FloatKind::F32 | FloatKind::F64))
    }

    pub fn supported(t: &Type<'_>) -> bool {
        match t {
            Type::Index => true,
            Type::Integer { .. } => Self::supported_int(t),
            Type::Float(_) => Self::supported_float(t),
            Type::Shaped(s) if s.kind == ShapedKind::Tensor => {
                let fixed = s.shape.as_ref().is_some_and(|d| d.iter().all(|d| matches!(d, Dim::Static(_))));
                fixed && Self::kind(&s.elem) != Some("array") && Self::supported(&s.elem)
            }
            Type::Tuple(ts) => ts.iter().all(|t| Self::kind(t) != Some("array") && Self::supported(t)),
            t => matches!(Self::kind(t), Some("opaque" | "ptr" | "array" | "size_t" | "ssize_t" | "ptrdiff_t")),
        }
    }
}
