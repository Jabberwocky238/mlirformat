module {
}

// -----
module {
  func.func @test_matmul_fp8_mixed_precision_operands(%arg0: tensor<1x14x19xf8E4M3FN>, %arg1: tensor<1x19x28xf8E5M2>) -> tensor<1x14x28xf16> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E5M2>, tensor<1xf8E4M3FN>, tensor<1xf8E5M2>) -> tensor<1x14x28xf16>
    return %2 : tensor<1x14x28xf16>
  }
}

// -----
module {
  func.func @test_matmul_fp8_input_fp32_acc_type(%arg0: tensor<1x14x19xf8E4M3FN>, %arg1: tensor<1x19x28xf8E4M3FN>) -> tensor<1x14x28xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x14x19xf8E4M3FN>, tensor<1x19x28xf8E4M3FN>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x14x28xf32>
    return %2 : tensor<1x14x28xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_fp8_input_fp32_acc_type(%arg0: tensor<1x14x19xf8E4M3FN>, %arg1: tensor<1x28x19xf8E4M3FN>) -> tensor<1x14x28xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
    %2 = tosa.matmul_t %arg0, %arg1, %0, %1 : (tensor<1x14x19xf8E4M3FN>, tensor<1x28x19xf8E4M3FN>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x14x28xf32>
    return %2 : tensor<1x14x28xf32>
  }
}

// -----
module {
  func.func @test_conv2d_fp8_acc32(%arg0: tensor<1x4x4x4xf8E5M2>, %arg1: tensor<8x1x1x4xf8E5M2>, %arg2: tensor<8xf32>) -> tensor<1x4x4x8xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xf8E5M2>, tensor<8x1x1x4xf8E5M2>, tensor<8xf32>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x4x8xf32>
    return %2 : tensor<1x4x4x8xf32>
  }
}

// -----
module {
  func.func @test_conv3d_fp8_acc32(%arg0: tensor<1x4x8x21x17xf8E5M2>, %arg1: tensor<34x1x1x1x17xf8E5M2>, %arg2: tensor<34xf32>) -> tensor<1x4x8x21x34xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = tosa.conv3d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x4x8x21x17xf8E5M2>, tensor<34x1x1x1x17xf8E5M2>, tensor<34xf32>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x8x21x34xf32>
    return %2 : tensor<1x4x8x21x34xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_fp8_acc32(%arg0: tensor<1x4x4x4xf8E5M2>, %arg1: tensor<1x1x4x2xf8E5M2>, %arg2: tensor<8xf32>) -> tensor<1x4x4x8xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xf8E5M2>, tensor<1x1x4x2xf8E5M2>, tensor<8xf32>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x4x4x8xf32>
    return %2 : tensor<1x4x4x8xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_fp8_acc32(%arg0: tensor<1x32x32x8xf8E5M2>, %arg1: tensor<16x1x1x8xf8E5M2>, %arg2: tensor<16xf32>) -> tensor<1x32x32x16xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
    %2 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf8E5M2>, tensor<16x1x1x8xf8E5M2>, tensor<16xf32>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x32x32x16xf32>
    return %2 : tensor<1x32x32x16xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_fp6e2m3(%arg0: tensor<4x8x32xf6E2M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf6E2M3FN>, %arg3: tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<4x8x32xf6E2M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E2M3FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    return %0 : tensor<4x8x16xf32>
  }
}

// -----
module {
  func.func @test_argmax_int64(%arg0: tensor<1x13x13x5xf32>) -> tensor<1x13x13xi64> {
    %0 = tosa.argmax %arg0 {axis = 3 : i32} : (tensor<1x13x13x5xf32>) -> tensor<1x13x13xi64>
    return %0 : tensor<1x13x13xi64>
  }
}

// -----
module {
  func.func @test_const_i64() -> tensor<4xi64> {
    %0 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi64>}> : () -> tensor<4xi64>
    return %0 : tensor<4xi64>
  }
}

