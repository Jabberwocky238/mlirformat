module {
  func.func @test_transpose_tracks_to_nullifying_single_step(%arg0: tensor<1x2x3x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = tosa.ceil %0 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %2 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_transpose_tracks_to_nullifying_multi_unary_step(%arg0: tensor<1x2x3x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = tosa.clamp %0 {max_val = 1 : i32, min_val = 0 : i32} : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %2 = tosa.abs %1 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %3 = tosa.bitwise_not %2 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %4 = tosa.transpose %3 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %4 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_transpose_tracks_to_nullifying_diverging_binary(%arg0: tensor<1x2x3x4xi32>, %arg1: tensor<1x2x3x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = tosa.transpose %arg1 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %2 = tosa.clamp %0 {max_val = 1 : i32, min_val = 0 : i32} : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %3 = tosa.abs %1 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %4 = tosa.add %2, %3 : (tensor<1x3x4x2xi32>, tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %5 = tosa.transpose %4 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %5 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_transpose_tracks_to_nullifying_diverging_binary_with_broadcasting(%arg0: tensor<1x2x3x4xi32>, %arg1: tensor<1x2x1x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = tosa.transpose %arg1 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x1x4xi32>) -> tensor<1x1x4x2xi32>
    %2 = tosa.clamp %0 {max_val = 1 : i32, min_val = 0 : i32} : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %3 = tosa.abs %1 : (tensor<1x1x4x2xi32>) -> tensor<1x1x4x2xi32>
    %4 = tosa.add %2, %3 : (tensor<1x3x4x2xi32>, tensor<1x1x4x2xi32>) -> tensor<1x3x4x2xi32>
    %5 = tosa.transpose %4 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %5 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_transpose_tracks_to_nullifying__converging_binary(%arg0: tensor<1x2x3x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = tosa.add %0, %0 : (tensor<1x3x4x2xi32>, tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %2 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_torch_conv2d_with_elementwise_in_between(%arg0: tensor<3x3x10x10xf32>) -> tensor<3x3x7x7xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tosa.const"() <{values = dense_resource<torch_tensor_3_torch.float32_2> : tensor<3xf32>}> : () -> tensor<3xf32>
    %3 = "tosa.const"() <{values = dense_resource<torch_tensor_3_3_2_2_torch.float32_2> : tensor<3x3x2x2xf32>}> : () -> tensor<3x3x2x2xf32>
    %4 = "tosa.const"() <{values = dense_resource<torch_tensor_3_torch.float32_1> : tensor<3xf32>}> : () -> tensor<3xf32>
    %5 = "tosa.const"() <{values = dense_resource<torch_tensor_3_3_2_2_torch.float32_1> : tensor<3x3x2x2xf32>}> : () -> tensor<3x3x2x2xf32>
    %6 = "tosa.const"() <{values = dense_resource<torch_tensor_3_3_2_2_torch.float32> : tensor<3x3x2x2xf32>}> : () -> tensor<3x3x2x2xf32>
    %7 = "tosa.const"() <{values = dense_resource<torch_tensor_3_torch.float32> : tensor<3xf32>}> : () -> tensor<3xf32>
    %8 = "tosa.const"() <{values = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %9 = "tosa.const"() <{values = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %10 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x10x10xf32>) -> tensor<3x10x10x3xf32>
    %11 = tosa.transpose %6 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x2x2xf32>) -> tensor<3x2x2x3xf32>
    %12 = tosa.conv2d %10, %11, %7, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<3x10x10x3xf32>, tensor<3x2x2x3xf32>, tensor<3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<3x9x9x3xf32>
    %13 = tosa.transpose %12 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x9x9x3xf32>) -> tensor<3x3x9x9xf32>
    %14 = tosa.ceil %13 : (tensor<3x3x9x9xf32>) -> tensor<3x3x9x9xf32>
    %15 = tosa.transpose %14 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x9x9xf32>) -> tensor<3x9x9x3xf32>
    %16 = tosa.transpose %5 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x2x2xf32>) -> tensor<3x2x2x3xf32>
    %17 = tosa.conv2d %15, %16, %4, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<3x9x9x3xf32>, tensor<3x2x2x3xf32>, tensor<3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<3x8x8x3xf32>
    %18 = tosa.transpose %17 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x8x8x3xf32>) -> tensor<3x3x8x8xf32>
    %19 = tosa.floor %18 : (tensor<3x3x8x8xf32>) -> tensor<3x3x8x8xf32>
    %20 = tosa.transpose %19 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x8x8xf32>) -> tensor<3x8x8x3xf32>
    %21 = tosa.transpose %3 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x2x2xf32>) -> tensor<3x2x2x3xf32>
    %22 = tosa.conv2d %20, %21, %2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<3x8x8x3xf32>, tensor<3x2x2x3xf32>, tensor<3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<3x7x7x3xf32>
    %23 = tosa.transpose %22 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x7x7x3xf32>) -> tensor<3x3x7x7xf32>
    return %23 : tensor<3x3x7x7xf32>
  }
}

