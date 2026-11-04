"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loopForever"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb1
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loopForever2"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "noLoop"}> ({
  ^bb0(%arg5: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "cf.cond_br"(%arg5)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> ()
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "multipleLoops"}> ({
  ^bb0(%arg3: i1, %arg4: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb4
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb1, ^bb3
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    "cf.cond_br"(%arg3)[^bb4, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb4:  // pred: ^bb3
    "cf.cond_br"(%arg4)[^bb1, ^bb5] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb5:  // pred: ^bb4
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "_QPblockTest0"}> ({
  ^bb0(%arg1: i1, %arg2: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb4
    "cf.cond_br"(%arg1)[^bb2, ^bb5] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "cf.cond_br"(%arg2)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    "func.return"() : () -> ()
  ^bb4:  // pred: ^bb2
    "cf.br"()[^bb1] : () -> ()
  ^bb5:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> (), sym_name = "check_alloc_in_loop"}> ({
  ^bb0(%arg0: i64):
    "cf.br"(%arg0)[^bb1] : (i64) -> ()
  ^bb1(%0: i64):  // 2 preds: ^bb0, ^bb2
    %1 = "arith.constant"() <{value = -1 : i64}> : () -> i64
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    %3 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %4 = "arith.cmpi"(%2, %3) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "cf.cond_br"(%4)[^bb3, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "scf.execute_region"() ({
      %5 = "arith.constant"() <{value = 1 : i64}> : () -> i64
      "scf.yield"() : () -> ()
    }) : () -> ()
    "cf.br"(%2)[^bb1] : (i64) -> ()
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

