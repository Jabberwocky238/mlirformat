module {
  llvm.func @fsub_f16_f16(%arg0: f16, %arg1: f16) -> f16 {
    %0 = nvvm.subf %arg0, %arg1 : f16
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : f16
    %2 = nvvm.subf %1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f16
    %3 = nvvm.subf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f16
    llvm.return %3 : f16
  }
  llvm.func @fsub_bf16_bf16(%arg0: bf16, %arg1: bf16) -> bf16 {
    %0 = nvvm.subf %arg0, %arg1 : bf16
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : bf16
    llvm.return %1 : bf16
  }
  llvm.func @fsub_f32_f32(%arg0: f32, %arg1: f32) -> f32 {
    %0 = nvvm.subf %arg0, %arg1 : f32
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %2 = nvvm.subf %1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f32
    %3 = nvvm.subf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %4 = nvvm.subf %3, %3 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f32
    %5 = nvvm.subf %4, %4 {rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %6 = nvvm.subf %5, %5 {rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : f32
    %7 = nvvm.subf %6, %6 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %8 = nvvm.subf %7, %7 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : f32
    %9 = nvvm.subf %8, %8 {rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %10 = nvvm.subf %9, %9 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : f32
    %11 = nvvm.subf %10, %10 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %12 = nvvm.subf %11, %11 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : f32
    %13 = nvvm.subf %12, %12 {rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %14 = nvvm.subf %13, %13 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : f32
    %15 = nvvm.subf %14, %14 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %16 = nvvm.subf %15, %15 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : f32
    llvm.return %16 : f32
  }
  llvm.func @fsub_f64_f64(%arg0: f64, %arg1: f64) -> f64 {
    %0 = nvvm.subf %arg0, %arg1 : f64
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : f64
    %2 = nvvm.subf %1, %1 {rnd = #nvvm.fp_rnd_mode<rm>} : f64
    %3 = nvvm.subf %2, %2 {rnd = #nvvm.fp_rnd_mode<rp>} : f64
    %4 = nvvm.subf %3, %3 {rnd = #nvvm.fp_rnd_mode<rz>} : f64
    llvm.return %4 : f64
  }
}

