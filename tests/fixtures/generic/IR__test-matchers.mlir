"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "test1"}> ({
  ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
    %9 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %10 = "arith.addf"(%arg3, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %11 = "arith.addf"(%arg5, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %12 = "arith.mulf"(%arg3, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %13 = "arith.mulf"(%12, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %14 = "arith.mulf"(%13, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %15 = "arith.mulf"(%14, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test2"}> ({
  ^bb0(%arg2: f32):
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %7 = "arith.addf"(%arg2, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %8 = "arith.mulf"(%arg2, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%8) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test3"}> ({
  ^bb0(%arg1: f32):
    %3 = "test.name"() {value = 1.000000e+00 : f32} : () -> f32
    %4 = "arith.addf"(%arg1, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %5 = "arith.mulf"(%arg1, %4) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test4"}> ({
  ^bb0(%arg0: f32):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.addf"(%arg0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