// -----
module {
  func.func @test_const_fp6e3m2() -> tensor<4xf6E3M2FN> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<4xf6E3M2FN>}> : () -> tensor<4xf6E3M2FN>
    return %0 : tensor<4xf6E3M2FN>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_fp8e5m2_fp32(%arg0: tensor<4x32xf8E5M2>, %arg1: tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32> {
    %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf8E5M2>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>
    return %0 : tensor<4x32xf32>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_fp8e5m2_bf16(%arg0: tensor<4x32xf8E5M2>, %arg1: tensor<4x1xf8E8M0FNU>) -> tensor<4x32xbf16> {
    %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf8E5M2>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xbf16>
    return %0 : tensor<4x32xbf16>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_static(%arg0: tensor<4x32xf32>) -> (tensor<4x32xf6E3M2FN>, tensor<4x1xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32} : (tensor<4x32xf32>) -> (tensor<4x32xf6E3M2FN>, tensor<4x1xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<4x32xf6E3M2FN>, tensor<4x1xf8E8M0FNU>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_mxint8(%arg0: tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32, stochastic_round = false} : (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>
  }
}

// -----
module {
  func.func @test_const_fp6e3m2() -> tensor<4xf6E3M2FN> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<4xf6E3M2FN>}> : () -> tensor<4xf6E3M2FN>
    return %0 : tensor<4xf6E3M2FN>
  }
}

// -----
module {
  func.func @test_const_mxint8() -> tensor<2x!tosa.mxint8> {
    %0 = "tosa.const"() <{values = dense<["0x00", "0x7F"]> : tensor<2x!tosa.mxint8>}> : () -> tensor<2x!tosa.mxint8>
    return %0 : tensor<2x!tosa.mxint8>
  }
}

// -----
module {
  func.func @test_const_block_scaled_types() -> (tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>) {
    %0 = "tosa.const"() <{values = dense<tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN, {1.000000e+00}>> : 0.000000e+00 : f4E2M1FN>}> : () -> tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>
    %1 = "tosa.const"() <{values = dense<tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN, {1.000000e+00}>> : 0.000000e+00 : f6E2M3FN>}> : () -> tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>
    %2 = "tosa.const"() <{values = dense<tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN, {1.000000e+00}>> : 0.000000e+00 : f6E3M2FN>}> : () -> tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>
    %3 = "tosa.const"() <{values = dense<tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN, {1.000000e+00}>> : 0.000000e+00 : f8E4M3FN>}> : () -> tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>
    %4 = "tosa.const"() <{values = dense<tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2, {1.000000e+00}>> : 0.000000e+00 : f8E5M2>}> : () -> tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>
    %5 = "tosa.const"() <{values = dense<tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8, {1.000000e+00}>> : 0 : i8>}> : () -> tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>
    return %0, %1, %2, %3, %4, %5 : tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>, tensor<1x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_mxint8(%arg0: tensor<4x8x32x!tosa.mxint8>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32x!tosa.mxint8>, %arg3: tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<4x8x32x!tosa.mxint8>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32x!tosa.mxint8>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
    return %0 : tensor<4x8x16xf32>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_mxint8(%arg0: tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32, stochastic_round = false} : (tensor<4x32xf32>) -> (tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<4x32x!tosa.mxint8>, tensor<4x1xf8E8M0FNU>
  }
}

// -----
module {
  func.func @test_argmax_fp8_i64(%arg0: tensor<12x8x16xf8E5M2>) -> tensor<12x16xi64> {
    %0 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<12x8x16xf8E5M2>) -> tensor<12x16xi64>
    return %0 : tensor<12x16xi64>
  }
}

// -----
module {
  func.func @test_argmax_bf16_i64(%arg0: tensor<12x8x16xbf16>) -> tensor<12x16xi64> {
    %0 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<12x8x16xbf16>) -> tensor<12x16xi64>
    return %0 : tensor<12x16xi64>
  }
}

// -----
module {
  func.func @test_scatter_const_indices_int64(%arg0: tensor<2x52x3xf32>, %arg1: tensor<2x12x3xf32>) -> tensor<2x52x3xf32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]> : tensor<2x12xi64>}> : () -> tensor<2x12xi64>
    %1 = tosa.scatter %arg0, %0, %arg1 : (tensor<2x52x3xf32>, tensor<2x12xi64>, tensor<2x12x3xf32>) -> tensor<2x52x3xf32>
    return %1 : tensor<2x52x3xf32>
  }
}

// -----
module {
  func.func @test_gather_bool_i64(%arg0: tensor<13x21x3xi1>, %arg1: tensor<13x26xi64>) -> tensor<13x26x3xi1> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi1>, tensor<13x26xi64>) -> tensor<13x26x3xi1>
    return %0 : tensor<13x26x3xi1>
  }
}

// -----
module {
  func.func @test_gather_bool_i32(%arg0: tensor<13x21x3xi1>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi1> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi1>, tensor<13x26xi32>) -> tensor<13x26x3xi1>
    return %0 : tensor<13x26x3xi1>
  }
}

