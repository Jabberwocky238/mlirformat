module {
  llvm.func @fma_f16(%arg0: f16, %arg1: f16, %arg2: f16) -> f16 {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : f16
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : f16
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f16
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f16
    %4 = nvvm.fma %arg0, %arg1, %3 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : f16
    %5 = nvvm.fma %arg0, %arg1, %4 {ftz = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : f16
    %6 = nvvm.fma %arg0, %arg1, %5 {oob = true, rnd = #nvvm.fp_rnd_mode<rn>} : f16
    %7 = nvvm.fma %arg0, %arg1, %6 {oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : f16
    llvm.return %7 : f16
  }
  llvm.func @fma_bf16(%arg0: bf16, %arg1: bf16, %arg2: bf16) -> bf16 {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : bf16
    %1 = nvvm.fma %arg0, %arg1, %0 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : bf16
    %2 = nvvm.fma %arg0, %arg1, %1 {oob = true, rnd = #nvvm.fp_rnd_mode<rn>} : bf16
    %3 = nvvm.fma %arg0, %arg1, %2 {oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : bf16
    llvm.return %3 : bf16
  }
  llvm.func @fma_f32_rn(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : f32
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f32
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : f32
    llvm.return %3 : f32
  }
  llvm.func @fma_f32_rm(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>} : f32
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : f32
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : f32
    llvm.return %3 : f32
  }
  llvm.func @fma_f32_rp(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>} : f32
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : f32
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : f32
    llvm.return %3 : f32
  }
  llvm.func @fma_f32_rz(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>} : f32
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : f32
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : f32
    llvm.return %3 : f32
  }
  llvm.func @fma_f64(%arg0: f64, %arg1: f64, %arg2: f64) -> f64 {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : f64
    %1 = nvvm.fma %arg0, %arg1, %0 {rnd = #nvvm.fp_rnd_mode<rm>} : f64
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rp>} : f64
    %3 = nvvm.fma %arg0, %arg1, %2 {rnd = #nvvm.fp_rnd_mode<rz>} : f64
    llvm.return %3 : f64
  }
}

