module {
}

// -----
module {
  func.func @test_resize_large_image_size(%arg0: tensor<1x16384x16384x8xf32>) -> tensor<1x32767x32767x8xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 1, 2, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x16384x16384x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x32767x32767x8xf32>
    return %3 : tensor<1x32767x32767x8xf32>
  }
}

// -----
module {
  func.func @test_resize_invalid_scale_numerator(%arg0: tensor<1x9x9x8xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<[2049, 8, 1, 2]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x9x9x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return %3 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @test_resize_invalid_downscale(%arg0: tensor<1x37x37x8xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 18, 1, 18]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x37x37x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return %3 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @test_resize_invalid_offset_y(%arg0: tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<[17, 0]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return %3 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @test_resize_invalid_offset_x(%arg0: tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<[0, -2]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return %3 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @test_resize_invalid_boarder_y(%arg0: tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<[-17, 0]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return %3 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @test_resize_invalid_boarder_x(%arg0: tensor<1x8x8x8xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<[0, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x8x8x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return %3 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @test_mul_negative_shift(%arg0: tensor<1x8x8x8xi32>, %arg1: tensor<1x8x8x8xi32>) -> tensor<1x8x8x8xi32> {
    %0 = "tosa.const"() <{values = dense<-1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = tosa.mul %arg0, %arg1, %0 : (tensor<1x8x8x8xi32>, tensor<1x8x8x8xi32>, tensor<1xi8>) -> tensor<1x8x8x8xi32>
    return %1 : tensor<1x8x8x8xi32>
  }
}

// -----
module {
  func.func @test_mul_too_big_shift(%arg0: tensor<1x8x8x8xi32>, %arg1: tensor<1x8x8x8xi32>) -> tensor<1x8x8x8xi32> {
    %0 = "tosa.const"() <{values = dense<64> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = tosa.mul %arg0, %arg1, %0 : (tensor<1x8x8x8xi32>, tensor<1x8x8x8xi32>, tensor<1xi8>) -> tensor<1x8x8x8xi32>
    return %1 : tensor<1x8x8x8xi32>
  }
}

// -----
module {
  func.func @test_mul_non_zero_shift(%arg0: tensor<1x8x8x8xi16>, %arg1: tensor<1x8x8x8xi16>) -> tensor<1x8x8x8xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = tosa.mul %arg0, %arg1, %0 : (tensor<1x8x8x8xi16>, tensor<1x8x8x8xi16>, tensor<1xi8>) -> tensor<1x8x8x8xi32>
    return %1 : tensor<1x8x8x8xi32>
  }
}

// -----
module {
  func.func @test_i16_table_size(%arg0: tensor<2x64xi16>, %arg1: tensor<256xi16>) -> tensor<2x64xi32> {
    %0 = tosa.table %arg0, %arg1 : (tensor<2x64xi16>, tensor<256xi16>) -> tensor<2x64xi32>
    return %0 : tensor<2x64xi32>
  }
}

// -----
module {
  func.func @test_i8_table_size(%arg0: tensor<2x64xi8>, %arg1: tensor<513xi8>) -> tensor<2x64xi8> {
    %0 = tosa.table %arg0, %arg1 : (tensor<2x64xi8>, tensor<513xi8>) -> tensor<2x64xi8>
    return %0 : tensor<2x64xi8>
  }
}

// -----
module {
  func.func @test_error_scale32_with_i48(%arg0: tensor<1xi48>) -> tensor<1xi8> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi48>}> : () -> tensor<1xi48>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<1xi48>, tensor<1xi32>, tensor<1xi8>, tensor<1xi48>, tensor<1xi8>) -> tensor<1xi8>
    return %4 : tensor<1xi8>
  }
}

// -----
module {
  func.func @test_error_input_output_unsigned(%arg0: tensor<1xi8>) -> tensor<1xi16> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi16>}> : () -> tensor<1xi16>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = true, output_unsigned = true, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<1xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi16>) -> tensor<1xi16>
    return %4 : tensor<1xi16>
  }
}

// -----
module {
  func.func @test_error_i32_output_unsigned_input(%arg0: tensor<1xi8>) -> tensor<1xi32> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<1xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi32>) -> tensor<1xi32>
    return %4 : tensor<1xi32>
  }
}

// -----
module {
  func.func @test_error_i32_input_unsigned_output(%arg0: tensor<1xi32>) -> tensor<1xi8> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<1xi32>, tensor<1xi16>, tensor<1xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<1xi8>
    return %4 : tensor<1xi8>
  }
}

// -----
module {
  func.func @test_error_i48_input_unsigned_output(%arg0: tensor<1xi48>) -> tensor<1xi8> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi48>}> : () -> tensor<1xi48>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<1xi48>, tensor<1xi16>, tensor<1xi8>, tensor<1xi48>, tensor<1xi8>) -> tensor<1xi8>
    return %4 : tensor<1xi8>
  }
}

// -----
module {
  func.func @test_error_i48_input_unsigned_output(%arg0: tensor<1xi48>) -> tensor<1xi8> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi48>}> : () -> tensor<1xi48>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<1xi48>, tensor<1xi16>, tensor<1xi8>, tensor<1xi48>, tensor<1xi8>) -> tensor<1xi8>
    return %4 : tensor<1xi8>
  }
}

// -----
module {
  func.func @test_error_i32_input_unsigned_output(%arg0: tensor<1xi32>) -> tensor<1xi8> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<1xi32>, tensor<1xi16>, tensor<1xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<1xi8>
    return %4 : tensor<1xi8>
  }
}

// -----
module {
  func.func @test_error_i32_unsigned_output(%arg0: tensor<1xi8>) -> tensor<1xi32> {
    %0 = "tosa.const"() <{values = dense<19689> : tensor<1xi16>}> : () -> tensor<1xi16>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<1xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi32>) -> tensor<1xi32>
    return %4 : tensor<1xi32>
  }
}

// -----
module {
  func.func @test_cond_if_then_not_isolated_from_above(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg1) : tensor<i1> (tensor<f32>) -> tensor<f32> {
    ^bb0(%arg3: tensor<f32>):
      tosa.yield %arg1 : tensor<f32>
    } else {
    ^bb0(%arg3: tensor<f32>):
      tosa.yield %arg3 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @test_cond_if_else_not_isolated_from_above(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<f32>, tensor<f32>) -> tensor<f32> {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      tosa.yield %arg3 : tensor<f32>
    } else {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      %1 = tosa.add %arg0, %arg4 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @test_cond_if_simplified_form_not_isolated_from_above(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
      tosa.yield %arg0 : tensor<f32>
    } else {
      tosa.yield %arg1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @test_while_loop_cond_not_isolated_from_above(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<f32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.while_loop (%arg3 = %0) : (tensor<i32>) -> tensor<i32> {
      %2 = tosa.greater_equal %arg3, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %3 = tosa.logical_not %2 : (tensor<i1>) -> tensor<i1>
      tosa.yield %3 : tensor<i1>
    } do {
    ^bb0(%arg3: tensor<i32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.add %arg3, %2 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %3 : tensor<i32>
    }
    return
  }
}

// -----
module {
  func.func @test_while_loop_body_not_isolated_from_above(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<f32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.while_loop (%arg3 = %0) : (tensor<i32>) -> tensor<i32> {
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.greater_equal %arg3, %2 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %4 = tosa.logical_not %3 : (tensor<i1>) -> tensor<i1>
      tosa.yield %4 : tensor<i1>
    } do {
    ^bb0(%arg3: tensor<i32>):
      %2 = tosa.add %arg3, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %2 : tensor<i32>
    }
    return
  }
}

