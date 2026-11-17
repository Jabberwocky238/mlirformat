//! The GFX10 instruction ops (`rdna2.isa.salu`, …): opcodes, operands as LLVM writes them, operand
//! slots, and an instruction op's fields read back.

use alloc::format;
use alloc::string::ToString;
use alloc::vec::Vec;
use core::fmt;

use crate::{Attribute, Error, Type, Value, mlir};
use serde::{Deserialize, Deserializer, Serialize, Serializer};

use super::{HASHES, Opcode};
use crate::NamedAttr;
use crate::isa::IsaInt;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Format {
    Sop1,
    Sop2,
    Sopk,
    Sopp,
    Sopc,
    Smem,
    Ds,
    Flat,
    Global,
    Scratch,
    Vop1,
    Vop2,
    Vopc,
    Vop3,
    Vop3p,
    Mubuf,
    Mtbuf,
    Mimg,
    Exp,
    Vintrp,
}

const FIXED: &[(&str, u32)] = &[
    ("vcc_lo", 106),
    ("vcc", 106),
    ("vcc_hi", 107),
    ("m0", 124),
    ("null", Operand::NULL),
    ("off", Operand::NULL),
    ("exec_lo", 126),
    ("exec", 126),
    ("exec_hi", 127),
    ("vccz", 251),
    ("execz", 252),
    ("scc", 253),
];

const FLOATS: &[(&str, u32)] = &[("0.5", 240), ("-0.5", 241), ("1.0", 242), ("-1.0", 243), ("2.0", 244), ("-2.0", 245), ("4.0", 246), ("-4.0", 247)];

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Operand {
    pub code: u32,
    pub len: u32,
    pub literal: Option<u32>,
    pub neg: bool,
    pub abs: bool,
}

impl Operand {
    /// The null register (`null`, `off`)
    pub const NULL: u32 = 125;
    /// A literal dword follows the instruction
    pub const LITERAL: u32 = 255;
    /// The first VGPR's code (`v0`)
    pub const VGPR: u32 = 256;

    const fn plain(code: u32) -> Self {
        Operand { code, len: 1, literal: None, neg: false, abs: false }
    }

    pub const fn sgpr(r: u32, n: u32) -> Self {
        Operand { len: n, ..Self::plain(r) }
    }

    pub const fn vgpr(r: u32, n: u32) -> Self {
        Operand { len: n, ..Self::plain(Self::VGPR + r) }
    }

    pub fn vgprs(&self) -> core::ops::Range<u32> {
        match self.code {
            c @ Self::VGPR.. => c - Self::VGPR..c - Self::VGPR + self.len,
            _ => 0..0,
        }
    }
}

impl From<i64> for Operand {
    fn from(v: i64) -> Self {
        match v {
            0..=64 => Self::plain(128 + v as u32),
            -16..=-1 => Self::plain((192 - v) as u32),
            _ => Operand { literal: Some(v as u32), ..Self::plain(Self::LITERAL) },
        }
    }
}

impl TryFrom<&str> for Operand {
    type Error = Error;

    fn try_from(s: &str) -> Result<Operand, Error> {
        let s = s.trim();
        if let Some(r) = s.strip_prefix('-').filter(|r| !r.starts_with(|c: char| c.is_ascii_digit() || c == '.')) {
            return Operand::try_from(r).map(|o| Operand { neg: true, ..o });
        }
        if let Some(r) = s.strip_prefix('|').and_then(|r| r.strip_suffix('|')) {
            return Operand::try_from(r).map(|o| Operand { abs: true, ..o });
        }
        let range = |p: &str| -> Option<(u32, u32)> {
            let r = s.strip_prefix(p)?;
            match r.strip_prefix('[').and_then(|r| r.strip_suffix(']')) {
                Some(r) => {
                    let (a, b) = r.split_once(':')?;
                    let (a, b) = (a.parse::<u32>().ok()?, b.parse::<u32>().ok()?);
                    (b >= a).then_some((a, b - a + 1))
                }
                None => Some((r.parse().ok()?, 1)),
            }
        };
        if let Some((r, n)) = range("v") {
            return Ok(Operand::vgpr(r, n));
        }
        if let Some((r, n)) = range("s") {
            return Ok(Operand::sgpr(r, n));
        }
        if let Some((_, c)) = FIXED.iter().chain(FLOATS).find(|(n, _)| *n == s) {
            return Ok(Operand { len: if matches!(s, "vcc" | "exec") { 2 } else { 1 }, ..Operand::plain(*c) });
        }
        let v = match s.strip_prefix("0x") {
            Some(h) => i64::from_str_radix(h, 16),
            None => s.parse(),
        };
        v.map(Operand::from).map_err(|_| Error(format!("{s}: not an operand")))
    }
}

