"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "pattern_test"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2 = "arith.addi"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":6:10)
    %3 = "arith.subi"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":7:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
