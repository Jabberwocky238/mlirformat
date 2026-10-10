"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<14x19xf32>) -> tensor<14xi32>, sym_name = "test_argmax"}> ({
  ^bb0(%arg0: tensor<14x19xf32>):
    %0 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<14x19xf32>) -> tensor<14xi32>
    "func.return"(%0) : (tensor<14xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xf32>) -> tensor<1x7x7x9xf32>, sym_name = "test_avg_pool2d"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = f32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x7x7x9xf32>
    "func.return"(%2) : (tensor<1x7x7x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>) -> tensor<1x4x4x8xf32>, sym_name = "test_conv2d"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf32>, %arg1: tensor<8x1x1x4xf32>, %arg2: tensor<8xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = f32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>
    "func.return"(%2) : (tensor<1x4x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x8x21x17xf32>, tensor<34x1x1x1x17xf32>, tensor<34xf32>) -> tensor<1x4x8x21x34xf32>, sym_name = "test_conv3d"}> ({
  ^bb0(%arg0: tensor<1x4x8x21x17xf32>, %arg1: tensor<34x1x1x1x17xf32>, %arg2: tensor<34xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.conv3d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>}> : (tensor<1x4x8x21x17xf32>, tensor<34x1x1x1x17xf32>, tensor<34xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x8x21x34xf32>
    "func.return"(%2) : (tensor<1x4x8x21x34xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf32>, tensor<1x1x4x2xf32>, tensor<8xf32>) -> tensor<1x4x4x8xf32>, sym_name = "test_depthwise_conv2d"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf32>, %arg1: tensor<1x1x4x2xf32>, %arg2: tensor<8xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.depthwise_conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf32>, tensor<1x1x4x2xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>
    "func.return"(%2) : (tensor<1x4x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x8xf32>, tensor<1x4x8xf32>) -> (tensor<1x4x8xf32>, tensor<1x4x8xf32>), sym_name = "test_fft2d"}> ({
  ^bb0(%arg0: tensor<1x4x8xf32>, %arg1: tensor<1x4x8xf32>):
    %0:2 = "tosa.fft2d"(%arg0, %arg1) <{inverse = false}> : (tensor<1x4x8xf32>, tensor<1x4x8xf32>) -> (tensor<1x4x8xf32>, tensor<1x4x8xf32>)
    "func.return"(%0#0, %0#1) : (tensor<1x4x8xf32>, tensor<1x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf32>, tensor<1x19x28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x14x28xf32>, sym_name = "test_matmul"}> ({
  ^bb0(%arg0: tensor<1x14x19xf32>, %arg1: tensor<1x19x28xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>):
    %0 = "tosa.matmul"(%arg0, %arg1, %arg2, %arg3) : (tensor<1x14x19xf32>, tensor<1x19x28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x14x28xf32>
    "func.return"(%0) : (tensor<1x14x28xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>, sym_name = "test_max_pool2d_f32"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>):
    %0 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 1, 1>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>
    "func.return"(%0) : (tensor<1x32x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x8x16xf32>) -> (tensor<13x8x9xf32>, tensor<13x8x9xf32>), sym_name = "test_rfft2d"}> ({
  ^bb0(%arg0: tensor<13x8x16xf32>):
    %0:2 = "tosa.rfft2d"(%arg0) : (tensor<13x8x16xf32>) -> (tensor<13x8x9xf32>, tensor<13x8x9xf32>)
    "func.return"(%0#0, %0#1) : (tensor<13x8x9xf32>, tensor<13x8x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>) -> tensor<1x32x32x16xf32>, sym_name = "test_transpose_conv2d"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> {out_shape = array<i64: 1, 32, 32, 16>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>
    "func.return"(%2) : (tensor<1x32x32x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_clamp"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 3.40282347E+38 : f32, min_val = -3.40282347E+38 : f32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_tanh"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.tanh"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_erf"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.erf"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
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
  "func.func"() <{function_type = (tensor<13x21x1xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_arithmetic_right_shift"}> ({
  ^bb0(%arg0: tensor<13x21x1xf32>, %arg1: tensor<13x21x3xf32>):
    %0 = "tosa.arithmetic_right_shift"(%arg0, %arg1) <{round = false}> : (tensor<13x21x1xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>, sym_name = "test_bitwise_and"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x21x1xi32>):
    %0 = "tosa.bitwise_and"(%arg0, %arg1) : (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<13x1x3xi32>) -> tensor<13x21x3xi32>, sym_name = "test_bitwise_or"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x1x3xi32>):
    %0 = "tosa.bitwise_or"(%arg0, %arg1) : (tensor<13x21x3xi32>, tensor<13x1x3xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x1xi32>, tensor<13x21x3xi32>) -> tensor<13x21x3xi32>, sym_name = "test_bitwise_xor"}> ({
  ^bb0(%arg0: tensor<13x21x1xi32>, %arg1: tensor<13x21x3xi32>):
    %0 = "tosa.bitwise_xor"(%arg0, %arg1) : (tensor<13x21x1xi32>, tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x1xi32>, tensor<13x21x3xi32>) -> tensor<13x21x3xi32>, sym_name = "test_intdiv"}> ({
  ^bb0(%arg0: tensor<13x21x1xi32>, %arg1: tensor<13x21x3xi32>):
    %0 = "tosa.intdiv"(%arg0, %arg1) : (tensor<13x21x1xi32>, tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi1>, tensor<13x21x1xi1>) -> tensor<13x21x3xi1>, sym_name = "test_logical_and"}> ({
  ^bb0(%arg0: tensor<13x21x3xi1>, %arg1: tensor<13x21x1xi1>):
    %0 = "tosa.logical_and"(%arg0, %arg1) : (tensor<13x21x3xi1>, tensor<13x21x1xi1>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>, sym_name = "test_logical_left_shift"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x21x1xi32>):
    %0 = "tosa.logical_left_shift"(%arg0, %arg1) : (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>, sym_name = "test_logical_right_shift"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x21x1xi32>):
    %0 = "tosa.logical_right_shift"(%arg0, %arg1) : (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x1x3xi1>, tensor<13x21x3xi1>) -> tensor<13x21x3xi1>, sym_name = "test_logical_or"}> ({
  ^bb0(%arg0: tensor<13x1x3xi1>, %arg1: tensor<13x21x3xi1>):
    %0 = "tosa.logical_or"(%arg0, %arg1) : (tensor<13x1x3xi1>, tensor<13x21x3xi1>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x1x3xi1>, tensor<13x21x3xi1>) -> tensor<13x21x3xi1>, sym_name = "test_logical_xor"}> ({
  ^bb0(%arg0: tensor<13x1x3xi1>, %arg1: tensor<13x21x3xi1>):
    %0 = "tosa.logical_xor"(%arg0, %arg1) : (tensor<13x1x3xi1>, tensor<13x21x3xi1>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<1x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_min"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<1x21x3xf32>):
    %0 = "tosa.minimum"(%arg0, %arg1) <{nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>, tensor<1x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_mul"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<13x21x3xf32>, tensor<13x1x3xf32>, tensor<1xi8>) -> tensor<13x21x3xf32>
    "func.return"(%1) : (tensor<13x21x3xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<64xi32>, tensor<513x!quant.uniform<i16:f32, 1.000000e+00>>) -> tensor<64x!quant.uniform<i16:f32, 1.000000e+00>>, sym_name = "test_table"}> ({
  ^bb0(%arg0: tensor<64xi32>, %arg1: tensor<513x!quant.uniform<i16:f32, 1.000000e+00>>):
    %0 = "tosa.table"(%arg0, %arg1) : (tensor<64xi32>, tensor<513x!quant.uniform<i16:f32, 1.000000e+00>>) -> tensor<64x!quant.uniform<i16:f32, 1.000000e+00>>
    "func.return"(%0) : (tensor<64x!quant.uniform<i16:f32, 1.000000e+00>>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x1xi32>) -> tensor<13x21x1xi32>, sym_name = "test_bitwise_not"}> ({
  ^bb0(%arg0: tensor<13x21x1xi32>):
    %0 = "tosa.bitwise_not"(%arg0) : (tensor<13x21x1xi32>) -> tensor<13x21x1xi32>
    "func.return"(%0) : (tensor<13x21x1xi32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xi32>) -> tensor<13x21x3xi32>, sym_name = "test_clz"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>):
    %0 = "tosa.clz"(%arg0) : (tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
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
  "func.func"() <{function_type = (tensor<1x21x3xi1>) -> tensor<1x21x3xi1>, sym_name = "test_logical_not"}> ({
  ^bb0(%arg0: tensor<1x21x3xi1>):
    %0 = "tosa.logical_not"(%arg0) : (tensor<1x21x3xi1>) -> tensor<1x21x3xi1>
    "func.return"(%0) : (tensor<1x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_negate"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.negate"(%arg0, %0, %1) : (tensor<13x21x3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<13x21x3xf32>
    "func.return"(%2) : (tensor<13x21x3xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_sin"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.sin"(%arg0) : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>, sym_name = "test_equal"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>):
    %0 = "tosa.equal"(%arg0, %arg1) : (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x1xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xi1>, sym_name = "test_greater"}> ({
  ^bb0(%arg0: tensor<13x21x1xf32>, %arg1: tensor<13x21x3xf32>):
    %0 = "tosa.greater"(%arg0, %arg1) : (tensor<13x21x1xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x1x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xi1>, sym_name = "test_greater_equal"}> ({
  ^bb0(%arg0: tensor<13x1x3xf32>, %arg1: tensor<13x21x3xf32>):
    %0 = "tosa.greater_equal"(%arg0, %arg1) : (tensor<13x1x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xi1>
    "func.return"(%0) : (tensor<13x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi1>) -> tensor<1x21x3xi1>, sym_name = "test_reduce_all"}> ({
  ^bb0(%arg0: tensor<13x21x3xi1>):
    %0 = "tosa.reduce_all"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xi1>) -> tensor<1x21x3xi1>
    "func.return"(%0) : (tensor<1x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi1>) -> tensor<1x21x3xi1>, sym_name = "test_reduce_any"}> ({
  ^bb0(%arg0: tensor<13x21x3xi1>):
    %0 = "tosa.reduce_any"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xi1>) -> tensor<1x21x3xi1>
    "func.return"(%0) : (tensor<1x21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>, sym_name = "test_reduce_max"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_max"(%arg0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    "func.return"(%0) : (tensor<1x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>, sym_name = "test_reduce_min"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_min"(%arg0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    "func.return"(%0) : (tensor<1x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>, sym_name = "test_reduce_product"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_product"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    "func.return"(%0) : (tensor<1x21x3xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<3x13x21xf32>, sym_name = "test_transpose"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
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
  "func.func"() <{function_type = (tensor<13x21x3xi32>) -> tensor<13x21x3xf32>, sym_name = "test_cast1"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>):
    %0 = "tosa.cast"(%arg0) : (tensor<13x21x3xi32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3x!quant.uniform<u8:f32, 0.015655439347028732:127>>, tensor<1xi32>, tensor<1xi8>) -> tensor<13x21x3x!quant.uniform<i8:f32, 0.015655439347028732:-1>>, sym_name = "test_rescale"}> ({
  ^bb0(%arg0: tensor<13x21x3x!quant.uniform<u8:f32, 0.015655439347028732:127>>, %arg1: tensor<1xi32>, %arg2: tensor<1xi8>):
    %0 = "tosa.const"() <{values = dense<127> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<-1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.rescale"(%arg0, %arg1, %arg2, %0, %1) <{input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = true}> : (tensor<13x21x3x!quant.uniform<u8:f32, 0.015655439347028732:127>>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<13x21x3x!quant.uniform<i8:f32, 0.015655439347028732:-1>>
    "func.return"(%2) : (tensor<13x21x3x!quant.uniform<i8:f32, 0.015655439347028732:-1>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<4xi32>, sym_name = "test_const"}> ({
  ^bb0(%arg0: index):
    %0 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32>
    "func.return"(%0) : (tensor<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>) -> tensor<13x21x3xi32>, sym_name = "test_identity"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>):
    %0 = "tosa.identity"(%arg0) : (tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
    "func.return"(%0) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "test_cond_if"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2) ({
      %2 = "tosa.add"(%arg0, %arg1) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%2) : (tensor<f32>) -> ()
    }, {
      %1 = "tosa.sub"(%arg0, %arg1) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%1) : (tensor<f32>) -> ()
    }) : (tensor<i1>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xi32>, tensor<i32>) -> (), sym_name = "test_while_loop"}> ({
  ^bb0(%arg0: tensor<10xi32>, %arg1: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1:3 = "tosa.while_loop"(%0, %0, %arg0) ({
    ^bb0(%arg5: tensor<i32>, %arg6: tensor<i32>, %arg7: tensor<10xi32>):
      %8 = "tosa.greater_equal"(%arg6, %arg1) : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %9 = "tosa.logical_not"(%8) : (tensor<i1>) -> tensor<i1>
      "tosa.yield"(%9) : (tensor<i1>) -> ()
    }, {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<i32>, %arg4: tensor<10xi32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = "tosa.add"(%arg3, %2) : (tensor<i32>, tensor<i32>) -> tensor<i32>
      %4 = "tosa.const_shape"() <{values = dense<1> : tensor<1xindex>}> : () -> !tosa.shape<1>
      %5 = "tosa.reshape"(%2, %4) : (tensor<i32>, !tosa.shape<1>) -> tensor<1xi32>
      %6 = "tosa.add"(%arg4, %5) : (tensor<10xi32>, tensor<1xi32>) -> tensor<10xi32>
      %7 = "tosa.add"(%arg2, %2) : (tensor<i32>, tensor<i32>) -> tensor<i32>
      "tosa.yield"(%7, %3, %6) : (tensor<i32>, tensor<i32>, tensor<10xi32>) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<10xi32>) -> (tensor<i32>, tensor<i32>, tensor<10xi32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xi32>) -> tensor<10xi32>, sym_name = "test_custom"}> ({
  ^bb0(%arg0: tensor<10xi32>):
    %0 = "tosa.custom"(%arg0) <{domain_name = "tosa.mlir_test", implementation_attrs = "", operator_name = "custom_test"}> : (tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%0) : (tensor<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_const_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<1> : tensor<4xindex>}> : () -> !tosa.shape<4>
    "func.return"(%0) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>, sym_name = "test_cast_from_block_scaled"}> ({
  ^bb0(%arg0: tensor<4x32xf4E2M1FN>, %arg1: tensor<4x1xf8E8M0FNU>):
    %0 = "tosa.cast_from_block_scaled"(%arg0, %arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>
    "func.return"(%0) : (tensor<4x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>), sym_name = "test_cast_to_block_scaled"}> ({
  ^bb0(%arg0: tensor<4x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> {stochastic_round = false} : (tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>)
    "func.return"(%0#0, %0#1) : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

