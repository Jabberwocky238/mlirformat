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
  "func.func"() <{function_type = (tensor<1x7x7x9xf32>) -> tensor<1x7x7x9xf32>, sym_name = "test_avg_pool2d_f32"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = f32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x7x7x9xf32>
    "func.return"(%2) : (tensor<1x7x7x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xf16>) -> tensor<1x7x7x9xf16>, sym_name = "test_avg_pool2d_f16"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xf16>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = f16, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x7x7x9xf16>
    "func.return"(%2) : (tensor<1x7x7x9xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xf16>) -> tensor<1x7x7x9xf16>, sym_name = "test_avg_pool2d_f16_accumf32"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xf16>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = f32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x7x7x9xf16>
    "func.return"(%2) : (tensor<1x7x7x9xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xi8>) -> tensor<1x7x7x9xi8>, sym_name = "test_avg_pool2d_i8"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xi8>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = i32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x7x7x9xi8>
    "func.return"(%2) : (tensor<1x7x7x9xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xi16>) -> tensor<1x7x7x9xi16>, sym_name = "test_avg_pool2d_i16"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xi16>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi16>}> : () -> tensor<1xi16>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = i32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xi16>, tensor<1xi16>, tensor<1xi16>) -> tensor<1x7x7x9xi16>
    "func.return"(%2) : (tensor<1x7x7x9xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>) -> tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>, sym_name = "test_avg_pool2d_q8"}> ({
  ^bb0(%arg0: tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = i32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>
    "func.return"(%2) : (tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>) -> ()
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
  "func.func"() <{function_type = (tensor<*xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>, sym_name = "test_conv2d_unranked_input"}> ({
  ^bb0(%arg0: tensor<*xf32>, %arg1: tensor<8x1x1x4xf32>, %arg2: tensor<8xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<*xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>
    "func.return"(%0) : (tensor<1x4x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4x!quant.uniform<i8:f32, 1.000000e-02>>, tensor<8x1x1x4x!quant.uniform<i8:f32, 1.000000e-02>>, tensor<8x!quant.uniform<i8:f32, 1.000000e-02>>) -> tensor<1x4x4x8x!quant.uniform<i32:f32, 1.000000e-02>>, sym_name = "test_conv2d_quant_uniform"}> ({
  ^bb0(%arg0: tensor<1x4x4x4x!quant.uniform<i8:f32, 1.000000e-02>>, %arg1: tensor<8x1x1x4x!quant.uniform<i8:f32, 1.000000e-02>>, %arg2: tensor<8x!quant.uniform<i8:f32, 1.000000e-02>>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.conv2d"(%arg0, %arg1, %arg2, %0, %0) <{acc_type = i32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4x!quant.uniform<i8:f32, 1.000000e-02>>, tensor<8x1x1x4x!quant.uniform<i8:f32, 1.000000e-02>>, tensor<8x!quant.uniform<i8:f32, 1.000000e-02>>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x4x4x8x!quant.uniform<i32:f32, 1.000000e-02>>
    "func.return"(%1) : (tensor<1x4x4x8x!quant.uniform<i32:f32, 1.000000e-02>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4x!quant.any<i8<-8:7>>>, tensor<8x1x1x4x!quant.any<i8<-8:7>>>, tensor<8x!quant.any<i8<-8:7>>>) -> tensor<1x4x4x8x!quant.any<i32<-8:7>>>, sym_name = "test_conv2d_quant_any"}> ({
  ^bb0(%arg0: tensor<1x4x4x4x!quant.any<i8<-8:7>>>, %arg1: tensor<8x1x1x4x!quant.any<i8<-8:7>>>, %arg2: tensor<8x!quant.any<i8<-8:7>>>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.conv2d"(%arg0, %arg1, %arg2, %0, %0) <{acc_type = i32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4x!quant.any<i8<-8:7>>>, tensor<8x1x1x4x!quant.any<i8<-8:7>>>, tensor<8x!quant.any<i8<-8:7>>>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x4x4x8x!quant.any<i32<-8:7>>>
    "func.return"(%1) : (tensor<1x4x4x8x!quant.any<i32<-8:7>>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x11x11x3xi8>) -> tensor<1x1x1x3xi8>, sym_name = "test_conv2d_q8xi4"}> ({
  ^bb0(%arg0: tensor<1x11x11x3xi8>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<3x11x11x3xi4>}> : () -> tensor<3x11x11x3xi4>
    %1 = "tosa.const"() <{values = dense<[12, 23, 55]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi4>}> : () -> tensor<1xi4>
    %4 = "tosa.conv2d"(%arg0, %0, %1, %2, %3) <{acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x11x11x3xi8>, tensor<3x11x11x3xi4>, tensor<3xi32>, tensor<1xi8>, tensor<1xi4>) -> tensor<1x1x1x3xi32>
    %5 = "tosa.const"() <{values = dense<[2026291432, 1079222024, 1693132724]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %6 = "tosa.const"() <{values = dense<[37, 36, 37]> : tensor<3xi8>}> : () -> tensor<3xi8>
    %7 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %8 = "tosa.const"() <{values = dense<27> : tensor<1xi8>}> : () -> tensor<1xi8>
    %9 = "tosa.rescale"(%4, %5, %6, %7, %8) <{input_unsigned = false, output_unsigned = false, per_channel = true, rounding_mode = #tosa.rounding_mode<DOUBLE_ROUND>, scale32 = true}> : (tensor<1x1x1x3xi32>, tensor<3xi32>, tensor<3xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<1x1x1x3xi8>
    "func.return"(%9) : (tensor<1x1x1x3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x8x21x17xf32>, tensor<34x1x1x1x17xf32>, tensor<34xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x8x21x34xf32>, sym_name = "test_conv3d"}> ({
  ^bb0(%arg0: tensor<1x4x8x21x17xf32>, %arg1: tensor<34x1x1x1x17xf32>, %arg2: tensor<34xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.conv3d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>}> : (tensor<1x4x8x21x17xf32>, tensor<34x1x1x1x17xf32>, tensor<34xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x8x21x34xf32>
    "func.return"(%0) : (tensor<1x4x8x21x34xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x8x21x17xf32>, tensor<34x1x1x1x17xf32>, tensor<34xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x8x21x34xf32>, sym_name = "test_conv3d_with_local_bound"}> ({
  ^bb0(%arg0: tensor<1x4x8x21x17xf32>, %arg1: tensor<34x1x1x1x17xf32>, %arg2: tensor<34xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.conv3d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, dilation = array<i64: 1, 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>}> : (tensor<1x4x8x21x17xf32>, tensor<34x1x1x1x17xf32>, tensor<34xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x8x21x34xf32>
    "func.return"(%0) : (tensor<1x4x8x21x34xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf32>, tensor<1x1x4x2xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>, sym_name = "test_depthwise_conv2d"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf32>, %arg1: tensor<1x1x4x2xf32>, %arg2: tensor<8xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.depthwise_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf32>, tensor<1x1x4x2xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>
    "func.return"(%0) : (tensor<1x4x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf32>, tensor<1x1x4x2xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>, sym_name = "test_depthwise_conv2d_with_local_bound"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf32>, %arg1: tensor<1x1x4x2xf32>, %arg2: tensor<8xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.depthwise_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf32>, tensor<1x1x4x2xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>
    "func.return"(%0) : (tensor<1x4x4x8xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<1x4x8xf32>, tensor<1x4x8xf32>) -> (tensor<1x4x8xf32>, tensor<1x4x8xf32>), sym_name = "test_fft2d_with_local_bound"}> ({
  ^bb0(%arg0: tensor<1x4x8xf32>, %arg1: tensor<1x4x8xf32>):
    %0:2 = "tosa.fft2d"(%arg0, %arg1) <{inverse = false, local_bound = true}> : (tensor<1x4x8xf32>, tensor<1x4x8xf32>) -> (tensor<1x4x8xf32>, tensor<1x4x8xf32>)
    "func.return"(%0#0, %0#1) : (tensor<1x4x8xf32>, tensor<1x4x8xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>, sym_name = "test_max_pool2d_f32"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>):
    %0 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 1, 1>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>
    "func.return"(%0) : (tensor<1x32x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xbf16>) -> tensor<1x32x32x8xbf16>, sym_name = "test_max_pool2d_bf16"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xbf16>):
    %0 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 1, 1>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xbf16>) -> tensor<1x32x32x8xbf16>
    "func.return"(%0) : (tensor<1x32x32x8xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf16>) -> tensor<1x32x32x8xf16>, sym_name = "test_max_pool2d_f16"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf16>):
    %0 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 1, 1>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf16>) -> tensor<1x32x32x8xf16>
    "func.return"(%0) : (tensor<1x32x32x8xf16>) -> ()
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
  "func.func"() <{function_type = (tensor<1x1x1xf32>) -> (tensor<1x1x1xf32>, tensor<1x1x1xf32>), sym_name = "test_rfft2d_width1"}> ({
  ^bb0(%arg0: tensor<1x1x1xf32>):
    %0:2 = "tosa.rfft2d"(%arg0) : (tensor<1x1x1xf32>) -> (tensor<1x1x1xf32>, tensor<1x1x1xf32>)
    "func.return"(%0#0, %0#1) : (tensor<1x1x1xf32>, tensor<1x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x8x16xf32>) -> (tensor<13x8x9xf32>, tensor<13x8x9xf32>), sym_name = "test_rfft2d_with_local_bound"}> ({
  ^bb0(%arg0: tensor<13x8x16xf32>):
    %0:2 = "tosa.rfft2d"(%arg0) <{local_bound = true}> : (tensor<13x8x16xf32>) -> (tensor<13x8x9xf32>, tensor<13x8x9xf32>)
    "func.return"(%0#0, %0#1) : (tensor<13x8x9xf32>, tensor<13x8x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>, sym_name = "test_transpose_conv2d"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>
    "func.return"(%0) : (tensor<1x32x32x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>, sym_name = "test_transpose_conv2d_unranked_input"}> ({
  ^bb0(%arg0: tensor<*xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> {out_shape = array<i64: 1, 32, 32, 16>} : (tensor<*xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>
    "func.return"(%0) : (tensor<1x32x32x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>, tensor<*xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>, sym_name = "test_transpose_conv2d_unranked_weight"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<*xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> {out_shape = array<i64: 1, 32, 32, 16>} : (tensor<1x32x32x8xf32>, tensor<*xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>
    "func.return"(%0) : (tensor<1x32x32x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>, sym_name = "test_transpose_conv2d_with_local_bound"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f32, local_bound = false, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>
    "func.return"(%0) : (tensor<1x32x32x16xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_clamp_propagate"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 1.000000e+00 : f32, min_val = 0.000000e+00 : f32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_clamp_ignore"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 1.000000e+00 : f32, min_val = 0.000000e+00 : f32, nan_mode = #tosa.nan_mode<IGNORE>}> : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_clamp_ignore_enum"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 1.000000e+00 : f32, min_val = 0.000000e+00 : f32, nan_mode = #tosa.nan_mode<IGNORE>}> : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf16>) -> tensor<13x21x3xf16>, sym_name = "test_clamp_f16"}> ({
  ^bb0(%arg0: tensor<13x21x3xf16>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 1.000000e+00 : f16, min_val = 0.000000e+00 : f16, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf16>) -> tensor<13x21x3xf16>
    "func.return"(%0) : (tensor<13x21x3xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xbf16>) -> tensor<13x21x3xbf16>, sym_name = "test_clamp_bf16"}> ({
  ^bb0(%arg0: tensor<13x21x3xbf16>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 1.000000e+00 : bf16, min_val = 0.000000e+00 : bf16, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xbf16>) -> tensor<13x21x3xbf16>
    "func.return"(%0) : (tensor<13x21x3xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>) -> tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>, sym_name = "test_clamp_quantized"}> ({
  ^bb0(%arg0: tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 1 : i8, min_val = 0 : i8, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>) -> tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>
    "func.return"(%0) : (tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>, sym_name = "clamp_quantized_unsigned"}> ({
  ^bb0(%arg0: tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 255 : ui8, min_val = 0 : ui8, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>
    "func.return"(%0) : (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x1xi64>, tensor<13x21x3xi64>) -> tensor<13x21x3xi64>, sym_name = "test_intdiv_i64"}> ({
  ^bb0(%arg0: tensor<13x21x1xi64>, %arg1: tensor<13x21x3xi64>):
    %0 = "tosa.intdiv"(%arg0, %arg1) : (tensor<13x21x1xi64>, tensor<13x21x3xi64>) -> tensor<13x21x3xi64>
    "func.return"(%0) : (tensor<13x21x3xi64>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>, sym_name = "test_max_ignore"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x1xf32>):
    %0 = "tosa.maximum"(%arg0, %arg1) <{nan_mode = #tosa.nan_mode<IGNORE>}> : (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>, sym_name = "test_max_propagate"}> ({
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
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<*xf32>, sym_name = "test_mul_scalar_with_unranked_output"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<*xf32>
    "func.return"(%1) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "test_mul_scalar"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    "func.return"(%1) : (tensor<f32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<13x1x3xi32>) -> tensor<13x21x3xi32>, sym_name = "test_i32_mul"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x1x3xi32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<13x21x3xi32>, tensor<13x1x3xi32>, tensor<1xi8>) -> tensor<13x21x3xi32>
    "func.return"(%1) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi16>, tensor<13x1x3xi16>) -> tensor<13x21x3xi16>, sym_name = "test_mul_relaxed_result_type"}> ({
  ^bb0(%arg0: tensor<13x21x3xi16>, %arg1: tensor<13x1x3xi16>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<13x21x3xi16>, tensor<13x1x3xi16>, tensor<1xi8>) -> tensor<13x21x3xi16>
    "func.return"(%1) : (tensor<13x21x3xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<*xf32>) -> tensor<13x21x3xf32>, sym_name = "test_mul_unranked_b"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<*xf32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<13x21x3xf32>, tensor<*xf32>, tensor<1xi8>) -> tensor<13x21x3xf32>
    "func.return"(%1) : (tensor<13x21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>, tensor<*xf32>) -> tensor<13x21x3xf32>, sym_name = "test_mul_unranked_a_and_b"}> ({
  ^bb0(%arg0: tensor<*xf32>, %arg1: tensor<*xf32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<*xf32>, tensor<*xf32>, tensor<1xi8>) -> tensor<13x21x3xf32>
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
  "func.func"() <{function_type = (tensor<64xi32>, tensor<513x!quant.uniform<i16:f32, 1.000000e+00>>) -> tensor<64x!quant.uniform<i16:f32, 1.000000e+00>>, sym_name = "main"}> ({
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
  "func.func"() <{function_type = (tensor<13x21x3xi1>) -> tensor<21x3xi1>, sym_name = "test_reduce_all"}> ({
  ^bb0(%arg0: tensor<13x21x3xi1>):
    %0 = "tosa.reduce_all"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xi1>) -> tensor<1x21x3xi1>
    %1 = "tosa.const_shape"() <{values = dense<[21, 3]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.reshape"(%0, %1) : (tensor<1x21x3xi1>, !tosa.shape<2>) -> tensor<21x3xi1>
    "func.return"(%2) : (tensor<21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi1>) -> tensor<21x3xi1>, sym_name = "test_reduce_any"}> ({
  ^bb0(%arg0: tensor<13x21x3xi1>):
    %0 = "tosa.reduce_any"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xi1>) -> tensor<1x21x3xi1>
    %1 = "tosa.const_shape"() <{values = dense<[21, 3]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.reshape"(%0, %1) : (tensor<1x21x3xi1>, !tosa.shape<2>) -> tensor<21x3xi1>
    "func.return"(%2) : (tensor<21x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<21x3xf32>, sym_name = "test_reduce_max"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_max"(%arg0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    %1 = "tosa.const_shape"() <{values = dense<[21, 3]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.reshape"(%0, %1) : (tensor<1x21x3xf32>, !tosa.shape<2>) -> tensor<21x3xf32>
    "func.return"(%2) : (tensor<21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<21x3xf32>, sym_name = "test_reduce_min"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_min"(%arg0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    %1 = "tosa.const_shape"() <{values = dense<[21, 3]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.reshape"(%0, %1) : (tensor<1x21x3xf32>, !tosa.shape<2>) -> tensor<21x3xf32>
    "func.return"(%2) : (tensor<21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<21x3xf32>, sym_name = "test_reduce_product"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_product"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    %1 = "tosa.const_shape"() <{values = dense<[21, 3]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.reshape"(%0, %1) : (tensor<1x21x3xf32>, !tosa.shape<2>) -> tensor<21x3xf32>
    "func.return"(%2) : (tensor<21x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<21x3xf32>, sym_name = "test_reduce_sum"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.reduce_sum"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    %1 = "tosa.const_shape"() <{values = dense<[21, 3]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.reshape"(%0, %1) : (tensor<1x21x3xf32>, !tosa.shape<2>) -> tensor<21x3xf32>
    "func.return"(%2) : (tensor<21x3xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_pad_explicit_value"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const_shape"() <{values = dense<0> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %2 = "tosa.pad"(%arg0, %1, %0) : (tensor<13x21x3xf32>, !tosa.shape<6>, tensor<1xf32>) -> tensor<13x21x3xf32>
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<*xf32>, sym_name = "test_reshape_unranked_output"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[21, 13, 3]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.reshape"(%arg0, %0) : (tensor<13x21x3xf32>, !tosa.shape<3>) -> tensor<*xf32>
    "func.return"(%1) : (tensor<*xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>) -> tensor<7x11x1xf32>, sym_name = "test_slice_size"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[-1, 11, 1]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[6, 8, 0]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<13x21x3xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<7x11x1xf32>
    "func.return"(%2) : (tensor<7x11x1xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x?x3xf32>) -> tensor<3x13x?xf32>, sym_name = "test_transpose_dynamic_dim"}> ({
  ^bb0(%arg0: tensor<13x?x3xf32>):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 2, 0, 1>}> : (tensor<13x?x3xf32>) -> tensor<3x13x?xf32>
    "func.return"(%0) : (tensor<3x13x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x3x3xf32>) -> tensor<3x13x?xf32>, sym_name = "test_transpose_half_dynamic_dim"}> ({
  ^bb0(%arg0: tensor<13x3x3xf32>):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 2, 0, 1>}> : (tensor<13x3x3xf32>) -> tensor<3x13x?xf32>
    "func.return"(%0) : (tensor<3x13x?xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<13x26xi64>) -> tensor<13x26x3xf32>, sym_name = "test_gather_int64"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x26xi64>):
    %0 = "tosa.gather"(%arg0, %arg1) : (tensor<13x21x3xf32>, tensor<13x26xi64>) -> tensor<13x26x3xf32>
    "func.return"(%0) : (tensor<13x26x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<*xi32>) -> tensor<13x26x3xf32>, sym_name = "test_gather_unranked_indices"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<*xi32>):
    %0 = "tosa.gather"(%arg0, %arg1) : (tensor<13x21x3xf32>, tensor<*xi32>) -> tensor<13x26x3xf32>
    "func.return"(%0) : (tensor<13x26x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x52x3xf32>, tensor<13x26xi32>, tensor<13x26x3xf32>) -> tensor<13x52x3xf32>, sym_name = "test_scatter"}> ({
  ^bb0(%arg0: tensor<13x52x3xf32>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xf32>):
    %0 = "tosa.scatter"(%arg0, %arg1, %arg2) : (tensor<13x52x3xf32>, tensor<13x26xi32>, tensor<13x26x3xf32>) -> tensor<13x52x3xf32>
    "func.return"(%0) : (tensor<13x52x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x52x3xf32>, tensor<13x26xi64>, tensor<13x26x3xf32>) -> tensor<13x52x3xf32>, sym_name = "test_scatter_int64"}> ({
  ^bb0(%arg0: tensor<13x52x3xf32>, %arg1: tensor<13x26xi64>, %arg2: tensor<13x26x3xf32>):
    %0 = "tosa.scatter"(%arg0, %arg1, %arg2) : (tensor<13x52x3xf32>, tensor<13x26xi64>, tensor<13x26x3xf32>) -> tensor<13x52x3xf32>
    "func.return"(%0) : (tensor<13x52x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf32>, tensor<*xi32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>, sym_name = "test_scatter_unranked_indices"}> ({
  ^bb0(%arg0: tensor<13x21x3xf32>, %arg1: tensor<*xi32>, %arg2: tensor<13x21x3xf32>):
    %0 = "tosa.scatter"(%arg0, %arg1, %arg2) : (tensor<13x21x3xf32>, tensor<*xi32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    "func.return"(%0) : (tensor<13x21x3xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<*xf32>, sym_name = "test_resize_unranked_output"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 2, 4, 2]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<-1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x32x32x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<*xf32>
    "func.return"(%3) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<1x64x64x8xf32>, sym_name = "test_resize_unranked_input"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 2, 4, 2]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<-1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<*xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x64x64x8xf32>
    "func.return"(%3) : (tensor<1x64x64x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<1x64x64x8xf32>, sym_name = "test_resize_enum"}> ({
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
  "func.func"() <{function_type = (tensor<13x21x3xi32>) -> tensor<13x21x3x!quant.uniform<u8:f32, 0.078431375324726104:128>>, sym_name = "test_cast2"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>):
    %0 = "tosa.cast"(%arg0) : (tensor<13x21x3xi32>) -> tensor<13x21x3x!quant.uniform<u8:f32, 0.078431375324726104:128>>
    "func.return"(%0) : (tensor<13x21x3x!quant.uniform<u8:f32, 0.078431375324726104:128>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>) -> tensor<13x21x3x!quant.uniform<i16:f32, 0.078431375324726104:128>>, sym_name = "test_cast3"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>):
    %0 = "tosa.cast"(%arg0) : (tensor<13x21x3xi32>) -> tensor<13x21x3x!quant.uniform<i16:f32, 0.078431375324726104:128>>
    "func.return"(%0) : (tensor<13x21x3x!quant.uniform<i16:f32, 0.078431375324726104:128>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3x!quant.uniform<u8:f32, 0.015655439347028732:127>>) -> tensor<13x21x3x!quant.uniform<i8:f32, 0.015655439347028732:-1>>, sym_name = "test_rescale"}> ({
  ^bb0(%arg0: tensor<13x21x3x!quant.uniform<u8:f32, 0.015655439347028732:127>>):
    %0 = "tosa.const"() <{values = dense<1073741824> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<127> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = true}> : (tensor<13x21x3x!quant.uniform<u8:f32, 0.015655439347028732:127>>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<13x21x3x!quant.uniform<i8:f32, 0.015655439347028732:-1>>
    "func.return"(%4) : (tensor<13x21x3x!quant.uniform<i8:f32, 0.015655439347028732:-1>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi16>, sym_name = "test_rescale_i16_zp32768"}> ({
  ^bb0(%arg0: tensor<2xi8>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<15> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<17> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-32768> : tensor<1xi16>}> : () -> tensor<1xi16>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi16>) -> tensor<2xi16>
    "func.return"(%4) : (tensor<2xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi16>, sym_name = "test_rescale_i16_rounding_mode"}> ({
  ^bb0(%arg0: tensor<2xi8>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<15> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<17> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-32768> : tensor<1xi16>}> : () -> tensor<1xi16>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi16>) -> tensor<2xi16>
    "func.return"(%4) : (tensor<2xi16>) -> ()
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
  "func.func"() <{function_type = (tensor<12x8x16xf8E5M2>) -> tensor<12x16xi32>, sym_name = "test_argmax_f8E5M2"}> ({
  ^bb0(%arg0: tensor<12x8x16xf8E5M2>):
    %0 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<12x8x16xf8E5M2>) -> tensor<12x16xi32>
    "func.return"(%0) : (tensor<12x16xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xf8E5M2>) -> tensor<1x7x7x9xf8E5M2>, sym_name = "test_avg_pool2d_f8E5M2"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xf8E5M2>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = f16, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xf8E5M2>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x7x7x9xf8E5M2>
    "func.return"(%2) : (tensor<1x7x7x9xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf8E5M2>, tensor<8x1x1x4xf8E5M2>, tensor<8xf16>) -> tensor<1x4x4x8xf16>, sym_name = "test_conv2d_f8E5M2"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf8E5M2>, %arg1: tensor<8x1x1x4xf8E5M2>, %arg2: tensor<8xf16>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = "tosa.conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = f16, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf8E5M2>, tensor<8x1x1x4xf8E5M2>, tensor<8xf16>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x4x8xf16>
    "func.return"(%2) : (tensor<1x4x4x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x8x21x17xf8E5M2>, tensor<34x1x1x1x17xf8E5M2>, tensor<34xf16>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x8x21x34xf16>, sym_name = "test_conv3d_f8E5M2"}> ({
  ^bb0(%arg0: tensor<1x4x8x21x17xf8E5M2>, %arg1: tensor<34x1x1x1x17xf8E5M2>, %arg2: tensor<34xf16>, %arg3: tensor<1xf8E5M2>, %arg4: tensor<1xf8E5M2>):
    %0 = "tosa.conv3d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>}> : (tensor<1x4x8x21x17xf8E5M2>, tensor<34x1x1x1x17xf8E5M2>, tensor<34xf16>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x8x21x34xf16>
    "func.return"(%0) : (tensor<1x4x8x21x34xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf8E5M2>, tensor<1x1x4x2xf8E5M2>, tensor<8xf16>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x4x8xf16>, sym_name = "test_depthwise_conv2d_f8E5M2"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf8E5M2>, %arg1: tensor<1x1x4x2xf8E5M2>, %arg2: tensor<8xf16>, %arg3: tensor<1xf8E5M2>, %arg4: tensor<1xf8E5M2>):
    %0 = "tosa.depthwise_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf8E5M2>, tensor<1x1x4x2xf8E5M2>, tensor<8xf16>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x4x8xf16>
    "func.return"(%0) : (tensor<1x4x4x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf8E5M2>, tensor<1x19x28xf8E5M2>) -> tensor<1x14x28xf16>, sym_name = "test_matmul_f8E5M2"}> ({
  ^bb0(%arg0: tensor<1x14x19xf8E5M2>, %arg1: tensor<1x19x28xf8E5M2>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = "tosa.matmul"(%arg0, %arg1, %0, %1) : (tensor<1x14x19xf8E5M2>, tensor<1x19x28xf8E5M2>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x14x28xf16>
    "func.return"(%2) : (tensor<1x14x28xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf8E5M2>, tensor<1x19x28xf8E4M3FN>) -> tensor<1x14x28xf16>, sym_name = "test_matmul_f8E5M2_f8E4M3"}> ({
  ^bb0(%arg0: tensor<1x14x19xf8E5M2>, %arg1: tensor<1x19x28xf8E4M3FN>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = "tosa.matmul"(%arg0, %arg1, %0, %1) : (tensor<1x14x19xf8E5M2>, tensor<1x19x28xf8E4M3FN>, tensor<1xf8E5M2>, tensor<1xf8E4M3FN>) -> tensor<1x14x28xf16>
    "func.return"(%2) : (tensor<1x14x28xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf8E5M2>) -> tensor<1x32x32x8xf8E5M2>, sym_name = "test_max_pool2d_f8E5M2"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf8E5M2>):
    %0 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 1, 1>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf8E5M2>) -> tensor<1x32x32x8xf8E5M2>
    "func.return"(%0) : (tensor<1x32x32x8xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf8E5M2>, tensor<16x1x1x8xf8E5M2>, tensor<16xf16>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x32x32x16xf16>, sym_name = "test_transpose_conv2d_f8E5M2"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf8E5M2>, %arg1: tensor<16x1x1x8xf8E5M2>, %arg2: tensor<16xf16>, %arg3: tensor<1xf8E5M2>, %arg4: tensor<1xf8E5M2>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf8E5M2>, tensor<16x1x1x8xf8E5M2>, tensor<16xf16>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x32x32x16xf16>
    "func.return"(%0) : (tensor<1x32x32x16xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<4xf8E5M2>, sym_name = "test_const_f8E5M2"}> ({
  ^bb0(%arg0: index):
    %0 = "tosa.const"() <{values = dense<[3.000000e+00, -0.000000e+00, -1.000000e+00, 2.000000e+00]> : tensor<4xf8E5M2>}> : () -> tensor<4xf8E5M2>
    "func.return"(%0) : (tensor<4xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf16>, sym_name = "test_cast_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.cast"(%arg0) : (tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf16>
    "func.return"(%0) : (tensor<13x21x3xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>, tensor<13x21x3xf8E5M2>) -> tensor<26x21x3xf8E5M2>, sym_name = "test_concat_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>, %arg1: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.concat"(%arg0, %arg1) <{axis = 0 : i32}> : (tensor<13x21x3xf8E5M2>, tensor<13x21x3xf8E5M2>) -> tensor<26x21x3xf8E5M2>
    "func.return"(%0) : (tensor<26x21x3xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf8E5M2>, sym_name = "test_pad_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.const_shape"() <{values = dense<0> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.const"() <{values = dense<-0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = "tosa.pad"(%arg0, %0, %1) : (tensor<13x21x3xf8E5M2>, !tosa.shape<6>, tensor<1xf8E5M2>) -> tensor<13x21x3xf8E5M2>
    "func.return"(%2) : (tensor<13x21x3xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>) -> tensor<1x819xf8E5M2>, sym_name = "test_reshape_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.const_shape"() <{values = dense<[1, 819]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %1 = "tosa.reshape"(%arg0, %0) : (tensor<13x21x3xf8E5M2>, !tosa.shape<2>) -> tensor<1x819xf8E5M2>
    "func.return"(%1) : (tensor<1x819xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf8E5M2>, sym_name = "test_reverse_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.reverse"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf8E5M2>
    "func.return"(%0) : (tensor<13x21x3xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>) -> tensor<4x11x1xf8E5M2>, sym_name = "test_slice_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 11, 1]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[6, 8, 0]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<13x21x3xf8E5M2>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xf8E5M2>
    "func.return"(%2) : (tensor<4x11x1xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>) -> tensor<39x21x6xf8E5M2>, sym_name = "test_tile_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.const_shape"() <{values = dense<[3, 1, 2]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.tile"(%arg0, %0) : (tensor<13x21x3xf8E5M2>, !tosa.shape<3>) -> tensor<39x21x6xf8E5M2>
    "func.return"(%1) : (tensor<39x21x6xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>) -> tensor<3x13x21xf8E5M2>, sym_name = "test_transpose_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 2, 0, 1>}> : (tensor<13x21x3xf8E5M2>) -> tensor<3x13x21xf8E5M2>
    "func.return"(%0) : (tensor<3x13x21xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E5M2>, tensor<13x26xi32>) -> tensor<13x26x3xf8E5M2>, sym_name = "test_gather_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E5M2>, %arg1: tensor<13x26xi32>):
    %0 = "tosa.gather"(%arg0, %arg1) : (tensor<13x21x3xf8E5M2>, tensor<13x26xi32>) -> tensor<13x26x3xf8E5M2>
    "func.return"(%0) : (tensor<13x26x3xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x52x3xf8E5M2>, tensor<13x26xi32>, tensor<13x26x3xf8E5M2>) -> tensor<13x52x3xf8E5M2>, sym_name = "test_scatter_f8E5M2"}> ({
  ^bb0(%arg0: tensor<13x52x3xf8E5M2>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xf8E5M2>):
    %0 = "tosa.scatter"(%arg0, %arg1, %arg2) : (tensor<13x52x3xf8E5M2>, tensor<13x26xi32>, tensor<13x26x3xf8E5M2>) -> tensor<13x52x3xf8E5M2>
    "func.return"(%0) : (tensor<13x52x3xf8E5M2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x8x16xf8E4M3FN>) -> tensor<12x16xi32>, sym_name = "test_argmax_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<12x8x16xf8E4M3FN>):
    %0 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<12x8x16xf8E4M3FN>) -> tensor<12x16xi32>
    "func.return"(%0) : (tensor<12x16xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x7x9xf8E4M3FN>) -> tensor<1x7x7x9xf8E4M3FN>, sym_name = "test_avg_pool2d_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<1x7x7x9xf8E4M3FN>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = "tosa.avg_pool2d"(%arg0, %0, %1) <{acc_type = f16, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>}> : (tensor<1x7x7x9xf8E4M3FN>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x7x7x9xf8E4M3FN>
    "func.return"(%2) : (tensor<1x7x7x9xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf8E4M3FN>, tensor<8x1x1x4xf8E4M3FN>, tensor<8xf16>) -> tensor<1x4x4x8xf16>, sym_name = "test_conv2d_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf8E4M3FN>, %arg1: tensor<8x1x1x4xf8E4M3FN>, %arg2: tensor<8xf16>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = "tosa.conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = f16, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf8E4M3FN>, tensor<8x1x1x4xf8E4M3FN>, tensor<8xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x4x4x8xf16>
    "func.return"(%2) : (tensor<1x4x4x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x8x21x17xf8E4M3FN>, tensor<34x1x1x1x17xf8E4M3FN>, tensor<34xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x4x8x21x34xf16>, sym_name = "test_conv3d_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<1x4x8x21x17xf8E4M3FN>, %arg1: tensor<34x1x1x1x17xf8E4M3FN>, %arg2: tensor<34xf16>, %arg3: tensor<1xf8E4M3FN>, %arg4: tensor<1xf8E4M3FN>):
    %0 = "tosa.conv3d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>}> : (tensor<1x4x8x21x17xf8E4M3FN>, tensor<34x1x1x1x17xf8E4M3FN>, tensor<34xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x4x8x21x34xf16>
    "func.return"(%0) : (tensor<1x4x8x21x34xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4xf8E4M3FN>, tensor<1x1x4x2xf8E4M3FN>, tensor<8xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x4x4x8xf16>, sym_name = "test_depthwise_conv2d_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<1x4x4x4xf8E4M3FN>, %arg1: tensor<1x1x4x2xf8E4M3FN>, %arg2: tensor<8xf16>, %arg3: tensor<1xf8E4M3FN>, %arg4: tensor<1xf8E4M3FN>):
    %0 = "tosa.depthwise_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x4xf8E4M3FN>, tensor<1x1x4x2xf8E4M3FN>, tensor<8xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x4x4x8xf16>
    "func.return"(%0) : (tensor<1x4x4x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E4M3FN>) -> tensor<1x14x28xf16>, sym_name = "test_matmul_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<1x14x19xf8E4M3FN>, %arg1: tensor<1x19x28xf8E4M3FN>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = "tosa.matmul"(%arg0, %arg1, %0, %1) : (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E4M3FN>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x14x28xf16>
    "func.return"(%2) : (tensor<1x14x28xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf8E4M3FN>) -> tensor<1x32x32x8xf8E4M3FN>, sym_name = "test_max_pool2d_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf8E4M3FN>):
    %0 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 1, 1>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf8E4M3FN>) -> tensor<1x32x32x8xf8E4M3FN>
    "func.return"(%0) : (tensor<1x32x32x8xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf8E4M3FN>, tensor<16x1x1x8xf8E4M3FN>, tensor<16xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x32x32x16xf16>, sym_name = "test_transpose_conv2d_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf8E4M3FN>, %arg1: tensor<16x1x1x8xf8E4M3FN>, %arg2: tensor<16xf16>, %arg3: tensor<1xf8E4M3FN>, %arg4: tensor<1xf8E4M3FN>):
    %0 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %arg3, %arg4) <{acc_type = f16, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf8E4M3FN>, tensor<16x1x1x8xf8E4M3FN>, tensor<16xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x32x32x16xf16>
    "func.return"(%0) : (tensor<1x32x32x16xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<4xf8E4M3FN>, sym_name = "test_const_f8E4M3FN"}> ({
  ^bb0(%arg0: index):
    %0 = "tosa.const"() <{values = dense<[3.000000e+00, -0.000000e+00, -1.000000e+00, 2.000000e+00]> : tensor<4xf8E4M3FN>}> : () -> tensor<4xf8E4M3FN>
    "func.return"(%0) : (tensor<4xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf16>, sym_name = "test_cast_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.cast"(%arg0) : (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf16>
    "func.return"(%0) : (tensor<13x21x3xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>, tensor<13x21x3xf8E4M3FN>) -> tensor<26x21x3xf8E4M3FN>, sym_name = "test_concat_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>, %arg1: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.concat"(%arg0, %arg1) <{axis = 0 : i32}> : (tensor<13x21x3xf8E4M3FN>, tensor<13x21x3xf8E4M3FN>) -> tensor<26x21x3xf8E4M3FN>
    "func.return"(%0) : (tensor<26x21x3xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN>, sym_name = "test_pad_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.const_shape"() <{values = dense<0> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.const"() <{values = dense<-0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = "tosa.pad"(%arg0, %0, %1) : (tensor<13x21x3xf8E4M3FN>, !tosa.shape<6>, tensor<1xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN>
    "func.return"(%2) : (tensor<13x21x3xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>) -> tensor<1x819xf8E4M3FN>, sym_name = "test_reshape_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.const_shape"() <{values = dense<[1, 819]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %1 = "tosa.reshape"(%arg0, %0) : (tensor<13x21x3xf8E4M3FN>, !tosa.shape<2>) -> tensor<1x819xf8E4M3FN>
    "func.return"(%1) : (tensor<1x819xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN>, sym_name = "test_reverse_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.reverse"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN>
    "func.return"(%0) : (tensor<13x21x3xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>) -> tensor<4x11x1xf8E4M3FN>, sym_name = "test_slice_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 11, 1]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[6, 8, 0]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<13x21x3xf8E4M3FN>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xf8E4M3FN>
    "func.return"(%2) : (tensor<4x11x1xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>) -> tensor<39x21x6xf8E4M3FN>, sym_name = "test_tile_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.const_shape"() <{values = dense<[3, 1, 2]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.tile"(%arg0, %0) : (tensor<13x21x3xf8E4M3FN>, !tosa.shape<3>) -> tensor<39x21x6xf8E4M3FN>
    "func.return"(%1) : (tensor<39x21x6xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>) -> tensor<3x13x21xf8E4M3FN>, sym_name = "test_transpose_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 2, 0, 1>}> : (tensor<13x21x3xf8E4M3FN>) -> tensor<3x13x21xf8E4M3FN>
    "func.return"(%0) : (tensor<3x13x21xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf8E4M3FN>, tensor<13x26xi32>) -> tensor<13x26x3xf8E4M3FN>, sym_name = "test_gather_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x21x3xf8E4M3FN>, %arg1: tensor<13x26xi32>):
    %0 = "tosa.gather"(%arg0, %arg1) : (tensor<13x21x3xf8E4M3FN>, tensor<13x26xi32>) -> tensor<13x26x3xf8E4M3FN>
    "func.return"(%0) : (tensor<13x26x3xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x29x3xf8E4M3FN>, tensor<13x26xi32>, tensor<13x26x3xf8E4M3FN>) -> tensor<13x29x3xf8E4M3FN>, sym_name = "test_scatter_f8E4M3FN"}> ({
  ^bb0(%arg0: tensor<13x29x3xf8E4M3FN>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xf8E4M3FN>):
    %0 = "tosa.scatter"(%arg0, %arg1, %arg2) : (tensor<13x29x3xf8E4M3FN>, tensor<13x26xi32>, tensor<13x26x3xf8E4M3FN>) -> tensor<13x29x3xf8E4M3FN>
    "func.return"(%0) : (tensor<13x29x3xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x32xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf8E4M3FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>, sym_name = "test_matmul_t_block_scaled_static"}> ({
  ^bb0(%arg0: tensor<4x8x32xf8E4M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf8E4M3FN>, %arg3: tensor<4x16x1xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x8x32xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf8E4M3FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    "func.return"(%0) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>, tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>) -> tensor<*xf32>, sym_name = "test_matmul_t_block_scaled_unranked"}> ({
  ^bb0(%arg0: tensor<*xf8E4M3FN>, %arg1: tensor<*xf8E8M0FNU>, %arg2: tensor<*xf8E4M3FN>, %arg3: tensor<*xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>, tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>) -> tensor<*xf32>
    "func.return"(%0) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x32xf6E3M2FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E3M2FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>, sym_name = "test_matmul_t_block_scaled_fp6e3m2"}> ({
  ^bb0(%arg0: tensor<4x8x32xf6E3M2FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf6E3M2FN>, %arg3: tensor<4x16x1xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x8x32xf6E3M2FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E3M2FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    "func.return"(%0) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x32xf6E2M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E2M3FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>, sym_name = "test_matmul_t_block_scaled_fp6e2m3"}> ({
  ^bb0(%arg0: tensor<4x8x32xf6E2M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf6E2M3FN>, %arg3: tensor<4x16x1xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x8x32xf6E2M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E2M3FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    "func.return"(%0) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x32xf4E2M1FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf4E2M1FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>, sym_name = "test_matmul_t_block_scaled_fp4e2m1"}> ({
  ^bb0(%arg0: tensor<4x8x32xf4E2M1FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf4E2M1FN>, %arg3: tensor<4x16x1xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x8x32xf4E2M1FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf4E2M1FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    "func.return"(%0) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x8x32xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<?x16x32xf8E4M3FN>, tensor<1x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>, sym_name = "test_matmul_t_block_scaled_broadcast"}> ({
  ^bb0(%arg0: tensor<?x8x32xf8E4M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<?x16x32xf8E4M3FN>, %arg3: tensor<1x16x1xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<?x8x32xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<?x16x32xf8E4M3FN>, tensor<1x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    "func.return"(%0) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x32x!tosa.mxint8>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32x!tosa.mxint8>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>, sym_name = "test_matmul_t_block_scaled_mxint8"}> ({
  ^bb0(%arg0: tensor<4x8x32x!tosa.mxint8>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32x!tosa.mxint8>, %arg3: tensor<4x16x1xf8E8M0FNU>):
    %0 = "tosa.matmul_t_block_scaled"(%arg0, %arg1, %arg2, %arg3) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x8x32x!tosa.mxint8>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32x!tosa.mxint8>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    "func.return"(%0) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x2x32xf32>, tensor<6x64x32xf32>) -> tensor<6x2x64xf32>, sym_name = "test_matmul_t_block_scaled_fp6e3m2_e2e"}> ({
  ^bb0(%arg0: tensor<6x2x32xf32>, %arg1: tensor<6x64x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32xf32>) -> (tensor<6x2x32xf6E3M2FN>, tensor<6x2x1xf8E8M0FNU>)
    %1:2 = "tosa.cast_to_block_scaled"(%arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x64x32xf32>) -> (tensor<6x64x32xf6E3M2FN>, tensor<6x64x1xf8E8M0FNU>)
    %2 = "tosa.matmul_t_block_scaled"(%0#0, %0#1, %1#0, %1#1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32xf6E3M2FN>, tensor<6x2x1xf8E8M0FNU>, tensor<6x64x32xf6E3M2FN>, tensor<6x64x1xf8E8M0FNU>) -> tensor<6x2x64xf32>
    "func.return"(%2) : (tensor<6x2x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x2x32xf32>, tensor<6x64x32xf32>) -> tensor<6x2x64xf32>, sym_name = "test_matmul_t_block_scaled_fp6e2m3_e2e"}> ({
  ^bb0(%arg0: tensor<6x2x32xf32>, %arg1: tensor<6x64x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32xf32>) -> (tensor<6x2x32xf6E2M3FN>, tensor<6x2x1xf8E8M0FNU>)
    %1:2 = "tosa.cast_to_block_scaled"(%arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x64x32xf32>) -> (tensor<6x64x32xf6E2M3FN>, tensor<6x64x1xf8E8M0FNU>)
    %2 = "tosa.matmul_t_block_scaled"(%0#0, %0#1, %1#0, %1#1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32xf6E2M3FN>, tensor<6x2x1xf8E8M0FNU>, tensor<6x64x32xf6E2M3FN>, tensor<6x64x1xf8E8M0FNU>) -> tensor<6x2x64xf32>
    "func.return"(%2) : (tensor<6x2x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x2x32xf32>, tensor<6x64x32xf32>) -> tensor<6x2x64xf32>, sym_name = "test_matmul_t_block_scaled_fp4e2m1_e2e"}> ({
  ^bb0(%arg0: tensor<6x2x32xf32>, %arg1: tensor<6x64x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32xf32>) -> (tensor<6x2x32xf4E2M1FN>, tensor<6x2x1xf8E8M0FNU>)
    %1:2 = "tosa.cast_to_block_scaled"(%arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x64x32xf32>) -> (tensor<6x64x32xf4E2M1FN>, tensor<6x64x1xf8E8M0FNU>)
    %2 = "tosa.matmul_t_block_scaled"(%0#0, %0#1, %1#0, %1#1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32xf4E2M1FN>, tensor<6x2x1xf8E8M0FNU>, tensor<6x64x32xf4E2M1FN>, tensor<6x64x1xf8E8M0FNU>) -> tensor<6x2x64xf32>
    "func.return"(%2) : (tensor<6x2x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x2x32xf32>, tensor<6x64x32xf32>) -> tensor<6x2x64xf32>, sym_name = "test_matmul_t_block_scaled_mxint8_e2e"}> ({
  ^bb0(%arg0: tensor<6x2x32xf32>, %arg1: tensor<6x64x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32xf32>) -> (tensor<6x2x32x!tosa.mxint8>, tensor<6x2x1xf8E8M0FNU>)
    %1:2 = "tosa.cast_to_block_scaled"(%arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x64x32xf32>) -> (tensor<6x64x32x!tosa.mxint8>, tensor<6x64x1xf8E8M0FNU>)
    %2 = "tosa.matmul_t_block_scaled"(%0#0, %0#1, %1#0, %1#1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<6x2x32x!tosa.mxint8>, tensor<6x2x1xf8E8M0FNU>, tensor<6x64x32x!tosa.mxint8>, tensor<6x64x1xf8E8M0FNU>) -> tensor<6x2x64xf32>
    "func.return"(%2) : (tensor<6x2x64xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) -> tensor<*xf32>, sym_name = "test_cast_from_block_scaled_unranked"}> ({
  ^bb0(%arg0: tensor<*xf4E2M1FN>, %arg1: tensor<*xf8E8M0FNU>):
    %0 = "tosa.cast_from_block_scaled"(%arg0, %arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) -> tensor<*xf32>
    "func.return"(%0) : (tensor<*xf32>) -> ()
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

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>), sym_name = "test_cast_to_block_scaled_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<*xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>)
    "func.return"(%0#0, %0#1) : (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>), sym_name = "test_cast_to_block_scaled_mxint8"}> ({
  ^bb0(%arg0: tensor<4x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>)
    "func.return"(%0#0, %0#1) : (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<2x!tosa.mxint8>, sym_name = "test_const_mxint8"}> ({
  ^bb0(%arg0: index):
    %0 = "tosa.const"() <{values = dense<"0x007F"> : tensor<2x!tosa.mxint8>}> : () -> tensor<2x!tosa.mxint8>
    "func.return"(%0) : (tensor<2x!tosa.mxint8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_add_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[1, 2, 3, 4]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[5, 6, 7, 8]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %2 = "tosa.add_shape"(%0, %1) : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%2) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<3>, sym_name = "test_sub_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[10, 5, 3]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[2, 1, 1]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.sub_shape"(%0, %1) : (!tosa.shape<3>, !tosa.shape<3>) -> !tosa.shape<3>
    "func.return"(%2) : (!tosa.shape<3>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_mul_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[2, 3, 4, 5]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[7, 0, 2, 6]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %2 = "tosa.mul_shape"(%0, %1) : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%2) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_mod_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[9, 12, 10, 5]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[2, 5, 3, 4]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %2 = "tosa.mod_shape"(%0, %1) : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%2) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_div_ceil_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[5, 7, 10, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[2, 3, 4, 3]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %2 = "tosa.div_ceil_shape"(%0, %1) : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%2) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_div_floor_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[5, 7, 10, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[2, 3, 4, 3]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %2 = "tosa.div_floor_shape"(%0, %1) : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%2) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4xi32>) -> !tosa.shape<1>, sym_name = "test_dim"}> ({
  ^bb0(%arg0: tensor<1x2x3x4xi32>):
    %0 = "tosa.dim"(%arg0) <{axis = 2 : i32}> : (tensor<1x2x3x4xi32>) -> !tosa.shape<1>
    "func.return"(%0) : (!tosa.shape<1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<5>, sym_name = "test_concat_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<10> : tensor<1xindex>}> : () -> !tosa.shape<1>
    %1 = "tosa.const_shape"() <{values = dense<[10, 15]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<[5, 2]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.concat_shape"(%0, %1, %2) : (!tosa.shape<1>, !tosa.shape<2>, !tosa.shape<2>) -> !tosa.shape<5>
    "func.return"(%3) : (!tosa.shape<5>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<0>, sym_name = "test_concat_shape_rank_0"}> ({
    %0 = "tosa.const_shape"() <{values = dense<> : tensor<0xindex>}> : () -> !tosa.shape<0>
    %1 = "tosa.const_shape"() <{values = dense<> : tensor<0xindex>}> : () -> !tosa.shape<0>
    %2 = "tosa.const_shape"() <{values = dense<> : tensor<0xindex>}> : () -> !tosa.shape<0>
    %3 = "tosa.concat_shape"(%0, %1, %2) : (!tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>) -> !tosa.shape<0>
    "func.return"(%3) : (!tosa.shape<0>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<3>, sym_name = "test_slice_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[4, 5, 6, 7, 8, 9]> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.const"() <{values = dense<1> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.const"() <{values = dense<3> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.slice_shape"(%0, %1, %2) : (!tosa.shape<6>, tensor<1xi32>, tensor<1xi32>) -> !tosa.shape<3>
    "func.return"(%3) : (!tosa.shape<3>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi32>, tensor<1xi32>) -> !tosa.shape<3>, sym_name = "test_slice_shape_dynamic"}> ({
  ^bb0(%arg0: tensor<1xi32>, %arg1: tensor<1xi32>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 5, 6, 7, 8, 9]> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.slice_shape"(%0, %arg0, %arg1) : (!tosa.shape<6>, tensor<1xi32>, tensor<1xi32>) -> !tosa.shape<3>
    "func.return"(%1) : (!tosa.shape<3>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_exp2_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[5, 7, 10, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.exp2_shape"(%0) : (!tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%1) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_log2_ceil_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[5, 7, 10, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.log2_ceil_shape"(%0) : (!tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%1) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_log2_floor_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[5, 7, 10, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.log2_floor_shape"(%0) : (!tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%1) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_max_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[5, 7, 10, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[2, 3, 4, 3]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %2 = "tosa.max_shape"(%0, %1) : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%2) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !tosa.shape<4>, sym_name = "test_min_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[5, 7, 10, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[2, 3, 4, 3]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %2 = "tosa.min_shape"(%0, %1) : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    "func.return"(%2) : (!tosa.shape<4>) -> ()
  }) : () -> ()
}) : () -> ()

