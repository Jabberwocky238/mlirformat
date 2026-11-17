"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i32, sym_name = "forall_store"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 7 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":6:10)
    "memref.store"(%0, %2) : (i32, memref<i32>) -> () loc("<stdin>":7:5)
    "scf.forall"(%arg0) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg1: index loc("<stdin>":9:10)):
      "memref.store"(%1, %2) : (i32, memref<i32>) -> () loc("<stdin>":10:7)
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> () loc("<stdin>":11:7)
    }) : (index) -> () loc("<stdin>":8:5)
    %3 = "memref.load"(%2) : (memref<i32>) -> i32 loc("<stdin>":15:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
