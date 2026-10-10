"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi8>, tensor<13x1x3xi8>, tensor<1xi8>) -> tensor<13x21x3xi16>, sym_name = "test_mul_non_const"}> ({
  ^bb0(%arg0: tensor<13x21x3xi8>, %arg1: tensor<13x1x3xi8>, %arg2: tensor<1xi8>):
    %0 = "tosa.mul"(%arg0, %arg1, %arg2) : (tensor<13x21x3xi8>, tensor<13x1x3xi8>, tensor<1xi8>) -> tensor<13x21x3xi16>
    "func.return"(%0) : (tensor<13x21x3xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xi8>, tensor<256xi8>) -> (), sym_name = "test_table_non_const"}> ({
  ^bb0(%arg0: tensor<4x5xi8>, %arg1: tensor<256xi8>):
    %0 = "tosa.table"(%arg0, %arg1) : (tensor<4x5xi8>, tensor<256xi8>) -> tensor<4x5xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi8>, tensor<1xi8>) -> tensor<13x22x4xi8>, sym_name = "test_pad_non_const"}> ({
  ^bb0(%arg0: tensor<13x21x3xi8>, %arg1: tensor<1xi8>):
    %0 = "tosa.const_shape"() <{values = dense<[0, 0, 0, 1, 0, 1]> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.pad"(%arg0, %0, %arg1) : (tensor<13x21x3xi8>, !tosa.shape<6>, tensor<1xi8>) -> tensor<13x22x4xi8>
    "func.return"(%1) : (tensor<13x22x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<1xi32>) -> tensor<13x21x3xi32>, sym_name = "test_rescale_non_const_multiplier"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<1xi32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.rescale"(%arg0, %arg1, %1, %0, %0) <{input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = true}> : (tensor<13x21x3xi32>, tensor<1xi32>, tensor<1xi8>, tensor<1xi32>, tensor<1xi32>) -> tensor<13x21x3xi32>
    "func.return"(%2) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<1xi8>) -> tensor<13x21x3xi32>, sym_name = "test_rescale_non_const_shift"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<1xi8>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<1073741824> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.rescale"(%arg0, %1, %arg1, %0, %0) <{input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = true}> : (tensor<13x21x3xi32>, tensor<1xi32>, tensor<1xi8>, tensor<1xi32>, tensor<1xi32>) -> tensor<13x21x3xi32>
    "func.return"(%2) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<1xi32>) -> tensor<13x21x3xi32>, sym_name = "test_rescale_non_const_input_zp"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<1xi32>):
    %0 = "tosa.const"() <{values = dense<1073741824> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.rescale"(%arg0, %0, %1, %arg1, %2) <{input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = true}> : (tensor<13x21x3xi32>, tensor<1xi32>, tensor<1xi8>, tensor<1xi32>, tensor<1xi32>) -> tensor<13x21x3xi32>
    "func.return"(%3) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi32>, tensor<1xi32>) -> tensor<13x21x3xi32>, sym_name = "test_rescale_non_const_output_zp"}> ({
  ^bb0(%arg0: tensor<13x21x3xi32>, %arg1: tensor<1xi32>):
    %0 = "tosa.const"() <{values = dense<1073741824> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.rescale"(%arg0, %0, %1, %2, %arg1) <{input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = true}> : (tensor<13x21x3xi32>, tensor<1xi32>, tensor<1xi8>, tensor<1xi32>, tensor<1xi32>) -> tensor<13x21x3xi32>
    "func.return"(%3) : (tensor<13x21x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf32>, tensor<1x19x28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x14x28xf32>, sym_name = "test_matmul_non_const_zps"}> ({
  ^bb0(%arg0: tensor<1x14x19xf32>, %arg1: tensor<1x19x28xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>):
    %0 = "tosa.matmul"(%arg0, %arg1, %arg2, %arg3) : (tensor<1x14x19xf32>, tensor<1x19x28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x14x28xf32>
    "func.return"(%0) : (tensor<1x14x28xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>, sym_name = "test_negate_non_const_zps"}> ({
  ^bb0(%arg0: tensor<1xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>):
    %0 = "tosa.negate"(%arg0, %arg1, %arg2) : (tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    "func.return"(%0) : (tensor<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x8xf32>, sym_name = "test_avg_pool2d_non_const_zps"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>):
    %0 = "tosa.avg_pool2d"(%arg0, %arg1, %arg2) <{acc_type = f32, kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<1x32x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x8xf32>
    "func.return"(%0) : (tensor<1x32x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi32>, tensor<1xi32>) -> !tosa.shape<3>, sym_name = "test_slice_shape_non_const_start_size"}> ({
  ^bb0(%arg0: tensor<1xi32>, %arg1: tensor<1xi32>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 5, 6, 7, 8, 9]> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.slice_shape"(%0, %arg0, %arg1) : (!tosa.shape<6>, tensor<1xi32>, tensor<1xi32>) -> !tosa.shape<3>
    "func.return"(%1) : (!tosa.shape<3>) -> ()
  }) : () -> ()
}) : () -> ()

