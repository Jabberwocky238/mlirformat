use crate::Str;
use alloc::format;
use alloc::string::String;
use alloc::vec::Vec;

use crate::{Attribute, Dim, Shaped};

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct StridedLayout {
    pub strides: Vec<i64>,
    pub offset: i64,
}

impl StridedLayout {
    #[inline]
    pub fn is_identity(&self) -> bool {
        self.offset == 0 && matches!(self.strides[..], [] | [1])
    }
}

impl TryFrom<&Attribute<'_>> for StridedLayout {
    type Error = ();

    fn try_from(a: &Attribute<'_>) -> Result<Self, ()> {
        let Attribute::Builtin { name, body, .. } = a else { return Err(()) };
        if name != "strided" {
            return Err(());
        }
        let inner = body.trim().strip_prefix('<').and_then(|b| b.strip_suffix('>')).ok_or(())?;
        let (list, rest) = inner.split_once(']').ok_or(())?;
        let num = |t: &str| if t.trim() == "?" { Ok(Dim::DYNAMIC) } else { t.trim().parse().map_err(|_| ()) };
        let strides = list.trim_start().strip_prefix('[').ok_or(())?.split(',').filter(|t| !t.trim().is_empty()).map(num).collect::<Result<Vec<_>, ()>>()?;
        let offset = match rest.split_once("offset:") {
            Some((_, o)) => num(o)?,
            None => 0,
        };
        Ok(StridedLayout { strides, offset })
    }
}

impl From<StridedLayout> for Attribute<'_> {
    fn from(l: StridedLayout) -> Self {
        let num = |n: i64| if n == Dim::DYNAMIC { String::from("?") } else { format!("{n}") };
        let list = l.strides.iter().map(|n| num(*n)).collect::<Vec<_>>().join(", ");
        let body = if l.offset == 0 { format!("<[{list}]>") } else { format!("<[{list}], offset: {}>", num(l.offset)) };
        Attribute::Builtin { name: Str::Borrowed("strided"), body: Str::Owned(body), ty: None }
    }
}

impl Attribute<'_> {
    #[inline]
    pub fn is_layout(&self) -> bool {
        matches!(self, Attribute::Builtin { name, .. } if name == "strided" || name == "affine_map")
    }

    #[inline]
    pub fn is_identity_map(&self) -> bool {
        crate::AffineMap::try_from(self).is_ok_and(|m| m.is_identity())
    }
}

impl<'a> Shaped<'a> {
    #[inline]
    pub fn layout(&self) -> Option<&Attribute<'a>> {
        self.extras.iter().find(|a| a.is_layout())
    }

    #[inline]
    pub fn strided(&self) -> Option<StridedLayout> {
        StridedLayout::try_from(self.layout()?).ok()
    }

    #[inline]
    pub fn memory_space(&self) -> Option<&Attribute<'a>> {
        self.extras.iter().find(|a| !a.is_layout())
    }
}
