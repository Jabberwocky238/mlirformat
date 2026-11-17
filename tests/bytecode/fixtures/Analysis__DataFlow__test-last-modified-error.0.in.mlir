"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> {always_fail} : () -> i32 loc("<stdin>":3:10)
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
