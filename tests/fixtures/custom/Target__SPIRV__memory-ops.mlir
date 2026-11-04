module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @load_store(%arg0: !spirv.ptr<f32, Input>, %arg1: !spirv.ptr<f32, Output>) "None" {
      %0 = spirv.Load "Input" %arg0 : f32
      spirv.Store "Output" %arg1, %0 : f32
      spirv.Return
    }
    spirv.func @load_store_memory_operands(%arg0: !spirv.ptr<f32, Input>, %arg1: !spirv.ptr<f32, Output>) "None" {
      %0 = spirv.Load "Input" %arg0 ["Volatile|Aligned", 4] : f32
      spirv.Store "Output" %arg1, %0 ["Volatile|Aligned", 4] : f32
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @access_chain(%arg0: !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, %arg1: i32, %arg2: i32) "None" {
      %0 = spirv.AccessChain %arg0[%arg1] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x f32>, Function>
      %1 = spirv.AccessChain %arg0[%arg1, %arg2] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32 -> !spirv.ptr<f32, Function>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_storage_buffer_storage_class]> {
    spirv.func @load_store_zero_rank_float(%arg0: !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.AccessChain %arg0[%cst0_i32, %cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      %cst0_i32_0 = spirv.Constant 0 : i32
      %2 = spirv.AccessChain %arg1[%cst0_i32_0, %cst0_i32_0] : !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      spirv.Store "StorageBuffer" %2, %1 : f32
      spirv.Return
    }
    spirv.func @load_store_zero_rank_int(%arg0: !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.AccessChain %arg0[%cst0_i32, %cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>, i32, i32 -> !spirv.ptr<i32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : i32
      %cst0_i32_0 = spirv.Constant 0 : i32
      %2 = spirv.AccessChain %arg1[%cst0_i32_0, %cst0_i32_0] : !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>, i32, i32 -> !spirv.ptr<i32, StorageBuffer>
      spirv.Store "StorageBuffer" %2, %1 : i32
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @copy_memory_simple() "None" {
      %0 = spirv.Variable : !spirv.ptr<f32, Function>
      %1 = spirv.Variable : !spirv.ptr<f32, Function>
      spirv.CopyMemory  "Function" %0,  "Function" %1,  : f32
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @copy_memory_different_storage_classes(%arg0: !spirv.ptr<!spirv.array<4 x f32>, Input>, %arg1: !spirv.ptr<!spirv.array<4 x f32>, Output>) "None" {
      spirv.CopyMemory  "Output" %arg1,  "Input" %arg0,  : !spirv.array<4 x f32>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.4, [Shader, Linkage], []> {
    spirv.func @copy_memory_with_access_operands() "None" {
      %0 = spirv.Variable : !spirv.ptr<f32, Function>
      %1 = spirv.Variable : !spirv.ptr<f32, Function>
      spirv.CopyMemory  "Function" %0,  "Function" %1 ["Aligned", 4],  ["Aligned", 4] : f32
      spirv.CopyMemory  "Function" %0,  "Function" %1 ["Volatile"],  ["Volatile"] : f32
      spirv.CopyMemory  "Function" %0,  "Function" %1 ["Volatile"],  ["Volatile"] : f32
      spirv.CopyMemory  "Function" %0,  "Function" %1 ["Aligned", 4],  ["Volatile"] : f32
      spirv.CopyMemory  "Function" %0,  "Function" %1 ["Volatile"],  ["Aligned", 4] : f32
      spirv.CopyMemory  "Function" %0,  "Function" %1 ["Aligned", 8],  ["Aligned", 4] : f32
      spirv.Return
    }
  }
}

