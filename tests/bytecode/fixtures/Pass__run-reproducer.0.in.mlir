"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":3:10)
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
