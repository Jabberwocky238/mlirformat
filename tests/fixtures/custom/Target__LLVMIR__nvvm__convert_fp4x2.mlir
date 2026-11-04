module {
  llvm.func @convert_f32x2_to_f4x2_e2m1(%arg0: f32, %arg1: f32) {
    %0 = nvvm.convert.f32x2.to.f4x2 %arg0, %arg1 : i8(f4E2M1FN)
    %1 = nvvm.convert.f32x2.to.f4x2 %arg0, %arg1 {relu = true} : i8(f4E2M1FN)
    llvm.return
  }
  llvm.func @convert_f4x2_to_f16x2(%arg0: i8) {
    %0 = nvvm.convert.f4x2.to.f16x2 %arg0 : i8(f4E2M1FN) -> vector<2xf16>
    %1 = nvvm.convert.f4x2.to.f16x2 %arg0 {relu = true} : i8(f4E2M1FN) -> vector<2xf16>
    llvm.return
  }
}

