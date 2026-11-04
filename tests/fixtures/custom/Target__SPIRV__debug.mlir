module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.3, [Shader, GroupNonUniformArithmetic], [SPV_KHR_non_semantic_info, SPV_KHR_storage_buffer_storage_class]> attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, GroupNonUniformArithmetic], [SPV_KHR_non_semantic_info, SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
    spirv.GlobalVariable @var0 bind(0, 1) : !spirv.ptr<f32, Input>
    spirv.func @arithmetic(%arg0: vector<4xf32>, %arg1: vector<4xf32>) "None" {
      %0 = spirv.FAdd %arg0, %arg1 : vector<4xf32>
      %1 = spirv.FNegate %arg0 : vector<4xf32>
      spirv.Return
    }
    spirv.func @atomic(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) "None" {
      %0 = spirv.AtomicAnd <Device> <None> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      spirv.Return
    }
    spirv.func @bitwiser(%arg0: i32, %arg1: i32) "None" {
      %0 = spirv.BitwiseAnd %arg0, %arg1 : i32
      spirv.Return
    }
    spirv.func @convert(%arg0: f32) "None" {
      %0 = spirv.ConvertFToU %arg0 : f32 to i32
      spirv.Return
    }
    spirv.func @composite(%arg0: !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)>, %arg1: !spirv.array<4 x f32>, %arg2: f32, %arg3: f32) "None" {
      %0 = spirv.CompositeInsert %arg1, %arg0[1 : i32, 0 : i32] : !spirv.array<4 x f32> into !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)>
      %1 = spirv.CompositeConstruct %arg2, %arg3 : (f32, f32) -> vector<2xf32>
      spirv.Return
    }
    spirv.func @group_non_uniform(%arg0: f32) "None" {
      %0 = spirv.GroupNonUniformFAdd <Workgroup> <Reduce> %arg0 : f32 -> f32
      spirv.Return
    }
    spirv.func @local_var() "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.Return
    }
    spirv.func @logical(%arg0: i32, %arg1: i32) "None" {
      %0 = spirv.IEqual %arg0, %arg1 : i32
      spirv.Return
    }
    spirv.func @memory_accesses(%arg0: !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, StorageBuffer>, %arg1: i32, %arg2: i32) "None" {
      %0 = spirv.AccessChain %arg0[%arg1, %arg2] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : f32
      spirv.Store "StorageBuffer" %0, %1 : f32
      spirv.Return
    }
    spirv.func @loop(%arg0: i32) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      %1 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.mlir.loop {
        spirv.Branch ^bb1
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %2 = spirv.Load "Function" %0 : i32
        %3 = spirv.SLessThan %2, %arg0 : i32
        spirv.BranchConditional %3, ^bb2, ^bb4
      ^bb2:  // pred: ^bb1
        spirv.Store "Function" %1, %cst0_i32 : i32
        spirv.mlir.loop {
          spirv.Branch ^bb1
        ^bb1:  // 2 preds: ^bb0, ^bb3
          %6 = spirv.Load "Function" %1 : i32
          %7 = spirv.SLessThan %6, %arg0 : i32
          spirv.BranchConditional %7, ^bb2, ^bb4
        ^bb2:  // pred: ^bb1
          spirv.Branch ^bb3
        ^bb3:  // pred: ^bb2
          %8 = spirv.Load "Function" %1 : i32
          %9 = spirv.IAdd %8, %cst1_i32 : i32
          spirv.Store "Function" %1, %9 : i32
          spirv.Branch ^bb1
        ^bb4:  // pred: ^bb1
          spirv.mlir.merge
        }
        spirv.Branch ^bb3
      ^bb3:  // pred: ^bb2
        %4 = spirv.Load "Function" %0 : i32
        %5 = spirv.IAdd %4, %cst1_i32 : i32
        spirv.Store "Function" %0, %5 : i32
        spirv.Branch ^bb1
      ^bb4:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @selection(%arg0: i1) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %cst2_i32 = spirv.Constant 2 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.mlir.selection {
        spirv.BranchConditional %arg0 [5, 10], ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        spirv.Store "Function" %0, %cst1_i32 : i32
        spirv.Branch ^bb3
      ^bb2:  // pred: ^bb0
        spirv.Store "Function" %0, %cst2_i32 : i32
        spirv.Branch ^bb3
      ^bb3:  // 2 preds: ^bb1, ^bb2
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @local_var
  }
}

