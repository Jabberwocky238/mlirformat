"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":3:10)
    "cf.assert"(%0) <{msg = "assertion foo"}> : (i1) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
