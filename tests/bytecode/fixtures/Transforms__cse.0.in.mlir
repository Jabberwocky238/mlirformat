"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "simple_constant"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":4:10)
    "func.return"(%0, %1) : (i32, i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
