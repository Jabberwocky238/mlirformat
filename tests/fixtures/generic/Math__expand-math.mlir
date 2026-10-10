"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "tanh"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.tanh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "vector_tanh"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "math.tanh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "tan"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.tan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "vector_tan"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "math.tan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "ctlz"}> ({
  ^bb0(%arg0: i32):
    %0 = "math.ctlz"(%arg0) : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "ctlz_vector"}> ({
  ^bb0(%arg0: vector<4xi32>):
    %0 = "math.ctlz"(%arg0) : (vector<4xi32>) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, f64, f64) -> f64, sym_name = "fmaf_func"}> ({
  ^bb0(%arg0: f64, %arg1: f64, %arg2: f64):
    %0 = "math.fma"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f64, f64, f64) -> f64
    "func.return"(%0) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "ceilf_func"}> ({
  ^bb0(%arg0: f64):
    %0 = "math.ceil"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%0) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "exp2f_func"}> ({
  ^bb0(%arg1: f64):
    %1 = "math.exp2"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xf32>) -> tensor<1xf32>, sym_name = "exp2f_func_tensor"}> ({
  ^bb0(%arg0: tensor<1xf32>):
    %0 = "math.exp2"(%arg0) <{fastmath = #arith.fastmath<none>}> : (tensor<1xf32>) -> tensor<1xf32>
    "func.return"(%0) : (tensor<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "roundf_func"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.round"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "powf_func"}> ({
  ^bb0(%arg8: f64, %arg9: f64):
    %16 = "math.powf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%16) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_zero"}> ({
  ^bb0(%arg7: f64):
    %14 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %15 = "math.powf"(%arg7, %14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%15) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_one"}> ({
  ^bb0(%arg6: f64):
    %12 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %13 = "math.powf"(%arg6, %12) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%13) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_negone"}> ({
  ^bb0(%arg5: f64):
    %10 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %11 = "math.powf"(%arg5, %10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%11) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_half"}> ({
  ^bb0(%arg4: f64):
    %8 = "arith.constant"() <{value = 5.000000e-01 : f64}> : () -> f64
    %9 = "math.powf"(%arg4, %8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%9) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_neghalf"}> ({
  ^bb0(%arg3: f64):
    %6 = "arith.constant"() <{value = -5.000000e-01 : f64}> : () -> f64
    %7 = "math.powf"(%arg3, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%7) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_two"}> ({
  ^bb0(%arg2: f64):
    %4 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %5 = "math.powf"(%arg2, %4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%5) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_negtwo"}> ({
  ^bb0(%arg1: f64):
    %2 = "arith.constant"() <{value = -2.000000e+00 : f64}> : () -> f64
    %3 = "math.powf"(%arg1, %2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%3) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "powf_func_three"}> ({
  ^bb0(%arg0: f64):
    %0 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %1 = "math.powf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "roundeven64"}> ({
  ^bb0(%arg0: f64):
    %0 = "math.roundeven"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%0) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "roundeven32"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.roundeven"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> f16, sym_name = "roundeven16"}> ({
  ^bb0(%arg0: f16):
    %0 = "math.roundeven"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%0) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf32>) -> tensor<8xf32>, sym_name = "math_fpowi_neg_odd_power"}> ({
  ^bb0(%arg0: tensor<8xf32>):
    %0 = "arith.constant"() <{value = dense<-3> : tensor<8xi64>}> : () -> tensor<8xi64>
    %1 = "math.fpowi"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (tensor<8xf32>, tensor<8xi64>) -> tensor<8xf32>
    "func.return"(%1) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf32>) -> tensor<8xf32>, sym_name = "math_fpowi_neg_even_power"}> ({
  ^bb0(%arg0: tensor<8xf32>):
    %0 = "arith.constant"() <{value = dense<-4> : tensor<8xi64>}> : () -> tensor<8xi64>
    %1 = "math.fpowi"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (tensor<8xf32>, tensor<8xi64>) -> tensor<8xf32>
    "func.return"(%1) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf32>) -> tensor<8xf32>, sym_name = "math_fpowi_pos_odd_power"}> ({
  ^bb0(%arg0: tensor<8xf32>):
    %0 = "arith.constant"() <{value = dense<5> : tensor<8xi64>}> : () -> tensor<8xi64>
    %1 = "math.fpowi"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (tensor<8xf32>, tensor<8xi64>) -> tensor<8xf32>
    "func.return"(%1) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf32>) -> tensor<8xf32>, sym_name = "math_fpowi_pos_even_power"}> ({
  ^bb0(%arg0: tensor<8xf32>):
    %0 = "arith.constant"() <{value = dense<4> : tensor<8xi64>}> : () -> tensor<8xi64>
    %1 = "math.fpowi"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (tensor<8xf32>, tensor<8xi64>) -> tensor<8xf32>
    "func.return"(%1) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "math_fpowi_even_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %1 = "math.fpowi"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, i64) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "math_fpowi_scalar_zero"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "math.fpowi"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, i64) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf32>, tensor<8xi32>) -> tensor<8xf32>, sym_name = "math_fpowi_to_powf_tensor"}> ({
  ^bb0(%arg0: tensor<8xf32>, %arg1: tensor<8xi32>):
    %0 = "math.fpowi"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (tensor<8xf32>, tensor<8xi32>) -> tensor<8xf32>
    "func.return"(%0) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i64) -> f32, sym_name = "math_fpowi_to_powf_scalar"}> ({
  ^bb0(%arg0: f32, %arg1: i64):
    %0 = "math.fpowi"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, i64) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> f16, sym_name = "rsqrt16"}> ({
  ^bb0(%arg0: f16):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%0) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "rsqrt32"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "rsqrt64"}> ({
  ^bb0(%arg0: f64):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%0) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<5xf32>) -> vector<5xf32>, sym_name = "rsqrt_vec"}> ({
  ^bb0(%arg0: vector<5xf32>):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<5xf32>) -> vector<5xf32>
    "func.return"(%0) : (vector<5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x8xf32>) -> tensor<5x8xf32>, sym_name = "rsqrt_tns"}> ({
  ^bb0(%arg0: tensor<5x8xf32>):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (tensor<5x8xf32>) -> tensor<5x8xf32>
    "func.return"(%0) : (tensor<5x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "non_static_shape_ceil_op"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "math.ceil"(%arg0) <{fastmath = #arith.fastmath<none>}> : (tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<*xf32>, sym_name = "unranked_ceil_op"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "math.ceil"(%arg0) <{fastmath = #arith.fastmath<none>}> : (tensor<*xf32>) -> tensor<*xf32>
    "func.return"(%0) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "non_static_shape_rsqrt_op"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<*xf32>, sym_name = "unranked_rsqrt_op"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (tensor<*xf32>) -> tensor<*xf32>
    "func.return"(%0) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16, f16, f16) -> f16, sym_name = "clampf_scalar_op"}> ({
  ^bb0(%arg3: f16, %arg4: f16, %arg5: f16):
    %1 = "math.clampf"(%arg3, %arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f16, f16, f16) -> f16
    "func.return"(%1) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4xf32>, vector<3x4xf32>, vector<3x4xf32>) -> vector<3x4xf32>, sym_name = "clampf_vector_op"}> ({
  ^bb0(%arg0: vector<3x4xf32>, %arg1: vector<3x4xf32>, %arg2: vector<3x4xf32>):
    %0 = "math.clampf"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<fast>}> : (vector<3x4xf32>, vector<3x4xf32>, vector<3x4xf32>) -> vector<3x4xf32>
    "func.return"(%0) : (vector<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

