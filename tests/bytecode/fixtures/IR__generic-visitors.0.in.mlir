"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "structured_cfg"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":5:10)
    "scf.for"(%1, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":7:10)):
      %3 = "use0"(%arg0) : (index) -> i1 loc("<stdin>":8:12)
      "scf.if"(%3) ({
        "use1"(%arg0) : (index) -> () loc("<stdin>":10:9)
        "scf.yield"() : () -> () loc("<stdin>":11:9)
      }, {
        "use2"(%arg0) : (index) -> () loc("<stdin>":13:9)
        "scf.yield"() : () -> () loc("<stdin>":14:9)
      }) : (i1) -> () loc("<stdin>":9:7)
      "use3"(%arg0) : (index) -> () loc("<stdin>":16:7)
      "scf.yield"() : () -> () loc("<stdin>":17:7)
    }) : (index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
