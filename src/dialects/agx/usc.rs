//! The USC (shader core) instruction encodings: each instruction's fields and where their bits go,
//! the operand encodings' cases, the operand slots of an op, and operands as attributes.

use alloc::borrow::Cow;
use alloc::format;
use alloc::string::ToString;
use alloc::vec;
use alloc::vec::Vec;

use crate::{Attribute, Error, NamedAttr};
use serde::{Deserialize, Deserializer, Serialize, Serializer};

use super::{Enc, USC_HASHES, UscOp};
use crate::isa::IsaInt;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Kind {
    Int,
    Signed,
    Model(&'static str),
    Operand(Enc),
}

#[derive(Clone, Copy, Debug)]
pub struct UscField<'t> {
    pub name: &'t str,
    pub kind: Kind,
    pub bits: &'t [(u32, u32)],
    pub shift: u32,
}

#[derive(Clone, Copy, Debug)]
pub struct UscIns<'t> {
    pub op: &'t str,
    pub lengths: &'t [u32],
    pub length_bit: Option<u32>,
    pub mask: u128,
    pub value: u128,
    pub modifiers: &'t [UscField<'t>],
    pub immediates: &'t [UscField<'t>],
    pub dests: &'t [UscField<'t>],
    pub sources: &'t [UscField<'t>],
}

#[derive(Clone, Copy, Debug)]
pub struct UscCase<'t> {
    pub mask: u128,
    pub value: u128,
    pub field: Option<UscField<'t>>,
    pub modifiers: &'t [UscField<'t>],
}

impl UscField<'_> {
    pub fn width(&self) -> u32 {
        self.bits.iter().map(|(a, b)| b - a + 1).sum()
    }

    pub fn deposit(&self, v: u128) -> Result<u128, Error> {
        let w = self.width();
        if w < 128 && v >> w != 0 {
            return Err(Error(format!("{}: {v:#x} does not fit {w} bits", self.name)));
        }
        let mut out = 0;
        let mut at = 0;
        for &(a, b) in self.bits {
            let n = b - a + 1;
            out |= ((v >> at) & ((1u128 << n) - 1)) << a;
            at += n;
        }
        Ok(out)
    }

    pub fn raw(&self, a: &Attribute<'_>) -> Result<u128, Error> {
        let v = IsaInt::try_from(a).map(|v| v.0).or_else(|_| match a {
            Attribute::Unit | Attribute::Bool(true) => Ok(1),
            Attribute::Bool(false) => Ok(0),
            _ => Err(Error(format!("{}: {a} is not a number", self.name))),
        })?;
        let w = self.width() + self.shift;
        let v = if v < 0 { (v as i128 & ((1i128 << w) - 1)) as u128 } else { v as u128 };
        if v & ((1 << self.shift) - 1) != 0 {
            return Err(Error(format!("{}: {v:#x} is not a multiple of {}", self.name, 1u32 << self.shift)));
        }
        Ok(v >> self.shift)
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Slot {
    D0,
    S0,
    S1,
    S2,
    S3,
    S4,
    S5,
}

impl Slot {
    pub const NEG: [&str; 3] = ["neg0", "neg1", "neg2"];
    pub const ABS: [&str; 3] = ["abs0", "abs1", "abs2"];

    const ALL: [Slot; 7] = [Slot::D0, Slot::S0, Slot::S1, Slot::S2, Slot::S3, Slot::S4, Slot::S5];

    pub const fn key(self) -> &'static str {
        match self {
            Slot::D0 => "d0",
            Slot::S0 => "s0",
            Slot::S1 => "s1",
            Slot::S2 => "s2",
            Slot::S3 => "s3",
            Slot::S4 => "s4",
            Slot::S5 => "s5",
        }
    }

    pub const fn source(k: usize) -> Option<Slot> {
        match k {
            0 => Some(Slot::S0),
            1 => Some(Slot::S1),
            2 => Some(Slot::S2),
            3 => Some(Slot::S3),
            4 => Some(Slot::S4),
            5 => Some(Slot::S5),
            _ => None,
        }
    }

    pub const fn index(self) -> Option<usize> {
        match self {
            Slot::D0 => None,
            s => Some(s as usize - 1),
        }
    }
}

impl Slot {
    /// An op's `slots` attribute read back (none: no slots)
    pub fn list(a: Option<&Attribute<'_>>) -> Result<Vec<Slot>, Error> {
        match a {
            None => Ok(Vec::new()),
            Some(Attribute::Array(s)) => s
                .iter()
                .map(|x| match x {
                    Attribute::Str { lit, .. } => Slot::try_from(&**lit),
                    _ => Err(Error(format!("slot {x}"))),
                })
                .collect(),
            Some(a) => Err(Error(format!("slots = {a}"))),
        }
    }

