"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "mixedOperations"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %1 = "arith.subf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %2 = "arith.mulf"(%arg0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %3 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %4 = "arith.mulf"(%3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %5 = "arith.subf"(%4, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %6 = "arith.addf"(%4, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%7) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

