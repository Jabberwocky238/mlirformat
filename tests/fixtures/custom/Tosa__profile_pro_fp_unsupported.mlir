module {
}

// -----
module {
  func.func @test_const_f16() -> tensor<3x11x11x3xf16> {
    %0 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<3x11x11x3xf16>}> : () -> tensor<3x11x11x3xf16>
    return %0 : tensor<3x11x11x3xf16>
  }
}

// -----
module {
  func.func @test_const_f32() -> tensor<3x11x11x3xf32> {
    %0 = "tosa.const"() <{values = dense<3.000000e+00> : tensor<3x11x11x3xf32>}> : () -> tensor<3x11x11x3xf32>
    return %0 : tensor<3x11x11x3xf32>
  }
}

// -----
module {
  func.func @test_avg_pool2d(%arg0: tensor<1x7x7x9xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<1x7x7x9xf32> {
    %0 = tosa.avg_pool2d %arg0, %arg1, %arg2 {acc_type = f32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x7x7x9xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x7x7x9xf32>
    return %0 : tensor<1x7x7x9xf32>
  }
}

// -----
module {
  func.func @test_conv2d(%arg0: tensor<1x4x4x4xf32>, %arg1: tensor<8x1x1x4xf32>, %arg2: tensor<8xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x4x4x8xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x4x4x8xf32>
    return %0 : tensor<1x4x4x8xf32>
  }
}

// -----
module {
  func.func @test_conv3d(%arg0: tensor<1x4x8x21x17xf16>, %arg1: tensor<34x1x1x1x17xf16>, %arg2: tensor<34xf16>, %arg3: tensor<1xf16>, %arg4: tensor<1xf16>) -> tensor<1x4x8x21x34xf16> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x4x8x21x17xf16>, tensor<34x1x1x1x17xf16>, tensor<34xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x4x8x21x34xf16>
    return %0 : tensor<1x4x8x21x34xf16>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d(%arg0: tensor<1x4x4x4xf16>, %arg1: tensor<1x1x4x2xf16>, %arg2: tensor<8xf16>, %arg3: tensor<1xf16>, %arg4: tensor<1xf16>) -> tensor<1x4x4x8xf16> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f16, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xf16>, tensor<1x1x4x2xf16>, tensor<8xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x4x4x8xf16>
    return %0 : tensor<1x4x4x8xf16>
  }
}

// -----
module {
  func.func @test_matmul(%arg0: tensor<1x14x19xf32>, %arg1: tensor<1x19x28xf32>) -> tensor<1x14x28xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x14x19xf32>, tensor<1x19x28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x14x28xf32>
    return %2 : tensor<1x14x28xf32>
  }
}

// -----
module {
  func.func @test_sigmoid(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.sigmoid %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x32x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, out_shape = array<i64: 1, 32, 32, 16>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x32x16xf32>
    return %0 : tensor<1x32x32x16xf32>
  }
}

// -----
module {
  func.func @test_max_pool2d(%arg0: tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>
    return %0 : tensor<1x32x32x8xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d(%arg0: tensor<1x32x32x8xf16>, %arg1: tensor<16x1x1x8xf16>, %arg2: tensor<16xf16>, %arg3: tensor<1xf16>, %arg4: tensor<1xf16>) -> tensor<1x32x32x16xf16> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f16, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf16>, tensor<16x1x1x8xf16>, tensor<16xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x32x32x16xf16>
    return %0 : tensor<1x32x32x16xf16>
  }
}

