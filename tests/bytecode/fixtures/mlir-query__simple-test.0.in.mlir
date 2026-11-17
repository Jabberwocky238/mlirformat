"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple1"}> ({
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "simple2"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
