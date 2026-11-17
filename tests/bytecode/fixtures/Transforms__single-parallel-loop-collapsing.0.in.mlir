"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "collapse_to_single"}> ({
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 11 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 29 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":8:10)
    "scf.parallel"(%0, %1, %2, %3, %4, %5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":10:10), %arg1: index loc("<stdin>":10:24)):
      %6 = "magic.op"(%arg0, %arg1) : (index, index) -> index loc("<stdin>":11:12)
      "scf.reduce"() : () -> () loc("<stdin>":12:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
