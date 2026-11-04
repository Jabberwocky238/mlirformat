"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_loop_single_block"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_loop"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "simple_loop"}> ({
  ^bb0(%arg0: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "cf.cond_br"(%arg0)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb1] : () -> ()
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "single_block_loop"}> ({
  ^bb0(%arg0: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb1
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "nested_loop"}> ({
  ^bb0(%arg0: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "cf.cond_br"(%arg0)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // 2 preds: ^bb1, ^bb3
    "cf.cond_br"(%arg0)[^bb1, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    "cf.br"()[^bb2] : () -> ()
  ^bb4:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "multi_latch"}> ({
  ^bb0(%arg0: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 3 preds: ^bb0, ^bb2, ^bb3
    "cf.cond_br"(%arg0)[^bb4, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "cf.cond_br"(%arg0)[^bb1, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    "cf.br"()[^bb1] : () -> ()
  ^bb4:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "multiple_loops"}> ({
  ^bb0(%arg0: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.cond_br"(%arg0)[^bb3, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // 2 preds: ^bb2, ^bb4
    "cf.cond_br"(%arg0)[^bb5, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb4:  // pred: ^bb3
    "cf.br"()[^bb3] : () -> ()
  ^bb5:  // pred: ^bb3
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

