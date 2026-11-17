"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "f"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "scf.if"(%arg0) ({
      "scf.yield"(%0) : (i32) -> () loc("<stdin>":6:7)
    }, {
      "scf.yield"(%0) : (i32) -> () loc("<stdin>":8:7)
    }) : (i1) -> i32 loc("<stdin>":5:10)
    %2 = "arith.addi"(%1, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":10:10)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