impl fmt::Display for Operand {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let (open, close) = if self.abs { ("|", "|") } else { ("", "") };
        let neg = if self.neg { "-" } else { "" };
        write!(f, "{neg}{open}")?;
        let range = |f: &mut fmt::Formatter<'_>, file: &str, r: u32| if self.len == 1 { write!(f, "{file}{r}") } else { write!(f, "{file}[{r}:{}]", r + self.len - 1) };
        match self.code {
            c @ Operand::VGPR.. => range(f, "v", c - Operand::VGPR)?,
            c @ 0..106 => range(f, "s", c)?,
            Operand::LITERAL => write!(f, "{:#x}", self.literal.unwrap_or(0))?,
            c @ 128..=192 => write!(f, "{}", c - 128)?,
            c @ 193..=208 => write!(f, "-{}", c - 192)?,
            c => match FIXED.iter().chain(FLOATS).find(|(_, k)| *k == c) {
                Some((n, _)) if self.len == 2 && matches!(*n, "vcc_lo" | "exec_lo") => f.write_str(&n[..n.len() - 3])?,
                Some((n, _)) => f.write_str(n)?,
                None => return Err(fmt::Error),
            },
        }
        f.write_str(close)
    }
}

impl From<Operand> for Attribute<'_> {
    fn from(o: Operand) -> Self {
        Attribute::Str { lit: o.to_string().into(), ty: None }
    }
}

impl Serialize for Operand {
    fn serialize<S: Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        s.collect_str(self)
    }
}

impl<'de> Deserialize<'de> for Operand {
    fn deserialize<D: Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        struct V;
        impl serde::de::Visitor<'_> for V {
            type Value = Operand;
            fn expecting(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                f.write_str("an operand as LLVM spells it")
            }
            fn visit_str<E: serde::de::Error>(self, s: &str) -> Result<Operand, E> {
                Operand::try_from(s).map_err(E::custom)
            }
            fn visit_i64<E: serde::de::Error>(self, v: i64) -> Result<Operand, E> {
                Ok(v.into())
            }
            fn visit_u64<E: serde::de::Error>(self, v: u64) -> Result<Operand, E> {
                i64::try_from(v).map(Operand::from).map_err(E::custom)
            }
        }
        d.deserialize_any(V)
    }
}

impl TryFrom<&str> for Opcode {
    type Error = Error;

    fn try_from(s: &str) -> Result<Opcode, Error> {
        let h = s.bytes().fold(0xcbf2_9ce4_8422_2325, |h, b| (h ^ u64::from(b)).wrapping_mul(0x0100_0000_01b3));
        HASHES.binary_search_by_key(&h, |(k, _)| *k).ok().map(|k| HASHES[k].1).filter(|o| o.name() == s).ok_or_else(|| Error(format!("{s}: not a GFX10 instruction")))
    }
}

impl Serialize for Opcode {
    fn serialize<S: Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        s.serialize_str(self.name())
    }
}

impl<'de> Deserialize<'de> for Opcode {
    fn deserialize<D: Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        struct V;
        impl serde::de::Visitor<'_> for V {
            type Value = Opcode;
            fn expecting(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                f.write_str("a GFX10 mnemonic")
            }
            fn visit_str<E: serde::de::Error>(self, s: &str) -> Result<Opcode, E> {
                Opcode::try_from(s).map_err(E::custom)
            }
        }
        d.deserialize_str(V)
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Slot {
    Src0,
    Src1,
    Src2,
    Addr,
    Data,
    Data0,
    Data1,
    Saddr,
    Sbase,
}

