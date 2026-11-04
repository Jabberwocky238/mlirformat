module {
  llvm.func @convert_f32x2_to_f16x2_rn(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %1 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : vector<2xf16>
    %2 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xf16>
    %3 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : vector<2xf16>
    llvm.return
  }
  llvm.func @convert_f32x2_to_f16x2_rz(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf16>
    %1 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>} : vector<2xf16>
    %2 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xf16>
    %3 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>} : vector<2xf16>
    llvm.return
  }
  llvm.func @convert_f32x2_to_f16x2_rs_stochastic(%arg0: f32, %arg1: f32, %arg2: i32) {
    %0 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rs>} : vector<2xf16>
    %1 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1, %arg2 {relu = true, rnd = #nvvm.fp_rnd_mode<rs>} : vector<2xf16>
    %2 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>} : vector<2xf16>
    %3 = nvvm.convert.f32x2.to.f16x2 %arg0, %arg1, %arg2 {relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>} : vector<2xf16>
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f32x2_to_bf16x2_rn(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xbf16>
    %1 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16>
    %2 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>} : vector<2xbf16>
    %3 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16>
    llvm.return
  }
  llvm.func @convert_f32x2_to_bf16x2_rz(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xbf16>
    %1 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16>
    %2 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xbf16>
    %3 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16>
    llvm.return
  }
  llvm.func @convert_f32x2_to_bf16x2_rs_stochastic(%arg0: f32, %arg1: f32, %arg2: i32) {
    %0 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rs>} : vector<2xbf16>
    %1 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1, %arg2 {relu = true, rnd = #nvvm.fp_rnd_mode<rs>} : vector<2xbf16>
    %2 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1, %arg2 {rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16>
    %3 = nvvm.convert.f32x2.to.bf16x2 %arg0, %arg1, %arg2 {relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16>
    llvm.return
  }
}

