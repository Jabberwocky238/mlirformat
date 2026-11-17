"builtin.module"() <{sym_name = "test_module"}> ({
  "func.func"() <{function_type = (f16, f32, f64) -> (f16, f32, f64), sym_name = "arith_remf"}> ({
  ^bb0(%arg0: f16 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: f64 loc("<stdin>":3:32)):
    %0 = "arith.remf"(%arg0, %arg0) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":4:10)
    %1 = "arith.remf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":5:10)
    %2 = "arith.remf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":6:10)
    "func.return"(%0, %1, %2) : (f16, f32, f64) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
