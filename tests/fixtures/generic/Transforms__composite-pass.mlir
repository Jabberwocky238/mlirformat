"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test"}> ({
    %0 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

