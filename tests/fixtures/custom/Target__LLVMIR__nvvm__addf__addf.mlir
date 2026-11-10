module {
  llvm.func @fadd_f16_f16(%arg0: f16, %arg1: f16) -> f16 {
    %0 = nvvm.addf %arg0, %arg1 : f16
    %1 = nvvm.addf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : f16
    %2 = nvvm.addf %1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f16
    %3 = nvvm.addf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f16
    llvm.return %3 : f16
  }
  llvm.func @fadd_bf16_bf16(%arg0: bf16, %arg1: bf16) -> bf16 {
    %0 = nvvm.addf %arg0, %arg1 : bf16
    %1 = nvvm.addf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : bf16
    llvm.return %1 : bf16
  }
  llvm.func @fadd_f32_f32(%arg0: f32, %arg1: f32) -> f32 {
    %0 = nvvm.addf %arg0, %arg1 : f32
    %1 = nvvm.addf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %2 = nvvm.addf %1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f32
    %3 = nvvm.addf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %4 = nvvm.addf %3, %3 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f32
    %5 = nvvm.addf %4, %4 {rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %6 = nvvm.addf %5, %5 {rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : f32
    %7 = nvvm.addf %6, %6 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %8 = nvvm.addf %7, %7 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : f32
    %9 = nvvm.addf %8, %8 {rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %10 = nvvm.addf %9, %9 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : f32
    %11 = nvvm.addf %10, %10 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %12 = nvvm.addf %11, %11 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : f32
    %13 = nvvm.addf %12, %12 {rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %14 = nvvm.addf %13, %13 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : f32
    %15 = nvvm.addf %14, %14 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %16 = nvvm.addf %15, %15 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : f32
    llvm.return %16 : f32
  }
  llvm.func @fadd_f64_f64(%arg0: f64, %arg1: f64) -> f64 {
    %0 = nvvm.addf %arg0, %arg1 : f64
    %1 = nvvm.addf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : f64
    %2 = nvvm.addf %1, %1 {rnd = #nvvm.fp_rnd_mode<rm>} : f64
    %3 = nvvm.addf %2, %2 {rnd = #nvvm.fp_rnd_mode<rp>} : f64
    %4 = nvvm.addf %3, %3 {rnd = #nvvm.fp_rnd_mode<rz>} : f64
    llvm.return %4 : f64
  }
}

