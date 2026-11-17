"builtin.module"() <{sym_name = "test_module"}> ({
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32), sym_name = "math_bin_f32"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20)):
    %0 = "math.copysign"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":4:10)
    %1 = "math.atan2"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":5:10)
    %2 = "math.powf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":6:10)
    "func.return"(%0, %1, %2) : (f32, f32, f32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
