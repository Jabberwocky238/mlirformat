module {
  func.func @branch() {
    spirv.Branch ^bb1
  ^bb1:  // pred: ^bb0
    spirv.Return
  }
}

// -----
module {
  func.func @branch_argument() {
    %cst0_i32 = spirv.Constant 0 : i32
    spirv.Branch ^bb1(%cst0_i32, %cst0_i32 : i32, i32)
  ^bb1(%0: i32, %1: i32):  // pred: ^bb0
    spirv.Return
  }
}

// -----
// -----
// -----
module {
  func.func @cond_branch() {
    %true = spirv.Constant true
    spirv.BranchConditional %true, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    spirv.Return
  ^bb2:  // pred: ^bb0
    spirv.Return
  }
}

// -----
module {
  func.func @cond_branch_argument() {
    %true = spirv.Constant true
    %cst0_i32 = spirv.Constant 0 : i32
    spirv.BranchConditional %true, ^bb1(%cst0_i32, %cst0_i32 : i32, i32), ^bb2
  ^bb1(%0: i32, %1: i32):  // pred: ^bb0
    spirv.BranchConditional %true, ^bb3, ^bb4(%cst0_i32, %cst0_i32 : i32, i32)
  ^bb2:  // pred: ^bb0
    spirv.Return
  ^bb3:  // pred: ^bb1
    spirv.Return
  ^bb4(%2: i32, %3: i32):  // pred: ^bb1
    spirv.Return
  }
}

