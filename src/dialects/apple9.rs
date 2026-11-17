//! Apple G13 (M1 … M3 family, "apple9") GPU instructions as an MLIR dialect: `apple9.kernel` and one op
//! per instruction form, its operands and fields as attributes; `Apple9Op` says what each form reads
//! and how it orders. Not an upstream dialect: load it with `MlirOpt::load(Apple9Dialect)`. The
//! machine code is mlirbinary's.

use alloc::format;
use alloc::vec::Vec;

use crate::isa::{RegType, ShaderStage};
use crate::{Attribute, Error, Region, Type, mlir};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Apple9Type<'e>(pub &'e str);

impl<'a> From<Apple9Type<'_>> for Type<'a> {
    fn from(r: Apple9Type<'_>) -> Self {
        RegType { name: "apple9.r", elem: r.0 }.into()
    }
}

impl<'t> TryFrom<&'t Type<'_>> for Apple9Type<'t> {
    type Error = Error;

    fn try_from(t: &'t Type<'_>) -> Result<Apple9Type<'t>, Error> {
        match RegType::try_from(t)? {
            RegType { name: "apple9.r", elem } => Ok(Apple9Type(elem)),
            _ => Err(Error(format!("{t} is not an apple9 register"))),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct Apple9Dialect;

impl Apple9Dialect {
    pub const INHERENT: &[(&str, &[&str])] = &[("apple9.kernel", &["sym_name", "stage", "params", "gprs"])];
}

impl crate::Dialect for Apple9Dialect {
    fn namespace(&self) -> &'static str {
        "apple9"
    }

    fn ops(&self) -> Vec<crate::Template> {
        [PseudoOps.ops(), IsaOps.ops()].concat()
    }

    fn op_infos(&self) -> Vec<crate::OpInfo> {
        crate::isa::OpRows::of(&self.ops(), Self::INHERENT)
    }
}

#[mlir::op("apple9.kernel", format = "$sym_name attr-dict-with-keyword $body")]
pub struct Apple9Kernel<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub stage: Option<ShaderStage>,
    pub params: Option<u32>,
    pub gprs: Option<u32>,
    pub shared: Option<u32>,
    pub workgroup: Option<u32>,
    pub body: Region<'a>,
}

#[mlir::dialect("apple9", ops = [Apple9Kernel])]
struct PseudoOps;

