"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "flush_denormals_f32"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.flush_denormals"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (bf16) -> bf16, sym_name = "flush_denormals_bf16"}> ({
  ^bb0(%arg0: bf16):
    %0 = "arith.flush_denormals"(%arg0) <{fastmath = #arith.fastmath<none>}> : (bf16) -> bf16
    "func.return"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> f16, sym_name = "flush_denormals_f16"}> ({
  ^bb0(%arg0: f16):
    %0 = "arith.flush_denormals"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%0) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "flush_denormals_f64"}> ({
  ^bb0(%arg0: f64):
    %0 = "arith.flush_denormals"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%0) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "flush_denormals_vector"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "arith.flush_denormals"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf32>) -> tensor<8xf32>, sym_name = "flush_denormals_tensor"}> ({
  ^bb0(%arg0: tensor<8xf32>):
    %0 = "arith.flush_denormals"(%arg0) <{fastmath = #arith.fastmath<none>}> : (tensor<8xf32>) -> tensor<8xf32>
    "func.return"(%0) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

