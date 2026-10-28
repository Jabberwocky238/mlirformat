//! ⭐ The built-in dialects that `mlirformat tblgen` generates from ODS (`src/dialects/*.gen.rs`),
//! each against the `mlir-opt` 22.1.8 fixtures: every custom form they print must be one
//! `mlir-opt` prints too, and must parse back to the same op. Ops the generated typed op cannot
//! express stay generic (counted, not a failure); `tests/coverage.rs` watches how many.
//!
//! Run with `--nocapture` for the per-dialect tally.

mod common;

use common::Fixtures;
use mlirformat::affine_ops::{Apply, For, If, Load, Max, Min, Parallel, Store};
use mlirformat::gpu_hand::{Func as GpuFunc, LaunchFunc};
use mlirformat::linalg_hand::{Generic as LinalgGeneric, Yield as LinalgYield};
use mlirformat::scf_hand::{For as ScfFor, If as ScfIf};
use mlirformat::{MlirOpt, Op};

/// One test per dialect: `opt` registers it alone, so only its own custom forms are judged.
macro_rules! dialects {
    ($($test:ident: $ns:literal => $dialect:expr),* $(,)?) => {$(
        #[test]
        fn $test() {
            let mut opt = MlirOpt::new();
            opt.load($dialect);
            // Hand-written forms for ops ODS describes in C++, as `MlirOpt::upstream` injects
            // them; they are named `affine.*` / `scf.*` / `gpu.*`, so they change nothing for the other dialects.
            opt.inject(Apply::template()).inject(Min::template()).inject(Max::template()).inject(Load::template()).inject(Store::template()).inject(For::template()).inject(If::template()).inject(Parallel::template()).inject(ScfFor::template()).inject(ScfIf::template()).inject(GpuFunc::template()).inject(LaunchFunc::template());
            // linalg's only with linalg: a named op's custom form rebuilds its body with ops of
            // `arith` / `math` / `complex`, whose ODS defaults (`fastmath = none`) those dialects carry.
            if $ns == "linalg" {
                opt.load(mlirformat::arith::ArithDialect).load(mlirformat::math::MathDialect).load(mlirformat::complex::ComplexDialect);
                opt.inject(LinalgGeneric::template()).inject(LinalgYield::template());
                for t in mlirformat::linalg_hand::named_templates().into_iter().chain(mlirformat::linalg_hand::contraction_templates()).chain(mlirformat::linalg_hand::dst_templates()) {
                    opt.inject(t);
                }
            }
            Fixtures::check_dialect(&opt, $ns);
        }
    )*};
}

dialects! {
    affine: "affine" => mlirformat::affine::AffineDialect,
    r#async: "async" => mlirformat::r#async::AsyncDialect,
    bufferization: "bufferization" => mlirformat::bufferization::BufferizationDialect,
    emitc: "emitc" => mlirformat::emitc::EmitcDialect,
    gpu: "gpu" => mlirformat::gpu::GpuDialect,
    linalg: "linalg" => mlirformat::linalg::LinalgDialect,
    llvm: "llvm" => mlirformat::llvm::LlvmDialect,
    memref: "memref" => mlirformat::memref::MemrefDialect,
    pdl: "pdl" => mlirformat::pdl::PdlDialect,
    scf: "scf" => mlirformat::scf::ScfDialect,
    shape: "shape" => mlirformat::shape::ShapeDialect,
    tensor: "tensor" => mlirformat::tensor::TensorDialect,
    tosa: "tosa" => mlirformat::tosa::TosaDialect,
    vector: "vector" => mlirformat::vector::VectorDialect,
}
