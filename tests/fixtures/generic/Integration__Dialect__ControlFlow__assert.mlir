"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "arith.constant"() <{value = true}> : () -> i1
    "cf.assert"(%0) <{msg = "assertion foo"}> : (i1) -> ()
    "cf.assert"(%1) <{msg = "assertion bar"}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

