module {
  llvm.func @sqrt_f32(%arg0: f32) -> f32 {
    %0 = nvvm.sqrt %arg0 {rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %1 = nvvm.sqrt %0 {rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %2 = nvvm.sqrt %1 {rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %3 = nvvm.sqrt %2 {rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %4 = nvvm.sqrt %3 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %5 = nvvm.sqrt %4 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %6 = nvvm.sqrt %5 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %7 = nvvm.sqrt %6 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>} : f32
    llvm.return %7 : f32
  }
  llvm.func @sqrt_f64(%arg0: f64) -> f64 {
    %0 = nvvm.sqrt %arg0 {rnd = #nvvm.fp_rnd_mode<rn>} : f64
    %1 = nvvm.sqrt %0 {rnd = #nvvm.fp_rnd_mode<rz>} : f64
    %2 = nvvm.sqrt %1 {rnd = #nvvm.fp_rnd_mode<rm>} : f64
    %3 = nvvm.sqrt %2 {rnd = #nvvm.fp_rnd_mode<rp>} : f64
    llvm.return %3 : f64
  }
  llvm.func @sqrt_approx(%arg0: f32) -> f32 {
    %0 = nvvm.sqrt.approx %arg0 : f32
    %1 = nvvm.sqrt.approx %0 {ftz = true} : f32
    llvm.return %1 : f32
  }
}