impl Slot {
    pub const fn key(self) -> &'static str {
        match self {
            Slot::Src0 => "src0",
            Slot::Src1 => "src1",
            Slot::Src2 => "src2",
            Slot::Addr => "addr",
            Slot::Data => "data",
            Slot::Data0 => "data0",
            Slot::Data1 => "data1",
            Slot::Saddr => "saddr",
            Slot::Sbase => "sbase",
        }
    }
}

impl Serialize for Slot {
    fn serialize<S: Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        s.serialize_str(self.key())
    }
}

impl<'de> Deserialize<'de> for Slot {
    fn deserialize<D: Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        struct V;
        impl serde::de::Visitor<'_> for V {
            type Value = Slot;
            fn expecting(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                f.write_str("a slot")
            }
            fn visit_str<E: serde::de::Error>(self, s: &str) -> Result<Slot, E> {
                Slot::try_from(s).map_err(E::custom)
            }
        }
        d.deserialize_str(V)
    }
}

#[mlir::op("rdna2.isa.salu", format = "(`(` $operands^ `:` type($operands) `)`)? attr-dict (`->` type($results)^)?", results(results))]
pub struct Salu<'a> {
    pub op: Opcode,
    pub dst: Option<Operand>,
    pub src0: Option<Operand>,
    pub src1: Option<Operand>,
    pub simm16: Option<i64>,
    #[slot(types)]
    pub operands: Vec<Value<'a>>,
    pub types: Vec<Type<'a>>,
    pub slots: Option<Vec<Slot>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("rdna2.isa.valu", format = "(`(` $operands^ `:` type($operands) `)`)? attr-dict (`->` type($results)^)?", results(results))]
pub struct Valu<'a> {
    pub op: Opcode,
    pub dst: Option<Operand>,
    pub sdst: Option<Operand>,
    pub src0: Option<Operand>,
    pub src1: Option<Operand>,
    pub src2: Option<Operand>,
    pub vop3: bool,
    pub clamp: bool,
    pub omod: Option<u32>,
    #[slot(types)]
    pub operands: Vec<Value<'a>>,
    pub types: Vec<Type<'a>>,
    pub slots: Option<Vec<Slot>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("rdna2.isa.smem", format = "(`(` $operands^ `:` type($operands) `)`)? attr-dict (`->` type($results)^)?", results(results))]
pub struct Smem<'a> {
    pub op: Opcode,
    pub dst: Option<Operand>,
    pub data: Option<Operand>,
    pub sbase: Option<Operand>,
    pub soffset: Option<Operand>,
    pub offset: Option<i64>,
    pub glc: bool,
    pub dlc: bool,
    #[slot(types)]
    pub operands: Vec<Value<'a>>,
    pub types: Vec<Type<'a>>,
    pub slots: Option<Vec<Slot>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("rdna2.isa.flat", format = "(`(` $operands^ `:` type($operands) `)`)? attr-dict (`->` type($results)^)?", results(results))]
pub struct Flat<'a> {
    pub op: Opcode,
    pub dst: Option<Operand>,
    pub addr: Option<Operand>,
    pub data: Option<Operand>,
    pub saddr: Option<Operand>,
    pub offset: Option<i64>,
    pub glc: bool,
    pub slc: bool,
    pub dlc: bool,
    #[slot(types)]
    pub operands: Vec<Value<'a>>,
    pub types: Vec<Type<'a>>,
    pub slots: Option<Vec<Slot>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("rdna2.isa.ds", format = "(`(` $operands^ `:` type($operands) `)`)? attr-dict (`->` type($results)^)?", results(results))]
pub struct Ds<'a> {
    pub op: Opcode,
    pub dst: Option<Operand>,
    pub addr: Option<Operand>,
    pub data0: Option<Operand>,
    pub data1: Option<Operand>,
    pub offset0: Option<i64>,
    pub offset1: Option<i64>,
    pub gds: bool,
    #[slot(types)]
    pub operands: Vec<Value<'a>>,
    pub types: Vec<Type<'a>>,
    pub slots: Option<Vec<Slot>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::dialect("rdna2", ops = [Salu, Valu, Smem, Flat, Ds])]