// -----
module {
  func.func @test_clamp(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.clamp %arg0 {max_val = 1.000000e+00 : f32, min_val = 0.000000e+00 : f32} : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_add(%arg0: tensor<13x21x1xf32>, %arg1: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<13x21x1xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_concat(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x3xf32>) -> tensor<26x21x3xf32> {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<26x21x3xf32>
    return %0 : tensor<26x21x3xf32>
  }
}

// -----
module {
  func.func @test_cast_i32_f32(%arg0: tensor<13x21x3xi32>) -> tensor<13x21x3xf32> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_max(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x1xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.maximum %arg0, %arg1 : (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_mul(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>, %arg2: tensor<1xi8>) -> tensor<13x21x3xf32> {
    %0 = tosa.mul %arg0, %arg1, %arg2 : (tensor<13x21x3xf32>, tensor<13x1x3xf32>, tensor<1xi8>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_pow(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x1xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.pow %arg0, %arg1 : (tensor<13x21x3xf32>, tensor<13x21x1xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_sub(%arg0: tensor<1x21x3xf32>, %arg1: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.sub %arg0, %arg1 : (tensor<1x21x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_abs(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.abs %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_ceil(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.ceil %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_cos(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.cos %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_exp(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.exp %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_floor(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.floor %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_log(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.log %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_negate(%arg0: tensor<13x21x3xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<13x21x3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_reciprocal(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.reciprocal %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_rsqrt(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.rsqrt %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_select(%arg0: tensor<1x1x1xi1>, %arg1: tensor<13x21x3xf32>, %arg2: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.select %arg0, %arg1, %arg2 : (tensor<1x1x1xi1>, tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_sin(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.sin %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_equal(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>) -> tensor<13x21x3xi1> {
    %0 = tosa.equal %arg0, %arg1 : (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>
    return %0 : tensor<13x21x3xi1>
  }
}

// -----
module {
  func.func @test_greater(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x1x3xf32>) -> tensor<13x21x3xi1> {
    %0 = tosa.greater %arg0, %arg1 : (tensor<13x21x3xf32>, tensor<13x1x3xf32>) -> tensor<13x21x3xi1>
    return %0 : tensor<13x21x3xi1>
  }
}

// -----
module {
  func.func @test_reduce_max(%arg0: tensor<13x21x3xf16>) -> tensor<1x21x3xf16> {
    %0 = tosa.reduce_max %arg0 {axis = 0 : i32} : (tensor<13x21x3xf16>) -> tensor<1x21x3xf16>
    return %0 : tensor<1x21x3xf16>
  }
}

// -----
module {
  func.func @test_reduce_sum(%arg0: tensor<13x21x3xf32>) -> tensor<1x21x3xf32> {
    %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
    return %0 : tensor<1x21x3xf32>
  }
}

// -----
module {
  func.func @test_concat(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x21x3xf32>) -> tensor<26x21x3xf32> {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<13x21x3xf32>, tensor<13x21x3xf32>) -> tensor<26x21x3xf32>
    return %0 : tensor<26x21x3xf32>
  }
}

// -----
module {
  func.func @test_pad(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.const_shape  {values = dense<0> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<13x21x3xf32>, !tosa.shape<6>, tensor<1xf32>) -> tensor<13x21x3xf32>
    return %2 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_reshape(%arg0: tensor<13x21x3xf32>) -> tensor<1x819xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 819]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<13x21x3xf32>, !tosa.shape<2>) -> tensor<1x819xf32>
    return %1 : tensor<1x819xf32>
  }
}

// -----
module {
  func.func @test_reverse(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
    %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_slice(%arg0: tensor<13x21x3xf32>) -> tensor<4x11x1xf32> {
    %0 = tosa.const_shape  {values = dense<[4, 11, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[6, 8, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<13x21x3xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xf32>
    return %2 : tensor<4x11x1xf32>
  }
}

// -----
module {
  func.func @test_tile(%arg0: tensor<13x21x3xf32>) -> tensor<39x21x6xf32> {
    %0 = tosa.const_shape  {values = dense<[3, 1, 2]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.tile %arg0, %0 : (tensor<13x21x3xf32>, !tosa.shape<3>) -> tensor<39x21x6xf32>
    return %1 : tensor<39x21x6xf32>
  }
}

// -----
module {
  func.func @test_transpose(%arg0: tensor<13x21x3xf32>, %arg1: tensor<3xi32>) -> tensor<3x13x21xf32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1>} : (tensor<13x21x3xf32>) -> tensor<3x13x21xf32>
    return %0 : tensor<3x13x21xf32>
  }
}

// -----
module {
  func.func @test_gather(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xf32> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xf32>, tensor<13x26xi32>) -> tensor<13x26x3xf32>
    return %0 : tensor<13x26x3xf32>
  }
}

// -----
module {
  func.func @test_scatter(%arg0: tensor<13x28x3xf32>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xf32>) -> tensor<13x28x3xf32> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x28x3xf32>, tensor<13x26xi32>, tensor<13x26x3xf32>) -> tensor<13x28x3xf32>
    return %0 : tensor<13x28x3xf32>
  }
}

// -----
module {
  func.func @test_resize(%arg0: tensor<1x32x32x8xf32>) -> tensor<1x64x64x8xf32> {
    %0 = tosa.const_shape  {values = dense<[4, 2, 4, 2]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<-1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x32x32x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x64x64x8xf32>
    return %3 : tensor<1x64x64x8xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled(%arg0: tensor<4x8x32xf6E3M2FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf6E3M2FN>, %arg3: tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<4x8x32xf6E3M2FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E3M2FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    return %0 : tensor<4x8x16xf32>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_static(%arg0: tensor<4x32xf4E2M1FN>, %arg1: tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32> {
    %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>
    return %0 : tensor<4x32xf32>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_static(%arg0: tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>
  }
}

