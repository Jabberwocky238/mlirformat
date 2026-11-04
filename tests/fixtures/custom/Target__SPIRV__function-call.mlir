module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, VariablePointers, Linkage], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_variable_pointers]> {
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>
    spirv.func @fmain() -> i32 "None" {
      %cst16_i32 = spirv.Constant 16 : i32
      %var1_addr = spirv.mlir.addressof @var1 : !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>
      %0 = spirv.FunctionCall @f_0(%cst16_i32) : (i32) -> i32
      spirv.FunctionCall @f_1(%0, %var1_addr) : (i32, !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>) -> ()
      %1 = spirv.FunctionCall @f_2(%var1_addr) : (!spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>) -> !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>
      spirv.ReturnValue %0 : i32
    }
    spirv.func @f_0(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
    spirv.func @f_1(%arg0: i32, %arg1: !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>) "None" {
      spirv.Return
    }
    spirv.func @f_2(%arg0: !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>) -> !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer> "None" {
      spirv.ReturnValue %arg0 : !spirv.ptr<!spirv.array<4 x f32>, StorageBuffer>
    }
    spirv.func @f_loop_with_function_call(%arg0: i32) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.mlir.loop {
        spirv.Branch ^bb1
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %1 = spirv.Load "Function" %0 : i32
        %2 = spirv.SLessThan %1, %arg0 : i32
        spirv.BranchConditional %2, ^bb2, ^bb4
      ^bb2:  // pred: ^bb1
        spirv.Branch ^bb3
      ^bb3:  // pred: ^bb2
        spirv.FunctionCall @f_inc(%0) : (!spirv.ptr<i32, Function>) -> ()
        spirv.Branch ^bb1
      ^bb4:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @f_inc(%arg0: !spirv.ptr<i32, Function>) "None" {
      %cst1_i32 = spirv.Constant 1 : i32
      %0 = spirv.Load "Function" %arg0 : i32
      %1 = spirv.IAdd %0, %cst1_i32 : i32
      spirv.Store "Function" %arg0, %1 : i32
      spirv.Return
    }
  }
}

