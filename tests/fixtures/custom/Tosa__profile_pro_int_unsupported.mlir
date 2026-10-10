module {
}

// -----
module {
  func.func @test_const_i1() -> tensor<3x11x11x3xi1> {
    %0 = "tosa.const"() <{values = dense<false> : tensor<3x11x11x3xi1>}> : () -> tensor<3x11x11x3xi1>
    return %0 : tensor<3x11x11x3xi1>
  }
}

// -----
module {
  func.func @test_const_i32() -> tensor<3x11x11x3xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<3x11x11x3xi32>}> : () -> tensor<3x11x11x3xi32>
    return %0 : tensor<3x11x11x3xi32>
  }
}

// -----
module {
  func.func @test_argmax(%arg0: tensor<14x19xi8>) -> tensor<14xi32> {
    %0 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<14x19xi8>) -> tensor<14xi32>
    return %0 : tensor<14xi32>
  }
}

// -----
module {
  func.func @test_avg_pool2d(%arg0: tensor<1x7x7x9xi8>, %arg1: tensor<1xi8>, %arg2: tensor<1xi8>) -> tensor<1x7x7x9xi8> {
    %0 = tosa.avg_pool2d %arg0, %arg1, %arg2 {acc_type = i32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x7x7x9xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x7x7x9xi8>
    return %0 : tensor<1x7x7x9xi8>
  }
}

// -----
module {
  func.func @test_conv2d(%arg0: tensor<1x4x4x4xi8>, %arg1: tensor<8x1x1x4xi8>, %arg2: tensor<8xi32>, %arg3: tensor<1xi8>) -> tensor<1x4x4x8xi32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = i32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xi8>, tensor<8x1x1x4xi8>, tensor<8xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x4x4x8xi32>
    return %0 : tensor<1x4x4x8xi32>
  }
}

// -----
module {
  func.func @test_conv3d(%arg0: tensor<1x4x8x21x17xi8>, %arg1: tensor<34x1x1x1x17xi8>, %arg2: tensor<34xi32>, %arg3: tensor<1xi8>, %arg4: tensor<1xi8>) -> tensor<1x4x8x21x34xi32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = i32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x4x8x21x17xi8>, tensor<34x1x1x1x17xi8>, tensor<34xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x4x8x21x34xi32>
    return %0 : tensor<1x4x8x21x34xi32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d(%arg0: tensor<1x4x4x4xi8>, %arg1: tensor<1x1x4x2xi8>, %arg2: tensor<8xi32>, %arg3: tensor<1xi8>, %arg4: tensor<1xi8>) -> tensor<1x4x4x8xi32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xi8>, tensor<1x1x4x2xi8>, tensor<8xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x4x4x8xi32>
    return %0 : tensor<1x4x4x8xi32>
  }
}

// -----
module {
  func.func @test_matmul(%arg0: tensor<1x14x19xi8>, %arg1: tensor<1x19x28xi8>) -> tensor<1x14x28xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x14x19xi8>, tensor<1x19x28xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x14x28xi32>
    return %2 : tensor<1x14x28xi32>
  }
}

// -----
module {
  func.func @test_max_pool2d(%arg0: tensor<1x32x32x8xi8>) -> tensor<1x32x32x8xi8> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xi8>) -> tensor<1x32x32x8xi8>
    return %0 : tensor<1x32x32x8xi8>
  }
}

// -----
module {
  func.func @test_transpose_conv2d(%arg0: tensor<1x32x32x8xi8>, %arg1: tensor<16x1x1x8xi8>, %arg2: tensor<16xi32>, %arg3: tensor<1xi8>, %arg4: tensor<1xi8>) -> tensor<1x32x32x16xi32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = i32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xi8>, tensor<16x1x1x8xi8>, tensor<16xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x32x32x16xi32>
    return %0 : tensor<1x32x32x16xi32>
  }
}

