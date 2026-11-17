"builtin.module"() ({
  "func.func"() <{function_type = (i1, i32, i32) -> i32, sym_name = "merge_point_arg_not_confused"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":4:8), %arg1: i32 loc("<stdin>":4:19), %arg2: i32 loc("<stdin>":4:31)):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":5:10)
    "memref.store"(%arg1, %0) : (i32, memref<i32>) -> () loc("<stdin>":6:5)
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":7:5)
  ^bb1:  // pred: ^bb0
    "memref.store"(%arg2, %0) : (i32, memref<i32>) -> () loc("<stdin>":9:5)
    "cf.br"(%arg1)[^bb3] : (i32) -> () loc("<stdin>":10:5)
  ^bb2:  // pred: ^bb0
    "cf.br"(%arg2)[^bb3] : (i32) -> () loc("<stdin>":12:5)
  ^bb3(%1: i32 loc("<stdin>":13:8)):  // 2 preds: ^bb1, ^bb2
    "cf.cond_br"(%arg0)[^bb4, ^bb5] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":14:5)
  ^bb4:  // pred: ^bb3
    "memref.store"(%1, %0) : (i32, memref<i32>) -> () loc("<stdin>":16:5)
    "cf.br"()[^bb6] : () -> () loc("<stdin>":17:5)
  ^bb5:  // pred: ^bb3
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":19:10)
    "memref.store"(%2, %0) : (i32, memref<i32>) -> () loc("<stdin>":20:5)
    "cf.br"()[^bb6] : () -> () loc("<stdin>":21:5)
  ^bb6:  // 2 preds: ^bb4, ^bb5
    %3 = "memref.load"(%0) : (memref<i32>) -> i32 loc("<stdin>":23:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