// -----
module {
  func.func @test_scatter_bool_i64(%arg0: tensor<13x52x3xi1>, %arg1: tensor<13x26xi64>, %arg2: tensor<13x26x3xi1>) -> tensor<13x52x3xi1> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x52x3xi1>, tensor<13x26xi64>, tensor<13x26x3xi1>) -> tensor<13x52x3xi1>
    return %0 : tensor<13x52x3xi1>
  }
}

// -----
module {
  func.func @test_scatter_bool_i32(%arg0: tensor<13x52x3xi1>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi1>) -> tensor<13x52x3xi1> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x52x3xi1>, tensor<13x26xi32>, tensor<13x26x3xi1>) -> tensor<13x52x3xi1>
    return %0 : tensor<13x52x3xi1>
  }
}

// -----
module {
  func.func @test_gather_i8_i32_indices(%arg0: tensor<13x21x3xi8>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi8> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi8>, tensor<13x26xi32>) -> tensor<13x26x3xi8>
    return %0 : tensor<13x26x3xi8>
  }
}

// -----
module {
  func.func @test_row_gather_i8_i32_indices(%arg0: tensor<13x21x3xi8>, %arg1: tensor<13x26xi32>) -> tensor<13x52x3xi8> {
    %0 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = tosa.row_gather %arg0, %arg1, %0 : (tensor<13x21x3xi8>, tensor<13x26xi32>, tensor<1xi32>) -> tensor<13x52x3xi8>
    return %1 : tensor<13x52x3xi8>
  }
}

// -----
module {
  func.func @test_row_gather_i8_i64_indices(%arg0: tensor<13x21x3xi8>, %arg1: tensor<13x26xi64>) -> tensor<13x52x3xi8> {
    %0 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = tosa.row_gather %arg0, %arg1, %0 : (tensor<13x21x3xi8>, tensor<13x26xi64>, tensor<1xi32>) -> tensor<13x52x3xi8>
    return %1 : tensor<13x52x3xi8>
  }
}

// -----
module {
  func.func @test_row_gather_f8e5m2_i32_indices(%arg0: tensor<13x21x3xf8E5M2>, %arg1: tensor<13x26xi32>) -> tensor<13x52x3xf8E5M2> {
    %0 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = tosa.row_gather %arg0, %arg1, %0 : (tensor<13x21x3xf8E5M2>, tensor<13x26xi32>, tensor<1xi32>) -> tensor<13x52x3xf8E5M2>
    return %1 : tensor<13x52x3xf8E5M2>
  }
}

// -----
module {
  func.func @test_row_gather_block_scaled_i8_i32_indices(%arg0: tensor<13x21x3xi8>, %arg1: tensor<13x26xi32>) -> tensor<13x52x3xi8> {
    %0 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = tosa.row_gather_block_scaled %arg0, %arg1, %0 {block_size = #tosa.block_size<BLOCK_SIZE_1>} : (tensor<13x21x3xi8>, tensor<13x26xi32>, tensor<1xi32>) -> tensor<13x52x3xi8>
    return %1 : tensor<13x52x3xi8>
  }
}

// -----
module {
  func.func @test_scatter_i8_i32_indices(%arg0: tensor<13x27x3xi8>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi8>) -> tensor<13x27x3xi8> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi8>, tensor<13x26xi32>, tensor<13x26x3xi8>) -> tensor<13x27x3xi8>
    return %0 : tensor<13x27x3xi8>
  }
}

// -----
module {
  func.func @test_gather_i16_i32_indices(%arg0: tensor<13x21x3xi16>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi16> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi16>, tensor<13x26xi32>) -> tensor<13x26x3xi16>
    return %0 : tensor<13x26x3xi16>
  }
}

// -----
module {
  func.func @test_scatter_i16_i32_indices(%arg0: tensor<13x27x3xi16>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi16>) -> tensor<13x27x3xi16> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi16>, tensor<13x26xi32>, tensor<13x26x3xi16>) -> tensor<13x27x3xi16>
    return %0 : tensor<13x27x3xi16>
  }
}

// -----
module {
  func.func @test_gather_i32_i32_indices(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi32> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi32>, tensor<13x26xi32>) -> tensor<13x26x3xi32>
    return %0 : tensor<13x26x3xi32>
  }
}

// -----
module {
  func.func @test_scatter_i32_i32_indices(%arg0: tensor<13x27x3xi32>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi32>) -> tensor<13x27x3xi32> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi32>, tensor<13x26xi32>, tensor<13x26x3xi32>) -> tensor<13x27x3xi32>
    return %0 : tensor<13x27x3xi32>
  }
}

