//! Upstream MLIR dialects described with `#[mlir::op]` / `#[mlir::dialect]`; the only module
//! allowed to `pub mod`.

pub mod arith;
pub mod builtin;
pub mod cf;
pub mod complex;
pub mod func;
pub mod index;
pub mod math;
pub mod ub;
