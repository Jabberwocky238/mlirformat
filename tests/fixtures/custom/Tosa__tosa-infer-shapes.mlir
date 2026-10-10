module {
  func.func @test_return(%arg0: tensor<4xf32>) -> tensor<*xf32> {
    %0 = tosa.log %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_multiple(%arg0: tensor<4xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<*xf32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %1 = tosa.log %0 : (tensor<*xf32>) -> tensor<*xf32>
    %2 = tosa.sub %0, %arg2 : (tensor<*xf32>, tensor<1xf32>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_unary_f32(%arg0: tensor<4xf32>) {
    %0 = tosa.abs %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %1 = tosa.ceil %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %2 = tosa.clamp %arg0 {max_val = 1.000000e+01 : f32, min_val = 0.000000e+00 : f32} : (tensor<4xf32>) -> tensor<*xf32>
    %3 = tosa.exp %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %4 = tosa.floor %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %5 = tosa.log %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %6 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %7 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %8 = tosa.negate %arg0, %6, %7 : (tensor<4xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<*xf32>
    %9 = tosa.reciprocal %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %10 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<4xf32>) -> tensor<?xf32>
    %11 = tosa.rsqrt %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %12 = tosa.tanh %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %13 = tosa.sigmoid %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    %14 = tosa.cast %arg0 : (tensor<4xf32>) -> tensor<*xi32>
    %15 = tosa.erf %arg0 : (tensor<4xf32>) -> tensor<*xf32>
    return
  }
}

// -----
module {
  func.func @test_unary_i32(%arg0: tensor<4xi32>, %arg1: tensor<2xi8>) {
    %0 = tosa.abs %arg0 : (tensor<4xi32>) -> tensor<*xi32>
    %1 = tosa.bitwise_not %arg0 : (tensor<4xi32>) -> tensor<*xi32>
    %2 = tosa.clamp %arg0 {max_val = 10 : i32, min_val = 0 : i32} : (tensor<4xi32>) -> tensor<*xi32>
    %3 = tosa.clz %arg0 : (tensor<4xi32>) -> tensor<*xi32>
    %4 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %5 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %6 = tosa.negate %arg0, %4, %5 : (tensor<4xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<*xi32>
    %7 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<4xi32>) -> tensor<?xi32>
    %8 = "tosa.const"() <{values = dense<[42, 43]> : tensor<2xi16>}> : () -> tensor<2xi16>
    %9 = "tosa.const"() <{values = dense<[14, 15]> : tensor<2xi8>}> : () -> tensor<2xi8>
    %10 = "tosa.const"() <{values = dense<43> : tensor<1xi8>}> : () -> tensor<1xi8>
    %11 = "tosa.const"() <{values = dense<52> : tensor<1xi8>}> : () -> tensor<1xi8>
    %12 = tosa.rescale %arg1, %8, %9, %10, %11 {input_unsigned = true, output_unsigned = true, per_channel = true, rounding_mode = SINGLE_ROUND, scale32 = false} : (tensor<2xi8>, tensor<2xi16>, tensor<2xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>
    %13 = tosa.identity %arg0 : (tensor<4xi32>) -> tensor<?xi32>
    return
  }
}

// -----
module {
  func.func @test_binary_scalar_f32(%arg0: tensor<4xf32>, %arg1: tensor<1xf32>) {
    %0 = tosa.add %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %1 = tosa.maximum %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %2 = tosa.minimum %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.mul %arg0, %arg1, %3 : (tensor<4xf32>, tensor<1xf32>, tensor<1xi8>) -> tensor<*xf32>
    %5 = tosa.pow %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %6 = tosa.sub %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %7 = tosa.equal %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xi1>
    %8 = tosa.greater %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xi1>
    %9 = tosa.greater_equal %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xi1>
    return
  }
}

// -----
module {
  func.func @test_binary_broadcast_f32(%arg0: tensor<4xf32>, %arg1: tensor<1xf32>) {
    %0 = tosa.add %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %1 = tosa.maximum %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %2 = tosa.minimum %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.mul %arg0, %arg1, %3 : (tensor<4xf32>, tensor<1xf32>, tensor<1xi8>) -> tensor<*xf32>
    %5 = tosa.pow %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %6 = tosa.sub %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xf32>
    %7 = tosa.equal %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xi1>
    %8 = tosa.greater %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xi1>
    %9 = tosa.greater_equal %arg0, %arg1 : (tensor<4xf32>, tensor<1xf32>) -> tensor<*xi1>
    return
  }
}

// -----
module {
  func.func @test_binary_i32(%arg0: tensor<4xi32>, %arg1: tensor<1xi32>) {
    %0 = tosa.add %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %1 = tosa.bitwise_and %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %2 = tosa.bitwise_or %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %3 = tosa.bitwise_xor %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %4 = tosa.equal %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi1>
    %5 = tosa.greater %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi1>
    %6 = tosa.greater_equal %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi1>
    %7 = tosa.logical_left_shift %arg0, %arg1 {shift = 0 : i32} : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %8 = tosa.logical_right_shift %arg0, %arg1 {shift = 0 : i32} : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %9 = tosa.maximum %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %10 = tosa.minimum %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %11 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %12 = tosa.mul %arg0, %arg1, %11 : (tensor<4xi32>, tensor<1xi32>, tensor<1xi8>) -> tensor<*xi32>
    %13 = tosa.pow %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    %14 = tosa.sub %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi32>
    return
  }
}

// -----
module {
  func.func @test_binary_i1(%arg0: tensor<4xi1>, %arg1: tensor<1xi1>) {
    %0 = tosa.logical_and %arg0, %arg1 : (tensor<4xi1>, tensor<1xi1>) -> tensor<*xi1>
    %1 = tosa.logical_or %arg0, %arg1 : (tensor<4xi1>, tensor<1xi1>) -> tensor<*xi1>
    %2 = tosa.logical_xor %arg0, %arg1 : (tensor<4xi1>, tensor<1xi1>) -> tensor<*xi1>
    return
  }
}

// -----
module {
  func.func @test_select_i32(%arg0: tensor<4xi1>, %arg1: tensor<1xi32>, %arg2: tensor<4xi32>) {
    %0 = tosa.select %arg0, %arg1, %arg2 : (tensor<4xi1>, tensor<1xi32>, tensor<4xi32>) -> tensor<*xi32>
    return
  }
}

// -----
module {
  func.func @test_static_argmax(%arg0: tensor<2x3xi32>) {
    %0 = tosa.argmax %arg0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<?xi32>
    %1 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<2x3xi32>) -> tensor<?xi32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_argmax(%arg0: tensor<2x?xi32>) {
    %0 = tosa.argmax %arg0 {axis = 0 : i32} : (tensor<2x?xi32>) -> tensor<?xi32>
    %1 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<2x?xi32>) -> tensor<?xi32>
    return
  }
}

// -----
module {
  func.func @test_static_matmul(%arg0: tensor<2x3x4xi32>, %arg1: tensor<2x4x5xi32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<2x3x4xi32>, tensor<2x4x5xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_lhs_matmul(%arg0: tensor<?x?x?xi32>, %arg1: tensor<2x4x5xi32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<?x?x?xi32>, tensor<2x4x5xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_rhs_matmul(%arg0: tensor<2x3x4xi32>, %arg1: tensor<?x?x?xi32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<2x3x4xi32>, tensor<?x?x?xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_mixed_matmul(%arg0: tensor<?x3x?xi32>, %arg1: tensor<?x?x5xi32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<?x3x?xi32>, tensor<?x?x5xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_unranked_zero_points_matmul(%arg0: tensor<1x2x3xf32>, %arg1: tensor<1x3x4xf32>, %arg2: tensor<1xf32>) -> tensor<1x2x4xf32> {
    %0 = tosa.cast %arg2 : (tensor<1xf32>) -> tensor<*xf32>
    %1 = tosa.matmul %arg0, %arg1, %0, %0 : (tensor<1x2x3xf32>, tensor<1x3x4xf32>, tensor<*xf32>, tensor<*xf32>) -> tensor<1x2x4xf32>
    return %1 : tensor<1x2x4xf32>
  }
}

// -----
module {
  func.func @test_accepts_unranked_scalar_tensor(%arg0: tensor<1x2x2xf32>, %arg1: tensor<1xf32>) -> tensor<*xf32> {
    %0 = tosa.cast %arg1 : (tensor<1xf32>) -> tensor<*xf32>
    %1 = tosa.const_shape  {values = dense<[0, 0, 0, 1, 0, 1]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.pad %arg0, %1, %0 : (tensor<1x2x2xf32>, !tosa.shape<6>, tensor<*xf32>) -> tensor<*xf32>
    return %2 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_unranked_scalar_i8_tensor(%arg0: tensor<4xi32>, %arg1: tensor<4xi32>, %arg2: tensor<1xi8>) -> tensor<4xi32> {
    %0 = tosa.cast %arg2 : (tensor<1xi8>) -> tensor<*xi8>
    %1 = tosa.mul %arg0, %arg1, %0 : (tensor<4xi32>, tensor<4xi32>, tensor<*xi8>) -> tensor<4xi32>
    return %1 : tensor<4xi32>
  }
}

// -----
module {
  func.func @test_table_static(%arg0: tensor<4x5xi16>, %arg1: tensor<513xi16>) {
    %0 = tosa.table %arg0, %arg1 : (tensor<4x5xi16>, tensor<513xi16>) -> tensor<?x?xi16>
    return
  }
}

// -----
module {
  func.func @test_table_dynamic(%arg0: tensor<4x?xi16>, %arg1: tensor<513xi16>) {
    %0 = tosa.table %arg0, %arg1 : (tensor<4x?xi16>, tensor<513xi16>) -> tensor<?x?xi16>
    return
  }
}

// -----
module {
  func.func @test_static_reshape(%arg0: tensor<4x4xi32>) {
    %0 = tosa.const_shape  {values = dense<16> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<4x4xi32>, !tosa.shape<1>) -> tensor<16xi32>
    %2 = tosa.const_shape  {values = dense<-1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %3 = tosa.reshape %arg0, %2 : (tensor<4x4xi32>, !tosa.shape<1>) -> tensor<16xi32>
    %4 = tosa.const_shape  {values = dense<[2, -1]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %5 = tosa.reshape %arg0, %4 : (tensor<4x4xi32>, !tosa.shape<2>) -> tensor<2x8xi32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_reshape(%arg0: tensor<4x?xi32>) {
    %0 = tosa.const_shape  {values = dense<16> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<4x?xi32>, !tosa.shape<1>) -> tensor<?xi32>
    %2 = tosa.const_shape  {values = dense<-1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %3 = tosa.reshape %arg0, %2 : (tensor<4x?xi32>, !tosa.shape<1>) -> tensor<?xi32>
    %4 = tosa.const_shape  {values = dense<[2, -1]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %5 = tosa.reshape %arg0, %4 : (tensor<4x?xi32>, !tosa.shape<2>) -> tensor<?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_reduce_binary(%arg0: tensor<2x3x?x?xi1>) {
    %0 = tosa.reduce_all %arg0 {axis = 0 : i32} : (tensor<2x3x?x?xi1>) -> tensor<?x?x?x?xi1>
    %1 = tosa.reduce_all %arg0 {axis = 1 : i32} : (tensor<2x3x?x?xi1>) -> tensor<?x?x?x?xi1>
    %2 = tosa.reduce_all %arg0 {axis = 2 : i32} : (tensor<2x3x?x?xi1>) -> tensor<?x?x?x?xi1>
    %3 = tosa.reduce_all %arg0 {axis = 3 : i32} : (tensor<2x3x?x?xi1>) -> tensor<?x?x?x?xi1>
    %4 = tosa.reduce_any %arg0 {axis = 0 : i32} : (tensor<2x3x?x?xi1>) -> tensor<?x?x?x?xi1>
    return
  }
}

// -----
module {
  func.func @test_reduce_float(%arg0: tensor<2x3x?x?xf32>) {
    %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<2x3x?x?xf32>) -> tensor<?x?x?x?xf32>
    %1 = tosa.reduce_sum %arg0 {axis = 1 : i32} : (tensor<2x3x?x?xf32>) -> tensor<?x?x?x?xf32>
    %2 = tosa.reduce_sum %arg0 {axis = 2 : i32} : (tensor<2x3x?x?xf32>) -> tensor<?x?x?x?xf32>
    %3 = tosa.reduce_sum %arg0 {axis = 3 : i32} : (tensor<2x3x?x?xf32>) -> tensor<?x?x?x?xf32>
    %4 = tosa.reduce_max %arg0 {axis = 3 : i32} : (tensor<2x3x?x?xf32>) -> tensor<?x?x?x?xf32>
    %5 = tosa.reduce_min %arg0 {axis = 3 : i32} : (tensor<2x3x?x?xf32>) -> tensor<?x?x?x?xf32>
    %6 = tosa.reduce_product %arg0 {axis = 3 : i32} : (tensor<2x3x?x?xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_concat(%arg0: tensor<1x2xf32>, %arg1: tensor<2x2xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<1x2xf32>, tensor<2x2xf32>) -> tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_concat_dynamic(%arg0: tensor<1x2xf32>, %arg1: tensor<2x?xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<1x2xf32>, tensor<2x?xf32>) -> tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_concat_dynamic_axis(%arg0: tensor<?x2xf32>, %arg1: tensor<2x2xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<?x2xf32>, tensor<2x2xf32>) -> tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_concat_axis_1(%arg0: tensor<2x1xf32>, %arg1: tensor<2x2xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 1 : i32} : (tensor<2x1xf32>, tensor<2x2xf32>) -> tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_padding_dynamic_input(%arg0: tensor<1x?xf32>) {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<1x?xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_padding_simple(%arg0: tensor<1x2xf32>) {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<1x2xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_slice(%arg0: tensor<?xi32>) {
    %0 = tosa.const_shape  {values = dense<1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.const_shape  {values = dense<2> : tensor<1xindex>} : () -> !tosa.shape<1>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<?xi32>, !tosa.shape<1>, !tosa.shape<1>) -> tensor<?xi32>
    return
  }
}

// -----
module {
  func.func @test_slice_size_minus_one(%arg0: tensor<?x8x8x8xi32>) {
    %0 = tosa.const_shape  {values = dense<[0, 1, -1, 8]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<-1> : tensor<4xindex>} : () -> !tosa.shape<4>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<?x8x8x8xi32>, !tosa.shape<4>, !tosa.shape<4>) -> tensor<?x?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_slice_size_out_of_bound(%arg0: tensor<8x8x8x?xi32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<[0, -2, 9, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<8x8x8x?xi32>, !tosa.shape<4>, !tosa.shape<4>) -> tensor<?x?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_slice_start_out_of_bound(%arg0: tensor<8x8x8x?xi32>) {
    %0 = tosa.const_shape  {values = dense<[-1, 8, 6, 8000000]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<[1, 1, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<8x8x8x?xi32>, !tosa.shape<4>, !tosa.shape<4>) -> tensor<?x?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_slice_dynamic(%arg0: tensor<10x?x2xf32>) {
    %0 = tosa.const_shape  {values = dense<[1, 0, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[7, -1, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<10x?x2xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_tile(%arg0: tensor<2x3x?xi32>) {
    %0 = tosa.const_shape  {values = dense<[2, 1, 5]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.tile %arg0, %0 : (tensor<2x3x?xi32>, !tosa.shape<3>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_tile_unknown_multiples(%arg0: tensor<2x3x?xi32>) {
    %0 = tosa.const_shape  {values = dense<[2, -1, 5]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.tile %arg0, %0 : (tensor<2x3x?xi32>, !tosa.shape<3>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_transpose_static(%arg0: tensor<3x4x5xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 2, 1, 0>} : (tensor<3x4x5xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @gather_static(%arg0: tensor<3x4x5xi32>, %arg1: tensor<3x6xi32>) {
    %0 = tosa.gather %arg0, %arg1 : (tensor<3x4x5xi32>, tensor<3x6xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @gather_dynamic_values(%arg0: tensor<?x?x?xi32>, %arg1: tensor<3x6xi32>) {
    %0 = tosa.gather %arg0, %arg1 : (tensor<?x?x?xi32>, tensor<3x6xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @gather_dynamic_indices(%arg0: tensor<3x4x5xi32>, %arg1: tensor<?x?xi32>) {
    %0 = tosa.gather %arg0, %arg1 : (tensor<3x4x5xi32>, tensor<?x?xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @gather_minimum_info(%arg0: tensor<3x?x5xi32>, %arg1: tensor<?x6xi32>) {
    %0 = tosa.gather %arg0, %arg1 : (tensor<3x?x5xi32>, tensor<?x6xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @scatter_static(%arg0: tensor<3x8x5xi32>, %arg1: tensor<3x6xi32>, %arg2: tensor<3x6x5xi32>) {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<3x8x5xi32>, tensor<3x6xi32>, tensor<3x6x5xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @scatter_static_values(%arg0: tensor<3x4x5xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?x?xi32>) {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<3x4x5xi32>, tensor<?x?xi32>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @scatter_static_indices(%arg0: tensor<?x?x?xi32>, %arg1: tensor<3x6xi32>, %arg2: tensor<?x?x?xi32>) {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<?x?x?xi32>, tensor<3x6xi32>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @scatter_static_input(%arg0: tensor<?x?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<3x6x5xi32>) {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<?x?x?xi32>, tensor<?x?xi32>, tensor<3x6x5xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @scatter_minimum_static(%arg0: tensor<?x4x?xi32>, %arg1: tensor<3x?xi32>, %arg2: tensor<?x?x5xi32>) {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<?x4x?xi32>, tensor<3x?xi32>, tensor<?x?x5xi32>) -> tensor<?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @test_pool_static(%arg0: tensor<3x5x6x7xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = f32, kernel = array<i64: 4, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<3x5x6x7xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    %3 = tosa.max_pool2d %arg0 {kernel = array<i64: 4, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<3x5x6x7xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_static(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_dynamic_input(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_pool_dynamic_input(%arg0: tensor<?x?x?x?xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = f32, kernel = array<i64: 4, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    %3 = tosa.max_pool2d %arg0 {kernel = array<i64: 4, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_pool_padded(%arg0: tensor<3x5x6x7xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = f32, kernel = array<i64: 4, 3>, pad = array<i64: 3, 2, 1, 0>, stride = array<i64: 1, 1>} : (tensor<3x5x6x7xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    %3 = tosa.max_pool2d %arg0 {kernel = array<i64: 4, 3>, pad = array<i64: 3, 2, 1, 0>, stride = array<i64: 1, 1>} : (tensor<3x5x6x7xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_dynamic_weight(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<?x?x?x?xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_dynamic_bias(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<?xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<5x3x6x3xf32>, tensor<?xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_pool_stride(%arg0: tensor<3x14x12x7xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = f32, kernel = array<i64: 4, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 3>} : (tensor<3x14x12x7xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    %3 = tosa.max_pool2d %arg0 {kernel = array<i64: 4, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 3>} : (tensor<3x14x12x7xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_padded(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 1, 2, 3, 4>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_dilated(%arg0: tensor<2x12x14x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 3, 2>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x12x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_strided(%arg0: tensor<1x13x15x1xf32>, %arg1: tensor<1x1x1x1xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 3, 2>} : (tensor<1x13x15x1xf32>, tensor<1x1x1x1xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_static(%arg0: tensor<2x8x9x10x3xf32>, %arg1: tensor<5x3x6x4x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<2x8x9x10x3xf32>, tensor<5x3x6x4x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_dynamic_input(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<5x3x6x4x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<?x?x?x?x?xf32>, tensor<5x3x6x4x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_dynamic_weight(%arg0: tensor<2x8x9x10x3xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<7xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<2x8x9x10x3xf32>, tensor<?x?x?x?x?xf32>, tensor<7xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_dynamic_bias(%arg0: tensor<2x8x9x10x3xf32>, %arg1: tensor<5x3x6x4x3xf32>, %arg2: tensor<?xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<2x8x9x10x3xf32>, tensor<5x3x6x4x3xf32>, tensor<?xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_padded(%arg0: tensor<2x8x9x10x3xf32>, %arg1: tensor<5x3x6x4x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 1, 2, 3, 4, 5, 6>, stride = array<i64: 1, 1, 1>} : (tensor<2x8x9x10x3xf32>, tensor<5x3x6x4x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_dilated(%arg0: tensor<2x12x14x16x3xf32>, %arg1: tensor<5x3x6x2x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 3, 2, 4>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<2x12x14x16x3xf32>, tensor<5x3x6x2x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_strided(%arg0: tensor<1x13x17x17x1xf32>, %arg1: tensor<1x1x1x1x1xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 3, 2, 4>} : (tensor<1x13x17x17x1xf32>, tensor<1x1x1x1x1xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_static(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<3x6x3x5xf32>, %arg2: tensor<15xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<3x6x3x5xf32>, tensor<15xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x6x4x15xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_dynamic_input(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<3x6x3x5xf32>, %arg2: tensor<15xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>, tensor<3x6x3x5xf32>, tensor<15xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x15xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_dynamic_weight(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<15xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<?x?x?x?xf32>, tensor<15xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x?x?x15xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_dynamic_bias(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<3x6x3x5xf32>, %arg2: tensor<?xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<3x6x3x5xf32>, tensor<?xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x6x4x15xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_padded(%arg0: tensor<2x8x9x3xf32>, %arg1: tensor<3x6x3x5xf32>, %arg2: tensor<15xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 1, 2, 3, 4>, stride = array<i64: 1, 1>} : (tensor<2x8x9x3xf32>, tensor<3x6x3x5xf32>, tensor<15xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x9x11x15xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_dilated(%arg0: tensor<2x12x14x3xf32>, %arg1: tensor<3x6x3x5xf32>, %arg2: tensor<15xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 3, 2>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x12x14x3xf32>, tensor<3x6x3x5xf32>, tensor<15xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x6x4x15xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_strided(%arg0: tensor<1x13x15x1xf32>, %arg1: tensor<1x1x1x1xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 3, 2>} : (tensor<1x13x15x1xf32>, tensor<1x1x1x1xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x8x1xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_out_shape(%arg0: tensor<2x?x?x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x?x?x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x8x9x5xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_static(%arg0: tensor<2x16x14x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x?x?x5xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_static_strided(%arg0: tensor<2x16x14x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 3>} : (tensor<2x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x?x?x5xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_dynamic_input(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x?x?x5xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_dynamic_weights(%arg0: tensor<2x6x4x3xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x6x4x3xf32>, tensor<?x?x?x?xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x?x?x5xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_dynamic_bias(%arg0: tensor<2x6x4x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<?xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x6x4x3xf32>, tensor<5x3x6x3xf32>, tensor<?xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x8x9x5xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_padded(%arg0: tensor<2x9x11x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 1, 0, 3, 0>, stride = array<i64: 1, 1>} : (tensor<2x9x11x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x12x19x5xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_strided(%arg0: tensor<1x5x7x1xf32>, %arg1: tensor<1x1x1x1xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 3, 2>} : (tensor<1x5x7x1xf32>, tensor<1x1x1x1xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x13x13x1xf32>
    return
  }
}

// -----
module {
  func.func @transpose_conv2d_dynamic_out_channels(%arg0: tensor<2x1x1x3xf32>, %arg1: tensor<5x3x6x3xf32>, %arg2: tensor<5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x1x1x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x3x6x?xf32>
    return
  }
}

// -----
module {
  func.func @resize_int_horizontal(%arg0: tensor<1x15x13x1xi8>) {
    %0 = tosa.const_shape  {values = dense<[11, 7, 89, 6]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = NEAREST_NEIGHBOR} : (tensor<1x15x13x1xi8>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xi8>
    return
  }
}

// -----
module {
  func.func @resize_int_vertical(%arg0: tensor<1x49x42x1xi16>) {
    %0 = tosa.const_shape  {values = dense<[37, 16, 219, 41]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = NEAREST_NEIGHBOR} : (tensor<1x49x42x1xi16>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xi16>
    return
  }
}

// -----
module {
  func.func @resize_int_power_of_two_upscale(%arg0: tensor<1x23x19x1xi8>) {
    %0 = tosa.const_shape  {values = dense<[16, 1, 16, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x23x19x1xi8>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xi32>
    return
  }
}

// -----
module {
  func.func @resize_int_power_of_two_upscale_offsetted(%arg0: tensor<1x41x26x1xi16>) {
    %0 = tosa.const_shape  {values = dense<[16, 2, 16, 2]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<-7> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<7> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x41x26x1xi16>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xi48>
    return
  }
}

// -----
module {
  func.func @resize_fp_horizontal(%arg0: tensor<1x50x48x1xf32>) {
    %0 = tosa.const_shape  {values = dense<[15, 7, 84, 47]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x50x48x1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @resize_fp_vertical(%arg0: tensor<1x50x48x1xf32>) {
    %0 = tosa.const_shape  {values = dense<[127, 49, 12, 47]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = NEAREST_NEIGHBOR} : (tensor<1x50x48x1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @resize_fp_power_of_two_upscale(%arg0: tensor<1x23x23x1xf32>) {
    %0 = tosa.const_shape  {values = dense<[4, 1, 4, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x23x23x1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @resize_fp_power_of_two_upscale_offsetted(%arg0: tensor<1x50x48x1xf32>) {
    %0 = tosa.const_shape  {values = dense<[64, 2, 64, 2]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<-31> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<31> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = NEAREST_NEIGHBOR} : (tensor<1x50x48x1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @resize_negative_output_dim(%arg0: tensor<1x3x1x1xi8>) {
    %0 = tosa.const_shape  {values = dense<[1, 3, 1, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<[6, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<[-15, 0]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = NEAREST_NEIGHBOR} : (tensor<1x3x1x1xi8>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<*xi8>
    return
  }
}

// -----
module {
  func.func @if_test_simple(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) {
    %0 = tosa.log %arg0 : (tensor<f32>) -> tensor<f32>
    %1 = tosa.log %arg1 : (tensor<f32>) -> tensor<f32>
    %2 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
      tosa.yield %0 : tensor<f32>
    } else {
      tosa.yield %1 : tensor<f32>
    }
    return
  }
}

// -----
module {
  func.func @if_test_dynamic(%arg0: tensor<2xf32>, %arg1: tensor<3xf32>, %arg2: tensor<i1>) {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<?xf32> {
      tosa.yield %arg0 : tensor<2xf32>
    } else {
      tosa.yield %arg1 : tensor<3xf32>
    }
    return
  }
}

// -----
module {
  func.func @if_test_unranked(%arg0: tensor<f32>, %arg1: tensor<3xf32>, %arg2: tensor<i1>) {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<*xf32> {
      tosa.yield %arg0 : tensor<f32>
    } else {
      tosa.yield %arg1 : tensor<3xf32>
    }
    return
  }
}

// -----
module {
  func.func @if_test_propagate(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
      %1 = tosa.add %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    } else {
      %1 = tosa.sub %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    }
    return
  }
}

// -----
module {
  func.func @while_test(%arg0: tensor<i32>) -> tensor<*xi32> {
    %0 = tosa.add %arg0, %arg0 : (tensor<i32>, tensor<i32>) -> tensor<*xi32>
    %1 = tosa.while_loop (%arg1 = %0) : (tensor<*xi32>) -> tensor<*xi32> {
      %2 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.greater_equal %2, %arg1 : (tensor<i32>, tensor<*xi32>) -> tensor<*xi1>
      tosa.yield %3 : tensor<*xi1>
    } do {
    ^bb0(%arg1: tensor<*xi32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.add %arg1, %2 : (tensor<*xi32>, tensor<i32>) -> tensor<*xi32>
      tosa.yield %3 : tensor<*xi32>
    }
    return %1 : tensor<*xi32>
  }
}

// -----
module {
  func.func @while_test(%arg0: tensor<i32>, %arg1: tensor<1xi32>) {
    %0:2 = tosa.while_loop (%arg2 = %arg0, %arg3 = %arg1) : (tensor<i32>, tensor<1xi32>) -> (tensor<i32>, tensor<?xi32>) {
      %1 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32>
      %2 = tosa.greater_equal %1, %arg2 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      tosa.yield %2 : tensor<i1>
    } do {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<?xi32>):
      %1 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %2 = tosa.add %arg2, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      %3 = tosa.concat %arg3, %arg3 {axis = 0 : i32} : (tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32>
      tosa.yield %2, %3 : tensor<i32>, tensor<?xi32>
    }
    return
  }
}

// -----
module {
  func.func @while_dont_crash(%arg0: tensor<i32>) -> tensor<*xi32> {
    %0 = tosa.add %arg0, %arg0 : (tensor<i32>, tensor<i32>) -> tensor<*xi32>
    %1 = tosa.while_loop (%arg1 = %0) : (tensor<*xi32>) -> tensor<*xi32> {
      %2 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.greater_equal %2, %arg1 : (tensor<i32>, tensor<*xi32>) -> tensor<*xi1>
      tosa.yield %3 : tensor<*xi1>
    } do {
    ^bb0(%arg1: tensor<*xi32>):
      %2 = tosa.add %arg1, %arg1 : (tensor<*xi32>, tensor<*xi32>) -> tensor<*xi32>
      "use"(%2) : (tensor<*xi32>) -> ()
      tosa.yield %2 : tensor<*xi32>
    }
    return %1 : tensor<*xi32>
  }
}

// -----
module {
  func.func @while_dont_crash_nested(%arg0: tensor<i32>) -> tensor<*xi32> {
    %0 = tosa.add %arg0, %arg0 : (tensor<i32>, tensor<i32>) -> tensor<*xi32>
    %1 = tosa.while_loop (%arg1 = %0) : (tensor<*xi32>) -> tensor<*xi32> {
      %2 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.greater_equal %2, %arg1 : (tensor<i32>, tensor<*xi32>) -> tensor<*xi1>
      tosa.yield %3 : tensor<*xi1>
    } do {
    ^bb0(%arg1: tensor<*xi32>):
      %2 = tosa.while_loop (%arg2 = %arg1) : (tensor<*xi32>) -> tensor<*xi32> {
        %3 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32>
        %4 = tosa.greater_equal %3, %arg2 : (tensor<i32>, tensor<*xi32>) -> tensor<*xi1>
        tosa.yield %4 : tensor<*xi1>
      } do {
      ^bb0(%arg2: tensor<*xi32>):
        %3 = tosa.add %arg2, %arg2 : (tensor<*xi32>, tensor<*xi32>) -> tensor<*xi32>
        "use"(%3) : (tensor<*xi32>) -> ()
        tosa.yield %3 : tensor<*xi32>
      }
      tosa.yield %2 : tensor<*xi32>
    }
    return %1 : tensor<*xi32>
  }
}

// -----
module {
  func.func @test_static_rfft2d(%arg0: tensor<5x2x8xf32>) {
    %output_real, %output_imag = tosa.rfft2d %arg0 : (tensor<5x2x8xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return
  }
}

// -----
module {
  func.func @test_dynamic_batch_rfft2d(%arg0: tensor<?x2x4xf32>) {
    %output_real, %output_imag = tosa.rfft2d %arg0 : (tensor<?x2x4xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return
  }
}

// -----
module {
  func.func @test_dynamic_width_rfft2d(%arg0: tensor<5x2x?xf32>) {
    %output_real, %output_imag = tosa.rfft2d %arg0 : (tensor<5x2x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return
  }
}

// -----
module {
  func.func @test_static_fft2d(%arg0: tensor<1x4x8xf32>, %arg1: tensor<1x4x8xf32>) -> (tensor<1x4x8xf32>, tensor<1x4x8xf32>) {
    %output_real, %output_imag = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<1x4x8xf32>, tensor<1x4x8xf32>) -> (tensor<1x4x8xf32>, tensor<1x4x8xf32>)
    return %output_real, %output_imag : tensor<1x4x8xf32>, tensor<1x4x8xf32>
  }
}

// -----
module {
  func.func @test_dynamic_batch_fft2d(%arg0: tensor<?x4x8xf32>, %arg1: tensor<?x4x8xf32>) -> (tensor<?x4x8xf32>, tensor<?x4x8xf32>) {
    %output_real, %output_imag = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<?x4x8xf32>, tensor<?x4x8xf32>) -> (tensor<?x4x8xf32>, tensor<?x4x8xf32>)
    return %output_real, %output_imag : tensor<?x4x8xf32>, tensor<?x4x8xf32>
  }
}

// -----
module {
  func.func @test_unranked_equal(%arg0: tensor<*xf32>, %arg1: tensor<f32>) {
    %0 = tosa.equal %arg0, %arg1 : (tensor<*xf32>, tensor<f32>) -> tensor<*xi1>
    return
  }
}

// -----
module {
  func.func @test_non_tosa_consumer_shape(%arg0: tensor<4x4xf32>) -> !shape.shape {
    %0 = tosa.log %arg0 : (tensor<4x4xf32>) -> tensor<*xf32>
    %1 = shape.shape_of %0 : tensor<*xf32> -> !shape.shape
    return %1 : !shape.shape
  }
}

// -----
module {
  func.func @test_non_tosa_consumer_shape2(%arg0: tensor<4x4xf32>) -> tensor<?xindex> {
    %0 = tosa.log %arg0 : (tensor<4x4xf32>) -> tensor<*xf32>
    %1 = shape.shape_of %0 : tensor<*xf32> -> tensor<?xindex>
    return %1 : tensor<?xindex>
  }
}

// -----
module {
  func.func @test_non_tosa_consumer_extract(%arg0: tensor<4x4xf32>, %arg1: index) -> f32 {
    %0 = tosa.log %arg0 : (tensor<4x4xf32>) -> tensor<?x?xf32>
    %extracted = tensor.extract %0[%arg1, %arg1] : tensor<?x?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @test_non_tosa_consumer_still_propagates(%arg0: tensor<1x1x8xf32>, %arg1: tensor<1x8x1xf32>) -> tensor<?x?xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x1x8xf32>, tensor<1x8x1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x1x1xf32>
    %cst = arith.constant dense<1> : tensor<2xindex>
    %reshape = tensor.reshape %2(%cst) : (tensor<?x1x1xf32>, tensor<2xindex>) -> tensor<?x?xf32>
    return %reshape : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @test_tosa_use_def_chain(%arg0: tensor<1x32x32x3xf32>, %arg1: tensor<16x3x3x3xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<?x16x16x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x32x32x3xf32>, tensor<16x3x3x3xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x32x32x16xf32>
    %1 = tosa.max_pool2d %0 {kernel = array<i64: 2, 2>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 2>} : (tensor<?x32x32x16xf32>) -> tensor<?x16x16x16xf32>
    return %1 : tensor<?x16x16x16xf32>
  }
}

// -----
module {
  func.func @test_multiple_non_inferrable_consumers(%arg0: tensor<1x2x8xf32>) {
    %0 = tosa.cast %arg0 : (tensor<1x2x8xf32>) -> tensor<?x2x8xf32>
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %0, %c0 : tensor<?x2x8xf32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2], [3]] output_shape [%dim, 1, 4, 8] : tensor<?x2x8xf32> into tensor<?x1x2x8xf32>
    %expanded_0 = tensor.expand_shape %0 [[0], [1, 2], [3]] output_shape [%dim, 1, 4, 8] : tensor<?x2x8xf32> into tensor<?x1x2x8xf32>
    return
  }
}

// -----
module {
  func.func @test_mul_scalar(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<*xf32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = tosa.mul %arg0, %arg1, %0 : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<*xf32>
    return %1 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_static(%arg0: tensor<4x8x32xf8E4M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<1x16x32xf8E4M3FN>, %arg3: tensor<1x16x1xf8E8M0FNU>) -> tensor<?x?x?xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<4x8x32xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<1x16x32xf8E4M3FN>, tensor<1x16x1xf8E8M0FNU>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_unranked_a_data(%arg0: tensor<*xf8E4M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf8E4M3FN>, %arg3: tensor<4x16x1xf8E8M0FNU>) -> tensor<?x?x?xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<*xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf8E4M3FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_unranked_b_data_and_scale(%arg0: tensor<4x8x32xf8E4M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<*xf8E4M3FN>, %arg3: tensor<*xf8E8M0FNU>) -> tensor<?x?x?xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<4x8x32xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_unranked_all(%arg0: tensor<*xf8E4M3FN>, %arg1: tensor<*xf8E8M0FNU>, %arg2: tensor<*xf8E4M3FN>, %arg3: tensor<*xf8E8M0FNU>) -> tensor<?x?x?xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>, tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_broadcast_b_data(%arg0: tensor<*xf8E4M3FN>, %arg1: tensor<*xf8E8M0FNU>, %arg2: tensor<1x4x32xf8E4M3FN>, %arg3: tensor<1x4x1xf8E8M0FNU>) -> tensor<?x?x?xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>, tensor<1x4x32xf8E4M3FN>, tensor<1x4x1xf8E8M0FNU>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_broadcast_b_scale(%arg0: tensor<*xf8E4M3FN>, %arg1: tensor<*xf8E8M0FNU>, %arg2: tensor<*xf8E4M3FN>, %arg3: tensor<1x4x1xf8E8M0FNU>) -> tensor<?x?x?xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>, tensor<*xf8E4M3FN>, tensor<1x4x1xf8E8M0FNU>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_static(%arg0: tensor<4x32xf4E2M1FN>, %arg1: tensor<4x1xf8E8M0FNU>) -> tensor<*xf32> {
    %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_unranked_input_scale(%arg0: tensor<4x32xf4E2M1FN>, %arg1: tensor<*xf8E8M0FNU>) -> tensor<*xf32> {
    %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf4E2M1FN>, tensor<*xf8E8M0FNU>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_static(%arg0: tensor<4x32xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_unranked(%arg0: tensor<*xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32} : (tensor<*xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_dynamic_scales(%arg0: tensor<4x?xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32} : (tensor<4x?xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>
  }
}

