"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> {always_fail} : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

