//! PM4 packets: a packet body's words, and the register spaces the `SET_*_REG` packets set.

use alloc::format;
use alloc::vec;

use super::RDNA2_PM4_OPCODES;
use crate::image::Fill;
use crate::isa::IsaInt;
use crate::{Attribute, Error};

/// A register space and the `SET_*_REG` packet that sets it
pub struct Pm4Space {
    pub start: u32,
    pub end: u32,
    pub op: &'static str,
}

const SPACES: &[Pm4Space] = &[
    Pm4Space { start: 0x8000, end: 0xb000, op: "rdna2.pm4.set_config_reg" },
    Pm4Space { start: 0xb000, end: 0xc000, op: "rdna2.pm4.set_sh_reg" },
    Pm4Space { start: 0x28000, end: 0x30000, op: "rdna2.pm4.set_context_reg" },
    Pm4Space { start: 0x30000, end: 0x40000, op: "rdna2.pm4.set_uconfig_reg" },
];

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Word {
    Dword(u32),
    Qword(Fill),
}

impl<'a> From<&Word> for Attribute<'a> {
    fn from(w: &Word) -> Self {
        match w {
            Word::Dword(v) => Attribute::Int { lit: format!("{v:#x}").into(), ty: None },
            Word::Qword(f) => Attribute::Array(vec![f.into()]),
        }
    }
}

impl TryFrom<&Attribute<'_>> for Word {
    type Error = Error;

    fn try_from(a: &Attribute<'_>) -> Result<Word, Error> {
        match a {
            Attribute::Array(q) if q.len() == 1 => Fill::try_from(&q[0]).map(Word::Qword),
            _ => u32::try_from(IsaInt::try_from(a)?.0).map(Word::Dword).map_err(|_| Error(format!("{a} is not a dword (a qword is [v])"))),
        }
    }
}

impl serde::Serialize for Word {
    fn serialize<S: serde::Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        serde::Serialize::serialize(&Attribute::from(self), s)
    }
}

impl<'de> serde::Deserialize<'de> for Word {
    fn deserialize<D: serde::Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        Word::try_from(&crate::image::attribute_of(d)?).map_err(serde::de::Error::custom)
    }
}

impl Pm4Space {
    /// Register ops' prefix (`rdna2.reg.compute_pgm_lo`)
    pub const REG: &'static str = "rdna2.reg.";

    /// The space register address `addr` is in
    pub fn of(addr: u32) -> Option<&'static Pm4Space> {
        SPACES.iter().find(|s| (s.start..s.end).contains(&addr))
    }

    /// The space packet op `op` sets
    pub fn named(op: &str) -> Option<&'static Pm4Space> {
        SPACES.iter().find(|s| s.op == op)
    }

    /// Packet op `name`'s type-3 opcode
    pub fn opcode(name: &str) -> Result<u32, Error> {
        RDNA2_PM4_OPCODES.binary_search_by(|(o, _)| o.cmp(&name)).map(|i| RDNA2_PM4_OPCODES[i].1).map_err(|_| Error(format!("{name} is not a PM4 packet")))
    }
}