// -----
module {
  func.func @test_gather_i8_i64_indices(%arg0: tensor<13x21x3xi8>, %arg1: tensor<13x26xi64>) -> tensor<13x26x3xi8> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi8>, tensor<13x26xi64>) -> tensor<13x26x3xi8>
    return %0 : tensor<13x26x3xi8>
  }
}

// -----
module {
  func.func @test_scatter_i8_i64_indices(%arg0: tensor<13x27x3xi8>, %arg1: tensor<13x26xi64>, %arg2: tensor<13x26x3xi8>) -> tensor<13x27x3xi8> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi8>, tensor<13x26xi64>, tensor<13x26x3xi8>) -> tensor<13x27x3xi8>
    return %0 : tensor<13x27x3xi8>
  }
}

// -----
module {
  func.func @test_gather_i16_i64_indices(%arg0: tensor<13x21x3xi16>, %arg1: tensor<13x26xi64>) -> tensor<13x26x3xi16> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi16>, tensor<13x26xi64>) -> tensor<13x26x3xi16>
    return %0 : tensor<13x26x3xi16>
  }
}

// -----
module {
  func.func @test_scatter_i16_i64_indices(%arg0: tensor<13x27x3xi16>, %arg1: tensor<13x26xi64>, %arg2: tensor<13x26x3xi16>) -> tensor<13x27x3xi16> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi16>, tensor<13x26xi64>, tensor<13x26x3xi16>) -> tensor<13x27x3xi16>
    return %0 : tensor<13x27x3xi16>
  }
}

// -----
module {
  func.func @test_gather_i32_i64_indices(%arg0: tensor<13x21x3xi32>, %arg1: tensor<13x26xi64>) -> tensor<13x26x3xi32> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi32>, tensor<13x26xi64>) -> tensor<13x26x3xi32>
    return %0 : tensor<13x26x3xi32>
  }
}

// -----
module {
  func.func @test_scatter_i32_i64_indices(%arg0: tensor<13x27x3xi32>, %arg1: tensor<13x26xi64>, %arg2: tensor<13x26x3xi32>) -> tensor<13x27x3xi32> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi32>, tensor<13x26xi64>, tensor<13x26x3xi32>) -> tensor<13x27x3xi32>
    return %0 : tensor<13x27x3xi32>
  }
}

// -----
module {
  func.func @test_cast_bool_fp32(%arg0: tensor<13x21x3xi1>) -> tensor<13x21x3xf32> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi1>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_cast_bool_i64(%arg0: tensor<13x21x3xi1>) -> tensor<13x21x3xi64> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi1>) -> tensor<13x21x3xi64>
    return %0 : tensor<13x21x3xi64>
  }
}

// -----
module {
  func.func @test_cast_fp32_bool(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xi1> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xi1>
    return %0 : tensor<13x21x3xi1>
  }
}

// -----
module {
  func.func @test_cast_i64_bool(%arg0: tensor<13x21x3xi64>) -> tensor<13x21x3xi1> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi64>) -> tensor<13x21x3xi1>
    return %0 : tensor<13x21x3xi1>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_types(%arg0: tensor<4x32xf16>, %arg1: tensor<4x32xf32>, %arg2: tensor<4x32xbf16>, %arg3: tensor<4x32xf8E4M3FN>, %arg4: tensor<4x32xf8E5M2>) -> (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>) {
    %0 = tosa.cast %arg1 : (tensor<4x32xf32>) -> tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>
    %1 = tosa.cast %arg1 : (tensor<4x32xf32>) -> tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>
    %2 = tosa.cast %arg1 : (tensor<4x32xf32>) -> tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>
    %3 = tosa.cast %arg0 : (tensor<4x32xf16>) -> tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>
    %4 = tosa.cast %arg2 : (tensor<4x32xbf16>) -> tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>
    %5 = tosa.cast %arg3 : (tensor<4x32xf8E4M3FN>) -> tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>
    %6 = tosa.cast %arg4 : (tensor<4x32xf8E5M2>) -> tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>
    return %0, %1, %2, %3, %4, %5 : tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>, tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_types(%arg0: tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>, %arg1: tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>, %arg2: tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>, %arg3: tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>, %arg4: tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>, %arg5: tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>) -> (tensor<4x32xf32>, tensor<4x32xf16>, tensor<4x32xbf16>, tensor<4x32xf8E4M3FN>, tensor<4x32xf8E5M2>) {
    %0 = tosa.cast %arg0 : (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>) -> tensor<4x32xf32>
    %1 = tosa.cast %arg1 : (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E2M3FN>>) -> tensor<4x32xf32>
    %2 = tosa.cast %arg2 : (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f6E3M2FN>>) -> tensor<4x32xf32>
    %3 = tosa.cast %arg3 : (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E4M3FN>>) -> tensor<4x32xf16>
    %4 = tosa.cast %arg4 : (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f8E5M2>>) -> tensor<4x32xbf16>
    %5 = tosa.cast %arg5 : (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:!tosa.mxint8>>) -> tensor<4x32xf8E4M3FN>
    %6 = tosa.cast %arg0 : (tensor<4x32x!tosa.block_scaled<BLOCK_SHAPE_32:f8E8M0FNU:f4E2M1FN>>) -> tensor<4x32xf8E5M2>
    return %0, %3, %4, %5, %6 : tensor<4x32xf32>, tensor<4x32xf16>, tensor<4x32xbf16>, tensor<4x32xf8E4M3FN>, tensor<4x32xf8E5M2>
  }
}

