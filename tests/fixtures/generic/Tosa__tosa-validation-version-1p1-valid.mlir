"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E5M2>) -> tensor<1x14x28xf16>, sym_name = "test_matmul_fp8_mixed_precision_operands"}> ({
  ^bb0(%arg0: tensor<1x14x19xf8E4M3FN>, %arg1: tensor<1x19x28xf8E5M2>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = "tosa.matmul"(%arg0, %arg1, %0, %1) : (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E5M2>, tensor<1xf8E4M3FN>, tensor<1xf8E5M2>) -> tensor<1x14x28xf16>
    "func.return"(%2) : (tensor<1x14x28xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E4M3FN>) -> tensor<1x14x28xf32>, sym_name = "test_matmul_fp8_input_fp32_acc_type"}> ({
  ^bb0(%arg0: tensor<1x14x19xf8E4M3FN>, %arg1: tensor<1x19x28xf8E4M3FN>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = "tosa.matmul"(%arg0, %arg1, %0, %1) : (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E4M3FN>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x14x28xf32>
    "func.return"(%2) : (tensor<1x14x28xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<1x13x13x5xf32>) -> tensor<1x13x13xi64>, sym_name = "test_argmax_int64"}> ({
  ^bb0(%arg0: tensor<1x13x13x5xf32>):
    %0 = "tosa.argmax"(%arg0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x13x13x5xf32>) -> tensor<1x13x13xi64>
    "func.return"(%0) : (tensor<1x13x13xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xi64>, sym_name = "test_const_i64"}> ({
    %0 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi64>}> : () -> tensor<4xi64>
    "func.return"(%0) : (tensor<4xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf6E3M2FN>, sym_name = "test_const_fp6e3m2"}> ({
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<4xf6E3M2FN>}> : () -> tensor<4xf6E3M2FN>
    "func.return"(%0) : (tensor<4xf6E3M2FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf8E5M2>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>, sym_name = "test_cast_from_block_scaled_fp8e5m2_fp32"}> ({
  ^bb0(%arg0: tensor<4x32xf8E5M2>, %arg1: tensor<4x1xf8E8M0FNU>):
    %0 = "tosa.cast_from_block_scaled"(%arg0, %arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x32xf8E5M2>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>
    "func.return"(%0) : (tensor<4x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf8E5M2>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xbf16>, sym_name = "test_cast_from_block_scaled_fp8e5m2_bf16"}> ({
  ^bb0(%arg0: tensor<4x32xf8E5M2>, %arg1: tensor<4x1xf8E8M0FNU>):
    %0 = "tosa.cast_from_block_scaled"(%arg0, %arg1) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x32xf8E5M2>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xbf16>
    "func.return"(%0) : (tensor<4x32xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf32>) -> (tensor<4x32xf6E3M2FN>, tensor<4x1xf8E8M0FNU>), sym_name = "test_cast_to_block_scaled_static"}> ({
  ^bb0(%arg0: tensor<4x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> : (tensor<4x32xf32>) -> (tensor<4x32xf6E3M2FN>, tensor<4x1xf8E8M0FNU>)
    "func.return"(%0#0, %0#1) : (tensor<4x32xf6E3M2FN>, tensor<4x1xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>), sym_name = "test_cast_to_block_scaled_mxint8"}> ({
  ^bb0(%arg0: tensor<4x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> {stochastic_round = false} : (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>)
    "func.return"(%0#0, %0#1) : (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf6E3M2FN>, sym_name = "test_const_fp6e3m2"}> ({
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<4xf6E3M2FN>}> : () -> tensor<4xf6E3M2FN>
    "func.return"(%0) : (tensor<4xf6E3M2FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x!tosa.mxint8>, sym_name = "test_const_mxint8"}> ({
    %0 = "tosa.const"() <{values = dense<["0x00", "0x7F"]> : tensor<2x!tosa.mxint8>}> : () -> tensor<2x!tosa.mxint8>
    "func.return"(%0) : (tensor<2x!tosa.mxint8>) -> ()
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
  "func.func"() <{function_type = (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>), sym_name = "test_cast_to_block_scaled_mxint8"}> ({
  ^bb0(%arg0: tensor<4x32xf32>):
    %0:2 = "tosa.cast_to_block_scaled"(%arg0) <{block_size = #tosa.block_size<BLOCK_SIZE_32>}> {stochastic_round = false} : (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>)
    "func.return"(%0#0, %0#1) : (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x8x16xf8E5M2>) -> tensor<12x16xi64>, sym_name = "test_argmax_fp8_i64"}> ({
  ^bb0(%arg0: tensor<12x8x16xf8E5M2>):
    %0 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<12x8x16xf8E5M2>) -> tensor<12x16xi64>
    "func.return"(%0) : (tensor<12x16xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x8x16xbf16>) -> tensor<12x16xi64>, sym_name = "test_argmax_bf16_i64"}> ({
  ^bb0(%arg0: tensor<12x8x16xbf16>):
    %0 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<12x8x16xbf16>) -> tensor<12x16xi64>
    "func.return"(%0) : (tensor<12x16xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x52x3xf32>, tensor<2x12x3xf32>) -> tensor<2x52x3xf32>, sym_name = "test_scatter_const_indices_int64"}> ({
  ^bb0(%arg0: tensor<2x52x3xf32>, %arg1: tensor<2x12x3xf32>):
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]> : tensor<2x12xi64>}> : () -> tensor<2x12xi64>
    %1 = "tosa.scatter"(%arg0, %0, %arg1) : (tensor<2x52x3xf32>, tensor<2x12xi64>, tensor<2x12x3xf32>) -> tensor<2x52x3xf32>
    "func.return"(%1) : (tensor<2x52x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x8x16xi8>) -> tensor<?x16xi32>, sym_name = "test_dynamic_dims"}> ({
  ^bb0(%arg0: tensor<?x8x16xi8>):
    %0 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<?x8x16xi8>) -> tensor<?x16xi32>
    "func.return"(%0) : (tensor<?x16xi32>) -> ()
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
  "func.func"() <{function_type = (tensor<1x2x3x4xi32>) -> !tosa.shape<1>, sym_name = "test_dim"}> ({
  ^bb0(%arg0: tensor<1x2x3x4xi32>):
    %0 = "tosa.dim"(%arg0) <{axis = 2 : i32}> : (tensor<1x2x3x4xi32>) -> !tosa.shape<1>
    "func.return"(%0) : (!tosa.shape<1>) -> ()
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
  "func.func"() <{function_type = () -> !tosa.shape<3>, sym_name = "test_mod_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[10, 11, 12]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[3, 5, 2]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.mod_shape"(%0, %1) : (!tosa.shape<3>, !tosa.shape<3>) -> !tosa.shape<3>
    "func.return"(%2) : (!tosa.shape<3>) -> ()
  }) : () -> ()
}) : () -> ()

