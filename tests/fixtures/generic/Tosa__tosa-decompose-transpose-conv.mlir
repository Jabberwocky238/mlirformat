"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>) -> tensor<2x18x19x5xf32>, sym_name = "transpose_conv2d"}> ({
  ^bb0(%arg0: tensor<2x16x14x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %0) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<2x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x18x19x5xf32>
    "func.return"(%1) : (tensor<2x18x19x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x16x14x3xi8>, tensor<5x3x6x3xi8>, tensor<5xi32>) -> tensor<2x18x19x5xi32>, sym_name = "transpose_conv2d_quantized"}> ({
  ^bb0(%arg0: tensor<2x16x14x3xi8>, %arg1: tensor<5x3x6x3xi8>, %arg2: tensor<5xi32>):
    %0 = "tosa.const"() <{values = dense<-6> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<11> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = i32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<2x16x14x3xi8>, tensor<5x3x6x3xi8>, tensor<5xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<2x18x19x5xi32>
    "func.return"(%2) : (tensor<2x18x19x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x16x14x3xi8>, tensor<5x3x6x3xi8>, tensor<5xi32>) -> tensor<2x21x26x5xi32>, sym_name = "transpose_conv2d_quantized_padded"}> ({
  ^bb0(%arg0: tensor<2x16x14x3xi8>, %arg1: tensor<5x3x6x3xi8>, %arg2: tensor<5xi32>):
    %0 = "tosa.const"() <{values = dense<-22> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<42> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = i32, out_pad = array<i64: 1, 2, 3, 4>, stride = array<i64: 1, 1>}> : (tensor<2x16x14x3xi8>, tensor<5x3x6x3xi8>, tensor<5xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<2x21x26x5xi32>
    "func.return"(%2) : (tensor<2x21x26x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x17x15x3xf32>, tensor<5x3x5x3xf32>, tensor<5xf32>) -> tensor<2x?x?x5xf32>, sym_name = "transpose_conv2d_strided"}> ({
  ^bb0(%arg0: tensor<2x17x15x3xf32>, %arg1: tensor<5x3x5x3xf32>, %arg2: tensor<5xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %0) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 3>}> : (tensor<2x17x15x3xf32>, tensor<5x3x5x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x35x47x5xf32>
    %2 = "tensor.cast"(%1) : (tensor<2x35x47x5xf32>) -> tensor<2x?x?x5xf32>
    "func.return"(%2) : (tensor<2x?x?x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x17x15x3xi8>, tensor<5x3x5x3xi8>, tensor<5xi32>) -> tensor<2x35x47x5xi32>, sym_name = "transpose_conv2d_strided_quantized"}> ({
  ^bb0(%arg0: tensor<2x17x15x3xi8>, %arg1: tensor<5x3x5x3xi8>, %arg2: tensor<5xi32>):
    %0 = "tosa.const"() <{values = dense<-22> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<42> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = i32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 3>}> : (tensor<2x17x15x3xi8>, tensor<5x3x5x3xi8>, tensor<5xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<2x35x47x5xi32>
    "func.return"(%2) : (tensor<2x35x47x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x17x15x3x!quant.uniform<i8:f32, 0.015684274956583977:-1>>, tensor<5x3x5x3x!quant.uniform<i8:f32, 0.015684274956583977:-1>>, tensor<5xi32>) -> tensor<2x35x47x5xi32>, sym_name = "transpose_conv2d_strided_quantized_quant_input"}> ({
  ^bb0(%arg0: tensor<2x17x15x3x!quant.uniform<i8:f32, 0.015684274956583977:-1>>, %arg1: tensor<5x3x5x3x!quant.uniform<i8:f32, 0.015684274956583977:-1>>, %arg2: tensor<5xi32>):
    %0 = "tosa.const"() <{values = dense<-22> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<42> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = i32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 3>}> : (tensor<2x17x15x3x!quant.uniform<i8:f32, 0.015684274956583977:-1>>, tensor<5x3x5x3x!quant.uniform<i8:f32, 0.015684274956583977:-1>>, tensor<5xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<2x35x47x5xi32>
    "func.return"(%2) : (tensor<2x35x47x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1x1xi8>, tensor<1x2x1x1xi8>, tensor<1xi32>) -> tensor<1x19x2x1xi32>, sym_name = "transpose_conv2d_strided_overpad"}> ({
  ^bb0(%arg0: tensor<1x16x1x1xi8>, %arg1: tensor<1x2x1x1xi8>, %arg2: tensor<1xi32>):
    %0 = "tosa.const"() <{values = dense<-103> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<93> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %1) <{acc_type = i32, out_pad = array<i64: 2, 0, 0, 1>, stride = array<i64: 1, 2>}> : (tensor<1x16x1x1xi8>, tensor<1x2x1x1xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x19x2x1xi32>
    "func.return"(%2) : (tensor<1x19x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>) -> tensor<?x18x19x5xf32>, sym_name = "transpose_conv2d_non_strided_dynamic_batch"}> ({
  ^bb0(%arg0: tensor<?x16x14x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %0) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<?x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x18x19x5xf32>
    "func.return"(%1) : (tensor<?x18x19x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x17x15x3xf32>, tensor<5x3x5x3xf32>, tensor<5xf32>) -> tensor<?x35x47x5xf32>, sym_name = "transpose_conv2d_strided_dynamic_batch"}> ({
  ^bb0(%arg0: tensor<?x17x15x3xf32>, %arg1: tensor<5x3x5x3xf32>, %arg2: tensor<5xf32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %0) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 3>}> : (tensor<?x17x15x3xf32>, tensor<5x3x5x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x35x47x5xf32>
    "func.return"(%1) : (tensor<?x35x47x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