// -----
module {
  func.func @test_dynamic_dims(%arg0: tensor<?x8x16xi8>) -> tensor<?x16xi32> {
    %0 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<?x8x16xi8>) -> tensor<?x16xi32>
    return %0 : tensor<?x16xi32>
  }
}

// -----
module {
  func.func @test_add_shape() {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<[5, 6, 7, 8]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %2 = tosa.add_shape %0, %1 : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
    return
  }
}

// -----
module {
  func.func @test_dim(%arg0: tensor<1x2x3x4xi32>) {
    %0 = tosa.dim %arg0 {axis = 2 : i32} : (tensor<1x2x3x4xi32>) -> !tosa.shape<1>
    return
  }
}

// -----
module {
  func.func @test_dim_bf16(%arg0: tensor<6x4x6x9xbf16>) {
    %0 = tosa.dim %arg0 {axis = 1 : i32} : (tensor<6x4x6x9xbf16>) -> !tosa.shape<1>
    return
  }
}

// -----
module {
  func.func @test_exp2_shape() {
    %0 = tosa.const_shape  {values = dense<[5, 7, 10, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.exp2_shape %0 : (!tosa.shape<4>) -> !tosa.shape<4>
    return
  }
}

// -----
module {
  func.func @test_log2_ceil_shape() {
    %0 = tosa.const_shape  {values = dense<[5, 7, 10, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.log2_ceil_shape %0 : (!tosa.shape<4>) -> !tosa.shape<4>
    return
  }
}

// -----
module {
  func.func @test_mod_shape() {
    %0 = tosa.const_shape  {values = dense<[10, 11, 12]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[3, 5, 2]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.mod_shape %0, %1 : (!tosa.shape<3>, !tosa.shape<3>) -> !tosa.shape<3>
    return
  }
}

// -----
module {
  func.func @test_conv2d_block_scaled(%arg0: tensor<1x4x4x64xf4E2M1FN>, %arg1: tensor<1x4x4x2xf8E8M0FNU>, %arg2: tensor<8x1x1x64xf4E2M1FN>, %arg3: tensor<8x1x1x2xf8E8M0FNU>, %arg4: tensor<1xf32>) -> tensor<1x4x4x8xf32> {
    %0 = tosa.const_shape  {values = dense<0> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.conv2d_block_scaled %arg0, %arg1, %arg2, %arg3, %arg4, %0, %1, %2 {block_size = BLOCK_SIZE_32} : (tensor<1x4x4x64xf4E2M1FN>, tensor<1x4x4x2xf8E8M0FNU>, tensor<8x1x1x64xf4E2M1FN>, tensor<8x1x1x2xf8E8M0FNU>, tensor<1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x4x4x8xf32>
    return %3 : tensor<1x4x4x8xf32>
  }
}

// -----
module {
  func.func @test_assert_equal_shape() {
    %0 = tosa.const_shape  {values = dense<[10, 15]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<[5, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
    tosa.assert_equal_shape %0, %1 {allow_broadcast = true} : (!tosa.shape<2>, !tosa.shape<2>) -> ()
    return
  }
}

// -----
module {
  func.func @test_maxpool2d_adaptive(%arg0: tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<4xindex>} : () -> !tosa.shape<4>
    %3 = tosa.max_pool2d_adaptive %arg0, %0, %1, %2 : (tensor<1x32x32x8xf32>, !tosa.shape<2>, !tosa.shape<2>, !tosa.shape<4>) -> tensor<1x32x32x8xf32>
    return %3 : tensor<1x32x32x8xf32>
  }
}

