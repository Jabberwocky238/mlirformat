module {
}

// -----
module {
  llvm.func @convert_f32x2_to_f8x2_e4m3(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : i16(f8E4M3FN)
    %1 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : i16(f8E4M3FN)
    llvm.return
  }
  llvm.func @convert_f32x2_to_f8x2_e5m2(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : i16(f8E5M2)
    %1 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : i16(f8E5M2)
    llvm.return
  }
  llvm.func @convert_f32x2_to_f8x2_ue8m0(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>} : i16(f8E8M0FNU)
    %1 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rp>} : i16(f8E8M0FNU)
    %2 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>} : i16(f8E8M0FNU)
    %3 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<satfinite>} : i16(f8E8M0FNU)
    llvm.return
  }
  llvm.func @convert_f32x2_to_f8x2_vector_return(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : vector<2xi8>(f8E4M3FN)
    %1 = nvvm.convert.f32x2.to.f8x2 %arg0, %arg1 {relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>} : vector<2xi8>(f8E4M3FN)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f16x2_to_f8x2_e4m3(%arg0: vector<2xf16>) {
    %0 = nvvm.convert.f16x2.to.f8x2 %arg0 : vector<2xf16> -> i16(f8E4M3FN)
    %1 = nvvm.convert.f16x2.to.f8x2 %arg0 {relu = true} : vector<2xf16> -> i16(f8E4M3FN)
    llvm.return
  }
  llvm.func @convert_f16x2_to_f8x2_e5m2(%arg0: vector<2xf16>) {
    %0 = nvvm.convert.f16x2.to.f8x2 %arg0 : vector<2xf16> -> i16(f8E5M2)
    %1 = nvvm.convert.f16x2.to.f8x2 %arg0 {relu = true} : vector<2xf16> -> i16(f8E5M2)
    llvm.return
  }
  llvm.func @convert_f16x2_to_f8x2_vector_return(%arg0: vector<2xf16>) {
    %0 = nvvm.convert.f16x2.to.f8x2 %arg0 : vector<2xf16> -> vector<2xi8>(f8E4M3FN)
    %1 = nvvm.convert.f16x2.to.f8x2 %arg0 : vector<2xf16> -> vector<2xi8>(f8E5M2)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_bf16x2_to_f8x2_ue8m0(%arg0: vector<2xbf16>) {
    %0 = nvvm.convert.bf16x2.to.f8x2 %arg0 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xbf16> -> i16(f8E8M0FNU)
    %1 = nvvm.convert.bf16x2.to.f8x2 %arg0 {rnd = #nvvm.fp_rnd_mode<rp>} : vector<2xbf16> -> i16(f8E8M0FNU)
    %2 = nvvm.convert.bf16x2.to.f8x2 %arg0 {rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16> -> i16(f8E8M0FNU)
    %3 = nvvm.convert.bf16x2.to.f8x2 %arg0 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16> -> i16(f8E8M0FNU)
    llvm.return
  }
  llvm.func @convert_bf16x2_to_f8x2_vector_return(%arg0: vector<2xbf16>) {
    %0 = nvvm.convert.bf16x2.to.f8x2 %arg0 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<2xbf16> -> vector<2xi8>(f8E8M0FNU)
    %1 = nvvm.convert.bf16x2.to.f8x2 %arg0 {rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<satfinite>} : vector<2xbf16> -> vector<2xi8>(f8E8M0FNU)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f8x2_to_f16x2_e4m3(%arg0: vector<2xi8>) {
    %0 = nvvm.convert.f8x2.to.f16x2 %arg0 : vector<2xi8>(f8E4M3FN) -> vector<2xf16>
    %1 = nvvm.convert.f8x2.to.f16x2 %arg0 {relu = true} : vector<2xi8>(f8E4M3FN) -> vector<2xf16>
    llvm.return
  }
  llvm.func @convert_f8x2_to_f16x2_e5m2(%arg0: vector<2xi8>) {
    %0 = nvvm.convert.f8x2.to.f16x2 %arg0 : vector<2xi8>(f8E5M2) -> vector<2xf16>
    %1 = nvvm.convert.f8x2.to.f16x2 %arg0 {relu = true} : vector<2xi8>(f8E5M2) -> vector<2xf16>
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f8x2_to_bf16x2_ue8m0(%arg0: vector<2xi8>) {
    %0 = nvvm.convert.f8x2.to.bf16x2 %arg0 : vector<2xi8>(f8E8M0FNU) -> vector<2xbf16>
    llvm.return
  }
}

