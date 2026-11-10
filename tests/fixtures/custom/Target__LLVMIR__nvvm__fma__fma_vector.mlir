module {
  llvm.func @fma_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>) -> vector<2xf16> {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf16>
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf16>
    %4 = nvvm.fma %arg0, %arg1, %3 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %5 = nvvm.fma %arg0, %arg1, %4 {ftz = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %6 = nvvm.fma %arg0, %arg1, %5 {oob = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %7 = nvvm.fma %arg0, %arg1, %6 {oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    llvm.return %7 : vector<2xf16>
  }
  llvm.func @fma_bf16(%arg0: vector<2xbf16>, %arg1: vector<2xbf16>, %arg2: vector<2xbf16>) -> vector<2xbf16> {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xbf16>
    %1 = nvvm.fma %arg0, %arg1, %0 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xbf16>
    %2 = nvvm.fma %arg0, %arg1, %1 {oob = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xbf16>
    %3 = nvvm.fma %arg0, %arg1, %2 {oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xbf16>
    llvm.return %3 : vector<2xbf16>
  }
  llvm.func @fma_f32_rn(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf32>
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf32>
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @fma_f32_rm(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rm>} : vector<2xf32>
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>} : vector<2xf32>
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @fma_f32_rp(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rp>} : vector<2xf32>
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>} : vector<2xf32>
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @fma_f32_rz(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf32>
    %1 = nvvm.fma %arg0, %arg1, %0 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf32>
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %3 = nvvm.fma %arg0, %arg1, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @fma_f64(%arg0: vector<2xf64>, %arg1: vector<2xf64>, %arg2: vector<2xf64>) -> vector<2xf64> {
    %0 = nvvm.fma %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf64>
    %1 = nvvm.fma %arg0, %arg1, %0 {rnd = #nvvm.fp_rnd_mode<rm>} : vector<2xf64>
    %2 = nvvm.fma %arg0, %arg1, %1 {rnd = #nvvm.fp_rnd_mode<rp>} : vector<2xf64>
    %3 = nvvm.fma %arg0, %arg1, %2 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf64>
    llvm.return %3 : vector<2xf64>
  }
}

