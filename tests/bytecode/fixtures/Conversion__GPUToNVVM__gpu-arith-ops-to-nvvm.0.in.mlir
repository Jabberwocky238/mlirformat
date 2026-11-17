"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module_54"}> ({
    "func.func"() <{function_type = (f32, f32, f64, f64) -> (f32, f32, f64, f64), sym_name = "gpu_fminmax"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10), %arg1: f32 loc("<stdin>":4:22), %arg2: f64 loc("<stdin>":4:34), %arg3: f64 loc("<stdin>":4:46)):
      %0 = "arith.maxnumf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":5:12)
      %1 = "arith.minnumf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":6:12)
      %2 = "arith.maxnumf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":7:12)
      %3 = "arith.minnumf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":8:12)
      "func.return"(%0, %1, %2, %3) : (f32, f32, f64, f64) -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
