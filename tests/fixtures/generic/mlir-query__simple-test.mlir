"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple1"}> ({
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "simple2"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

