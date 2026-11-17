"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "recurse_fold_traits"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "arith.addi"(%0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
