"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "rsqrt32"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":3:8)):
    %2 = "math.rsqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":4:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f64) -> f64, sym_name = "rsqrt64"}> ({
  ^bb0(%arg1: f64 loc("<stdin>":8:8)):
    %1 = "math.rsqrt"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":9:10)
    "func.return"(%1) : (f64) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "negative_rsqrt16"}> ({
  ^bb0(%arg0: f16 loc("<stdin>":13:8)):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":14:10)
    "func.return"(%0) : (f16) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
