"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "return"}> ({
    "llvm.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i1) -> (), sym_name = "control_flow"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":6:8)):
    "llvm.br"()[^bb1] : () -> () loc("<stdin>":7:5)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    "llvm.cond_br"(%arg0)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":9:5)
  ^bb2:  // pred: ^bb1
    "llvm.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":1:1)