// -----
module {
  func.func @test_mulop_conversion(%arg0: tensor<1x2x3x4xi32>, %arg1: tensor<1x2x3x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = tosa.transpose %arg1 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = tosa.mul %0, %1, %2 : (tensor<1x3x4x2xi32>, tensor<1x3x4x2xi32>, tensor<1xi8>) -> tensor<1x3x4x2xi32>
    %4 = tosa.transpose %3 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %4 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_basic_non_broadcasting_reshape(%arg0: tensor<2x3xi32>) -> tensor<1x2x3xi32> {
    %0 = tosa.const_shape  {values = dense<[1, 3, 2]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<2x3xi32>, !tosa.shape<3>) -> tensor<1x3x2xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 2, 1>} : (tensor<1x3x2xi32>) -> tensor<1x2x3xi32>
    return %2 : tensor<1x2x3xi32>
  }
}

// -----
module {
  func.func @test_dynamic_broadcasting_reshape(%arg0: tensor<?xi32>) -> tensor<1x1x?xi32> {
    %0 = tosa.const_shape  {values = dense<[1, -1, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<?xi32>, !tosa.shape<3>) -> tensor<1x?x1xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 2, 1>} : (tensor<1x?x1xi32>) -> tensor<1x1x?xi32>
    return %2 : tensor<1x1x?xi32>
  }
}

