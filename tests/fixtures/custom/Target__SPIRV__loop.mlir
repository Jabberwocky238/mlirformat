module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @loop(%arg0: i32) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.mlir.loop {
        spirv.Branch ^bb1
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %1 = spirv.Load "Function" %0 : i32
        %2 = spirv.SLessThan %1, %arg0 : i32
        spirv.BranchConditional %2 [1, 1], ^bb2, ^bb4
      ^bb2:  // pred: ^bb1
        spirv.Branch ^bb3
      ^bb3:  // pred: ^bb2
        %3 = spirv.Load "Function" %0 : i32
        %4 = spirv.IAdd %3, %cst1_i32 : i32
        spirv.Store "Function" %0, %4 : i32
        spirv.Branch ^bb1
      ^bb4:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]> {
    spirv.GlobalVariable @GV1 bind(0, 0) : !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @GV2 bind(0, 1) : !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>
    spirv.func @loop_kernel() "None" {
      %GV1_addr = spirv.mlir.addressof @GV1 : !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.AccessChain %GV1_addr[%cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>, i32 -> !spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>
      %GV2_addr = spirv.mlir.addressof @GV2 : !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>
      %1 = spirv.AccessChain %GV2_addr[%cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>, i32 -> !spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>
      %cst4_i32 = spirv.Constant 4 : i32
      %cst42_i32 = spirv.Constant 42 : i32
      %cst2_i32 = spirv.Constant 2 : i32
      spirv.mlir.loop {
        spirv.Branch ^bb1(%cst4_i32 : i32)
      ^bb1(%2: i32):  // 2 preds: ^bb0, ^bb2
        %3 = spirv.SLessThan %2, %cst42_i32 : i32
        spirv.BranchConditional %3, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %4 = spirv.AccessChain %0[%2] : !spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>, i32 -> !spirv.ptr<f32, StorageBuffer>
        %5 = spirv.Load "StorageBuffer" %4 : f32
        %6 = spirv.AccessChain %1[%2] : !spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>, i32 -> !spirv.ptr<f32, StorageBuffer>
        spirv.Store "StorageBuffer" %6, %5 : f32
        %7 = spirv.IAdd %2, %cst2_i32 : i32
        spirv.Branch ^bb1(%7 : i32)
      ^bb3:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @loop_kernel
    spirv.ExecutionMode @loop_kernel "LocalSize", 1, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @loop(%arg0: i32) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      %1 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.mlir.loop control(Unroll) {
        spirv.Branch ^bb1
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %2 = spirv.Load "Function" %0 : i32
        %3 = spirv.SLessThan %2, %arg0 : i32
        spirv.BranchConditional %3, ^bb2, ^bb4
      ^bb2:  // pred: ^bb1
        spirv.Store "Function" %1, %cst0_i32 : i32
        spirv.mlir.loop control(DontUnroll) {
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
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Linkage, Addresses, Int64], []> {
    spirv.func @kernel(%arg0: i64) "None" {
      %cst0_i64 = spirv.Constant 0 : i64
      %true = spirv.Constant true
      %false = spirv.Constant false
      spirv.mlir.loop {
        spirv.Branch ^bb1(%arg0 : i64)
      ^bb1(%0: i64):  // 2 preds: ^bb0, ^bb2
        %1 = spirv.SGreaterThan %0, %cst0_i64 : i64
        %2 = spirv.Variable : !spirv.ptr<i1, Function>
        spirv.mlir.selection {
          spirv.BranchConditional %1, ^bb1, ^bb2
        ^bb1:  // pred: ^bb0
          spirv.Store "Function" %2, %true : i1
          spirv.Branch ^bb3
        ^bb2:  // pred: ^bb0
          spirv.Store "Function" %2, %false : i1
          spirv.Branch ^bb3
        ^bb3:  // 2 preds: ^bb1, ^bb2
          spirv.mlir.merge
        }
        %3 = spirv.Load "Function" %2 : i1
        spirv.BranchConditional %3, ^bb2(%0 : i64), ^bb3
      ^bb2(%4: i64):  // pred: ^bb1
        %5 = spirv.SLessThan %4, %cst0_i64 : i64
        spirv.Store "Function" %2, %5 : i1
        spirv.Branch ^bb1(%4 : i64)
      ^bb3:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @loop_yield(%arg0: i32) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      %1 = spirv.mlir.loop -> i32 {
        spirv.Branch ^bb1(%cst0_i32 : i32)
      ^bb1(%2: i32):  // 2 preds: ^bb0, ^bb3
        %3 = spirv.SLessThan %2, %arg0 : i32
        spirv.BranchConditional %3, ^bb2, ^bb4
      ^bb2:  // pred: ^bb1
        spirv.Branch ^bb3
      ^bb3:  // pred: ^bb2
        %4 = spirv.IAdd %2, %cst1_i32 : i32
        spirv.Branch ^bb1(%4 : i32)
      ^bb4:  // pred: ^bb1
        spirv.mlir.merge %2 : i32
      }
      spirv.Store "Function" %0, %1 : i32
      spirv.Return
    }
  }
}

