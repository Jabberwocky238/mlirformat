//! Upstream MLIR dialects described with `#[mlir::op]` / `#[mlir::dialect]`; the only module
//! allowed to `pub mod`.
//!
//! The `*.gen.rs` files come straight out of `mlirformat tblgen` (ODS `.td` ⇒ Rust) and are not
//! edited by hand; each comes from its entry file under `td/` (`td/mlir/Dialect/SCF/IR/scf.td`), and
//! `scripts/regen-dialects.sh` regenerates them all.

pub mod arith;
pub mod builtin;
pub mod cf;
pub mod complex;
pub mod func;
pub mod index;
pub mod math;
pub mod ub;

pub mod affine_ops;
pub mod gpu_ops;
pub mod emitc_types;
pub mod linalg_ops;
pub mod llvm_types;
pub mod scf_ops;
pub mod bufferization_ops;
pub mod spirv_types;
#[path = "affine.gen.rs"]
pub mod affine;
#[path = "amx.gen.rs"]
pub mod amx;
#[path = "bufferization.gen.rs"]
pub mod bufferization;
#[path = "async.gen.rs"]
pub mod r#async;
#[path = "emitc.gen.rs"]
pub mod emitc;
#[path = "gpu.gen.rs"]
pub mod gpu;
#[path = "llvm.gen.rs"]
pub mod llvm;
#[path = "linalg.gen.rs"]
pub mod linalg;
#[path = "memref.gen.rs"]
pub mod memref;
#[path = "pdl.gen.rs"]
pub mod pdl;
#[path = "scf.gen.rs"]
pub mod scf;
#[path = "shape.gen.rs"]
pub mod shape;
#[path = "tensor.gen.rs"]
pub mod tensor;
#[path = "spirv.gen.rs"]
pub mod spirv;
#[path = "tosa.gen.rs"]
pub mod tosa;
#[path = "vector.gen.rs"]
pub mod vector;
#[path = "x86vector.gen.rs"]
pub mod x86vector;
#[path = "amdgpu.gen.rs"]
pub mod amdgpu;
#[path = "arm_neon.gen.rs"]
pub mod arm_neon;
#[path = "arm_sme.gen.rs"]
pub mod arm_sme;
#[path = "arm_sve.gen.rs"]
pub mod arm_sve;
#[path = "nvgpu.gen.rs"]
pub mod nvgpu;
#[path = "nvvm.gen.rs"]
pub mod nvvm;
#[path = "rocdl.gen.rs"]
pub mod rocdl;
#[path = "xegpu.gen.rs"]
pub mod xegpu;
#[path = "xevm.gen.rs"]
pub mod xevm;
