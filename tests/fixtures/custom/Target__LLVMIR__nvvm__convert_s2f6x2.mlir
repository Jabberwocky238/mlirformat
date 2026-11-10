module {
  llvm.func @convert_f32x2_to_s2f6x2(%arg0: f32, %arg1: f32) -> i16 {
    %0 = nvvm.convert.f32x2.to.s2f6x2 %arg0, %arg1 : i16
    %1 = nvvm.convert.f32x2.to.s2f6x2 %arg0, %arg1 {relu = true} : i16
    %2 = llvm.or %0, %1 : i16
    llvm.return %2 : i16
  }
  llvm.func @convert_f32x2_to_s2f6x2_scale(%arg0: f32, %arg1: f32, %arg2: i16) -> i16 {
    %0 = nvvm.convert.f32x2.to.s2f6x2 %arg0, %arg1, %arg2 : i16
    %1 = nvvm.convert.f32x2.to.s2f6x2 %arg0, %arg1, %arg2 {relu = true} : i16
    %2 = llvm.or %0, %1 : i16
    llvm.return %2 : i16
  }
  llvm.func @convert_f32x2_to_s2f6x2_vector(%arg0: f32, %arg1: f32) -> vector<2xi8> {
    %0 = nvvm.convert.f32x2.to.s2f6x2 %arg0, %arg1 : vector<2xi8>
    llvm.return %0 : vector<2xi8>
  }
  llvm.func @convert_f32x2_to_s2f6x2_vector_scale(%arg0: f32, %arg1: f32, %arg2: i16) -> vector<2xi8> {
    %0 = nvvm.convert.f32x2.to.s2f6x2 %arg0, %arg1, %arg2 : vector<2xi8>
    llvm.return %0 : vector<2xi8>
  }
  llvm.func @convert_bf16x2_to_s2f6x2(%arg0: vector<2xbf16>) -> i16 {
    %0 = nvvm.convert.bf16x2.to.s2f6x2 %arg0 : vector<2xbf16> -> i16
    %1 = nvvm.convert.bf16x2.to.s2f6x2 %arg0 {relu = true} : vector<2xbf16> -> i16
    %2 = llvm.or %0, %1 : i16
    llvm.return %2 : i16
  }
  llvm.func @convert_bf16x2_to_s2f6x2_scale(%arg0: vector<2xbf16>, %arg1: i16) -> i16 {
    %0 = nvvm.convert.bf16x2.to.s2f6x2 %arg0, %arg1 : vector<2xbf16> -> i16
    %1 = nvvm.convert.bf16x2.to.s2f6x2 %arg0, %arg1 {relu = true} : vector<2xbf16> -> i16
    %2 = llvm.or %0, %1 : i16
    llvm.return %2 : i16
  }
  llvm.func @convert_bf16x2_to_s2f6x2_vector(%arg0: vector<2xbf16>) -> vector<2xi8> {
    %0 = nvvm.convert.bf16x2.to.s2f6x2 %arg0 : vector<2xbf16> -> vector<2xi8>
    llvm.return %0 : vector<2xi8>
  }
  llvm.func @convert_bf16x2_to_s2f6x2_vector_scale(%arg0: vector<2xbf16>, %arg1: i16) -> vector<2xi8> {
    %0 = nvvm.convert.bf16x2.to.s2f6x2 %arg0, %arg1 : vector<2xbf16> -> vector<2xi8>
    llvm.return %0 : vector<2xi8>
  }
  llvm.func @convert_s2f6x2_to_bf16x2(%arg0: vector<2xi8>) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0 : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
  llvm.func @convert_s2f6x2_to_bf16x2_relu(%arg0: vector<2xi8>) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0 {relu = true} : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
  llvm.func @convert_s2f6x2_to_bf16x2_scale(%arg0: vector<2xi8>, %arg1: i16) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0, %arg1 : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
  llvm.func @convert_s2f6x2_to_bf16x2_scale_relu(%arg0: vector<2xi8>, %arg1: i16) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0, %arg1 {relu = true} : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
  llvm.func @convert_s2f6x2_to_bf16x2_satfinite(%arg0: vector<2xi8>) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0 {sat = #nvvm.sat_mode<satfinite>} : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
  llvm.func @convert_s2f6x2_to_bf16x2_relu_satfinite(%arg0: vector<2xi8>) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0 {relu = true, sat = #nvvm.sat_mode<satfinite>} : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
  llvm.func @convert_s2f6x2_to_bf16x2_scale_satfinite(%arg0: vector<2xi8>, %arg1: i16) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0, %arg1 {sat = #nvvm.sat_mode<satfinite>} : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
  llvm.func @convert_s2f6x2_to_bf16x2_scale_relu_satfinite(%arg0: vector<2xi8>, %arg1: i16) -> vector<2xbf16> {
    %0 = nvvm.convert.s2f6x2.to.bf16x2 %arg0, %arg1 {relu = true, sat = #nvvm.sat_mode<satfinite>} : vector<2xi8> -> vector<2xbf16>
    llvm.return %0 : vector<2xbf16>
  }
}