crate::attr_ops! { "apple9" IsaOps;
    Apple9GetSr "apple9.get_sr", Apple9GetSr16 "apple9.get_sr16", Apple9Mov "apple9.mov", Apple9MovImm "apple9.mov_imm",
    Apple9Iadd "apple9.iadd", Apple9Isub "apple9.isub", Apple9Imad "apple9.imad", Apple9Shl "apple9.shl",
    Apple9Shr "apple9.shr", Apple9Asr "apple9.asr", Apple9And "apple9.and", Apple9Or "apple9.or", Apple9Xor "apple9.xor",
    Apple9Smin "apple9.smin", Apple9Smax "apple9.smax", Apple9Umin "apple9.umin", Apple9Umax "apple9.umax",
    Apple9Select "apple9.select", Apple9I2f "apple9.i2f", Apple9F2i "apple9.f2i", Apple9Fadd "apple9.fadd",
    Apple9Fmul "apple9.fmul", Apple9Fsub "apple9.fsub", Apple9Fma "apple9.fma", Apple9Fmin "apple9.fmin",
    Apple9Fmax "apple9.fmax", Apple9Rcp "apple9.rcp", Apple9Rsq "apple9.rsq", Apple9Floor "apple9.floor",
    Apple9Ceil "apple9.ceil", Apple9Trunc "apple9.trunc", Apple9Roundeven "apple9.roundeven", Apple9Load "apple9.load",
    Apple9Store "apple9.store", Apple9Atomic "apple9.atomic", Apple9Cmpxchg "apple9.cmpxchg", Apple9SharedAtomic "apple9.shared_atomic", Apple9SharedLoad "apple9.shared_load",
    Apple9SharedStore "apple9.shared_store", Apple9Barrier "apple9.barrier", Apple9Pred "apple9.pred",
    Apple9Push "apple9.push", Apple9Else "apple9.else", Apple9Pop "apple9.pop", Apple9LoopPush "apple9.loop_push",
    Apple9LoopUpdate "apple9.loop_update", Apple9LoopPop "apple9.loop_pop", Apple9JmpAny "apple9.jmp_any",
    Apple9JmpNone "apple9.jmp_none", Apple9Label "apple9.label", Apple9Halt "apple9.halt",
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Apple9Op {
    GetSr,
    GetSr16,
    Mov,
    MovImm,
    Iadd,
    Isub,
    Imad,
    Shl,
    Shr,
    Asr,
    And,
    Or,
    Xor,
    Smin,
    Smax,
    Umin,
    Umax,
    Select,
    I2f,
    F2i,
    Fadd,
    Fsub,
    Fmul,
    Fma,
    Fmin,
    Fmax,
    Rcp,
    Rsq,
    Floor,
    Ceil,
    Trunc,
    Roundeven,
    Load,
    Store,
    Atomic,
    Cmpxchg,
    SharedAtomic,
    SharedLoad,
    SharedStore,
    Barrier,
    Pred,
    Push,
    Else,
    Pop,
    LoopPush,
    LoopUpdate,
    LoopPop,
    JmpAny,
    JmpNone,
    Label,
    Halt,
}

impl Apple9Op {
    const ALL: [(&'static str, Apple9Op); 51] = [
        ("apple9.get_sr", Apple9Op::GetSr),
        ("apple9.get_sr16", Apple9Op::GetSr16),
        ("apple9.mov", Apple9Op::Mov),
        ("apple9.mov_imm", Apple9Op::MovImm),
        ("apple9.iadd", Apple9Op::Iadd),
        ("apple9.isub", Apple9Op::Isub),
        ("apple9.imad", Apple9Op::Imad),
        ("apple9.shl", Apple9Op::Shl),
        ("apple9.shr", Apple9Op::Shr),
        ("apple9.asr", Apple9Op::Asr),
        ("apple9.and", Apple9Op::And),
        ("apple9.or", Apple9Op::Or),
        ("apple9.xor", Apple9Op::Xor),
        ("apple9.smin", Apple9Op::Smin),
        ("apple9.smax", Apple9Op::Smax),
        ("apple9.umin", Apple9Op::Umin),
        ("apple9.umax", Apple9Op::Umax),
        ("apple9.select", Apple9Op::Select),
        ("apple9.i2f", Apple9Op::I2f),
        ("apple9.f2i", Apple9Op::F2i),
        ("apple9.fadd", Apple9Op::Fadd),
        ("apple9.fmul", Apple9Op::Fmul),
        ("apple9.fsub", Apple9Op::Fsub),
        ("apple9.fma", Apple9Op::Fma),
        ("apple9.fmin", Apple9Op::Fmin),
        ("apple9.fmax", Apple9Op::Fmax),
        ("apple9.rcp", Apple9Op::Rcp),
        ("apple9.rsq", Apple9Op::Rsq),
        ("apple9.floor", Apple9Op::Floor),
        ("apple9.ceil", Apple9Op::Ceil),
        ("apple9.trunc", Apple9Op::Trunc),
        ("apple9.roundeven", Apple9Op::Roundeven),
        ("apple9.load", Apple9Op::Load),
        ("apple9.store", Apple9Op::Store),
        ("apple9.atomic", Apple9Op::Atomic),
        ("apple9.cmpxchg", Apple9Op::Cmpxchg),
        ("apple9.shared_atomic", Apple9Op::SharedAtomic),
        ("apple9.shared_load", Apple9Op::SharedLoad),
        ("apple9.shared_store", Apple9Op::SharedStore),
        ("apple9.barrier", Apple9Op::Barrier),
        ("apple9.pred", Apple9Op::Pred),
        ("apple9.push", Apple9Op::Push),
        ("apple9.else", Apple9Op::Else),
        ("apple9.pop", Apple9Op::Pop),
        ("apple9.loop_push", Apple9Op::LoopPush),
        ("apple9.loop_update", Apple9Op::LoopUpdate),
        ("apple9.loop_pop", Apple9Op::LoopPop),
        ("apple9.jmp_any", Apple9Op::JmpAny),
        ("apple9.jmp_none", Apple9Op::JmpNone),
        ("apple9.label", Apple9Op::Label),
        ("apple9.halt", Apple9Op::Halt),
    ];

    pub fn of(name: &str) -> Option<Apple9Op> {
        Apple9Op::ALL.iter().find(|(n, _)| *n == name).map(|(_, o)| *o)
    }

    pub fn name(self) -> &'static str {
        Apple9Op::ALL.iter().find(|(_, o)| *o == self).map(|(n, _)| *n).expect("every form is named")
    }

    pub fn sources(self) -> &'static [&'static str] {
        use Apple9Op::*;
        match self {
            GetSr | GetSr16 | MovImm | Halt | Barrier | Push | Else | Pop | LoopPush | LoopUpdate | LoopPop | JmpAny | JmpNone | Label => &[],
            Mov | I2f | F2i | Rcp | Rsq | Floor | Ceil | Trunc | Roundeven => &["a"],
            Iadd | Isub | Shl | Shr | Asr | And | Or | Xor | Smin | Smax | Umin | Umax | Fadd | Fsub | Fmul | Fmin | Fmax | Pred => &["a", "b"],
            Imad | Fma => &["a", "b", "c"],
            Select => &["a", "b", "t", "f"],
            Load | SharedLoad => &["index"],
            Store | SharedStore | Cmpxchg => &["data", "index"],
            Atomic => &["a", "index"],
            SharedAtomic => &["data", "index"],
        }
    }

    pub fn has_dst(self) -> bool {
        !matches!(self, Apple9Op::Store | Apple9Op::SharedStore | Apple9Op::Barrier | Apple9Op::Halt) && !self.controls()
    }

    pub fn controls(self) -> bool {
        use Apple9Op::*;
        matches!(self, Pred | Push | Else | Pop | LoopPush | LoopUpdate | LoopPop | JmpAny | JmpNone | Label)
    }

    pub fn completes(self) -> bool {
        matches!(self, Apple9Op::GetSr | Apple9Op::GetSr16 | Apple9Op::Load | Apple9Op::SharedLoad | Apple9Op::Atomic | Apple9Op::Cmpxchg | Apple9Op::SharedAtomic)
    }

    pub fn releases(self) -> bool {
        use Apple9Op::*;
        matches!(self, Iadd | Isub | Imad | Shl | Shr | Asr | And | Or | Xor | Smin | Smax | Umin | Umax | Fmin | Fmax | Fadd | Fsub | Fmul | Fma | Select | I2f | F2i | Floor | Ceil | Trunc | Roundeven | Load | SharedLoad | Store | SharedStore)
    }

    pub fn slot(self) -> Option<u32> {
        matches!(self, Apple9Op::Atomic | Apple9Op::Cmpxchg).then_some(6)
    }

    pub fn waits(self) -> bool {
        use Apple9Op::*;
        matches!(self, Iadd | Isub | Load | Store | SharedLoad | SharedStore | Atomic | Cmpxchg | SharedAtomic)
    }
}

pub const APPLE9_GPRS: u32 = 96;