// -----
module {
  func.func @cond_branch_with_weights() {
    %true = spirv.Constant true
    spirv.BranchConditional %true [5, 10], ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    spirv.Return
  ^bb2:  // pred: ^bb0
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @fmain(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: i32) -> i32 "None" {
      %0 = spirv.FunctionCall @f_0(%arg0, %arg1) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      spirv.FunctionCall @f_1(%0, %arg1) : (vector<4xf32>, vector<4xf32>) -> ()
      spirv.FunctionCall @f_2() : () -> ()
      %1 = spirv.FunctionCall @f_3(%arg2) : (i32) -> i32
      spirv.ReturnValue %1 : i32
    }
    spirv.func @f_0(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> vector<4xf32> "None" {
      spirv.ReturnValue %arg0 : vector<4xf32>
    }
    spirv.func @f_1(%arg0: vector<4xf32>, %arg1: vector<4xf32>) "None" {
      spirv.Return
    }
    spirv.func @f_2() "None" {
      spirv.Return
    }
    spirv.func @f_3(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
}

// -----
module {
  spirv.func @callee() "None" {
    spirv.Return
  }
  func.func @caller() {
    spirv.FunctionCall @callee() : () -> ()
    spirv.Return
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
module {
  func.func @loop(%arg0: i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst1_i32 = spirv.Constant 1 : i32
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
      %3 = spirv.Load "Function" %0 : i32
      %4 = spirv.IAdd %3, %cst1_i32 : i32
      spirv.Store "Function" %0, %4 : i32
      spirv.Branch ^bb1
    ^bb4:  // pred: ^bb1
      spirv.mlir.merge
    }
    return
  }
}

// -----
module {
  func.func @empty_region() {
    spirv.mlir.loop {
    }
    return
  }
}

// -----
module {
  func.func @loop_with_control() {
    spirv.mlir.loop control(Unroll) {
    }
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
module {
  func.func @loop_yield(%arg0: i32) {
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
module {
  func.func @in_selection(%arg0: i1) {
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Return
    ^bb2:  // pred: ^bb0
      spirv.mlir.merge
    }
    spirv.Return
  }
  func.func @in_loop(%arg0: i1) {
    spirv.mlir.loop {
      spirv.Branch ^bb1
    ^bb1:  // 2 preds: ^bb0, ^bb3
      spirv.BranchConditional %arg0, ^bb2, ^bb4
    ^bb2:  // pred: ^bb1
      spirv.Return
    ^bb3:  // no predecessors
      spirv.Branch ^bb1
    ^bb4:  // pred: ^bb1
      spirv.mlir.merge
    }
    spirv.Return
  }
  func.func @in_other_func_like_op() {
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @ret_val() -> i32 {
    %cst42_i32 = spirv.Constant 42 : i32
    spirv.ReturnValue %cst42_i32 : i32
  }
  func.func @in_selection(%arg0: i1) -> i32 {
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
  func.func @in_loop(%arg0: i1) -> i32 {
    spirv.mlir.loop {
      spirv.Branch ^bb1
    ^bb1:  // 2 preds: ^bb0, ^bb3
      spirv.BranchConditional %arg0, ^bb2, ^bb4
    ^bb2:  // pred: ^bb1
      %cst0_i32 = spirv.Constant 0 : i32
      spirv.ReturnValue %cst0_i32 : i32
    ^bb3:  // no predecessors
      spirv.Branch ^bb1
    ^bb4:  // pred: ^bb1
      spirv.mlir.merge
    }
    %cst1_i32 = spirv.Constant 1 : i32
    spirv.ReturnValue %cst1_i32 : i32
  }
  func.func @in_other_func_like_op(%arg0: i32) -> i32 {
    spirv.ReturnValue %arg0 : i32
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @selection(%arg0: i1) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst1_i32 : i32
      spirv.Branch ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @selection(%arg0: i1) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst1_i32 = spirv.Constant 1 : i32
    %cst2_i32 = spirv.Constant 2 : i32
    %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
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
}

// -----
module {
  func.func @selection_switch(%arg0: i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst1_i32 = spirv.Constant 1 : i32
    %cst2_i32 = spirv.Constant 2 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
    spirv.mlir.selection {
      spirv.Switch %arg0 : i32, [
        default: ^bb1,
        0: ^bb2,
        1: ^bb3
      ]
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst1_i32 : i32
      spirv.Branch ^bb4
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %0, %cst2_i32 : i32
      spirv.Branch ^bb4
    ^bb3:  // pred: ^bb0
      spirv.Store "Function" %0, %cst3_i32 : i32
      spirv.Branch ^bb4
    ^bb4:  // 3 preds: ^bb1, ^bb2, ^bb3
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @empty_region() {
    spirv.mlir.selection {
    }
    return
  }
}

// -----
module {
  func.func @selection_with_control() {
    spirv.mlir.selection control(Flatten) {
    }
    return
  }
}

// -----
// -----
// -----
module {
  func.func @selection_yield(%arg0: i1) {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
    %1 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
    %2:2 = spirv.mlir.selection -> i32, i32 {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %cst1_i32 = spirv.Constant 1 : i32
      %cst3_i32 = spirv.Constant 3 : i32
      spirv.Branch ^bb3(%cst1_i32, %cst3_i32 : i32, i32)
    ^bb2:  // pred: ^bb0
      %cst2_i32 = spirv.Constant 2 : i32
      %cst4_i32 = spirv.Constant 4 : i32
      spirv.Branch ^bb3(%cst2_i32, %cst4_i32 : i32, i32)
    ^bb3(%3: i32, %4: i32):  // 2 preds: ^bb1, ^bb2
      spirv.mlir.merge %3, %4 : i32, i32
    }
    spirv.Store "Function" %0, %2#0 : i32
    spirv.Store "Function" %1, %2#1 : i32
    spirv.Return
  }
}

// -----
// -----
// -----
module {
  func.func @unreachable_no_pred() {
    spirv.Return
  ^bb1:  // no predecessors
    spirv.Unreachable
  }
  func.func @unreachable_with_pred() {
    spirv.Return
  ^bb1:  // no predecessors
    spirv.Branch ^bb2
  ^bb2:  // pred: ^bb1
    spirv.Unreachable
  }
}

// -----
// -----
module {
  func.func @kill() {
    spirv.Kill
  }
}

// -----
module {
  func.func @switch(%arg0: i32) {
    spirv.Switch %arg0 : i32, [
      default: ^bb1,
      0: ^bb2,
      1: ^bb3,
      2: ^bb4
    ]
  ^bb1:  // pred: ^bb0
    spirv.Branch ^bb5
  ^bb2:  // pred: ^bb0
    spirv.Branch ^bb5
  ^bb3:  // pred: ^bb0
    spirv.Branch ^bb5
  ^bb4:  // pred: ^bb0
    spirv.Branch ^bb5
  ^bb5:  // 4 preds: ^bb1, ^bb2, ^bb3, ^bb4
    spirv.Return
  }
  func.func @switch_only_default(%arg0: i32) {
    spirv.Switch %arg0 : i32, [
      default: ^bb1]
  ^bb1:  // pred: ^bb0
    spirv.Branch ^bb2
  ^bb2:  // pred: ^bb1
    spirv.Return
  }
  func.func @switch_operands(%arg0: i32, %arg1: i32) {
    spirv.Switch %arg0 : i32, [
      default: ^bb1(%arg1 : i32),
      0: ^bb2(%arg1 : i32),
      1: ^bb3(%arg1 : i32)
    ]
  ^bb1(%0: i32):  // pred: ^bb0
    spirv.Branch ^bb4
  ^bb2(%1: i32):  // pred: ^bb0
    spirv.Branch ^bb4
  ^bb3(%2: i32):  // pred: ^bb0
    spirv.Branch ^bb4
  ^bb4:  // 3 preds: ^bb1, ^bb2, ^bb3
    spirv.Return
  }
  func.func @switch_targets_no_literals(%arg0: i32) {
    spirv.Switch %arg0 : i32, [
      default: ^bb1]
  ^bb1:  // pred: ^bb0
    spirv.Branch ^bb3
  ^bb2:  // pred: ^bb0
    spirv.Branch ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
