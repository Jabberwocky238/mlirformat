"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "branch"}> ({
    "spirv.Branch"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "branch_argument"}> ({
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    "spirv.Branch"(%0, %0)[^bb1] : (i32, i32) -> ()
  ^bb1(%1: i32, %2: i32):  // pred: ^bb0
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "cond_branch"}> ({
    %0 = "spirv.Constant"() <{value = true}> : () -> i1
    "spirv.BranchConditional"(%0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "spirv.Return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "cond_branch_argument"}> ({
    %0 = "spirv.Constant"() <{value = true}> : () -> i1
    %1 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    "spirv.BranchConditional"(%0, %1, %1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (i1, i32, i32) -> ()
  ^bb1(%2: i32, %3: i32):  // pred: ^bb0
    "spirv.BranchConditional"(%0, %1, %1)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 2>}> : (i1, i32, i32) -> ()
  ^bb2:  // pred: ^bb0
    "spirv.Return"() : () -> ()
  ^bb3:  // pred: ^bb1
    "spirv.Return"() : () -> ()
  ^bb4(%4: i32, %5: i32):  // pred: ^bb1
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "cond_branch_with_weights"}> ({
    %0 = "spirv.Constant"() <{value = true}> : () -> i1
    "spirv.BranchConditional"(%0)[^bb1, ^bb2] <{branch_weights = [5 : i32, 10 : i32], operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "spirv.Return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>, i32) -> i32, sym_name = "fmain"}> ({
    ^bb0(%arg5: vector<4xf32>, %arg6: vector<4xf32>, %arg7: i32):
      %0 = "spirv.FunctionCall"(%arg5, %arg6) <{callee = @f_0}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "spirv.FunctionCall"(%0, %arg6) <{callee = @f_1}> : (vector<4xf32>, vector<4xf32>) -> ()
      "spirv.FunctionCall"() <{callee = @f_2}> : () -> ()
      %1 = "spirv.FunctionCall"(%arg7) <{callee = @f_3}> : (i32) -> i32
      "spirv.ReturnValue"(%1) : (i32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "f_0"}> ({
    ^bb0(%arg3: vector<4xf32>, %arg4: vector<4xf32>):
      "spirv.ReturnValue"(%arg3) : (vector<4xf32>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "f_1"}> ({
    ^bb0(%arg1: vector<4xf32>, %arg2: vector<4xf32>):
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "f_2"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "f_3"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "callee"}> ({
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "caller"}> ({
    "spirv.FunctionCall"() <{callee = @callee}> : () -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "loop"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
    "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
      "spirv.Branch"()[^bb1] : () -> ()
    ^bb1:  // 2 preds: ^bb0, ^bb3
      %3 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32
      %4 = "spirv.SLessThan"(%3, %arg0) : (i32, i32) -> i1
      "spirv.BranchConditional"(%4)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "spirv.Branch"()[^bb3] : () -> ()
    ^bb3:  // pred: ^bb2
      %5 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32
      %6 = "spirv.IAdd"(%5, %1) : (i32, i32) -> i32
      "spirv.Store"(%2, %6) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Branch"()[^bb1] : () -> ()
    ^bb4:  // pred: ^bb1
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "empty_region"}> ({
    "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_with_control"}> ({
    "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<Unroll>}> ({
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "loop_yield"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
    %3 = "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
      "spirv.Branch"(%0)[^bb1] : (i32) -> ()
    ^bb1(%4: i32):  // 2 preds: ^bb0, ^bb3
      %5 = "spirv.SLessThan"(%4, %arg0) : (i32, i32) -> i1
      "spirv.BranchConditional"(%5)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "spirv.Branch"()[^bb3] : () -> ()
    ^bb3:  // pred: ^bb2
      %6 = "spirv.IAdd"(%4, %1) : (i32, i32) -> i32
      "spirv.Branch"(%6)[^bb1] : (i32) -> ()
    ^bb4:  // pred: ^bb1
      "spirv.mlir.merge"(%4) : (i32) -> ()
    }) : () -> i32
    "spirv.Store"(%2, %3) : (!spirv.ptr<i32, Function>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "in_selection"}> ({
  ^bb0(%arg1: i1):
    "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
      "spirv.BranchConditional"(%arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      "spirv.Return"() : () -> ()
    ^bb2:  // pred: ^bb0
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "in_loop"}> ({
  ^bb0(%arg0: i1):
    "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
      "spirv.Branch"()[^bb1] : () -> ()
    ^bb1:  // 2 preds: ^bb0, ^bb3
      "spirv.BranchConditional"(%arg0)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "spirv.Return"() : () -> ()
    ^bb3:  // no predecessors
      "spirv.Branch"()[^bb1] : () -> ()
    ^bb4:  // pred: ^bb1
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "in_other_func_like_op"}> ({
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "ret_val"}> ({
    %4 = "spirv.Constant"() <{value = 42 : i32}> : () -> i32
    "spirv.ReturnValue"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i32, sym_name = "in_selection"}> ({
  ^bb0(%arg2: i1):
    "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
      "spirv.BranchConditional"(%arg2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      %3 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      "spirv.ReturnValue"(%3) : (i32) -> ()
    ^bb2:  // pred: ^bb0
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    %2 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    "spirv.ReturnValue"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i32, sym_name = "in_loop"}> ({
  ^bb0(%arg1: i1):
    "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
      "spirv.Branch"()[^bb1] : () -> ()
    ^bb1:  // 2 preds: ^bb0, ^bb3
      "spirv.BranchConditional"(%arg1)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      %1 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      "spirv.ReturnValue"(%1) : (i32) -> ()
    ^bb3:  // no predecessors
      "spirv.Branch"()[^bb1] : () -> ()
    ^bb4:  // pred: ^bb1
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "in_other_func_like_op"}> ({
  ^bb0(%arg0: i32):
    "spirv.ReturnValue"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "selection"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
    "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
      "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      "spirv.Store"(%2, %1) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Branch"()[^bb2] : () -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "selection"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %2 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
    %3 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
    "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
      "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      "spirv.Store"(%3, %1) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Branch"()[^bb3] : () -> ()
    ^bb2:  // pred: ^bb0
      "spirv.Store"(%3, %2) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Branch"()[^bb3] : () -> ()
    ^bb3:  // 2 preds: ^bb1, ^bb2
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "selection_switch"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %2 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
    %3 = "spirv.Constant"() <{value = 3 : i32}> : () -> i32
    %4 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
    "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
      "spirv.Switch"(%arg0)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 0, 0>, literals = dense<[0, 1]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
    ^bb1:  // pred: ^bb0
      "spirv.Store"(%4, %1) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Branch"()[^bb4] : () -> ()
    ^bb2:  // pred: ^bb0
      "spirv.Store"(%4, %2) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Branch"()[^bb4] : () -> ()
    ^bb3:  // pred: ^bb0
      "spirv.Store"(%4, %3) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Branch"()[^bb4] : () -> ()
    ^bb4:  // 3 preds: ^bb1, ^bb2, ^bb3
      "spirv.mlir.merge"() : () -> ()
    }) : () -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "empty_region"}> ({
    "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "selection_with_control"}> ({
    "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<Flatten>}> ({
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "selection_yield"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
    %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
    %3:2 = "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
      "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      %4 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %5 = "spirv.Constant"() <{value = 3 : i32}> : () -> i32
      "spirv.Branch"(%4, %5)[^bb3] : (i32, i32) -> ()
    ^bb2:  // pred: ^bb0
      %6 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
      %7 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
      "spirv.Branch"(%6, %7)[^bb3] : (i32, i32) -> ()
    ^bb3(%8: i32, %9: i32):  // 2 preds: ^bb1, ^bb2
      "spirv.mlir.merge"(%8, %9) : (i32, i32) -> ()
    }) : () -> (i32, i32)
    "spirv.Store"(%1, %3#0) : (!spirv.ptr<i32, Function>, i32) -> ()
    "spirv.Store"(%2, %3#1) : (!spirv.ptr<i32, Function>, i32) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unreachable_no_pred"}> ({
    "spirv.Return"() : () -> ()
  ^bb1:  // no predecessors
    "spirv.Unreachable"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unreachable_with_pred"}> ({
    "spirv.Return"() : () -> ()
  ^bb1:  // no predecessors
    "spirv.Branch"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "spirv.Unreachable"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "kill"}> ({
    "spirv.Kill"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "switch"}> ({
  ^bb0(%arg4: i32):
    "spirv.Switch"(%arg4)[^bb1, ^bb2, ^bb3, ^bb4] <{case_operand_segments = array<i32: 0, 0, 0>, literals = dense<[0, 1, 2]> : vector<3xi32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb1:  // pred: ^bb0
    "spirv.Branch"()[^bb5] : () -> ()
  ^bb2:  // pred: ^bb0
    "spirv.Branch"()[^bb5] : () -> ()
  ^bb3:  // pred: ^bb0
    "spirv.Branch"()[^bb5] : () -> ()
  ^bb4:  // pred: ^bb0
    "spirv.Branch"()[^bb5] : () -> ()
  ^bb5:  // 4 preds: ^bb1, ^bb2, ^bb3, ^bb4
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "switch_only_default"}> ({
  ^bb0(%arg3: i32):
    "spirv.Switch"(%arg3)[^bb1] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb1:  // pred: ^bb0
    "spirv.Branch"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "switch_operands"}> ({
  ^bb0(%arg1: i32, %arg2: i32):
    "spirv.Switch"(%arg1, %arg2, %arg2, %arg2)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 1>, literals = dense<[0, 1]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (i32, i32, i32, i32) -> ()
  ^bb1(%0: i32):  // pred: ^bb0
    "spirv.Branch"()[^bb4] : () -> ()
  ^bb2(%1: i32):  // pred: ^bb0
    "spirv.Branch"()[^bb4] : () -> ()
  ^bb3(%2: i32):  // pred: ^bb0
    "spirv.Branch"()[^bb4] : () -> ()
  ^bb4:  // 3 preds: ^bb1, ^bb2, ^bb3
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "switch_targets_no_literals"}> ({
  ^bb0(%arg0: i32):
    "spirv.Switch"(%arg0)[^bb1, ^bb2] <{case_operand_segments = array<i32: 0>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb1:  // pred: ^bb0
    "spirv.Branch"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "spirv.Branch"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