// -----
module {
  func.func @test_clamp(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi8> {
    %0 = tosa.clamp %arg0 {max_val = 1 : i8, min_val = 0 : i8} : (tensor<13x21x3xi8>) -> tensor<13x21x3xi8>
    return %0 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_arithmetic_right_shift(%arg0: tensor<13x21x1xi32>, %arg1: tensor<13x21x3xi32>) -> tensor<13x21x3xi32> {
    %0 = tosa.arithmetic_right_shift %arg0, %arg1 {round = false} : (tensor<13x21x1xi32>, tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
    return %0 : tensor<13x21x3xi32>
  }
}

// -----
module {
  func.func @test_bitwise_and(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x21x1xi32>) -> tensor<13x21x3xi32> {
    %0 = tosa.bitwise_and %arg0, %arg1 : (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>
    return %0 : tensor<13x21x3xi32>
  }
}

// -----
module {
  func.func @test_max(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x21x1xi32>) -> tensor<13x21x3xi32> {
    %0 = tosa.maximum %arg0, %arg1 : (tensor<13x21x3xi32>, tensor<13x21x1xi32>) -> tensor<13x21x3xi32>
    return %0 : tensor<13x21x3xi32>
  }
}

// -----
module {
  func.func @test_mul(%arg0: tensor<13x21x3xi16>, %arg1: tensor<13x1x3xi16>, %arg2: tensor<1xi8>) -> tensor<13x21x3xi32> {
    %0 = tosa.mul %arg0, %arg1, %arg2 : (tensor<13x21x3xi16>, tensor<13x1x3xi16>, tensor<1xi8>) -> tensor<13x21x3xi32>
    return %0 : tensor<13x21x3xi32>
  }
}

// -----
module {
  func.func @test_table(%arg0: tensor<4x5xi8>, %arg1: tensor<513xi8>) {
    %0 = tosa.table %arg0, %arg1 : (tensor<4x5xi8>, tensor<513xi8>) -> tensor<?x?xi8>
    return
  }
}

// -----
module {
  func.func @test_abs(%arg0: tensor<13x21x3xi32>) -> tensor<13x21x3xi32> {
    %0 = tosa.abs %arg0 : (tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
    return %0 : tensor<13x21x3xi32>
  }
}

// -----
module {
  func.func @test_bitwise_not(%arg0: tensor<13x21x1xi32>) -> tensor<13x21x1xi32> {
    %0 = tosa.bitwise_not %arg0 : (tensor<13x21x1xi32>) -> tensor<13x21x1xi32>
    return %0 : tensor<13x21x1xi32>
  }
}

// -----
module {
  func.func @test_clz(%arg0: tensor<13x21x3xi32>) -> tensor<13x21x3xi32> {
    %0 = tosa.clz %arg0 : (tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
    return %0 : tensor<13x21x3xi32>
  }
}

// -----
module {
  func.func @test_negate(%arg0: tensor<13x21x3xi16>, %arg1: tensor<1xi16>, %arg2: tensor<1xi16>) -> tensor<13x21x3xi16> {
    %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<13x21x3xi16>, tensor<1xi16>, tensor<1xi16>) -> tensor<13x21x3xi16>
    return %0 : tensor<13x21x3xi16>
  }
}

// -----
module {
  func.func @test_select(%arg0: tensor<1x1x1xi1>, %arg1: tensor<13x21x3xi8>, %arg2: tensor<13x21x3xi8>) -> tensor<13x21x3xi8> {
    %0 = tosa.select %arg0, %arg1, %arg2 : (tensor<1x1x1xi1>, tensor<13x21x3xi8>, tensor<13x21x3xi8>) -> tensor<13x21x3xi8>
    return %0 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_equal(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x1x3xi32>) -> tensor<13x21x3xi1> {
    %0 = tosa.equal %arg0, %arg1 : (tensor<13x21x3xi32>, tensor<13x1x3xi32>) -> tensor<13x21x3xi1>
    return %0 : tensor<13x21x3xi1>
  }
}

// -----
module {
  func.func @test_greater(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x1x3xi32>) -> tensor<13x21x3xi1> {
    %0 = tosa.greater %arg0, %arg1 : (tensor<13x21x3xi32>, tensor<13x1x3xi32>) -> tensor<13x21x3xi1>
    return %0 : tensor<13x21x3xi1>
  }
}

// -----
module {
  func.func @test_reduce_max(%arg0: tensor<13x21x3xi8>) -> tensor<1x21x3xi8> {
    %0 = tosa.reduce_max %arg0 {axis = 0 : i32} : (tensor<13x21x3xi8>) -> tensor<1x21x3xi8>
    return %0 : tensor<1x21x3xi8>
  }
}

// -----
module {
  func.func @test_reduce_sum(%arg0: tensor<13x21x3xi32>) -> tensor<1x21x3xi32> {
    %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<13x21x3xi32>) -> tensor<1x21x3xi32>
    return %0 : tensor<1x21x3xi32>
  }
}

// -----
module {
  func.func @test_concat(%arg0: tensor<13x21x3xi16>, %arg1: tensor<13x21x3xi16>) -> tensor<26x21x3xi16> {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<13x21x3xi16>, tensor<13x21x3xi16>) -> tensor<26x21x3xi16>
    return %0 : tensor<26x21x3xi16>
  }
}

// -----
module {
  func.func @test_pad(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi8> {
    %0 = tosa.const_shape  {values = dense<0> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<13x21x3xi8>, !tosa.shape<6>, tensor<1xi8>) -> tensor<13x21x3xi8>
    return %2 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_reshape(%arg0: tensor<13x21x3xi8>) -> tensor<1x819xi8> {
    %0 = tosa.const_shape  {values = dense<[1, 819]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<13x21x3xi8>, !tosa.shape<2>) -> tensor<1x819xi8>
    return %1 : tensor<1x819xi8>
  }
}

// -----
module {
  func.func @test_reverse(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi8> {
    %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<13x21x3xi8>) -> tensor<13x21x3xi8>
    return %0 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_slice(%arg0: tensor<13x21x3xi8>) -> tensor<4x11x1xi8> {
    %0 = tosa.const_shape  {values = dense<[4, 11, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[6, 8, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<13x21x3xi8>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xi8>
    return %2 : tensor<4x11x1xi8>
  }
}

// -----
module {
  func.func @test_tile(%arg0: tensor<13x21x3xi8>) -> tensor<39x21x6xi8> {
    %0 = tosa.const_shape  {values = dense<[3, 1, 2]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.tile %arg0, %0 : (tensor<13x21x3xi8>, !tosa.shape<3>) -> tensor<39x21x6xi8>
    return %1 : tensor<39x21x6xi8>
  }
}

// -----
module {
  func.func @test_transpose(%arg0: tensor<13x21x3xi8>, %arg1: tensor<3xi32>) -> tensor<3x13x21xi8> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1>} : (tensor<13x21x3xi8>) -> tensor<3x13x21xi8>
    return %0 : tensor<3x13x21xi8>
  }
}

// -----
module {
  func.func @test_gather(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi32> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi32>, tensor<13x26xi32>) -> tensor<13x26x3xi32>
    return %0 : tensor<13x26x3xi32>
  }
}

// -----
module {
  func.func @test_scatter(%arg0: tensor<13x27x3xi32>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi32>) -> tensor<13x27x3xi32> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi32>, tensor<13x26xi32>, tensor<13x26x3xi32>) -> tensor<13x27x3xi32>
    return %0 : tensor<13x27x3xi32>
  }
}

// -----
module {
  func.func @test_resize(%arg0: tensor<1x32x32x8xi8>) -> tensor<1x64x64x8xi32> {
    %0 = tosa.const_shape  {values = dense<[4, 2, 4, 2]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<-1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x32x32x8xi8>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x64x64x8xi32>
    return %3 : tensor<1x64x64x8xi32>
  }
}

// -----
module {
  func.func @test_cast_i1_i8(%arg0: tensor<13x21x3xi1>) -> tensor<13x21x3xi8> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi1>) -> tensor<13x21x3xi8>
    return %0 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_cast_i8_i32(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi32> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi8>) -> tensor<13x21x3xi32>
    return %0 : tensor<13x21x3xi32>
  }
}

// -----
module {
  func.func @test_cast_i16_i8(%arg0: tensor<13x21x3xi16>) -> tensor<13x21x3xi8> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi16>) -> tensor<13x21x3xi8>
    return %0 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_cast_i32_i16(%arg0: tensor<13x21x3xi32>) -> tensor<13x21x3xi16> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi32>) -> tensor<13x21x3xi16>
    return %0 : tensor<13x21x3xi16>
  }
}

// -----
module {
  func.func @test_rescale(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi32> {
    %0 = "tosa.const"() <{values = dense<1073741824> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<127> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = false, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<13x21x3xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi32>) -> tensor<13x21x3xi32>
    return %4 : tensor<13x21x3xi32>
  }
}

