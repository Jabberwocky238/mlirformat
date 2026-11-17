"builtin.module"() ({
  "func.func"() <{function_type = (vector<11xf32>) -> vector<11xf32>, sym_name = "func"}> ({
  ^bb0(%arg0: vector<11xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = dense<true> : vector<11xi1>}> : () -> vector<11xi1> loc("<stdin>":4:10)
    %1 = "vector.mask"(%0) ({
      "vector.yield"(%arg0) : (vector<11xf32>) -> () loc("<stdin>":6:7)
    }) : (vector<11xi1>) -> vector<11xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (vector<11xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
