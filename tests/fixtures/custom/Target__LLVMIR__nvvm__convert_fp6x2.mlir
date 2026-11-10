module {
  llvm.func @convert_f32x2_to_fp6x2_e2m3(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f6x2 %arg0, %arg1 : i16(f6E2M3FN)
    %1 = nvvm.convert.f32x2.to.f6x2 %arg0, %arg1 {relu = true} : i16(f6E2M3FN)
    llvm.return
  }
  llvm.func @convert_f32x2_to_fp6x2_e3m2(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f6x2 %arg0, %arg1 : i16(f6E3M2FN)
    %1 = nvvm.convert.f32x2.to.f6x2 %arg0, %arg1 {relu = true} : i16(f6E3M2FN)
    llvm.return
  }
  llvm.func @convert_f32x2_to_fp6x2_vector(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f6x2 %arg0, %arg1 : vector<2xi8>(f6E2M3FN)
    %1 = nvvm.convert.f32x2.to.f6x2 %arg0, %arg1 : vector<2xi8>(f6E3M2FN)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f16x2_to_fp6x2_e2m3(%arg0: vector<2xf16>) {
    %0 = nvvm.convert.f16x2.to.f6x2 %arg0 : vector<2xf16> -> i16(f6E2M3FN)
    %1 = nvvm.convert.f16x2.to.f6x2 %arg0 {relu = true} : vector<2xf16> -> i16(f6E2M3FN)
    llvm.return
  }
  llvm.func @convert_f16x2_to_fp6x2_e3m2(%arg0: vector<2xf16>) {
    %0 = nvvm.convert.f16x2.to.f6x2 %arg0 : vector<2xf16> -> i16(f6E3M2FN)
    %1 = nvvm.convert.f16x2.to.f6x2 %arg0 {relu = true} : vector<2xf16> -> i16(f6E3M2FN)
    llvm.return
  }
  llvm.func @convert_f16x2_to_fp6x2_vector(%arg0: vector<2xf16>) {
    %0 = nvvm.convert.f16x2.to.f6x2 %arg0 : vector<2xf16> -> vector<2xi8>(f6E2M3FN)
    %1 = nvvm.convert.f16x2.to.f6x2 %arg0 : vector<2xf16> -> vector<2xi8>(f6E3M2FN)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_bf16x2_to_fp6x2_e2m3(%arg0: vector<2xbf16>, %arg1: i16) {
    %0 = nvvm.convert.bf16x2.to.f6x2 %arg0 : vector<2xbf16> -> i16(f6E2M3FN)
    %1 = nvvm.convert.bf16x2.to.f6x2 %arg0 {relu = true} : vector<2xbf16> -> i16(f6E2M3FN)
    llvm.return
  }
  llvm.func @convert_bf16x2_to_fp6x2_e3m2(%arg0: vector<2xbf16>, %arg1: i16) {
    %0 = nvvm.convert.bf16x2.to.f6x2 %arg0 : vector<2xbf16> -> i16(f6E3M2FN)
    %1 = nvvm.convert.bf16x2.to.f6x2 %arg0 {relu = true} : vector<2xbf16> -> i16(f6E3M2FN)
    llvm.return
  }
  llvm.func @convert_bf16x2_to_fp6x2_vector(%arg0: vector<2xbf16>, %arg1: i16) {
    %0 = nvvm.convert.bf16x2.to.f6x2 %arg0 : vector<2xbf16> -> vector<2xi8>(f6E2M3FN)
    %1 = nvvm.convert.bf16x2.to.f6x2 %arg0 : vector<2xbf16> -> vector<2xi8>(f6E3M2FN)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f6x2_to_f16x2_e2m3(%arg0: vector<2xi8>) {
    %0 = nvvm.convert.f6x2.to.f16x2 %arg0 : vector<2xi8>(f6E2M3FN) -> vector<2xf16>
    %1 = nvvm.convert.f6x2.to.f16x2 %arg0 {relu = true} : vector<2xi8>(f6E2M3FN) -> vector<2xf16>
    llvm.return
  }
  llvm.func @convert_f6x2_to_f16x2_e3m2(%arg0: vector<2xi8>) {
    %0 = nvvm.convert.f6x2.to.f16x2 %arg0 : vector<2xi8>(f6E3M2FN) -> vector<2xf16>
    %1 = nvvm.convert.f6x2.to.f16x2 %arg0 {relu = true} : vector<2xi8>(f6E3M2FN) -> vector<2xf16>
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f6x2_to_bf16x2_e2m3(%arg0: vector<2xi8>, %arg1: i16) {
    %0 = nvvm.convert.f6x2.to.bf16x2 %arg0 : vector<2xi8>(f6E2M3FN) -> vector<2xbf16>
    %1 = nvvm.convert.f6x2.to.bf16x2 %arg0 {relu = true} : vector<2xi8>(f6E2M3FN) -> vector<2xbf16>
    %2 = nvvm.convert.f6x2.to.bf16x2 %arg0 {sat = #nvvm.sat_mode<satfinite>} : vector<2xi8>(f6E2M3FN) -> vector<2xbf16>
    %3 = nvvm.convert.f6x2.to.bf16x2 %arg0 {relu = true, sat = #nvvm.sat_mode<satfinite>} : vector<2xi8>(f6E2M3FN) -> vector<2xbf16>
    %4 = nvvm.convert.f6x2.to.bf16x2 %arg0, %arg1 : vector<2xi8>(f6E2M3FN) -> vector<2xbf16>
    llvm.return
  }
  llvm.func @convert_f6x2_to_bf16x2_e3m2(%arg0: vector<2xi8>, %arg1: i16) {
    %0 = nvvm.convert.f6x2.to.bf16x2 %arg0 : vector<2xi8>(f6E3M2FN) -> vector<2xbf16>
    %1 = nvvm.convert.f6x2.to.bf16x2 %arg0 {relu = true} : vector<2xi8>(f6E3M2FN) -> vector<2xbf16>
    %2 = nvvm.convert.f6x2.to.bf16x2 %arg0 {sat = #nvvm.sat_mode<satfinite>} : vector<2xi8>(f6E3M2FN) -> vector<2xbf16>
    %3 = nvvm.convert.f6x2.to.bf16x2 %arg0 {relu = true, sat = #nvvm.sat_mode<satfinite>} : vector<2xi8>(f6E3M2FN) -> vector<2xbf16>
    %4 = nvvm.convert.f6x2.to.bf16x2 %arg0, %arg1 : vector<2xi8>(f6E3M2FN) -> vector<2xbf16>
    llvm.return
  }
}

