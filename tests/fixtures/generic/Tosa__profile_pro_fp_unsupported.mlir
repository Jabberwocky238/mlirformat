"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x11x11x3xf16>, sym_name = "test_const_f16"}> ({
    %0 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<3x11x11x3xf16>}> : () -> tensor<3x11x11x3xf16>
    "func.return"(%0) : (tensor<3x11x11x3xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x11x11x3xf32>, sym_name = "test_const_f32"}> ({
    %0 = "tosa.const"() <{values = dense<3.000000e+00> : tensor<3x11x11x3xf32>}> : () -> tensor<3x11x11x3xf32>
    "func.return"(%0) : (tensor<3x11x11x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x7x7x9xf32>, sym_name = "test_avg_pool2d"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>):
    %0 = "tosa.avg_pool2d"(%arg0, %arg1, %arg2) <{acc_type = f32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x7x7x9xf32>
    "func.return"(%0) : (tensor<1x7x7x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>, sym_name = "test_conv2d"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf32>, %arg1: tensor<8x1x1x4xf32>, %arg2: tensor<8xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>
    "func.return"(%0) : (tensor<1x4x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x8x21x17xf16>, tensor<34x1x1x1x17xf16>, tensor<34xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x4x8x21x34xf16>, sym_name = "test_conv3d"}> ({
  ^bb0(%arg0: tensor<1x4x8x21x17xf16>, %arg1: tensor<34x1x1x1x17xf16>, %arg2: tensor<34xf16>, %arg3: tensor<1xf16>, %arg4: tensor<1xf16>):
    %0 = "tosa.conv3d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>}> : (tensor<1x4x8x21x17xf16>, tensor<34x1x1x1x17xf16>, tensor<34xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x4x8x21x34xf16>
    "func.return"(%0) : (tensor<1x4x8x21x34xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf16>, tensor<1x1x4x2xf16>, tensor<8xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x4x4x8xf16>, sym_name = "test_depthwise_conv2d"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf16>, %arg1: tensor<1x1x4x2xf16>, %arg2: tensor<8xf16>, %arg3: tensor<1xf16>, %arg4: tensor<1xf16>):
    %0 = "tosa.depthwise_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf16>, tensor<1x1x4x2xf16>, tensor<8xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x4x4x8xf16>
    "func.return"(%0) : (tensor<1x4x4x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf32>, tensor<1x19x28xf32>) -> tensor<1x14x28xf32>, sym_name = "test_matmul"}> ({
  ^bb0(%arg0: tensor<1x14x19xf32>, %arg1: tensor<1x19x28xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.matmul"(%arg0, %arg1, %0, %1) : (tensor<1x14x19xf32>, tensor<1x19x28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x14x28xf32>
    "func.return"(%2) : (tensor<1x14x28xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_sigmoid"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.sigmoid"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>, sym_name = "test_transpose_conv2d"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> {out_shape = array<i64: 1, 32, 32, 16>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>
    "func.return"(%0) : (tensor<1x32x32x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>, sym_name = "test_max_pool2d"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>):
    %0 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 1, 1>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>
    "func.return"(%0) : (tensor<1x32x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf16>, tensor<16x1x1x8xf16>, tensor<16xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x32x32x16xf16>, sym_name = "test_transpose_conv2d"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf16>, %arg1: tensor<16x1x1x8xf16>, %arg2: tensor<16xf16>, %arg3: tensor<1xf16>, %arg4: tensor<1xf16>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf16>, tensor<16x1x1x8xf16>, tensor<16xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x32x32x16xf16>
    "func.return"(%0) : (tensor<1x32x32x16xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_clamp"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 1.000000e+00 : f32, min_val = 0.000000e+00 : f32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x1xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_add"}> ({
  ^bb0(%arg0: tensor<13x21x1xf32>, %arg1: tensor<13x21x3xf32>):
    %0 = "tosa.add"(%arg0, %arg1) : (tensor<13x21x1xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<26x21x3xf32>, sym_name = "test_concat"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x3xf32>):
    %0 = "tosa.concat"(%arg0, %arg1) <{axis = 0 : i32}> : (tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<26x21x3xf32>
    "func.return"(%0) : (tensor<26x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>) -> tensor<13x21x3xf32>, sym_name = "test_cast_i32_f32"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>):
    %0 = "tosa.cast"(%arg0) : (tensor<13x21x3xi32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>, sym_name = "test_max"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x1xf32>):
    %0 = "tosa.maximum"(%arg0, %arg1) <{nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x1x3xf32>, tensor<1xi8>) -> tensor<13x21x3xf32>, sym_name = "test_mul"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>, %arg2: tensor<1xi8>):
    %0 = "tosa.mul"(%arg0, %arg1, %arg2) : (tensor<13x21x3xf32>, tensor<13x1x3xf32>, tensor<1xi8>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>, sym_name = "test_pow"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x1xf32>):
    %0 = "tosa.pow"(%arg0, %arg1) : (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x21x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_sub"}> ({
  ^bb0(%arg0: tensor<1x21x3xf32>, %arg1: tensor<13x21x3xf32>):
    %0 = "tosa.sub"(%arg0, %arg1) : (tensor<1x21x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_abs"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.abs"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_ceil"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.ceil"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_cos"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.cos"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_exp"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.exp"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_floor"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.floor"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_log"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.log"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<13x21x3xf32>, sym_name = "test_negate"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>):
    %0 = "tosa.negate"(%arg0, %arg1, %arg2) : (tensor<13x21x3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_reciprocal"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reciprocal"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_rsqrt"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.rsqrt"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1xi1>, tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_select"}> ({
  ^bb0(%arg0: tensor<1x1x1xi1>, %arg1: tensor<13x21x3xf32>, %arg2: tensor<13x21x3xf32>):
    %0 = "tosa.select"(%arg0, %arg1, %arg2) : (tensor<1x1x1xi1>, tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_sin"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.sin"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>, sym_name = "test_equal"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>):
    %0 = "tosa.equal"(%arg0, %arg1) : (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>, sym_name = "test_greater"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>):
    %0 = "tosa.greater"(%arg0, %arg1) : (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf16>) -> tensor<1x21x3xf16>, sym_name = "test_reduce_max"}> ({
  ^bb0(%arg0: tensor<13x21x3xf16>):
    %0 = "tosa.reduce_max"(%arg0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf16>) -> tensor<1x21x3xf16>
    "func.return"(%0) : (tensor<1x21x3xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>, sym_name = "test_reduce_sum"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_sum"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    "func.return"(%0) : (tensor<1x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<26x21x3xf32>, sym_name = "test_concat"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x3xf32>):
    %0 = "tosa.concat"(%arg0, %arg1) <{axis = 0 : i32}> : (tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<26x21x3xf32>
    "func.return"(%0) : (tensor<26x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_pad"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const_shape"() <{values = dense<0> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.pad"(%arg0, %0, %1) : (tensor<13x21x3xf32>, !tosa.shape<6>, tensor<1xf32>) -> tensor<13x21x3xf32>
    "func.return"(%2) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<1x819xf32>, sym_name = "test_reshape"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[1, 819]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %1 = "tosa.reshape"(%arg0, %0) : (tensor<13x21x3xf32>, !tosa.shape<2>) -> tensor<1x819xf32>
    "func.return"(%1) : (tensor<1x819xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_reverse"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reverse"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<4x11x1xf32>, sym_name = "test_slice"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 11, 1]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[6, 8, 0]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<13x21x3xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xf32>
    "func.return"(%2) : (tensor<4x11x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<39x21x6xf32>, sym_name = "test_tile"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[3, 1, 2]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.tile"(%arg0, %0) : (tensor<13x21x3xf32>, !tosa.shape<3>) -> tensor<39x21x6xf32>
    "func.return"(%1) : (tensor<39x21x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<3xi32>) -> tensor<3x13x21xf32>, sym_name = "test_transpose"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<3xi32>):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 2, 0, 1>}> : (tensor<13x21x3xf32>) -> tensor<3x13x21xf32>
    "func.return"(%0) : (tensor<3x13x21xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x26xi32>) -> tensor<13x26x3xf32>, sym_name = "test_gather"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x26xi32>):
    %0 = "tosa.gather"(%arg0, %arg1) : (tensor<13x21x3xf32>, tensor<13x26xi32>) -> tensor<13x26x3xf32>
    "func.return"(%0) : (tensor<13x26x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x28x3xf32>, tensor<13x26xi32>, tensor<13x26x3xf32>) -> tensor<13x28x3xf32>, sym_name = "test_scatter"}> ({
  ^bb0(%arg0: tensor<13x28x3xf32>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xf32>):
    %0 = "tosa.scatter"(%arg0, %arg1, %arg2) : (tensor<13x28x3xf32>, tensor<13x26xi32>, tensor<13x26x3xf32>) -> tensor<13x28x3xf32>
    "func.return"(%0) : (tensor<13x28x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<1x64x64x8xf32>, sym_name = "test_resize"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 2, 4, 2]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<-1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x32x32x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x64x64x8xf32>
    "func.return"(%3) : (tensor<1x64x64x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x32xf6E3M2FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E3M2FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>, sym_name = "test_matmul_t_block_scaled"}> ({
  ^bb0(%arg0: tensor<4x8x32xf6E3M2FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf6E3M2FN>, %arg3: tensor<4x16x1xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x8x32xf6E3M2FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E3M2FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    "func.return"(%0) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>, sym_name = "test_cast_from_block_scaled_static"}> ({
  ^bb0(%arg0: tensor<4x32xf4E2M1FN>, %arg1: tensor<4x1xf8E8M0FNU>):
    %0 = "tosa.cast_from_block_scaled"(%arg0, %arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>
    "func.return"(%0) : (tensor<4x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>), sym_name = "test_cast_to_block_scaled_static"}> ({
  ^bb0(%arg0: tensor<4x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>)
    "func.return"(%0#0, %0#1) : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

