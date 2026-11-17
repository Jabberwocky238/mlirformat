"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %2 = "arith.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":3:10)
    %3 = "func.call"(%2) <{callee = @emulate_me_please}> : (i64) -> i64 loc("<stdin>":4:10)
    %4 = "func.call"(%2) <{callee = @foo}> : (i64) -> i64 loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i64) -> i64, sym_name = "emulate_me_please"}> ({
  ^bb0(%arg1: i64 loc("<stdin>":9:8)):
    %1 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":10:10)
    "func.return"(%1) : (i64) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (i64) -> i64, sym_name = "foo"}> ({
  ^bb0(%arg0: i64 loc("<stdin>":14:8)):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":15:10)
    "func.return"(%0) : (i64) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":1:1)
