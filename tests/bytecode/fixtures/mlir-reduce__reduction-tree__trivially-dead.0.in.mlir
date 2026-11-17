"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "trivially_dead"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
