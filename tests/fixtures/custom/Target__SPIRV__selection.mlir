module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @selection(%arg0: i1) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %cst2_i32 = spirv.Constant 2 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.mlir.selection control(Flatten) {
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
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
    spirv.ExecutionMode @main "LocalSize", 1, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @selection(%arg0: i1) -> i32 "None" {
      spirv.mlir.selection {
        spirv.BranchConditional %arg0, ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        %cst0_i32 = spirv.Constant 0 : i32
        spirv.ReturnValue %cst0_i32 : i32
      ^bb2:  // pred: ^bb0
        spirv.mlir.merge
      }
      %cst1_i32 = spirv.Constant 1 : i32
      spirv.ReturnValue %cst1_i32 : i32
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
    spirv.ExecutionMode @main "LocalSize", 1, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @selection_cf() "None" {
      %true = spirv.Constant true
      %false = spirv.Constant false
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %0 = spirv.Variable : !spirv.ptr<i1, Function>
      spirv.mlir.selection {
        spirv.BranchConditional %true, ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        spirv.Store "Function" %0, %true : i1
        spirv.Branch ^bb3
      ^bb2:  // pred: ^bb0
        spirv.Store "Function" %0, %false : i1
        spirv.Branch ^bb3
      ^bb3:  // 2 preds: ^bb1, ^bb2
        spirv.mlir.merge
      }
      %1 = spirv.Load "Function" %0 : i1
      spirv.mlir.selection {
        spirv.BranchConditional %1, ^bb1(%cst1_i32 : i32), ^bb2(%cst0_i32, %cst0_i32 : i32, i32)
      ^bb1(%2: i32):  // pred: ^bb0
        spirv.Return
      ^bb2(%3: i32, %4: i32):  // pred: ^bb0
        spirv.Return
      ^bb3:  // no predecessors
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
    spirv.ExecutionMode @main "LocalSize", 1, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @selection_yield(%arg0: i1) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      %1 = spirv.mlir.selection -> i32 {
        spirv.BranchConditional %arg0 [5, 10], ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        %cst1_i32 = spirv.Constant 1 : i32
        spirv.Branch ^bb3(%cst1_i32 : i32)
      ^bb2:  // pred: ^bb0
        %cst2_i32 = spirv.Constant 2 : i32
        spirv.Branch ^bb3(%cst2_i32 : i32)
      ^bb3(%2: i32):  // 2 preds: ^bb1, ^bb2
        spirv.mlir.merge %2 : i32
      }
      spirv.Store "Function" %0, %1 : i32
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
    spirv.ExecutionMode @main "LocalSize", 1, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @selection_switch(%arg0: i32) "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %cst2_i32 = spirv.Constant 2 : i32
      %cst3_i32 = spirv.Constant 3 : i32
      %cst4_i32 = spirv.Constant 4 : i32
      %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
      spirv.mlir.selection {
        spirv.Switch %arg0 : i32, [
          default: ^bb1,
          0: ^bb2,
          1: ^bb3,
          2: ^bb4
        ]
      ^bb1:  // pred: ^bb0
        spirv.Store "Function" %0, %cst1_i32 : i32
        spirv.Branch ^bb5
      ^bb2:  // pred: ^bb0
        spirv.Store "Function" %0, %cst2_i32 : i32
        spirv.Branch ^bb5
      ^bb3:  // pred: ^bb0
        spirv.Store "Function" %0, %cst3_i32 : i32
        spirv.Branch ^bb5
      ^bb4:  // pred: ^bb0
        spirv.Store "Function" %0, %cst4_i32 : i32
        spirv.Branch ^bb5
      ^bb5:  // 4 preds: ^bb1, ^bb2, ^bb3, ^bb4
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
    spirv.ExecutionMode @main "LocalSize", 1, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.5, [Shader], []> {
    spirv.func @selection_switch_operands(%arg0: si32) "None" {
      %cst_f32 = spirv.Constant 1.000000e+00 : f32
      %0 = spirv.Undef : vector<3xf32>
      %1 = spirv.CompositeInsert %cst_f32, %0[0 : i32] : f32 into vector<3xf32>
      spirv.Branch ^bb1
    ^bb1:  // pred: ^bb0
      %2 = spirv.mlir.selection -> vector<3xf32> {
        spirv.Switch %arg0 : si32, [
          default: ^bb3(%1 : vector<3xf32>),
          0: ^bb1(%1 : vector<3xf32>),
          1: ^bb2(%1 : vector<3xf32>)
        ]
      ^bb1(%4: vector<3xf32>):  // pred: ^bb0
        %cst_f32_1 = spirv.Constant 3.000000e+00 : f32
        %5 = spirv.CompositeInsert %cst_f32_1, %4[1 : i32] : f32 into vector<3xf32>
        spirv.Branch ^bb3(%5 : vector<3xf32>)
      ^bb2(%6: vector<3xf32>):  // pred: ^bb0
        %cst_f32_2 = spirv.Constant 4.000000e+00 : f32
        %7 = spirv.CompositeInsert %cst_f32_2, %6[1 : i32] : f32 into vector<3xf32>
        spirv.Branch ^bb3(%7 : vector<3xf32>)
      ^bb3(%8: vector<3xf32>):  // 3 preds: ^bb0, ^bb1, ^bb2
        spirv.mlir.merge %8 : vector<3xf32>
      }
      %cst_f32_0 = spirv.Constant 2.000000e+00 : f32
      %3 = spirv.CompositeInsert %cst_f32_0, %2[2 : i32] : f32 into vector<3xf32>
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
    spirv.ExecutionMode @main "LocalSize", 1, 1, 1
  }
}

