"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "rsqrt32"}> ({
  ^bb0(%arg2: f32):
    %2 = "math.rsqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "rsqrt64"}> ({
  ^bb0(%arg1: f64):
    %1 = "math.rsqrt"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16) -> f16, sym_name = "negative_rsqrt16"}> ({
  ^bb0(%arg0: f16):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%0) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

