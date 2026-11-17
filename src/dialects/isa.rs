//! What the GPU instruction-set dialects (`apple9`, `agx`, `rdna2`, `xe3`) share: register types
//! (`!apple9.r<u32>`), the stage a kernel runs as, their op tables, and `attr_ops!`, which declares
//! instruction ops whose fields are attributes.

use alloc::borrow::ToOwned;
use alloc::boxed::Box;
use alloc::collections::BTreeMap;
use alloc::format;
use alloc::vec::Vec;

use serde::{Deserialize, Serialize};

use crate::{Error, Extended, Type};

/// A register type: the dialect's register type name and what it holds (`!apple9.r<u32>`)
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct RegType<'t> {
    pub name: &'t str,
    pub elem: &'t str,
}

impl<'a> From<RegType<'_>> for Type<'a> {
    fn from(r: RegType<'_>) -> Self {
        Type::Extended(Box::new(Extended { name: r.name.to_owned().into(), body: Some(format!("<{}>", r.elem).into()), params: Vec::new() }))
    }
}

impl<'t> TryFrom<&'t Type<'_>> for RegType<'t> {
    type Error = Error;

    fn try_from(t: &'t Type<'_>) -> Result<RegType<'t>, Error> {
        let not = || Error(format!("{t} is not a register type"));
        let Type::Extended(e) = t else { return Err(not()) };
        let elem = e.inner().ok_or_else(not)?;
        Ok(RegType { name: &e.name, elem })
    }
}

/// The stage a kernel runs as
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum ShaderStage {
    Vertex,
    Fragment,
    Compute,
}

/// An instruction dialect's op infos: each op and its inherent attributes, no traits, effects unknown
pub struct OpRows;

impl OpRows {
    pub fn of(ops: &[crate::Template], inherent: &[(&'static str, &'static [&'static str])]) -> Vec<crate::OpInfo> {
        let inherent: BTreeMap<&str, &'static [&'static str]> = inherent.iter().rev().copied().collect();
        ops.iter()
            .map(|t| {
                let inherent = inherent.get(t.name).copied().unwrap_or_default();
                crate::OpInfo { name: t.name, traits: &[], effects: crate::Effects::Unknown, inherent }
            })
            .collect()
    }
}

/// Instruction ops whose fields are attributes: `"apple9.iadd"(%a, %b) {dst = 3} : (…) -> …`
#[macro_export]
macro_rules! attr_ops {
    ($ns:tt $set:ident; $($ty:ident $op:literal,)*) => {
        $(
            #[doc = concat!("`", $op, "`")]
            #[$crate::mlir::op($op, format = "(`(` $operands^ `:` type($operands) `)`)? attr-dict (`->` type($results)^)?", results(results))]
            pub struct $ty<'a> {
                #[slot(types)]
                pub operands: Vec<$crate::Value<'a>>,
                pub types: Vec<$crate::Type<'a>>,
                pub results: Vec<$crate::Type<'a>>,
            }
        )*

        #[$crate::mlir::dialect($ns, ops = [$($ty),*])]
        pub struct $set;
    };
}

/// An instruction's integer field: an integer attribute, hex literals too (`{offset = 0x10}`)
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct IsaInt(pub i64);

impl TryFrom<&crate::Attribute<'_>> for IsaInt {
    type Error = Error;

    fn try_from(a: &crate::Attribute<'_>) -> Result<IsaInt, Error> {
        match a {
            crate::Attribute::Int { lit, .. } => match lit.strip_prefix("0x") {
                Some(h) => i64::from_str_radix(h, 16),
                None => lit.parse(),
            }
            .map(IsaInt)
            .map_err(|_| Error(format!("bad integer {lit}"))),
            a => Err(Error(format!("{a} is not an integer"))),
        }
    }
}
