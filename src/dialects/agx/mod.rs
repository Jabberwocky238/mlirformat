//! Apple AGX (G13): the USC shader instructions with their encodings (Mesa's AGX2 model), the
//! command-buffer structs (Mesa's asahi genxml) and their layout tables, and kernels.

mod usc;

pub use usc::{Kind as UscKind, Slot as AgxSlot, Usc, UscCase, UscField, UscIns, UscOperand};
use usc::{Kind, Slot};

use alloc::format;
use alloc::vec::Vec;

use crate::image::Layouts;
use crate::isa::{OpRows, RegType, ShaderStage};
use crate::{Attribute, Error, Region, Type, mlir};

/// The command-buffer structs' layouts
pub const AGX: Layouts<'_> = Layouts(AGX_ITEMS);

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum AgxType<'e> {
    R(&'e str),
    U(&'e str),
}

impl<'a> From<AgxType<'_>> for Type<'a> {
    fn from(r: AgxType<'_>) -> Self {
        let (name, elem) = match r {
            AgxType::R(e) => ("agx.r", e),
            AgxType::U(e) => ("agx.u", e),
        };
        RegType { name, elem }.into()
    }
}

impl<'t> TryFrom<&'t Type<'_>> for AgxType<'t> {
    type Error = Error;

    fn try_from(t: &'t Type<'_>) -> Result<AgxType<'t>, Error> {
        match RegType::try_from(t)? {
            RegType { name: "agx.r", elem } => Ok(AgxType::R(elem)),
            RegType { name: "agx.u", elem } => Ok(AgxType::U(elem)),
            _ => Err(Error(format!("{t} is not a agx register"))),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct AgxDialect;

impl crate::Dialect for AgxDialect {
    fn namespace(&self) -> &'static str {
        "agx"
    }

    fn ops(&self) -> Vec<crate::Template> {
        [StructOps.ops(), UscOps.ops(), PseudoOps.ops()].concat()
    }

    fn op_infos(&self) -> Vec<crate::OpInfo> {
        OpRows::of(&self.ops(), &[("agx.usc.input", &["uniform"]), ("agx.kernel", &["sym_name", "stage", "params", "gprs", "align"])])
    }
}

#[mlir::op("agx.usc.input", format = "attr-dict `->` type($result)", results(result))]
pub struct UscInput<'a> {
    #[attr(int = "i64")]
    pub uniform: i64,
    pub result: Type<'a>,
}

#[mlir::op("agx.kernel", format = "$sym_name attr-dict-with-keyword $body")]
pub struct AgxKernel<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub stage: Option<ShaderStage>,
    pub params: Option<u32>,
    pub gprs: Option<u32>,
    pub align: Option<u64>,
    pub body: Region<'a>,
}

#[mlir::dialect("agx", ops = [UscInput, AgxKernel])]
pub struct PseudoOps;

#[allow(non_snake_case, reason = "Mesa's field names")]
#[path = "cmdbuf.gen.rs"]
mod cmdbuf;
#[path = "usc.gen.rs"]
mod isa;

pub use cmdbuf::*;
pub use isa::*;
