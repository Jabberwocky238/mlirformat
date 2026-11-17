"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fuse_empty_loops"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":7:10), %arg3: index loc("<stdin>":7:24)):
      "scf.reduce"() : () -> () loc("<stdin>":8:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":6:5)
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":11:10), %arg1: index loc("<stdin>":11:24)):
      "scf.reduce"() : () -> () loc("<stdin>":12:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
