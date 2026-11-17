"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "forward"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg0: index loc("<stdin>":7:10)):
      %3 = "index.add"(%arg0, %arg0) : (index, index) -> index loc("<stdin>":8:12)
      "scf.yield"() : () -> () loc("<stdin>":9:7)
    }) : (index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
