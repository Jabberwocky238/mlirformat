//! Memref layouts: `strided<[s0, s1, ...], offset: o>` as values.

use alloc::borrow::Cow;
use alloc::format;
use alloc::string::String;
use alloc::vec::Vec;

use crate::{Attribute, Dim, Shaped};

/// `StridedLayoutAttr`: strides and offset, [`Dim::DYNAMIC`] for `?`.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct StridedLayout {
    pub strides: Vec<i64>,
    pub offset: i64,
}

impl StridedLayout {
    /// `isIdentity`: `strided<[]>` or `strided<[1]>`, no offset.
    pub fn is_identity(&self) -> bool {
        self.offset == 0 && matches!(self.strides[..], [] | [1])
    }
}

impl TryFrom<&Attribute<'_>> for StridedLayout {
    type Error = ();

    /// `strided<[s0, s1], offset: o>`.
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
    /// As MLIR prints it: a zero offset left out.
    fn from(l: StridedLayout) -> Self {
        let num = |n: i64| if n == Dim::DYNAMIC { String::from("?") } else { format!("{n}") };
        let list = l.strides.iter().map(|n| num(*n)).collect::<Vec<_>>().join(", ");
        let body = if l.offset == 0 { format!("<[{list}]>") } else { format!("<[{list}], offset: {}>", num(l.offset)) };
        Attribute::Builtin { name: Cow::Borrowed("strided"), body: Cow::Owned(body), ty: None }
    }
}

impl Attribute<'_> {
    /// A `MemRefLayoutAttrInterface`: `strided<...>` or `affine_map<...>`.
    pub fn is_layout(&self) -> bool {
        matches!(self, Attribute::Builtin { name, .. } if name == "strided" || name == "affine_map")
    }
}

impl<'a> Shaped<'a> {
    /// The memref's layout attribute, when it has one.
    pub fn layout(&self) -> Option<&Attribute<'a>> {
        self.extras.iter().find(|a| a.is_layout())
    }

    /// The memref's `strided` layout, when that is its layout.
    pub fn strided(&self) -> Option<StridedLayout> {
        StridedLayout::try_from(self.layout()?).ok()
    }

    /// `getMemorySpace`: the attribute after the layout, when there is one.
    pub fn memory_space(&self) -> Option<&Attribute<'a>> {
        self.extras.iter().find(|a| !a.is_layout())
    }
}
