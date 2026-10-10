"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16384x16384x8xf32>) -> tensor<1x32767x32767x8xf32>, sym_name = "test_resize_large_image_size"}> ({
  ^bb0(%arg0: tensor<1x16384x16384x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[2, 1, 2, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x16384x16384x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x32767x32767x8xf32>
    "func.return"(%3) : (tensor<1x32767x32767x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x9x9x8xf32>) -> tensor<?x?x?x?xf32>, sym_name = "test_resize_invalid_scale_numerator"}> ({
  ^bb0(%arg0: tensor<1x9x9x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[2049, 8, 1, 2]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x9x9x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x37x37x8xf32>) -> tensor<?x?x?x?xf32>, sym_name = "test_resize_invalid_downscale"}> ({
  ^bb0(%arg0: tensor<1x37x37x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<[1, 18, 1, 18]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x37x37x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32>, sym_name = "test_resize_invalid_offset_y"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<1> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[17, 0]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32>, sym_name = "test_resize_invalid_offset_x"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<1> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<[0, -2]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32>, sym_name = "test_resize_invalid_boarder_y"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<1> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<[-17, 0]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32>, sym_name = "test_resize_invalid_boarder_x"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xf32>):
    %0 = "tosa.const_shape"() <{values = dense<1> : tensor<4xindex>}> : () -> !tosa.shape<4>
    %1 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<[0, 2]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<BILINEAR>}> : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xi32>, tensor<1x8x8x8xi32>) -> tensor<1x8x8x8xi32>, sym_name = "test_mul_negative_shift"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xi32>, %arg1: tensor<1x8x8x8xi32>):
    %0 = "tosa.const"() <{values = dense<-1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<1x8x8x8xi32>, tensor<1x8x8x8xi32>, tensor<1xi8>) -> tensor<1x8x8x8xi32>
    "func.return"(%1) : (tensor<1x8x8x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xi32>, tensor<1x8x8x8xi32>) -> tensor<1x8x8x8xi32>, sym_name = "test_mul_too_big_shift"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xi32>, %arg1: tensor<1x8x8x8xi32>):
    %0 = "tosa.const"() <{values = dense<64> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<1x8x8x8xi32>, tensor<1x8x8x8xi32>, tensor<1xi8>) -> tensor<1x8x8x8xi32>
    "func.return"(%1) : (tensor<1x8x8x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x8x8xi16>, tensor<1x8x8x8xi16>) -> tensor<1x8x8x8xi32>, sym_name = "test_mul_non_zero_shift"}> ({
  ^bb0(%arg0: tensor<1x8x8x8xi16>, %arg1: tensor<1x8x8x8xi16>):
    %0 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.mul"(%arg0, %arg1, %0) : (tensor<1x8x8x8xi16>, tensor<1x8x8x8xi16>, tensor<1xi8>) -> tensor<1x8x8x8xi32>
    "func.return"(%1) : (tensor<1x8x8x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x64xi16>, tensor<256xi16>) -> tensor<2x64xi32>, sym_name = "test_i16_table_size"}> ({
  ^bb0(%arg0: tensor<2x64xi16>, %arg1: tensor<256xi16>):
    %0 = "tosa.table"(%arg0, %arg1) : (tensor<2x64xi16>, tensor<256xi16>) -> tensor<2x64xi32>
    "func.return"(%0) : (tensor<2x64xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x64xi8>, tensor<513xi8>) -> tensor<2x64xi8>, sym_name = "test_i8_table_size"}> ({
  ^bb0(%arg0: tensor<2x64xi8>, %arg1: tensor<513xi8>):
    %0 = "tosa.table"(%arg0, %arg1) : (tensor<2x64xi8>, tensor<513xi8>) -> tensor<2x64xi8>
    "func.return"(%0) : (tensor<2x64xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi48>) -> tensor<1xi8>, sym_name = "test_error_scale32_with_i48"}> ({
  ^bb0(%arg0: tensor<1xi48>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi48>}> : () -> tensor<1xi48>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = true}> : (tensor<1xi48>, tensor<1xi32>, tensor<1xi8>, tensor<1xi48>, tensor<1xi8>) -> tensor<1xi8>
    "func.return"(%4) : (tensor<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi8>) -> tensor<1xi16>, sym_name = "test_error_input_output_unsigned"}> ({
  ^bb0(%arg0: tensor<1xi8>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi16>}> : () -> tensor<1xi16>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = true, output_unsigned = true, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<1xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi16>) -> tensor<1xi16>
    "func.return"(%4) : (tensor<1xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi8>) -> tensor<1xi32>, sym_name = "test_error_i32_output_unsigned_input"}> ({
  ^bb0(%arg0: tensor<1xi8>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<1xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi32>) -> tensor<1xi32>
    "func.return"(%4) : (tensor<1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi32>) -> tensor<1xi8>, sym_name = "test_error_i32_input_unsigned_output"}> ({
  ^bb0(%arg0: tensor<1xi32>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<1xi32>, tensor<1xi16>, tensor<1xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<1xi8>
    "func.return"(%4) : (tensor<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi48>) -> tensor<1xi8>, sym_name = "test_error_i48_input_unsigned_output"}> ({
  ^bb0(%arg0: tensor<1xi48>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi48>}> : () -> tensor<1xi48>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<1xi48>, tensor<1xi16>, tensor<1xi8>, tensor<1xi48>, tensor<1xi8>) -> tensor<1xi8>
    "func.return"(%4) : (tensor<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi48>) -> tensor<1xi8>, sym_name = "test_error_i48_input_unsigned_output"}> ({
  ^bb0(%arg0: tensor<1xi48>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi48>}> : () -> tensor<1xi48>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<1xi48>, tensor<1xi16>, tensor<1xi8>, tensor<1xi48>, tensor<1xi8>) -> tensor<1xi8>
    "func.return"(%4) : (tensor<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi32>) -> tensor<1xi8>, sym_name = "test_error_i32_input_unsigned_output"}> ({
  ^bb0(%arg0: tensor<1xi32>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<1xi32>, tensor<1xi16>, tensor<1xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<1xi8>
    "func.return"(%4) : (tensor<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi8>) -> tensor<1xi32>, sym_name = "test_error_i32_unsigned_output"}> ({
  ^bb0(%arg0: tensor<1xi8>):
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = #tosa.rounding_mode<SINGLE_ROUND>, scale32 = false}> : (tensor<1xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi32>) -> tensor<1xi32>
    "func.return"(%4) : (tensor<1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "test_cond_if_then_not_isolated_from_above"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2, %arg1) ({
    ^bb0(%arg4: tensor<f32>):
      "tosa.yield"(%arg1) : (tensor<f32>) -> ()
    }, {
    ^bb0(%arg3: tensor<f32>):
      "tosa.yield"(%arg3) : (tensor<f32>) -> ()
    }) : (tensor<i1>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "test_cond_if_else_not_isolated_from_above"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2, %arg0, %arg1) ({
    ^bb0(%arg5: tensor<f32>, %arg6: tensor<f32>):
      "tosa.yield"(%arg5) : (tensor<f32>) -> ()
    }, {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      %1 = "tosa.add"(%arg0, %arg4) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%1) : (tensor<f32>) -> ()
    }) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "test_cond_if_simplified_form_not_isolated_from_above"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2) ({
      "tosa.yield"(%arg0) : (tensor<f32>) -> ()
    }, {
      "tosa.yield"(%arg1) : (tensor<f32>) -> ()
    }) : (tensor<i1>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<i32>, tensor<f32>) -> (), sym_name = "test_while_loop_cond_not_isolated_from_above"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.while_loop"(%0) ({
    ^bb0(%arg4: tensor<i32>):
      %4 = "tosa.greater_equal"(%arg4, %arg1) : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %5 = "tosa.logical_not"(%4) : (tensor<i1>) -> tensor<i1>
      "tosa.yield"(%5) : (tensor<i1>) -> ()
    }, {
    ^bb0(%arg3: tensor<i32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = "tosa.add"(%arg3, %2) : (tensor<i32>, tensor<i32>) -> tensor<i32>
      "tosa.yield"(%3) : (tensor<i32>) -> ()
    }) : (tensor<i32>) -> tensor<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<i32>, tensor<f32>) -> (), sym_name = "test_while_loop_body_not_isolated_from_above"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.while_loop"(%0) ({
    ^bb0(%arg4: tensor<i32>):
      %3 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %4 = "tosa.greater_equal"(%arg4, %3) : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %5 = "tosa.logical_not"(%4) : (tensor<i1>) -> tensor<i1>
      "tosa.yield"(%5) : (tensor<i1>) -> ()
    }, {
    ^bb0(%arg3: tensor<i32>):
      %2 = "tosa.add"(%arg3, %arg1) : (tensor<i32>, tensor<i32>) -> tensor<i32>
      "tosa.yield"(%2) : (tensor<i32>) -> ()
    }) : (tensor<i32>) -> tensor<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

