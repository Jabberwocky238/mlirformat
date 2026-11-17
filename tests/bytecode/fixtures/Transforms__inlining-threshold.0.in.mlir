"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "callee1"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":3:8)):
    %1 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":4:10)
    %2 = "arith.addi"(%1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:10)
    %3 = "arith.addi"(%2, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":6:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "caller1"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":10:8)):
    %0 = "func.call"(%arg0) <{callee = @callee1}> : (i32) -> i32 loc("<stdin>":11:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
