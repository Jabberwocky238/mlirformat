"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "loopForever"}> ({
    "cf.br"()[^bb1] : () -> () loc("<stdin>":6:5)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    "cf.br"()[^bb1] : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "loopForever2"}> ({
    "cf.br"()[^bb1] : () -> () loc("<stdin>":11:5)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "cf.br"()[^bb2] : () -> () loc("<stdin>":13:5)
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb1] : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (i1) -> (), sym_name = "noLoop"}> ({
  ^bb0(%arg5: i1 loc("<stdin>":18:8)):
    "cf.br"()[^bb1] : () -> () loc("<stdin>":19:5)
  ^bb1:  // pred: ^bb0
    "cf.cond_br"(%arg5)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":21:5)
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":23:5)
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "multipleLoops"}> ({
  ^bb0(%arg3: i1 loc("<stdin>":28:8), %arg4: i1 loc("<stdin>":28:19)):
    "cf.br"()[^bb1] : () -> () loc("<stdin>":29:5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    "cf.br"()[^bb2] : () -> () loc("<stdin>":31:5)
  ^bb2:  // 2 preds: ^bb1, ^bb3
    "cf.br"()[^bb3] : () -> () loc("<stdin>":33:5)
  ^bb3:  // pred: ^bb2
    "cf.cond_br"(%arg3)[^bb4, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":35:5)
  ^bb4:  // pred: ^bb3
    "cf.cond_br"(%arg4)[^bb1, ^bb5] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":37:5)
  ^bb5:  // pred: ^bb4
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "_QPblockTest0"}> ({
  ^bb0(%arg1: i1 loc("<stdin>":42:8), %arg2: i1 loc("<stdin>":42:19)):
    "cf.br"()[^bb1] : () -> () loc("<stdin>":43:5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    "cf.cond_br"(%arg1)[^bb2, ^bb5] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":45:5)
  ^bb2:  // pred: ^bb1
    "cf.cond_br"(%arg2)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":47:5)
  ^bb3:  // pred: ^bb2
    "func.return"() : () -> () loc("<stdin>":49:5)
  ^bb4:  // pred: ^bb2
    "cf.br"()[^bb1] : () -> () loc("<stdin>":51:5)
  ^bb5:  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (i64) -> (), sym_name = "check_alloc_in_loop"}> ({
  ^bb0(%arg0: i64 loc("<stdin>":56:8)):
    "cf.br"(%arg0)[^bb1] : (i64) -> () loc("<stdin>":57:5)
  ^bb1(%0: i64 loc("<stdin>":58:8)):  // 2 preds: ^bb0, ^bb2
    %1 = "arith.constant"() <{value = -1 : i64}> : () -> i64 loc("<stdin>":59:10)
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":60:10)
    %3 = "arith.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":61:10)
    %4 = "arith.cmpi"(%2, %3) <{predicate = 0 : i64}> : (i64, i64) -> i1 loc("<stdin>":62:10)
    "cf.cond_br"(%4)[^bb3, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":63:5)
  ^bb2:  // pred: ^bb1
    "scf.execute_region"() ({
      %5 = "arith.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":66:12)
      "scf.yield"() : () -> () loc("<stdin>":67:7)
    }) : () -> () loc("<stdin>":65:5)
    "cf.br"(%2)[^bb1] : (i64) -> () loc("<stdin>":69:5)
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":55:3)
}) : () -> () loc("<stdin>":1:1)
