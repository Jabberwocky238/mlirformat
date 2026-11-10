module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @load_store_scalar(%arg0: i32) -> f32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_addr = spirv.mlir.addressof @var01s : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      spirv.Store "StorageBuffer" %0, %1 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @load_store_scalar_64bit(%arg0: i64) -> f32 "None" {
      %cst0_i64 = spirv.Constant 0 : i64
      %var01s_addr = spirv.mlir.addressof @var01s : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_addr[%cst0_i64, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i64, i64 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      spirv.Store "StorageBuffer" %0, %1 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @multiple_uses(%arg0: i32, %arg1: i32) -> f32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_addr = spirv.mlir.addressof @var01s : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      %2 = spirv.AccessChain %var01s_addr[%cst0_i32, %arg1] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %3 = spirv.Load "StorageBuffer" %2 : f32
      %4 = spirv.FAdd %1, %3 : f32
      spirv.ReturnValue %4 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<3xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @vector3(%arg0: i32) -> f32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_addr = spirv.mlir.addressof @var01s : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v bind(1, 0) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @not_aliased(%arg0: i32) -> f32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_addr = spirv.mlir.addressof @var01s : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      spirv.Store "StorageBuffer" %0, %1 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01s_1 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v_1 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @multiple_aliases(%arg0: i32) -> f32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_addr = spirv.mlir.addressof @var01s : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      %var01s_1_addr = spirv.mlir.addressof @var01s_1 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %2 = spirv.AccessChain %var01s_1_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %3 = spirv.Load "StorageBuffer" %2 : f32
      %var01v_1_addr = spirv.mlir.addressof @var01v_1 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
      %4 = spirv.AccessChain %var01v_1_addr[%cst0_i32, %arg0, %cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>, i32, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %5 = spirv.Load "StorageBuffer" %4 : f32
      %6 = spirv.FAdd %1, %3 : f32
      %7 = spirv.FAdd %6, %5 : f32
      spirv.ReturnValue %7 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s_i32 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01s_f32 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.func @different_scalar_type(%arg0: i32, %arg1: f32) -> i32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_i32_addr = spirv.mlir.addressof @var01s_i32 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_i32_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<i32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : i32
      %var01s_f32_addr = spirv.mlir.addressof @var01s_f32 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %2 = spirv.AccessChain %var01s_f32_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      spirv.Store "StorageBuffer" %2, %arg1 : f32
      spirv.ReturnValue %1 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01v bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @different_primitive_type(%arg0: i32, %arg1: i32) -> i32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_addr = spirv.mlir.addressof @var01s : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i32, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<i32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : i32
      spirv.Store "StorageBuffer" %0, %arg1 : i32
      spirv.ReturnValue %1 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01s_i64 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01s_f32 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.func @load_different_scalar_bitwidth(%arg0: i32) -> i64 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01s_i64_addr = spirv.mlir.addressof @var01s_i64 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01s_i64_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<i64, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : i64
      spirv.ReturnValue %1 : i64
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01_scalar bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01_vec2 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf32>, stride=8> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01_vec4 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.func @load_different_vector_sizes(%arg0: i32) -> vector<4xf32> "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01_vec4_addr = spirv.mlir.addressof @var01_vec4 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01_vec4_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<vector<4xf32>, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : vector<4xf32>
      %var01_scalar_addr = spirv.mlir.addressof @var01_scalar : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %2 = spirv.AccessChain %var01_scalar_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %3 = spirv.Load "StorageBuffer" %2 : f32
      %4 = spirv.CompositeInsert %3, %1[0 : i32] : f32 into vector<4xf32>
      spirv.ReturnValue %4 : vector<4xf32>
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01_v4f32 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01_f32 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01_i64 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=8> [0])>, StorageBuffer>
    spirv.func @load_mixed_scalar_vector_primitive_types(%arg0: i32) -> vector<4xf32> "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01_v4f32_addr = spirv.mlir.addressof @var01_v4f32 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01_v4f32_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<vector<4xf32>, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : vector<4xf32>
      %var01_f32_addr = spirv.mlir.addressof @var01_f32 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>
      %2 = spirv.AccessChain %var01_f32_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %3 = spirv.Load "StorageBuffer" %2 : f32
      %var01_i64_addr = spirv.mlir.addressof @var01_i64 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=8> [0])>, StorageBuffer>
      %4 = spirv.AccessChain %var01_i64_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=8> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<i64, StorageBuffer>
      %5 = spirv.Load "StorageBuffer" %4 : i64
      %6 = spirv.SConvert %5 : i64 to i32
      %7 = spirv.Bitcast %6 : i32 to f32
      %8 = spirv.CompositeInsert %3, %1[0 : i32] : f32 into vector<4xf32>
      %9 = spirv.CompositeInsert %7, %8[1 : i32] : f32 into vector<4xf32>
      spirv.ReturnValue %9 : vector<4xf32>
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01_v2f2 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf32>, stride=16> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01_i64 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=8> [0])>, StorageBuffer>
    spirv.func @load_mixed_scalar_vector_primitive_types(%arg0: i32) -> i64 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01_i64_addr = spirv.mlir.addressof @var01_i64 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=8> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01_i64_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i64, stride=8> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<i64, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : i64
      spirv.ReturnValue %1 : i64
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01_v2f2 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf32>, stride=16> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01_i16 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i16, stride=2> [0])>, StorageBuffer>
    spirv.func @scalar_type_bitwidth_smaller_than_vector(%arg0: i32) -> i16 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var01_i16_addr = spirv.mlir.addressof @var01_i16 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i16, stride=2> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01_i16_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<i16, stride=2> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<i16, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : i16
      spirv.ReturnValue %1 : i16
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var00_v4f32 bind(0, 0) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
    spirv.GlobalVariable @var00_v4f16 bind(0, 0) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf16>, stride=8> [0])>, StorageBuffer>
    spirv.func @vector_type_same_size_different_element_type(%arg0: i32) -> vector<4xf32> "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var00_v4f32_addr = spirv.mlir.addressof @var00_v4f32 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var00_v4f32_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<vector<4xf32>, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : vector<4xf32>
      spirv.ReturnValue %1 : vector<4xf32>
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var01_v2f16 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf16>, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var01_v2f32 bind(0, 1) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf32>, stride=8> [0])>, StorageBuffer>
    spirv.func @aliased(%arg0: i32) -> vector<3xf32> "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst_vec_3xf32 = spirv.Constant dense<0.000000e+00> : vector<3xf32>
      %var01_v2f16_addr = spirv.mlir.addressof @var01_v2f16 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf16>, stride=4> [0])>, StorageBuffer>
      %0 = spirv.AccessChain %var01_v2f16_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf16>, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<vector<2xf16>, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : vector<2xf16>
      %var01_v2f32_addr = spirv.mlir.addressof @var01_v2f32 : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf32>, stride=8> [0])>, StorageBuffer>
      %2 = spirv.AccessChain %var01_v2f32_addr[%cst0_i32, %arg0] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<2xf32>, stride=8> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<vector<2xf32>, StorageBuffer>
      %3 = spirv.Load "StorageBuffer" %2 : vector<2xf32>
      %4 = spirv.Bitcast %1 : vector<2xf16> to f32
      %5 = spirv.CompositeConstruct %4, %3 : (f32, vector<2xf32>) -> vector<3xf32>
      spirv.ReturnValue %5 : vector<3xf32>
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @main(%arg0: !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.AccessChain %arg0[%cst0_i32, %cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      spirv.Return
    }
  }
}

