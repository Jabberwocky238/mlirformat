"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "func_condBranch"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8)):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":4:5)
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb3] : () -> () loc("<stdin>":6:5)
  ^bb2:  // pred: ^bb0
    "cf.br"()[^bb3] : () -> () loc("<stdin>":8:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
