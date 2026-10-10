"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "test"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %1 = "arith.addf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "test"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %1 = "arith.addf"(%0, %arg2) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "test"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %1 = "arith.addf"(%arg2, %0) <{fastmath = #arith.fastmath<contract>}> : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

