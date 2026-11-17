"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "fold_and_merge"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":4:10)
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 6 : i32}> : () -> i32 loc("<stdin>":6:10)
    "func.return"(%2, %3) : (i32, i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
