module {
  llvm.func @convert_f32x2_to_f4x2_e2m1(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f4x2 %arg0, %arg1 : i8(f4E2M1FN)
    %1 = nvvm.convert.f32x2.to.f4x2 %arg0, %arg1 {relu = true} : i8(f4E2M1FN)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f16x2_to_f4x2(%arg0: vector<2xf16>) {
    %0 = nvvm.convert.f16x2.to.f4x2 %arg0 : vector<2xf16> -> i8(f4E2M1FN)
    %1 = nvvm.convert.f16x2.to.f4x2 %arg0 {relu = true} : vector<2xf16> -> i8(f4E2M1FN)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_bf16x2_to_f4x2(%arg0: vector<2xbf16>) {
    %0 = nvvm.convert.bf16x2.to.f4x2 %arg0 : vector<2xbf16> -> i8(f4E2M1FN)
    %1 = nvvm.convert.bf16x2.to.f4x2 %arg0 {relu = true} : vector<2xbf16> -> i8(f4E2M1FN)
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f4x2_to_f16x2(%arg0: i8) {
    %0 = nvvm.convert.f4x2.to.f16x2 %arg0 : i8(f4E2M1FN) -> vector<2xf16>
    %1 = nvvm.convert.f4x2.to.f16x2 %arg0 {relu = true} : i8(f4E2M1FN) -> vector<2xf16>
    llvm.return
  }
}

// -----
module {
  llvm.func @convert_f4x2_to_bf16x2(%arg0: i8, %arg1: i16) {
    %0 = nvvm.convert.f4x2.to.bf16x2 %arg0 : i8(f4E2M1FN) -> vector<2xbf16>
    %1 = nvvm.convert.f4x2.to.bf16x2 %arg0 {relu = true} : i8(f4E2M1FN) -> vector<2xbf16>
    %2 = nvvm.convert.f4x2.to.bf16x2 %arg0 {sat = #nvvm.sat_mode<satfinite>} : i8(f4E2M1FN) -> vector<2xbf16>
    %3 = nvvm.convert.f4x2.to.bf16x2 %arg0 {relu = true, sat = #nvvm.sat_mode<satfinite>} : i8(f4E2M1FN) -> vector<2xbf16>
    %4 = nvvm.convert.f4x2.to.bf16x2 %arg0, %arg1 : i8(f4E2M1FN) -> vector<2xbf16>
    llvm.return
  }
}