// -----
module {
  func.func @test_reshape_for_broadcast(%arg0: tensor<4x3x2xi32>) -> tensor<4x3x2xi32> {
    %0 = "tosa.const"() <{values = dense<[1, 2, 3, 4]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %1 = tosa.const_shape  {values = dense<[1, 1, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.reshape %0, %1 : (tensor<4xi32>, !tosa.shape<3>) -> tensor<1x1x4xi32>
    %3 = tosa.transpose %arg0 {perms = array<i32: 2, 1, 0>} : (tensor<4x3x2xi32>) -> tensor<2x3x4xi32>
    %4 = tosa.add %3, %2 : (tensor<2x3x4xi32>, tensor<1x1x4xi32>) -> tensor<2x3x4xi32>
    %5 = tosa.transpose %4 {perms = array<i32: 2, 1, 0>} : (tensor<2x3x4xi32>) -> tensor<4x3x2xi32>
    return %5 : tensor<4x3x2xi32>
  }
}

// -----
module {
  func.func @test_resnet18_common_case(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>, %arg2: tensor<1x112x112x64xf32>) -> tensor<1x112x112x64xf32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = tosa.const_shape  {values = dense<[1, 64, 1, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %2 = "tosa.const"() <{values = dense_resource<torch_tensor_64_torch.float32_1> : tensor<64xf32>}> : () -> tensor<64xf32>
    %3 = "tosa.const"() <{values = dense_resource<torch_tensor_64_torch.float32> : tensor<64xf32>}> : () -> tensor<64xf32>
    %4 = "tosa.const"() <{values = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %5 = "tosa.const"() <{values = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %6 = "tosa.const"() <{values = dense<9.99999974E-6> : tensor<1xf32>}> : () -> tensor<1xf32>
    %7 = "tosa.const"() <{values = dense<5.000000e-01> : tensor<1xf32>}> : () -> tensor<1xf32>
    %8 = tosa.transpose %arg2 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x112x112x64xf32>) -> tensor<1x64x112x112xf32>
    %9 = tosa.add %arg1, %6 : (tensor<64xf32>, tensor<1xf32>) -> tensor<64xf32>
    %10 = tosa.pow %9, %7 : (tensor<64xf32>, tensor<1xf32>) -> tensor<64xf32>
    %11 = tosa.reciprocal %10 : (tensor<64xf32>) -> tensor<64xf32>
    %12 = tosa.reshape %arg0, %1 : (tensor<64xf32>, !tosa.shape<4>) -> tensor<1x64x1x1xf32>
    %13 = tosa.sub %8, %12 : (tensor<1x64x112x112xf32>, tensor<1x64x1x1xf32>) -> tensor<1x64x112x112xf32>
    %14 = tosa.reshape %11, %1 : (tensor<64xf32>, !tosa.shape<4>) -> tensor<1x64x1x1xf32>
    %15 = tosa.mul %13, %14, %0 : (tensor<1x64x112x112xf32>, tensor<1x64x1x1xf32>, tensor<1xi8>) -> tensor<1x64x112x112xf32>
    %16 = tosa.reshape %3, %1 : (tensor<64xf32>, !tosa.shape<4>) -> tensor<1x64x1x1xf32>
    %17 = tosa.mul %15, %16, %0 : (tensor<1x64x112x112xf32>, tensor<1x64x1x1xf32>, tensor<1xi8>) -> tensor<1x64x112x112xf32>
    %18 = tosa.reshape %2, %1 : (tensor<64xf32>, !tosa.shape<4>) -> tensor<1x64x1x1xf32>
    %19 = tosa.add %17, %18 : (tensor<1x64x112x112xf32>, tensor<1x64x1x1xf32>) -> tensor<1x64x112x112xf32>
    %20 = tosa.clamp %19 {max_val = 3.40282347E+38 : f32, min_val = 0.000000e+00 : f32} : (tensor<1x64x112x112xf32>) -> tensor<1x64x112x112xf32>
    %21 = tosa.transpose %20 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x64x112x112xf32>) -> tensor<1x112x112x64xf32>
    return %21 : tensor<1x112x112x64xf32>
  }
}

// -----
module {
  func.func @test_back_to_back_nullifiers(%arg0: tensor<2x3xi32>) -> tensor<3x2xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<2x3xi32>) -> tensor<3x2xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<3x2xi32>) -> tensor<2x3xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 1, 0>} : (tensor<2x3xi32>) -> tensor<3x2xi32>
    return %2 : tensor<3x2xi32>
  }
}

// -----
module {
  func.func @test_back_to_back_nullifiers_different_transposes(%arg0: tensor<2x3x4x5xi32>) -> tensor<2x4x5x3xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<2x3x4x5xi32>) -> tensor<2x4x5x3xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 0, 3, 1, 2>} : (tensor<2x4x5x3xi32>) -> tensor<2x3x4x5xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 2, 3, 1>} : (tensor<2x3x4x5xi32>) -> tensor<2x4x5x3xi32>
    return %2 : tensor<2x4x5x3xi32>
  }
}

// -----
module {
  func.func @test_no_transform_if_outside_fan_in_cone(%arg0: tensor<3x3x3x3xi32>) -> (tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %1 = tosa.clamp %0 {max_val = 2147483647 : i32, min_val = 0 : i32} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    return %2, %1 : tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>
  }
}

