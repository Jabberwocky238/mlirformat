module {
  func.func @access_chain_struct() {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.Variable : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>
    %1 = spirv.AccessChain %0[%cst1_i32, %cst1_i32] : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>, i32, i32 -> !spirv.ptr<f32, Function>
    return
  }
  func.func @access_chain_1D_array(%arg0: i32) {
    %0 = spirv.Variable : !spirv.ptr<!spirv.array<4 x f32>, Function>
    %1 = spirv.AccessChain %0[%arg0] : !spirv.ptr<!spirv.array<4 x f32>, Function>, i32 -> !spirv.ptr<f32, Function>
    return
  }
  func.func @access_chain_2D_array_1(%arg0: i32) {
    %0 = spirv.Variable : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>
    %1 = spirv.AccessChain %0[%arg0, %arg0] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32 -> !spirv.ptr<f32, Function>
    %2 = spirv.Load "Function" %1 ["Volatile"] : f32
    return
  }
  func.func @access_chain_2D_array_2(%arg0: i32) {
    %0 = spirv.Variable : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>
    %1 = spirv.AccessChain %0[%arg0] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x f32>, Function>
    %2 = spirv.Load "Function" %1 ["Volatile"] : !spirv.array<4 x f32>
    return
  }
  func.func @access_chain_rtarray(%arg0: i32) {
    %0 = spirv.Variable : !spirv.ptr<!spirv.rtarray<f32>, Function>
    %1 = spirv.AccessChain %0[%arg0] : !spirv.ptr<!spirv.rtarray<f32>, Function>, i32 -> !spirv.ptr<f32, Function>
    %2 = spirv.Load "Function" %1 ["Volatile"] : f32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @simple_load() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 : f32
    return
  }
  func.func @load_none_access() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["None"] : f32
    return
  }
  func.func @volatile_load() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Volatile"] : f32
    return
  }
  func.func @aligned_load() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Aligned", 4] : f32
    return
  }
  func.func @volatile_aligned_load() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Volatile|Aligned", 4] : f32
    return
  }
}

// -----
module {
  func.func @load_none_access() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["None"] : f32
    return
  }
  func.func @volatile_load() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Volatile"] : f32
    return
  }
  func.func @aligned_load() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Aligned", 4] : f32
    return
  }
  func.func @volatile_aligned_load() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Load "Function" %0 ["Volatile|Aligned", 4] : f32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 : !spirv.ptr<f32, Input>
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, Arrayed, SingleSampled, NeedSampler, Unknown>>, UniformConstant>
    spirv.func @simple_load() "None" {
      %var0_addr = spirv.mlir.addressof @var0 : !spirv.ptr<f32, Input>
      %0 = spirv.Load "Input" %var0_addr : f32
      %var1_addr = spirv.mlir.addressof @var1 : !spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, Arrayed, SingleSampled, NeedSampler, Unknown>>, UniformConstant>
      %1 = spirv.Load "UniformConstant" %var1_addr : !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, Arrayed, SingleSampled, NeedSampler, Unknown>>
      spirv.Return
    }
  }
}

// -----
module {
  func.func @image_load() {
    %0 = spirv.Variable : !spirv.ptr<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, Function>
    %1 = spirv.Load "Function" %0 : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>
    return
  }
}

// -----
module {
  func.func @simple_store(%arg0: f32) {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.Store "Function" %0, %arg0 : f32
    return
  }
  func.func @volatile_store(%arg0: f32) {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.Store "Function" %0, %arg0 ["Volatile"] : f32
    return
  }
  func.func @aligned_store(%arg0: f32) {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.Store "Function" %0, %arg0 ["Aligned", 4] : f32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 : !spirv.ptr<f32, Input>
    spirv.func @simple_store(%arg0: f32) "None" {
      %var0_addr = spirv.mlir.addressof @var0 : !spirv.ptr<f32, Input>
      spirv.Store "Input" %var0_addr, %arg0 : f32
      spirv.Return
    }
  }
}

// -----
module {
  func.func @variable(%arg0: f32) {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    return
  }
}

// -----
module {
  func.func @variable_init_normal_constant() {
    %cst_f32 = spirv.Constant 4.000000e+00 : f32
    %0 = spirv.Variable init(%cst_f32) : !spirv.ptr<f32, Function>
    return
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @global : !spirv.ptr<f32, Workgroup>
    spirv.func @variable_init_global_variable() "None" {
      %global_addr = spirv.mlir.addressof @global : !spirv.ptr<f32, Workgroup>
      %0 = spirv.Variable init(%global_addr) : !spirv.ptr<!spirv.ptr<f32, Workgroup>, Function>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc = 42 : i32
    spirv.func @variable_init_spec_constant() "None" {
      %0 = spirv.mlir.referenceof @sc : i32
      %1 = spirv.Variable init(%0) : !spirv.ptr<i32, Function>
      spirv.Return
    }
  }
}

// -----
module {
  func.func @variable_ptr_physical_buffer() {
    %0 = spirv.Variable {aliased_pointer} : !spirv.ptr<!spirv.ptr<f32, PhysicalStorageBuffer>, Function>
    %1 = spirv.Variable {restrict_pointer} : !spirv.ptr<!spirv.ptr<f32, PhysicalStorageBuffer>, Function>
    return
  }
}

// -----
// -----
// -----
module {
  func.func @variable_ptr_array_physical_buffer() {
    %0 = spirv.Variable {aliased_pointer} : !spirv.ptr<!spirv.array<4 x !spirv.ptr<f32, PhysicalStorageBuffer>>, Function>
    %1 = spirv.Variable {restrict_pointer} : !spirv.ptr<!spirv.array<4 x !spirv.ptr<f32, PhysicalStorageBuffer>>, Function>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @copy_memory_print_maa() {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Variable : !spirv.ptr<f32, Function>
    spirv.CopyMemory  "Function" %0,  "Function" %1 ["Volatile"],  ["Volatile"] : f32
    spirv.CopyMemory  "Function" %0,  "Function" %1 ["Aligned", 4],  ["Aligned", 4] : f32
    spirv.CopyMemory  "Function" %0,  "Function" %1 ["Aligned", 4],  ["Volatile"] : f32
    spirv.CopyMemory  "Function" %0,  "Function" %1 ["Aligned", 4],  ["Aligned", 8] : f32
    spirv.Return
  }
}

// -----
module {
  func.func @ptr_access_chain1(%arg0: !spirv.ptr<f32, CrossWorkgroup>, %arg1: i64) {
    %0 = spirv.PtrAccessChain %arg0[%arg1] : !spirv.ptr<f32, CrossWorkgroup>, i64 -> !spirv.ptr<f32, CrossWorkgroup>
    return
  }
}

// -----
module {
  func.func @inbounds_ptr_access_chain1(%arg0: !spirv.ptr<f32, CrossWorkgroup>, %arg1: i64) {
    %0 = spirv.InBoundsPtrAccessChain %arg0[%arg1] : !spirv.ptr<f32, CrossWorkgroup>, i64 -> !spirv.ptr<f32, CrossWorkgroup>
    return
  }
}

