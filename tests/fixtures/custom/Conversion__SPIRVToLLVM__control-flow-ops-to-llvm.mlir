module {
  spirv.module Logical GLSL450 {
    spirv.func @branch_without_arguments() "None" {
      spirv.Branch ^bb1
    ^bb1:  // pred: ^bb0
      spirv.Return
    }
    spirv.func @branch_with_arguments() "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %true = spirv.Constant true
      spirv.Branch ^bb1(%cst0_i32, %true : i32, i1)
    ^bb1(%0: i32, %1: i1):  // pred: ^bb0
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @cond_branch_without_arguments() "None" {
      %true = spirv.Constant true
      spirv.BranchConditional %true, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Return
    ^bb2:  // pred: ^bb0
      spirv.Return
    }
    spirv.func @cond_branch_with_arguments_nested() "None" {
      %true = spirv.Constant true
      %cst0_i32 = spirv.Constant 0 : i32
      %false = spirv.Constant false
      spirv.BranchConditional %true, ^bb1(%cst0_i32, %false : i32, i1), ^bb2
    ^bb1(%0: i32, %1: i1):  // pred: ^bb0
      spirv.BranchConditional %1, ^bb3, ^bb4(%0, %0 : i32, i32)
    ^bb2:  // pred: ^bb0
      spirv.Return
    ^bb3:  // pred: ^bb1
      spirv.Return
    ^bb4(%2: i32, %3: i32):  // pred: ^bb1
      spirv.Return
    }
    spirv.func @cond_branch_with_weights(%arg0: i1) "None" {
      spirv.BranchConditional %arg0 [1, 2], ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Return
    ^bb2:  // pred: ^bb0
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @empty_loop() "None" {
      spirv.mlir.loop {
      }
      spirv.Return
    }
    spirv.func @infinite_loop(%arg0: i32) "None" {
      spirv.mlir.loop {
        spirv.Branch ^bb1
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %true = spirv.Constant true
        spirv.BranchConditional %true, ^bb2, ^bb4
      ^bb2:  // pred: ^bb1
        spirv.Branch ^bb3
      ^bb3:  // pred: ^bb2
        spirv.Branch ^bb1
      ^bb4:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @selection_empty() "None" {
      spirv.mlir.selection {
      }
      spirv.Return
    }
    spirv.func @selection_with_merge_block_only() "None" {
      %true = spirv.Constant true
      spirv.mlir.selection {
        spirv.BranchConditional %true, ^bb1, ^bb1
      ^bb1:  // 2 preds: ^bb0, ^bb0
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @selection_with_true_block_only() "None" {
      %true = spirv.Constant true
      spirv.mlir.selection {
        spirv.BranchConditional %true, ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        spirv.Branch ^bb2
      ^bb2:  // 2 preds: ^bb0, ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @selection_with_both_true_and_false_block() "None" {
      %true = spirv.Constant true
      spirv.mlir.selection {
        spirv.BranchConditional %true, ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        spirv.Branch ^bb3
      ^bb2:  // pred: ^bb0
        spirv.Branch ^bb3
      ^bb3:  // 2 preds: ^bb1, ^bb2
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @selection_with_early_return(%arg0: i1) -> i32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      spirv.mlir.selection {
        spirv.BranchConditional %arg0, ^bb1(%cst0_i32 : i32), ^bb2
      ^bb1(%0: i32):  // pred: ^bb0
        spirv.ReturnValue %0 : i32
      ^bb2:  // pred: ^bb0
        spirv.mlir.merge
      }
      %cst1_i32 = spirv.Constant 1 : i32
      spirv.ReturnValue %cst1_i32 : i32
    }
  }
}