// -----
module {
  func.func @test_two_different_downstream_converge_to_reshape_same_perms(%arg0: tensor<64xf32>) -> (tensor<1x1x64xf32>, tensor<1x1x64xf32>) {
    %0 = "tosa.const"() <{values = dense<[0, 2, 1]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %1 = tosa.const_shape  {values = dense<[1, 64, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.reshape %arg0, %1 : (tensor<64xf32>, !tosa.shape<3>) -> tensor<1x64x1xf32>
    %3 = tosa.clamp %2 {max_val = 3.40282347E+38 : f32, min_val = 0.000000e+00 : f32} : (tensor<1x64x1xf32>) -> tensor<1x64x1xf32>
    %4 = tosa.transpose %2 {perms = array<i32: 0, 2, 1>} : (tensor<1x64x1xf32>) -> tensor<1x1x64xf32>
    %5 = tosa.transpose %3 {perms = array<i32: 0, 2, 1>} : (tensor<1x64x1xf32>) -> tensor<1x1x64xf32>
    return %4, %5 : tensor<1x1x64xf32>, tensor<1x1x64xf32>
  }
}

// -----
module {
  func.func @test_two_different_downstream_converge_to_reshape_different_perms(%arg0: tensor<64xf32>) -> (tensor<1x1x64xf32>, tensor<64x1x1xf32>) {
    %0 = tosa.const_shape  {values = dense<[1, 64, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<64xf32>, !tosa.shape<3>) -> tensor<1x64x1xf32>
    %2 = tosa.clamp %1 {max_val = 3.40282347E+38 : f32, min_val = 0.000000e+00 : f32} : (tensor<1x64x1xf32>) -> tensor<1x64x1xf32>
    %3 = tosa.transpose %1 {perms = array<i32: 0, 2, 1>} : (tensor<1x64x1xf32>) -> tensor<1x1x64xf32>
    %4 = tosa.transpose %2 {perms = array<i32: 1, 2, 0>} : (tensor<1x64x1xf32>) -> tensor<64x1x1xf32>
    return %3, %4 : tensor<1x1x64xf32>, tensor<64x1x1xf32>
  }
}

// -----
module {
  func.func @test_outside_perms_usage_of_fan_in(%arg0: tensor<2x3xf32>, %arg1: tensor<3x2xf32>) -> (tensor<2x3xf32>, tensor<3x2xf32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<2x3xf32>) -> tensor<3x2xf32>
    %1 = tosa.clamp %0 {max_val = 3.40282347E+38 : f32, min_val = 0.000000e+00 : f32} : (tensor<3x2xf32>) -> tensor<3x2xf32>
    %2 = tosa.transpose %1 {perms = array<i32: 1, 0>} : (tensor<3x2xf32>) -> tensor<2x3xf32>
    %3 = tosa.add %arg1, %1 : (tensor<3x2xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>
    return %2, %3 : tensor<2x3xf32>, tensor<3x2xf32>
  }
}

// -----
module {
  func.func @test_use_present_in_another_valid_perms_fan_in(%arg0: tensor<2x3xf32>, %arg1: tensor<2x3xf32>) -> (tensor<2x3xf32>, tensor<2x3xf32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<2x3xf32>) -> tensor<3x2xf32>
    %1 = tosa.clamp %0 {max_val = 3.40282347E+38 : f32, min_val = 0.000000e+00 : f32} : (tensor<3x2xf32>) -> tensor<3x2xf32>
    %2 = tosa.transpose %1 {perms = array<i32: 1, 0>} : (tensor<3x2xf32>) -> tensor<2x3xf32>
    %3 = tosa.transpose %arg1 {perms = array<i32: 1, 0>} : (tensor<2x3xf32>) -> tensor<3x2xf32>
    %4 = tosa.add %3, %1 : (tensor<3x2xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>
    %5 = tosa.transpose %4 {perms = array<i32: 1, 0>} : (tensor<3x2xf32>) -> tensor<2x3xf32>
    return %2, %5 : tensor<2x3xf32>, tensor<2x3xf32>
  }
}

// -----
module {
  func.func @test_two_same_perms_fan_in_but_one_doesnt_convert_dependents(%arg0: tensor<2x3xi32>, %arg1: tensor<3x2xi32>) -> (tensor<2x3xi32>, tensor<2x3xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<2x3xi32>) -> tensor<3x2xi32>
    %1 = tosa.ceil %0 : (tensor<3x2xi32>) -> tensor<3x2xi32>
    %2 = tosa.add %1, %arg1 : (tensor<3x2xi32>, tensor<3x2xi32>) -> tensor<3x2xi32>
    %3 = tosa.transpose %1 {perms = array<i32: 1, 0>} : (tensor<3x2xi32>) -> tensor<2x3xi32>
    %4 = tosa.transpose %2 {perms = array<i32: 1, 0>} : (tensor<3x2xi32>) -> tensor<2x3xi32>
    return %3, %4 : tensor<2x3xi32>, tensor<2x3xi32>
  }
}

// -----
module {
  func.func @test_direct_use_in_other_transpose_with_same_perms(%arg0: tensor<3x3x3x3xi32>) -> (tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %1 = tosa.clamp %0 {max_val = 2147483647 : i32, min_val = 0 : i32} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %3 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    return %2, %3 : tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>
  }
}

// -----
module {
  func.func @test_const_transpose() -> tensor<2x3xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<3x2xi32>}> : () -> tensor<3x2xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<3x2xi32>) -> tensor<2x3xi32>
    return %1 : tensor<2x3xi32>
  }
}

