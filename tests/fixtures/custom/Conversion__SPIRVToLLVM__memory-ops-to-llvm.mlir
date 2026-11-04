module {
  spirv.func @access_chain() "None" {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.Variable : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>
    %1 = spirv.AccessChain %0[%cst1_i32, %cst1_i32] : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>, i32, i32 -> !spirv.ptr<f32, Function>
    spirv.Return
  }
  spirv.func @access_chain_array(%arg0: i32) "None" {
    %0 = spirv.Variable : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>
    %1 = spirv.AccessChain %0[%arg0] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x f32>, Function>
    %2 = spirv.Load "Function" %1 ["Volatile"] : !spirv.array<4 x f32>
    spirv.Return
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var : !spirv.ptr<f32, Input>
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @struct : !spirv.ptr<!spirv.struct<(f32, !spirv.array<10 x f32>)>, Private>
    spirv.func @func() "None" {
      %struct_addr = spirv.mlir.addressof @struct : !spirv.ptr<!spirv.struct<(f32, !spirv.array<10 x f32>)>, Private>
      spirv.Return
    }
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @bar bind(0, 0) : !spirv.ptr<i32, StorageBuffer>
    spirv.func @foo() "None" {
      %bar_addr = spirv.mlir.addressof @bar : !spirv.ptr<i32, StorageBuffer>
      spirv.Return
    }
  }
  spirv.module @name Logical GLSL450 {
    spirv.GlobalVariable @bar bind(0, 0) : !spirv.ptr<i32, StorageBuffer>
    spirv.func @foo() "None" {
      %bar_addr = spirv.mlir.addressof @bar : !spirv.ptr<i32, StorageBuffer>
      spirv.Return
    }
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @bar {location = 1 : i32} : !spirv.ptr<i32, Output>
    spirv.func @foo() "None" {
      %bar_addr = spirv.mlir.addressof @bar : !spirv.ptr<i32, Output>
      spirv.Return
    }
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @bar {descriptor_set = 0 : i32, location = 3 : i32} : !spirv.ptr<f32, UniformConstant>
    spirv.func @foo() "None" {
      %bar_addr = spirv.mlir.addressof @bar : !spirv.ptr<f32, UniformConstant>
      spirv.Return
    }
  }
  spirv.func @load() "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 : f32
    spirv.Return
  }
  spirv.func @load_none() "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["None"] : f32
    spirv.Return
  }
  spirv.func @load_with_alignment() "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Aligned", 4] : f32
    spirv.Return
  }
  spirv.func @load_volatile() "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Volatile"] : f32
    spirv.Return
  }
  spirv.func @load_nontemporal() "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Nontemporal"] : f32
    spirv.Return
  }
  spirv.func @store(%arg0: f32) "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.Store "Function" %0, %arg0 : f32
    spirv.Return
  }
  spirv.func @store_composite(%arg0: !spirv.struct<(f64)>) "None" {
    %0 = spirv.Variable : !spirv.ptr<!spirv.struct<(f64)>, Function>
    spirv.Store "Function" %0, %arg0 : !spirv.struct<(f64)>
    spirv.Return
  }
  spirv.func @store_with_alignment(%arg0: f32) "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.Store "Function" %0, %arg0 ["Aligned", 4] : f32
    spirv.Return
  }
  spirv.func @store_volatile(%arg0: f32) "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.Store "Function" %0, %arg0 ["Volatile"] : f32
    spirv.Return
  }
  spirv.func @store_nontemporal(%arg0: f32) "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.Store "Function" %0, %arg0 ["Nontemporal"] : f32
    spirv.Return
  }
  spirv.func @variable_scalar() "None" {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Variable : !spirv.ptr<i8, Function>
    spirv.Return
  }
  spirv.func @variable_scalar_with_initialization() "None" {
    %cst0_i64 = spirv.Constant 0 : i64
    %0 = spirv.Variable init(%cst0_i64) : !spirv.ptr<i64, Function>
    spirv.Return
  }
  spirv.func @variable_vector() "None" {
    %0 = spirv.Variable : !spirv.ptr<vector<3xf32>, Function>
    spirv.Return
  }
  spirv.func @variable_vector_with_initialization() "None" {
    %cst_vec_3xi1 = spirv.Constant dense<false> : vector<3xi1>
    %0 = spirv.Variable init(%cst_vec_3xi1) : !spirv.ptr<vector<3xi1>, Function>
    spirv.Return
  }
  spirv.func @variable_array() "None" {
    %0 = spirv.Variable : !spirv.ptr<!spirv.array<10 x i32>, Function>
    spirv.Return
  }
}

