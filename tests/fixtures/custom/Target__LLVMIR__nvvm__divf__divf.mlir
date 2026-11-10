module {
  llvm.func @divf_f32(%arg0: f32, %arg1: f32) -> f32 {
    %0 = nvvm.divf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %1 = nvvm.divf %0, %0 {rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %2 = nvvm.divf %1, %1 {rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %3 = nvvm.divf %2, %2 {rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %4 = nvvm.divf %3, %3 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %5 = nvvm.divf %4, %4 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %6 = nvvm.divf %5, %5 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %7 = nvvm.divf %6, %6 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>} : f32
    llvm.return %7 : f32
  }
  llvm.func @divf_f64(%arg0: f64, %arg1: f64) -> f64 {
    %0 = nvvm.divf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>} : f64
    %1 = nvvm.divf %0, %0 {rnd = #nvvm.fp_rnd_mode<rz>} : f64
    %2 = nvvm.divf %1, %1 {rnd = #nvvm.fp_rnd_mode<rm>} : f64
    %3 = nvvm.divf %2, %2 {rnd = #nvvm.fp_rnd_mode<rp>} : f64
    llvm.return %3 : f64
  }
  llvm.func @divf_approx(%arg0: f32, %arg1: f32) -> f32 {
    %0 = nvvm.divf %arg0, %arg1 {approx = true} : f32
    %1 = nvvm.divf %0, %0 {approx = true, ftz = true} : f32
    llvm.return %1 : f32
  }
  llvm.func @divf_full(%arg0: f32, %arg1: f32) -> f32 {
    %0 = nvvm.divf %arg0, %arg1 {full = true} : f32
    %1 = nvvm.divf %0, %0 {ftz = true, full = true} : f32
    llvm.return %1 : f32
  }
}

