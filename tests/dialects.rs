mod common;

use common::Fixtures;
use mlirformat::affine_ops::{Apply, For, If, Load, Max, Min, Parallel, Store};
use mlirformat::gpu_hand::{Func as GpuFunc, LaunchFunc};
use mlirformat::linalg_hand::{Generic as LinalgGeneric, Yield as LinalgYield};
use mlirformat::scf_hand::{For as ScfFor, If as ScfIf};
use mlirformat::{MlirOpt, Op};

macro_rules! dialects {
    ($($test:ident: $ns:literal => $dialect:expr),* $(,)?) => {$(
        #[test]
        fn $test() {
            let mut opt = MlirOpt::new();
            opt.load($dialect);
            opt.inject(Apply::template()).inject(Min::template()).inject(Max::template()).inject(Load::template()).inject(Store::template()).inject(For::template()).inject(If::template()).inject(Parallel::template()).inject(ScfFor::template()).inject(ScfIf::template()).inject(GpuFunc::template()).inject(LaunchFunc::template());
            if $ns == "llvm" {
                for t in mlirformat::llvm_hand::LlvmHand::templates() {
                    opt.inject(t);
                }
            }
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
    amdgpu: "amdgpu" => mlirformat::amdgpu::AmdgpuDialect,
    arm_neon: "arm_neon" => mlirformat::arm_neon::ArmNeonDialect,
    arm_sme: "arm_sme" => mlirformat::arm_sme::ArmSmeDialect,
    arm_sve: "arm_sve" => mlirformat::arm_sve::ArmSveDialect,
    r#async: "async" => mlirformat::r#async::AsyncDialect,
    bufferization: "bufferization" => mlirformat::bufferization::BufferizationDialect,
    emitc: "emitc" => mlirformat::emitc::EmitcDialect,
    gpu: "gpu" => mlirformat::gpu::GpuDialect,
    linalg: "linalg" => mlirformat::linalg::LinalgDialect,
    llvm: "llvm" => mlirformat::llvm::LlvmDialect,
    memref: "memref" => mlirformat::memref::MemrefDialect,
    nvgpu: "nvgpu" => mlirformat::nvgpu::NvgpuDialect,
    nvvm: "nvvm" => mlirformat::nvvm::NvvmDialect,
    rocdl: "rocdl" => mlirformat::rocdl::RocdlDialect,
    pdl: "pdl" => mlirformat::pdl::PdlDialect,
    scf: "scf" => mlirformat::scf::ScfDialect,
    shape: "shape" => mlirformat::shape::ShapeDialect,
    spirv: "spirv" => mlirformat::spirv::SpirvDialect,
    tensor: "tensor" => mlirformat::tensor::TensorDialect,
    tosa: "tosa" => mlirformat::tosa::TosaDialect,
    vector: "vector" => mlirformat::vector::VectorDialect,
    x86: "x86" => mlirformat::x86::X86Dialect,
    xegpu: "xegpu" => mlirformat::xegpu::XegpuDialect,
    xevm: "xevm" => mlirformat::xevm::XevmDialect,
}