    /// The `slots` attribute naming these slots
    pub fn attr<'a>(slots: &[Slot]) -> Attribute<'a> {
        Attribute::Array(slots.iter().map(|s| Attribute::Str { lit: s.key().into(), ty: None }).collect())
    }
}

impl TryFrom<&str> for Slot {
    type Error = Error;

    fn try_from(k: &str) -> Result<Slot, Error> {
        Slot::ALL.into_iter().find(|s| s.key() == k).ok_or_else(|| Error(format!("{k}: not a slot")))
    }
}

impl Serialize for Slot {
    fn serialize<S: Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        s.serialize_str(self.key())
    }
}

impl<'de> Deserialize<'de> for Slot {
    fn deserialize<D: Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        let k = <Cow<'de, str>>::deserialize(d)?;
        Slot::try_from(&*k).map_err(serde::de::Error::custom)
    }
}

pub trait UscOperand: Sized {
    const ENC: Enc;
    fn parts(&self) -> (usize, Vec<u32>);
    fn of_parts(case: usize, values: &[u32]) -> Result<Self, Error>;
}

impl Usc {
    pub fn case_bits(enc: Enc, k: usize, values: &[u32]) -> Result<u128, Error> {
        let case = enc.cases().get(k).ok_or_else(|| Error(format!("{} has no case {k}", enc.name())))?;
        let mut v = case.value;
        for (f, x) in case.field.iter().chain(case.modifiers).zip(values) {
            v |= f.deposit(u128::from(*x) >> f.shift)?;
        }
        Ok(v)
    }

    pub fn attr<O: UscOperand>(o: &O) -> Attribute<'static> {
        let (k, values) = o.parts();
        let case = &O::ENC.cases()[k];
        let int = |v: u64| Attribute::Int { lit: v.to_string().into(), ty: None };
        let mut d = vec![NamedAttr { name: "case".into(), value: Some(int(k as u64)) }];
        d.extend(case.field.iter().chain(case.modifiers).zip(&values).filter(|(_, x)| **x != 0).map(|(f, x)| NamedAttr { name: f.name.into(), value: Some(int(u64::from(*x))) }));
        Attribute::Dict(d)
    }

    pub fn of_attr<O: UscOperand>(a: &Attribute<'_>) -> Result<O, Error> {
        let Attribute::Dict(entries) = a else { return Err(Error(format!("{}: {a} is not an operand dictionary", O::ENC.name()))) };
        let num = |v: &Option<Attribute<'_>>| match v {
            None | Some(Attribute::Unit) => Ok(1),
            Some(a) => IsaInt::try_from(a).map(|v| v.0),
        };
        let mut k = 0;
        for e in entries.iter().filter(|e| e.name == "case") {
            k = num(&e.value)? as usize;
        }
        let case = O::ENC.cases().get(k).ok_or_else(|| Error(format!("{} has no case {k}", O::ENC.name())))?;
        let fields: Vec<&UscField<'_>> = case.field.iter().chain(case.modifiers).collect();
        let mut values = vec![0u32; fields.len()];
        for e in entries.iter().filter(|e| e.name != "case") {
            let at = fields.iter().position(|f| f.name == e.name).ok_or_else(|| Error(format!("{} case {k} has no {}", O::ENC.name(), e.name)))?;
            values[at] = u32::try_from(num(&e.value)?).map_err(|e| Error(e.to_string()))?;
        }
        O::of_parts(k, &values)
    }

    pub fn serialize_operand<O: UscOperand, S: Serializer>(o: &O, s: S) -> Result<S::Ok, S::Error> {
        Usc::attr(o).serialize(s)
    }

    pub fn deserialize_operand<'de, O: UscOperand, D: Deserializer<'de>>(d: D) -> Result<O, D::Error> {
        Usc::of_attr(&Attribute::deserialize(d)?).map_err(<D::Error as serde::de::Error>::custom)
    }
}

pub struct Usc;

impl Usc {
    pub fn op(name: &str) -> Option<UscOp> {
        let m = name.strip_prefix("agx.usc.")?;
        let h = m.bytes().fold(0xcbf2_9ce4_8422_2325, |h, b| (h ^ u64::from(b)).wrapping_mul(0x0100_0000_01b3));
        USC_HASHES.binary_search_by_key(&h, |(k, _)| *k).ok().map(|k| USC_HASHES[k].1).filter(|o| o.name() == m)
    }

    pub fn get(name: &str) -> Option<&'static UscIns<'static>> {
        Usc::op(name).map(UscOp::ins)
    }
}
