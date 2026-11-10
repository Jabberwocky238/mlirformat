"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "maximumf"}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %3 = "arith.maximumf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "minimumf"}> ({
  ^bb0(%arg4: f32, %arg5: f32):
    %2 = "arith.minimumf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "minsi"}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %1 = "arith.minsi"(%arg2, %arg3) : (i32, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "maxsi"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.maxsi"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