// -----
module {
  func.func @test_transpose_tracks_to_const_single_step() -> tensor<1x2x3x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1x3x4x2xi32>}> : () -> tensor<1x3x4x2xi32>
    %1 = tosa.clamp %0 {max_val = 2147483647 : i32, min_val = 0 : i32} : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %2 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_static_unary_path_to_const() -> tensor<1x2x3x4xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1x3x4x2xi32>}> : () -> tensor<1x3x4x2xi32>
    %1 = tosa.clamp %0 {max_val = 2147483647 : i32, min_val = 0 : i32} : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %2 = tosa.abs %1 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %3 = tosa.bitwise_not %2 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %4 = tosa.transpose %3 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %4 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_static_diverges_to_non_splat_const_and_nullifying(%arg0: tensor<1x2x3x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4], [5, 6], [7, 8]], [[9, 10], [11, 12], [13, 14], [15, 16]], [[17, 18], [19, 20], [21, 22], [23, 24]]]]> : tensor<1x3x4x2xi32>}> : () -> tensor<1x3x4x2xi32>
    %2 = tosa.clamp %0 {max_val = 2147483647 : i32, min_val = 0 : i32} : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %3 = tosa.abs %1 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %4 = tosa.add %3, %2 : (tensor<1x3x4x2xi32>, tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %5 = tosa.transpose %4 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %5 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_multi_downstream_both_nullify(%arg0: tensor<3x3x3x3xi32>) -> (tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %1 = tosa.clamp %0 {max_val = 2147483647 : i32, min_val = 0 : i32} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %3 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    return %2, %3 : tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>
  }
}

// -----
module {
  func.func @test_multi_downstream_one_nullifies_upstream_other_does_not(%arg0: tensor<3x3x3x3xi32>) -> (tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %1 = tosa.clamp %0 {max_val = 2147483647 : i32, min_val = 0 : i32} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    %3 = tosa.transpose %1 {perms = array<i32: 0, 2, 3, 1>} : (tensor<3x3x3x3xi32>) -> tensor<3x3x3x3xi32>
    return %2, %3 : tensor<3x3x3x3xi32>, tensor<3x3x3x3xi32>
  }
}

// -----
module {
  func.func @test_unknown_dim_inner_replacement_matches(%arg0: tensor<3x2xi32>) -> tensor<3x2xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<3x2xi32>) -> tensor<?x3xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<?x3xi32>) -> tensor<3x2xi32>
    return %1 : tensor<3x2xi32>
  }
}

