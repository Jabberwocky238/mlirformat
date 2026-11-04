"builtin.module"() ({
  "func.func"() <{function_type = (i64, i1) -> i64, sym_name = "simple"}> ({
  ^bb0(%arg4: i64, %arg5: i1):
    "cf.cond_br"(%arg5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg4)[^bb3] : (i64) -> ()
  ^bb2:  // pred: ^bb0
    %2 = "emitc.call_opaque"(%arg4, %arg4) <{callee = "add"}> : (i64, i64) -> i64
    "cf.br"(%2)[^bb3] : (i64) -> ()
  ^bb3(%3: i64):  // 2 preds: ^bb1, ^bb2
    "cf.br"(%3, %arg4)[^bb4] : (i64, i64) -> ()
  ^bb4(%4: i64, %5: i64):  // pred: ^bb3
    %6 = "emitc.call_opaque"(%4, %5) <{callee = "add"}> : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "block_labels0"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "block_labels1"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, i32) -> (), sym_name = "expression_inlining"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "emitc.expression"(%arg0, %arg1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %1 = "emitc.cmp"(%arg2, %arg3) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%1) : (i1) -> ()
    }) : (i32, i32) -> i1
    "cf.cond_br"(%0)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb0
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

