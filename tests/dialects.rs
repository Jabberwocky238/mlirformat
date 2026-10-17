//! ⭐ The built-in dialects that `mlirformat tblgen` generates from ODS (`src/dialects/*.gen.rs`),
//! each against the `mlir-opt` 22.1.8 fixtures: every custom form they print must be one
//! `mlir-opt` prints too, and must parse back to the same op. Ops the generated typed op cannot
//! express stay generic (counted, not a failure); `tests/coverage.rs` watches how many.
//!
//! Run with `--nocapture` for the per-dialect tally.

mod common;

use common::Fixtures;
use mlirformat::affine_ops::{Apply, For, Load, Max, Min, Store};
use mlirformat::{MlirOpt, Op};

/// One test per dialect: `opt` registers it alone, so only its own custom forms are judged.
macro_rules! dialects {
    ($($test:ident: $ns:literal => $dialect:ty),* $(,)?) => {$(
        #[test]
        fn $test() {
            let mut opt = MlirOpt::new();
            opt.register::<$dialect>();
            // Hand-written forms for ops ODS describes in C++, as `MlirOpt::upstream` injects
            // them; they are named `affine.*`, so they change nothing for the other dialects.
            opt.inject(Apply::template()).inject(Min::template()).inject(Max::template()).inject(Load::template()).inject(Store::template()).inject(For::template());
            Fixtures::check_dialect(&opt, $ns);
        }
    )*};
}

dialects! {
    affine: "affine" => mlirformat::affine::Affine,
    r#async: "async" => mlirformat::r#async::Async,
    gpu: "gpu" => mlirformat::gpu::Gpu,
    memref: "memref" => mlirformat::memref::Memref,
    pdl: "pdl" => mlirformat::pdl::Pdl,
    scf: "scf" => mlirformat::scf::Scf,
    tensor: "tensor" => mlirformat::tensor::Tensor,
    vector: "vector" => mlirformat::vector::Vector,
}
