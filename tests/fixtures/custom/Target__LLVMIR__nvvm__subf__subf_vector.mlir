module {
  llvm.func @subf_vector_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>) -> vector<2xf16> {
    %0 = nvvm.subf %arg0, %arg1 : vector<2xf16>
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %2 = nvvm.subf %1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf16>
    %3 = nvvm.subf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf16>
    llvm.return %0 : vector<2xf16>
  }
  llvm.func @subf_vector_bf16_bf16(%arg0: vector<2xbf16>, %arg1: vector<2xbf16>) -> vector<2xbf16> {
    %0 = nvvm.subf %arg0, %arg1 : vector<2xbf16>
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xbf16>
    llvm.return %1 : vector<2xbf16>
  }
  llvm.func @subf_vector_f32_f32_rn(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.subf %arg0, %arg1 : vector<2xf32>
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf32>
    %2 = nvvm.subf %1, %1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %3 = nvvm.subf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf32>
    %4 = nvvm.subf %3, %3 {ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @subf_vector_f32_f32_rm(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.subf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rm>} : vector<2xf32>
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %2 = nvvm.subf %1, %1 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>} : vector<2xf32>
    %3 = nvvm.subf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @subf_vector_f32_f32_rp(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.subf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rp>} : vector<2xf32>
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %2 = nvvm.subf %1, %1 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>} : vector<2xf32>
    %3 = nvvm.subf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @subf_vector_f32_f32_rz(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = nvvm.subf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf32>
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    %2 = nvvm.subf %1, %1 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf32>
    %3 = nvvm.subf %2, %2 {ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>} : vector<2xf32>
    llvm.return %3 : vector<2xf32>
  }
  llvm.func @subf_vector_f64_f64_rn(%arg0: vector<2xf64>, %arg1: vector<2xf64>) -> vector<2xf64> {
    %0 = nvvm.subf %arg0, %arg1 : vector<2xf64>
    %1 = nvvm.subf %0, %0 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf64>
    llvm.return %1 : vector<2xf64>
  }
  llvm.func @subf_vector_f64_f64_rm(%arg0: vector<2xf64>, %arg1: vector<2xf64>) -> vector<2xf64> {
    %0 = nvvm.subf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rm>} : vector<2xf64>
    llvm.return %0 : vector<2xf64>
  }
  llvm.func @subf_vector_f64_f64_rp(%arg0: vector<2xf64>, %arg1: vector<2xf64>) -> vector<2xf64> {
    %0 = nvvm.subf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rp>} : vector<2xf64>
    llvm.return %0 : vector<2xf64>
  }
  llvm.func @subf_vector_f64_f64_rz(%arg0: vector<2xf64>, %arg1: vector<2xf64>) -> vector<2xf64> {
    %0 = nvvm.subf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf64>
    llvm.return %0 : vector<2xf64>
  }
}

