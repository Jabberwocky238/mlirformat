"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":4:10)
    "cf.assert"(%0) <{msg = "assertion foo"}> : (i1) -> () loc("<stdin>":5:5)
    "cf.assert"(%1) <{msg = "assertion bar"}> : (i1) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
