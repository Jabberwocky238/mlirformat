//! Upstream MLIR dialects described with `#[mlir::op]` / `#[mlir::dialect]`; the only module
//! allowed to `pub mod`.
//!
//! The `*.gen.rs` files come straight out of `mlirformat tblgen` (ODS `.td` ⇒ Rust) and are not
//! edited by hand; regenerate them with, e.g.
//! `mlirformat tblgen $LLVM/mlir/include/mlir/Dialect/SCF/IR/SCFOps.td -I $LLVM/mlir/include -o src/dialects`.

pub mod arith;
pub mod builtin;
pub mod cf;
pub mod complex;
pub mod func;
pub mod index;
pub mod math;
pub mod ub;

pub mod affine_ops;
pub mod scf_ops;
#[path = "affine.gen.rs"]
pub mod affine;
#[path = "bufferization.gen.rs"]
pub mod bufferization;
#[path = "async.gen.rs"]
pub mod r#async;
#[path = "gpu.gen.rs"]
pub mod gpu;
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
#[path = "vector.gen.rs"]
pub mod vector;
