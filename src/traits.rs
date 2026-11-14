use alloc::collections::{BTreeMap, BTreeSet};
use alloc::vec::Vec;

macro_rules! traits {
    ($($t:ident,)*) => {
        #[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
        #[allow(non_camel_case_types)]
        pub enum Trait { $($t),* }
    };
}

#[path = "traits.gen.rs"]
mod table;

pub use table::Trait;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum EffectKind {
    Read,
    Write,
    Allocate,
    Free,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum EffectOn {
    Op,
    Operand(u32),
    Result(u32),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Effect {
    pub kind: EffectKind,
    pub on: EffectOn,
    pub resource: &'static str,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Effects {
    Unknown,
    Known(&'static [Effect]),
    Custom,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct OpInfo {
    pub name: &'static str,
    pub traits: &'static [Trait],
    pub effects: Effects,
    pub inherent: &'static [&'static str],
}

impl OpInfo {
    #[inline]
    pub fn has(&self, t: Trait) -> bool {
        self.traits.contains(&t)
    }
}

#[derive(Debug, Clone, Default)]
pub struct OpInfos {
    ops: BTreeMap<&'static str, OpInfo>,
    dialects: BTreeSet<&'static str>,
}

impl OpInfos {
    #[inline]
    pub const fn new() -> Self {
        Self { ops: BTreeMap::new(), dialects: BTreeSet::new() }
    }

    pub fn upstream() -> Self {
        let mut infos = Self::new();
        infos.register_upstream_ops();
        for ns in [
            "acc", "affine", "amdgpu", "arith", "arm_neon", "arm_sme", "arm_sve", "async", "bufferization", "builtin", "cf", "complex", "dlti", "emitc", "func", "gpu", "index", "irdl", "linalg", "llvm", "math", "memref", "ml_program", "mpi", "nvgpu", "nvvm", "omp", "pdl", "pdl_interp", "ptr", "quant", "rocdl", "scf", "shape", "shard", "smt", "sparse_tensor", "spirv", "tensor", "test", "test_dyn", "test_irdl_to_cpp", "tosa", "transform", "ub", "vector", "wasmssa", "x86", "xegpu", "xevm",
        ] {
            infos.dialect(ns);
        }
        infos
    }

    #[inline]
    pub fn insert(&mut self, info: OpInfo) {
        self.ops.insert(info.name, info);
    }

    #[inline]
    pub fn of_dialect(&self, ns: &str) -> Vec<OpInfo> {
        self.ops.values().filter(|i| i.name.split_once('.').is_some_and(|(d, _)| d == ns)).copied().collect()
    }

    #[inline]
    pub fn dialect(&mut self, ns: &'static str) {
        self.dialects.insert(ns);
    }

    #[inline]
    pub fn op_info(&self, name: &str) -> Option<&OpInfo> {
        self.ops.get(name)
    }

    #[inline]
    pub fn knows_dialect(&self, ns: &str) -> bool {
        self.dialects.contains(ns)
    }
}