// -----
module {
  func.func @test_unknown_dim_outer_replacement_matches(%arg0: tensor<3x?xi32>) -> tensor<3x?xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<3x?xi32>) -> tensor<2x3xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<2x3xi32>) -> tensor<3x?xi32>
    return %1 : tensor<3x?xi32>
  }
}

// -----
module {
  func.func @test_transpose_tracks_to_nullifying_diverging_binary_unknown_dim_replacements_match(%arg0: tensor<1x?x3x4xi32>, %arg1: tensor<1x2x?x4xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x?x3x4xi32>) -> tensor<?x3x4x?xi32>
    %1 = tosa.transpose %arg1 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x?x4xi32>) -> tensor<1x?x?x2xi32>
    %2 = tosa.clamp %0 {max_val = 1 : i32, min_val = 0 : i32} : (tensor<?x3x4x?xi32>) -> tensor<?x3x4x?xi32>
    %3 = tosa.abs %1 : (tensor<1x?x?x2xi32>) -> tensor<1x?x?x2xi32>
    %4 = tosa.add %2, %3 : (tensor<?x3x4x?xi32>, tensor<1x?x?x2xi32>) -> tensor<1x3x4x2xi32>
    %5 = tosa.transpose %4 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %5 : tensor<1x2x3x4xi32>
  }
}

// -----
module {
  func.func @test_unimplemented_transpose_tracks_to_non_nullifying_transpose_single_step(%arg0: tensor<1x2x3x4xi32>) -> tensor<1x2x4x3xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 3, 2, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x4x3x2xi32>
    %1 = tosa.clamp %0 {max_val = 1 : i32, min_val = 0 : i32} : (tensor<1x4x3x2xi32>) -> tensor<1x4x3x2xi32>
    %2 = tosa.transpose %1 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x4x3x2xi32>) -> tensor<1x2x4x3xi32>
    return %2 : tensor<1x2x4x3xi32>
  }
}

// -----
module {
  func.func @test_unimplemented_unknown_dim_input_nullifying_pair(%arg0: tensor<3x?xi32>) -> tensor<3x2xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<3x?xi32>) -> tensor<2x3xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<2x3xi32>) -> tensor<3x2xi32>
    return %1 : tensor<3x2xi32>
  }
}

// -----
module {
  func.func @test_unimplemented_unknown_dim_replacement_does_not_match(%arg0: tensor<3x?xi32>) -> tensor<?x?xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<3x?xi32>) -> tensor<?x3xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<?x3xi32>) -> tensor<?x?xi32>
    return %1 : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @test_unimplemented_unranked_tensors_present(%arg0: tensor<3x2xi32>) -> tensor<*xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 1>} : (tensor<3x2xi32>) -> tensor<*xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 0, 1>} : (tensor<*xi32>) -> tensor<*xi32>
    return %1 : tensor<*xi32>
  }
}

// -----
module {
  func.func @test_unimplemented_unranked_everything(%arg0: tensor<*xi32>) -> tensor<*xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<*xi32>) -> tensor<*xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<*xi32>) -> tensor<*xi32>
    return %1 : tensor<*xi32>
  }
}

// -----
module {
  func.func @test_unimplemented_static_diverges_to_one_nullifying_one_non_nullifying(%arg0: tensor<1x2x3x4xi32>, %arg1: tensor<1x2x4x3xi32>) -> tensor<1x2x3x4xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 2, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32>
    %1 = tosa.transpose %arg1 {perms = array<i32: 0, 3, 2, 1>} : (tensor<1x2x4x3xi32>) -> tensor<1x3x4x2xi32>
    %2 = tosa.clamp %0 {max_val = 1 : i32, min_val = 0 : i32} : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %3 = tosa.abs %1 : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %4 = tosa.add %2, %3 : (tensor<1x3x4x2xi32>, tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32>
    %5 = tosa.transpose %4 {perms = array<i32: 0, 3, 1, 2>} : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32>
    return %5 : tensor<1x2x3x4xi32>
  }
}

