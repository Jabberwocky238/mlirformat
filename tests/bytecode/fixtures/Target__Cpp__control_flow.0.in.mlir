"builtin.module"() ({
  "func.func"() <{function_type = (i64, i1) -> i64, sym_name = "simple"}> ({
  ^bb0(%arg4: i64 loc("<stdin>":3:8), %arg5: i1 loc("<stdin>":3:20)):
    "cf.cond_br"(%arg5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":4:5)
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg4)[^bb3] : (i64) -> () loc("<stdin>":6:5)
  ^bb2:  // pred: ^bb0
    %2 = "emitc.call_opaque"(%arg4, %arg4) <{callee = "add"}> : (i64, i64) -> i64 loc("<stdin>":8:10)
    "cf.br"(%2)[^bb3] : (i64) -> () loc("<stdin>":9:5)
  ^bb3(%3: i64 loc("<stdin>":10:8)):  // 2 preds: ^bb1, ^bb2
    "cf.br"(%3, %arg4)[^bb4] : (i64, i64) -> () loc("<stdin>":11:5)
  ^bb4(%4: i64 loc("<stdin>":12:8), %5: i64 loc("<stdin>":12:17)):  // pred: ^bb3
    %6 = "emitc.call_opaque"(%4, %5) <{callee = "add"}> : (i64, i64) -> i64 loc("<stdin>":13:10)
    "func.return"(%6) : (i64) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "block_labels0"}> ({
    "cf.br"()[^bb1] : () -> () loc("<stdin>":17:5)
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "block_labels1"}> ({
    "cf.br"()[^bb1] : () -> () loc("<stdin>":22:5)
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":21:3)
  "emitc.func"() <{function_type = (i32, i32) -> (), sym_name = "expression_inlining"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":27:8), %arg1: i32 loc("<stdin>":27:20)):
    %0 = "emitc.expression"(%arg0, %arg1) ({
    ^bb0(%arg2: i32 loc("<stdin>":29:10), %arg3: i32 loc("<stdin>":29:22)):
      %1 = "emitc.cmp"(%arg2, %arg3) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":30:12)
      "emitc.yield"(%1) : (i1) -> () loc("<stdin>":31:7)
    }) : (i32, i32) -> i1 loc("<stdin>":28:10)
    "cf.cond_br"(%0)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":33:5)
  ^bb1:  // 2 preds: ^bb0, ^bb0
    "emitc.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