pub struct IsaOps;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Flag {
    Vop3,
    Clamp,
    Glc,
    Slc,
    Dlc,
    Gds,
}

impl Flag {
    pub const fn key(self) -> &'static str {
        match self {
            Flag::Vop3 => "vop3",
            Flag::Clamp => "clamp",
            Flag::Glc => "glc",
            Flag::Slc => "slc",
            Flag::Dlc => "dlc",
            Flag::Gds => "gds",
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Key {
    Op,
    Slots,
    Reg(Reg),
    Flag(Flag),
    Int(Int),
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Reg {
    Dst,
    Sdst,
    Src0,
    Src1,
    Src2,
    Addr,
    Data,
    Data0,
    Data1,
    Saddr,
    Sbase,
    Soffset,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Int {
    Simm16,
    Offset,
    Offset0,
    Offset1,
    Omod,
}

impl Reg {
    const ALL: usize = 12;
}

impl From<Slot> for Reg {
    fn from(s: Slot) -> Self {
        match s {
            Slot::Src0 => Reg::Src0,
            Slot::Src1 => Reg::Src1,
            Slot::Src2 => Reg::Src2,
            Slot::Addr => Reg::Addr,
            Slot::Data => Reg::Data,
            Slot::Data0 => Reg::Data0,
            Slot::Data1 => Reg::Data1,
            Slot::Saddr => Reg::Saddr,
            Slot::Sbase => Reg::Sbase,
        }
    }
}

impl TryFrom<&str> for Key {
    type Error = Error;

    fn try_from(k: &str) -> Result<Key, Error> {
        Ok(match k {
            "op" => Key::Op,
            "slots" => Key::Slots,
            "dst" => Key::Reg(Reg::Dst),
            "sdst" => Key::Reg(Reg::Sdst),
            "src0" => Key::Reg(Reg::Src0),
            "src1" => Key::Reg(Reg::Src1),
            "src2" => Key::Reg(Reg::Src2),
            "addr" => Key::Reg(Reg::Addr),
            "data" => Key::Reg(Reg::Data),
            "data0" => Key::Reg(Reg::Data0),
            "data1" => Key::Reg(Reg::Data1),
            "saddr" => Key::Reg(Reg::Saddr),
            "sbase" => Key::Reg(Reg::Sbase),
            "soffset" => Key::Reg(Reg::Soffset),
            "vop3" => Key::Flag(Flag::Vop3),
            "clamp" => Key::Flag(Flag::Clamp),
            "glc" => Key::Flag(Flag::Glc),
            "slc" => Key::Flag(Flag::Slc),
            "dlc" => Key::Flag(Flag::Dlc),
            "gds" => Key::Flag(Flag::Gds),
            "simm16" => Key::Int(Int::Simm16),
            "offset" => Key::Int(Int::Offset),
            "offset0" => Key::Int(Int::Offset0),
            "offset1" => Key::Int(Int::Offset1),
            "omod" => Key::Int(Int::Omod),
            _ => return Err(Error(format!("{k}: not an instruction field"))),
        })
    }
}

impl TryFrom<&str> for Slot {
    type Error = Error;

    fn try_from(k: &str) -> Result<Slot, Error> {
        match Key::try_from(k)? {
            Key::Reg(Reg::Src0) => Ok(Slot::Src0),
            Key::Reg(Reg::Src1) => Ok(Slot::Src1),
            Key::Reg(Reg::Src2) => Ok(Slot::Src2),
            Key::Reg(Reg::Addr) => Ok(Slot::Addr),
            Key::Reg(Reg::Data) => Ok(Slot::Data),
            Key::Reg(Reg::Data0) => Ok(Slot::Data0),
            Key::Reg(Reg::Data1) => Ok(Slot::Data1),
            Key::Reg(Reg::Saddr) => Ok(Slot::Saddr),
            Key::Reg(Reg::Sbase) => Ok(Slot::Sbase),
            _ => Err(Error(format!("{k}: not a slot"))),
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Family {
    Salu,
    Valu,
    Smem,
    Flat,
    Ds,
}

impl Family {
    pub fn of(name: &str) -> Option<Family> {
        use crate::Op;
        [(Salu::NAME, Family::Salu), (Valu::NAME, Family::Valu), (Smem::NAME, Family::Smem), (Flat::NAME, Family::Flat), (Ds::NAME, Family::Ds)].into_iter().find(|(n, _)| *n == name).map(|(_, f)| f)
    }

    const fn holds(format: Format) -> Option<Family> {
        Some(match format {
            Format::Sop1 | Format::Sop2 | Format::Sopk | Format::Sopp | Format::Sopc => Family::Salu,
            Format::Vop1 | Format::Vop2 | Format::Vopc | Format::Vop3 => Family::Valu,
            Format::Smem => Family::Smem,
            Format::Global | Format::Flat | Format::Scratch => Family::Flat,
            Format::Ds => Family::Ds,
            _ => return None,
        })
    }
}

#[derive(Clone, Debug)]
pub struct Fields {
    pub family: Family,
    pub op: Opcode,
    regs: [Option<Operand>; Reg::ALL],
    flags: u8,
    ints: [Option<i64>; 5],
    pub slots: Vec<Slot>,
    pub results: usize,
}

impl Fields {
    pub fn reg(&self, r: Reg) -> Option<Operand> {
        self.regs[r as usize]
    }

    pub fn flag(&self, f: Flag) -> bool {
        self.flags & (1 << f as u8) != 0
    }

    pub fn int(&self, i: Int) -> Option<i64> {
        self.ints[i as usize]
    }

    pub fn fields(&self) -> impl Iterator<Item = Operand> + '_ {
        self.regs.iter().flatten().copied()
    }

    pub fn global_load(&self) -> bool {
        self.op.format() == Format::Global && (self.results > 0 || self.reg(Reg::Dst).is_some())
    }

    /// The fields of instruction op `name` with attributes `attrs` and `results` results (`None`:
    /// not an instruction op)
    pub fn of<'r, 'a: 'r>(name: &str, attrs: impl IntoIterator<Item = &'r NamedAttr<'a>>, results: usize) -> Result<Option<Fields>, Error> {
        Family::of(name).map(|family| Fields::read(family, name, attrs, results)).transpose()
    }

    fn read<'r, 'a: 'r>(family: Family, name: &str, attrs: impl IntoIterator<Item = &'r NamedAttr<'a>>, results: usize) -> Result<Fields, Error> {
        let mut op = None;
        let mut f = Fields { family, op: Opcode::SNop, regs: [None; Reg::ALL], flags: 0, ints: [None; 5], slots: Vec::new(), results };
        let int = |v: &Attribute<'_>| IsaInt::try_from(v).map(|v| v.0);
        for a in attrs {
            let v = a.value.as_ref().unwrap_or(&Attribute::Unit);
            match Key::try_from(&*a.name)? {
                Key::Op => match v {
                    Attribute::Str { lit, .. } => op = Some(Opcode::try_from(&**lit)?),
                    _ => return Err(Error(format!("op = {v}"))),
                },
                Key::Slots => match v {
                    Attribute::Array(s) => {
                        f.slots = s
                            .iter()
                            .map(|x| match x {
                                Attribute::Str { lit, .. } => Slot::try_from(&**lit),
                                _ => Err(Error(format!("slot {x}"))),
                            })
                            .collect::<Result<_, _>>()?
                    }
                    _ => return Err(Error(format!("slots = {v}"))),
                },
                Key::Reg(r) => {
                    f.regs[r as usize] = Some(match v {
                        Attribute::Str { lit, .. } => Operand::try_from(&**lit)?,
                        _ => Operand::from(int(v)?),
                    })
                }
                Key::Flag(g) => f.flags |= u8::from(matches!(v, Attribute::Unit | Attribute::Bool(true))) << g as u8,
                Key::Int(i) => f.ints[i as usize] = Some(int(v)?),
            }
        }
        f.op = op.ok_or_else(|| Error(format!("{name}: no op")))?;
        if Family::holds(f.op.format()) != Some(family) {
            return Err(Error(format!("{:?} is {:?}, not in {family:?}", f.op, f.op.format())));
        }
        Ok(f)
    }
}
