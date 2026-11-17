//! AMD RDNA2 (gfx1036): the GFX10 instruction ops, the registers (Mesa's register database) and PM4
//! packets, kernels.

mod isa;
#[path = "opcodes.gen.rs"]
mod opcodes;
mod pm4;
#[path = "regs.gen.rs"]
mod regs;

use alloc::format;
use alloc::vec::Vec;

use crate::image::Layouts;
use crate::isa::{OpRows, RegType, ShaderStage};
use crate::{Attribute, Error, Region, Type, mlir};

pub use isa::{Ds as Rdna2Ds, Family as Rdna2Family, Fields as Rdna2Fields, Flag as Rdna2Flag, Flat as Rdna2Flat, Format as Rdna2Format, Int as Rdna2Int, Key as Rdna2Key, Operand as Rdna2Operand, Reg as Rdna2Reg, Salu as Rdna2Salu, Slot as Rdna2Slot, Smem as Rdna2Smem, Valu as Rdna2Valu};
pub use opcodes::{HASHES as RDNA2_HASHES, Opcode as Rdna2Opcode};
pub use pm4::{Pm4Space, Word as Rdna2Word};
pub use regs::*;

use isa::{Format, IsaOps};
use opcodes::{HASHES, Opcode};
use pm4::Word;

/// The registers' and packet dwords' layouts
pub const RDNA2: Layouts<'_> = Layouts(RDNA2_ITEMS);

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Rdna2Type<'e> {
    V(&'e str),
    S(&'e str),
}

impl<'a> From<Rdna2Type<'_>> for Type<'a> {
    fn from(r: Rdna2Type<'_>) -> Self {
        let (name, elem) = match r {
            Rdna2Type::V(e) => ("rdna2.v", e),
            Rdna2Type::S(e) => ("rdna2.s", e),
        };
        RegType { name, elem }.into()
    }
}

impl<'t> TryFrom<&'t Type<'_>> for Rdna2Type<'t> {
    type Error = Error;

    fn try_from(t: &'t Type<'_>) -> Result<Rdna2Type<'t>, Error> {
        match RegType::try_from(t)? {
            RegType { name: "rdna2.v", elem } => Ok(Rdna2Type::V(elem)),
            RegType { name: "rdna2.s", elem } => Ok(Rdna2Type::S(elem)),
            _ => Err(Error(format!("{t} is not a rdna2 register"))),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct Rdna2Dialect;

impl Rdna2Dialect {
    pub const INHERENT: &[(&str, &[&str])] = &[("rdna2.isa.input", &["reg"]), ("rdna2.kernel", &["sym_name", "stage", "params", "sgprs", "vgprs", "pad", "align"])];
}

impl crate::Dialect for Rdna2Dialect {
    fn namespace(&self) -> &'static str {
        "rdna2"
    }

    fn ops(&self) -> Vec<crate::Template> {
        [TypedRegOps.ops(), PacketOps.ops(), SetOps.ops(), PseudoOps.ops(), IsaOps.ops()].concat()
    }

    fn op_infos(&self) -> Vec<crate::OpInfo> {
        OpRows::of(&self.ops(), &[RDNA2_INHERENT, Self::INHERENT].concat())
    }
}

#[mlir::op("rdna2.isa.input", format = "attr-dict `->` type($result)", results(result))]
pub struct Rdna2Input<'a> {
    #[attr(int = "i64")]
    pub reg: i64,
    pub result: Type<'a>,
}

#[mlir::op("rdna2.kernel", format = "$sym_name attr-dict-with-keyword $body")]
pub struct Rdna2Kernel<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub stage: Option<ShaderStage>,
    pub params: Option<u32>,
    pub sgprs: Option<u32>,
    pub vgprs: Option<u32>,
    pub pad: Option<u64>,
    pub align: Option<u64>,
    pub body: Region<'a>,
}

#[mlir::dialect("rdna2", ops = [Rdna2Input, Rdna2Kernel])]
struct PseudoOps;

macro_rules! sets {
    ($($ty:ident $op:literal;)*) => {
        $(
            #[doc = concat!("`", $op, "`")]
            #[mlir::op($op, format = "attr-dict-with-keyword $body")]
            pub struct $ty<'a> {
                pub body: Region<'a>,
            }
        )*

        #[mlir::dialect("rdna2", ops = [$($ty),*])]
        struct SetOps;
    };
}

sets! {
    Pm4SetConfigReg "rdna2.pm4.set_config_reg";
    Pm4SetShReg "rdna2.pm4.set_sh_reg";
    Pm4SetContextReg "rdna2.pm4.set_context_reg";
    Pm4SetUconfigReg "rdna2.pm4.set_uconfig_reg";
}
