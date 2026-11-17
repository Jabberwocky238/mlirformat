"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "one_3d_nest"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 56 : index}> : () -> index loc("<stdin>":8:10)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg0: index loc("<stdin>":10:10)):
      "scf.for"(%0, %5, %1) ({
      ^bb0(%arg1: index loc("<stdin>":12:12)):
        "scf.for"(%0, %3, %1) ({
        ^bb0(%arg2: index loc("<stdin>":14:14)):
          "use"(%arg0, %arg1, %arg2) : (index, index, index) -> () loc("<stdin>":15:11)
          "scf.yield"() : () -> () loc("<stdin>":16:11)
        }) : (index, index, index) -> () loc("<stdin>":13:9)
        "scf.yield"() : () -> () loc("<stdin>":18:9)
      }) : (index, index, index) -> () loc("<stdin>":11:7)
      "scf.yield"() : () -> () loc("<stdin>":20:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
