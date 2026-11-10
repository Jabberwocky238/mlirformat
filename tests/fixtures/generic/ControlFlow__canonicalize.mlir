"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "assert_true"}> ({
    %0 = "arith.constant"() <{value = true}> : () -> i1
    "cf.assert"(%0) <{msg = "Computer says no"}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "cf.assert"}> ({
  ^bb0(%arg0: i1):
    "cf.assert"(%arg0) <{msg = "Computer says no"}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "branchCondProp"}> ({
  ^bb0(%arg0: i1):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "test.consumer1"(%arg0) : (i1) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "test.consumer2"(%arg0) : (i1) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "cycle_2_blocks"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "no_cycle_2_blocks"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cycle_4_blocks"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb4
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    "cf.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "no_cycle_4_blocks"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    "cf.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    "cf.br"()[^bb5] : () -> ()
  ^bb5:  // pred: ^bb4
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "delayed_3_cycle"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb2, ^bb5
    "cf.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    "cf.br"()[^bb5] : () -> ()
  ^bb5:  // pred: ^bb4
    "cf.br"()[^bb3] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cycle_1_block"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb1, ^bb2
    "cf.br"()[^bb2] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "unsimplified_cycle_1"}> ({
  ^bb0(%arg3: i1):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb2, ^bb4
    "cf.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    "cf.br"()[^bb3] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "unsimplified_cycle_2"}> ({
  ^bb0(%arg2: i1):
    "cf.cond_br"(%arg2)[^bb1, ^bb7] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb7
    "cf.br"()[^bb2] {F} : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb3] {A} : () -> ()
  ^bb3:  // 2 preds: ^bb2, ^bb6
    "cf.br"()[^bb4] {B} : () -> ()
  ^bb4:  // pred: ^bb3
    "cf.br"()[^bb5] {C} : () -> ()
  ^bb5:  // pred: ^bb4
    "cf.br"()[^bb6] {D} : () -> ()
  ^bb6:  // pred: ^bb5
    "cf.br"()[^bb3] {E} : () -> ()
  ^bb7:  // pred: ^bb0
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "drop_unreachable_branch_1"}> ({
  ^bb0(%arg1: i1):
    "cf.cond_br"(%arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "test.foo"() : () -> ()
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "ub.unreachable"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "drop_unreachable_branch_2"}> ({
  ^bb0(%arg0: i1):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "ub.unreachable"() : () -> ()
  ^bb2:  // pred: ^bb0
    "ub.unreachable"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> i1, sym_name = "no_merge_self_arg_loop"}> ({
  ^bb0(%arg12: i1):
    %9 = "arith.constant"() <{value = true}> : () -> i1
    "cf.br"(%9)[^bb1] : (i1) -> ()
  ^bb1(%10: i1):  // pred: ^bb0
    "cf.cond_br"(%10, %9, %arg12, %9)[^bb4, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (i1, i1, i1, i1) -> ()
  ^bb2(%11: i1, %12: i1):  // 2 preds: ^bb1, ^bb3
    "cf.cond_br"(%11, %12)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i1, i1) -> ()
  ^bb3:  // pred: ^bb2
    "cf.br"(%arg12, %12)[^bb2] : (i1, i1) -> ()
  ^bb4(%13: i1):  // 2 preds: ^bb1, ^bb2
    "func.return"(%13) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i32) -> i32, sym_name = "fold_uniform_branch_block_arg"}> ({
  ^bb0(%arg10: i1, %arg11: i32):
    "cf.cond_br"(%arg10)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "foo.op"() : () -> ()
    "cf.br"(%arg11)[^bb3] : (i32) -> ()
  ^bb2:  // pred: ^bb0
    "foo.op"() : () -> ()
    "cf.br"(%arg11)[^bb3] : (i32) -> ()
  ^bb3(%8: i32):  // 2 preds: ^bb1, ^bb2
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i32, i32) -> i32, sym_name = "no_fold_non_uniform_block_arg"}> ({
  ^bb0(%arg7: i1, %arg8: i32, %arg9: i32):
    "cf.cond_br"(%arg7)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "foo.op"() : () -> ()
    "cf.br"(%arg8)[^bb3] : (i32) -> ()
  ^bb2:  // pred: ^bb0
    "foo.op"() : () -> ()
    "cf.br"(%arg9)[^bb3] : (i32) -> ()
  ^bb3(%7: i32):  // 2 preds: ^bb1, ^bb2
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "no_fold_same_dest_different_args"}> ({
  ^bb0(%arg5: i32, %arg6: i32):
    %5 = "test.producing_br"(%arg5, %arg6)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> i32
  ^bb1(%6: i32):  // 2 preds: ^bb0, ^bb0
    "func.return"(%6) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "fold_same_dest_same_args"}> ({
  ^bb0(%arg4: i32):
    %3 = "test.producing_br"(%arg4, %arg4)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> i32
  ^bb1(%4: i32):  // 2 preds: ^bb0, ^bb0
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "no_fold_unknown_terminator"}> ({
  ^bb0(%arg3: i32):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "foo.two_successors"()[^bb2, ^bb3] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"(%arg3)[^bb3] : (i32) -> ()
  ^bb3(%2: i32):  // 2 preds: ^bb1, ^bb2
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "skip_unused_block_arg"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "foo.pred"()[^bb1, ^bb2] : () -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg2, %arg1)[^bb3] : (i32, i32) -> ()
  ^bb2:  // pred: ^bb0
    "cf.br"(%arg1, %arg1)[^bb3] : (i32, i32) -> ()
  ^bb3(%0: i32, %1: i32):  // 2 preds: ^bb1, ^bb2
    "foo.use"(%0) : (i32) -> ()
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

