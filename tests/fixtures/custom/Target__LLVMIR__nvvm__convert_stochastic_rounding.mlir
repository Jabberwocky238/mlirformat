module {
}

// -----
module {
  gpu.module @valid_f16x2_rs_sm_100a [#nvvm.target<chip = "sm_100a">] {
    func.func @convert_rs() {
      %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
      %1 = llvm.mlir.constant(2.000000e+00 : f32) : f32
      %2 = llvm.mlir.constant(305419896 : i32) : i32
      %3 = nvvm.convert.f32x2.to.f16x2 %0, %1, %2 {rnd = #nvvm.fp_rnd_mode<rs>} : vector<2xf16>
      return
    }
  }
  gpu.module @valid_bf16x2_rs_sm_103a [#nvvm.target<chip = "sm_103a">] {
    func.func @convert_rs() {
      %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
      %1 = llvm.mlir.constant(2.000000e+00 : f32) : f32
      %2 = llvm.mlir.constant(0 : i32) : i32
      %3 = nvvm.convert.f32x2.to.bf16x2 %0, %1, %2 {rnd = #nvvm.fp_rnd_mode<rs>} : vector<2xbf16>
      return
    }
  }
}

// -----
module {
  llvm.func @convert_f32x4_to_f8x4_e4m3_rs(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f8x4 %arg0, %arg1 : vector<4xf32> -> vector<4xi8>(f8E4M3FN)
    llvm.return %0 : vector<4xi8>
  }
  llvm.func @convert_f32x4_to_f8x4_e4m3_rs_relu(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f8x4 %arg0, %arg1 {relu = true} : vector<4xf32> -> vector<4xi8>(f8E4M3FN)
    llvm.return %0 : vector<4xi8>
  }
}

// -----
module {
  llvm.func @convert_f32x4_to_f8x4_e5m2_rs(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f8x4 %arg0, %arg1 : vector<4xf32> -> vector<4xi8>(f8E5M2)
    llvm.return %0 : vector<4xi8>
  }
  llvm.func @convert_f32x4_to_f8x4_e5m2_rs_relu(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f8x4 %arg0, %arg1 {relu = true} : vector<4xf32> -> vector<4xi8>(f8E5M2)
    llvm.return %0 : vector<4xi8>
  }
}

// -----
module {
  llvm.func @convert_f32x4_to_f6x4_e2m3_rs(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f6x4 %arg0, %arg1 : vector<4xf32> -> vector<4xi8>(f6E2M3FN)
    llvm.return %0 : vector<4xi8>
  }
  llvm.func @convert_f32x4_to_f6x4_e2m3_rs_relu(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f6x4 %arg0, %arg1 {relu = true} : vector<4xf32> -> vector<4xi8>(f6E2M3FN)
    llvm.return %0 : vector<4xi8>
  }
}

// -----
module {
  llvm.func @convert_f32x4_to_f6x4_e3m2_rs(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f6x4 %arg0, %arg1 : vector<4xf32> -> vector<4xi8>(f6E3M2FN)
    llvm.return %0 : vector<4xi8>
  }
  llvm.func @convert_f32x4_to_f6x4_e3m2_rs_relu(%arg0: vector<4xf32>, %arg1: i32) -> vector<4xi8> {
    %0 = nvvm.convert.f32x4.to.f6x4 %arg0, %arg1 {relu = true} : vector<4xf32> -> vector<4xi8>(f6E3M2FN)
    llvm.return %0 : vector<4xi8>
  }
}

// -----
module {
  llvm.func @convert_f32x4_to_f4x4_e2m1_rs(%arg0: vector<4xf32>, %arg1: i32) -> i16 {
    %0 = nvvm.convert.f32x4.to.f4x4 %arg0, %arg1 : vector<4xf32> -> i16(f4E2M1FN)
    llvm.return %0 : i16
  }
  llvm.func @convert_f32x4_to_f4x4_e2m1_rs_relu(%arg0: vector<4xf32>, %arg1: i32) -> i16 {
    %0 = nvvm.convert.f32x4.to.f4x4 %arg0, %arg1 {relu = true} : vector<4xf32> -> i16(f4E2M1FN)
    llvm.return %0 : i16
  }
}

