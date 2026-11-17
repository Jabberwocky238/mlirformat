"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xi32>) -> (), sym_name = "single_iteration_some"}> ({
  ^bb0(%arg0: memref<?x?x?xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":8:10)
    %5 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":9:10)
    %6 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":10:10)
    "scf.parallel"(%0, %3, %5, %1, %4, %6, %1, %2, %3) <{operandSegmentSizes = array<i32: 3, 3, 3, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":12:10), %arg2: index loc("<stdin>":12:24), %arg3: index loc("<stdin>":12:38)):
      %7 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":13:12)
      "memref.store"(%7, %arg0, %arg1, %arg2, %arg3) : (i32, memref<?x?x?xi32>, index, index, index) -> () loc("<stdin>":14:7)
      "scf.reduce"() : () -> () loc("<stdin>":15:7)
    }) : (index, index, index, index, index, index, index, index, index) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
