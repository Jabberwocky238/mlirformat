"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "test1"}> ({
  ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
    %6 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %7 = "arith.addf"(%arg2, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %8 = "arith.addf"(%arg4, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %9 = "arith.mulf"(%arg2, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %10 = "arith.mulf"(%9, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %11 = "arith.mulf"(%10, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %12 = "arith.mulf"(%11, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test2"}> ({
  ^bb0(%arg1: f32):
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.addf"(%arg1, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %5 = "arith.mulf"(%arg1, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test3"}> ({
  ^bb0(%arg0: f32):
    %0 = "test.name"() {value = 1.000000e+00 : f32} : () -> f32
    %1 = "arith.addf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %2 = "arith.mulf"(%arg0, %1) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

