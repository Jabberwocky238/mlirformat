module {
}

// -----
module {
  func.func @test_reshape_0d_same_s2s_explicit(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = tosa.const_shape  {values = dense<> : tensor<0xindex>} : () -> !tosa.shape<0>
    %1 = tosa.reshape %arg0, %0 : (tensor<f32>, !tosa.shape<0>) -> tensor<f32>
    return %1 : tensor<f32>
  }
}

// -----
module {
  func.func @test_reshape_0d_up_s2d_auto(%arg0: tensor<f32>) -> tensor<?xf32> {
    %0 = tosa.const_shape  {values = dense<-1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<f32>, !tosa.shape<1>) -> tensor<?xf32>
    return %1 : tensor<?xf32>
  }
}

// -----
module {
  func.func @test_reshape_0d_up_s2d_explicit(%arg0: tensor<f32>) -> tensor<?xf32> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<f32>, !tosa.shape<1>) -> tensor<?xf32>
    return %1 : tensor<?xf32>
  }
}

// -----
module {
  func.func @test_reshape_0d_up_s2s_auto(%arg0: tensor<f32>) -> tensor<1xf32> {
    %0 = tosa.const_shape  {values = dense<-1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<f32>, !tosa.shape<1>) -> tensor<1xf32>
    return %1 : tensor<1xf32>
  }
}

// -----
module {
  func.func @test_reshape_0d_up_s2s_explicit(%arg0: tensor<f32>) -> tensor<1xf32> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<f32>, !tosa.shape<1>) -> tensor<1xf32>
    return %1 : tensor<1xf32>
  }
}

// -----
module {
  func.func @test_reshape_1d_down_d2s_explicit(%arg0: tensor<?xf32>) -> tensor<f32> {
    %0 = tosa.const_shape  {values = dense<> : tensor<0xindex>} : () -> !tosa.shape<0>
    %1 = tosa.reshape %arg0, %0 : (tensor<?xf32>, !tosa.shape<0>) -> tensor<f32>
    return %1 : tensor<f32>
  }
}

// -----
module {
  func.func @test_reshape_1d_down_s2s_explicit(%arg0: tensor<1xf32>) -> tensor<f32> {
    %0 = tosa.const_shape  {values = dense<> : tensor<0xindex>} : () -> !tosa.shape<0>
    %1 = tosa.reshape %arg0, %0 : (tensor<1xf32>, !tosa.shape<0>) -> tensor<f32>
    return %1 : tensor<f32>
  }
}

// -----
module {
  func.func @test_reshape_1d_up_d2d_auto(%arg0: tensor<?xf32>) -> tensor<2x?xf32> {
    %0 = tosa.const_shape  {values = dense<[2, -1]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<?xf32>, !tosa.shape<2>) -> tensor<2x?xf32>
    return %1 : tensor<2x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_1d_up_s2s_explicit(%arg0: tensor<6xf32>) -> tensor<2x3xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<6xf32>, !tosa.shape<2>) -> tensor<2x3xf32>
    return %1 : tensor<2x3xf32>
  }
}

// -----
module {
  func.func @test_reshape_2d_down_d2d_auto(%arg0: tensor<2x?xf32>) -> tensor<?xf32> {
    %0 = tosa.const_shape  {values = dense<-1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<2x?xf32>, !tosa.shape<1>) -> tensor<?xf32>
    return %1 : tensor<?xf32>
  }
}

// -----
module {
  func.func @test_reshape_2d_down_s2s_explicit(%arg0: tensor<2x3xf32>) -> tensor<6xf32> {
    %0 = tosa.const_shape  {values = dense<6> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.reshape %arg0, %0 : (tensor<2x3xf32>, !tosa.shape<1>) -> tensor<6xf32>
    return %1 : tensor<6xf32>
  }
}

// -----
module {
  func.func @test_reshape_2d_same_d2d_auto(%arg0: tensor<?x2xf32>) -> tensor<2x?xf32> {
    %0 = tosa.const_shape  {values = dense<[2, -1]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x2xf32>, !tosa.shape<2>) -> tensor<2x?xf32>
    return %1 : tensor<2x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_2d_same_s2d_auto(%arg0: tensor<2x4xf32>) -> tensor<?x2xf32> {
    %0 = tosa.const_shape  {values = dense<[-1, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<2x4xf32>, !tosa.shape<2>) -> tensor<?x2xf32>
    return %1 : tensor<?x2xf32>
  }
}

// -----
module {
  func.func @test_reshape_2d_same_s2d_explicit(%arg0: tensor<2x4xf32>) -> tensor<?x2xf32> {
    %0 = tosa.const_shape  {values = dense<[4, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<2x4xf32>, !tosa.shape<2>) -> tensor<?x2xf32>
    return %1 : tensor<?x2xf32>
  }
}

// -----
module {
  func.func @test_reshape_2d_same_s2s_explicit(%arg0: tensor<3x2xf32>) -> tensor<2x3xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<3x2xf32>, !tosa.shape<2>) -> tensor<2x3xf32>
    return %1 : tensor<2x3xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2d_auto_empty(%arg0: tensor<3x2x?xf32>) -> tensor<?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<[0, 3, -1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<3x2x?xf32>, !tosa.shape<3>) -> tensor<?x?x?xf32>
    return %1 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2d_auto(%arg0: tensor<2x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<[2, -1, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<2x?x?xf32>, !tosa.shape<3>) -> tensor<?x?x?xf32>
    return %1 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2d_auto_identity(%arg0: tensor<?x3x4xf32>) -> tensor<2x3x?xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 3, -1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x3x4xf32>, !tosa.shape<3>) -> tensor<2x3x?xf32>
    return %1 : tensor<2x3x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2d_explicit_empty(%arg0: tensor<3x2x?xf32>) -> tensor<?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<[0, 3, 2]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<3x2x?xf32>, !tosa.shape<3>) -> tensor<?x?x?xf32>
    return %1 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2d_explicit(%arg0: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 3, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x?x?xf32>, !tosa.shape<3>) -> tensor<?x?x?xf32>
    return %1 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2d_explicit_identity(%arg0: tensor<?x3x4xf32>) -> tensor<2x3x?xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 3, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x3x4xf32>, !tosa.shape<3>) -> tensor<2x3x?xf32>
    return %1 : tensor<2x3x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2s_auto(%arg0: tensor<?x?x?xf32>) -> tensor<2x3x4xf32> {
    %0 = tosa.const_shape  {values = dense<[2, -1, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x?x?xf32>, !tosa.shape<3>) -> tensor<2x3x4xf32>
    return %1 : tensor<2x3x4xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_d2s_explicit(%arg0: tensor<?x?x?xf32>) -> tensor<2x3x4xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 3, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x?x?xf32>, !tosa.shape<3>) -> tensor<2x3x4xf32>
    return %1 : tensor<2x3x4xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_same_s2s_explicit_identity(%arg0: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
    %0 = tosa.const_shape  {values = dense<[2, 3, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<2x3x4xf32>, !tosa.shape<3>) -> tensor<2x3x4xf32>
    return %1 : tensor<2x3x4xf32>
  }
}

// -----
module {
  func.func @test_reshape_3d_up_d2s_explicit(%arg0: tensor<?x?x?xf32>) -> tensor<1x3x2x1xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 3, 2, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x?x?xf32>, !tosa.shape<4>) -> tensor<1x3x2x1xf32>
    return %1 : tensor<1x3x2x1xf32>
  }
}

// -----
module {
  func.func @test_reshape_4d_down_d2s_explicit(%arg0: tensor<?x?x?x?xf32>) -> tensor<f32> {
    %0 = tosa.const_shape  {values = dense<> : tensor<0xindex>} : () -> !tosa.shape<0>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x?x?x?xf32>, !tosa.shape<0>) -> tensor<f32>
    return %1 : tensor<f32>
  }
}

// -----
module {
  func.func @test_reshape_5d_down_d2d_auto(%arg0: tensor<?x?x?x2x3xf32>) -> tensor<?x2x3xf32> {
    %0 = tosa.const_shape  {values = dense<[-1, 2, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<?x?x?x2x3xf32>, !tosa.shape<3>) -> tensor<?x2x3xf32>
    return %1 : tensor<?x2x3xf32>
  }
}

// -----
module {
  func.func @test_reshape_6d_down_d2d_auto(%arg0: tensor<1x2x?x5x7x11xf32>) -> tensor<?x5x77xf32> {
    %0 = tosa.const_shape  {values = dense<[-1, 5, 77]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<1x2x?x5x7x11xf32>, !tosa.shape<3>) -> tensor<?x5x77xf32>
    return %1 : tensor<?x5x77xf32>
  }
}

// -----
module {
  func.func @test_reshape_6d_down_s2s_auto(%arg0: tensor<1x2x3x5x7x11xf32>) -> tensor<6x5x77xf32> {
    %0 = tosa.const_shape  {values = dense<[6, 5, -1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<1x2x3x5x7x11xf32>, !tosa.shape<3>) -> tensor<6x5x77xf32>
    return %1 : tensor<6x5x77xf32>
  }
}

// -----
module {
}

// -----
module {
  func.func @reshape_bug_fix(%arg0: tensor<?xf32>) -> tensor<1x1x1x?xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 1, 1, -1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.reshape %arg0, %0 : (tensor<?xf32>, !tosa.shape<4>) -> tensor<1x1x1x?xf32>
    return %1 : tensor<1x1x1x?xf32>
  }
}

// -----
module {
  func.func @test_reshape_6d_down_s2s_explicit(%arg0: tensor<1x2x3x5x7x11xf32>) -> tensor<6x5x77xf32> {
    %0 = tosa.const_shape  {values = dense<[6, 5, 77]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.reshape %arg0, %0 : (tensor<1x2x3x5x7x11xf32>, !tosa.shape<3>) -> tensor<6x5x77xf32>
    return %1 : tensor<6x5x77xf32>
  }
}

// -----
module {
  func.func @test_reshape_samerank_unsigned(%arg0: tensor<3x2xui8>) -> tensor<2x3xui8> {
    %0 = tosa.const_shape  {values = dense<[2, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<3x2xui8>, !tosa.shape<2>) -> tensor<2x3xui8>
    return %1 : tensor<2x3xui8>
  }
}

// -----
module {
  func.func @slice(%arg0: tensor<6xf32>) {
    %0 = tosa.const_shape  {values = dense<2> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.const_shape  {values = dense<1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<6xf32>, !tosa.shape<1>, !tosa.shape<1>) -> tensor<1xf32>
    return
  }
}

// -----
module {
  func.func @slice_dyn(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %0 = tosa.const_shape  {values = dense<2> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.const_shape  {values = dense<-1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<?xf32>, !tosa.shape<1>, !tosa.shape<1>) -> tensor<?xf32>
    return %2 : tensor<?xf32>
  }
}

// -----
module {
  func.func @pad_float(%arg0: tensor<1x2xf32>) -> tensor<4x9xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<1x2xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<4x9xf32>
    return %2 : tensor<4x9xf32>
  }
}

// -----
module {
  func.func @pad_int(%arg0: tensor<1x2xi32>) -> tensor<4x9xi32> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = "tosa.const"() <{values = dense<3> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<1x2xi32>, !tosa.shape<4>, tensor<1xi32>) -> tensor<4x9xi32>
    return %2 : tensor<4x9xi32>
  }
}

// -----
module {
  func.func @pad_quant(%arg0: tensor<1x2xi32>) -> tensor<4x9xi32> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = tosa.pad %arg0, %0, %1 {input_zp = 42 : i32} : (tensor<1x2xi32>, !tosa.shape<4>, tensor<1xi32>) -> tensor<4x9xi32>
    return %2 : tensor<4x9xi32>
  }
}

// -----
module {
  func.func @pad_float_explicit(%arg0: tensor<1x2xf32>) -> tensor<4x9xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %cst = arith.constant dense<4.200000e+01> : tensor<1xf32>
    %1 = tosa.pad %arg0, %0, %cst : (tensor<1x2xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<4x9xf32>
    return %1 : tensor<4x9xf32>
  }
}

// -----
module {
  func.func @pad_dyn_input(%arg0: tensor<?x2xf32>) -> tensor<?x9xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<?x2xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<?x9xf32>
    return %2 : tensor<?x9xf32>
  }
}

// -----
module {
  func.func @pad_dyn_padding(%arg0: tensor<1x2xf32>) -> tensor<?x9xf32> {
    %0 = tosa.const_shape  {values = dense<[-1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.pad %arg0, %0, %1 : (tensor<1x2xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<?x9xf32>
    return %2 : tensor<?x9xf32>
  }
}

// -----
module {
  func.func @concat(%arg0: tensor<5x1xf32>, %arg1: tensor<6x1xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<5x1xf32>, tensor<6x1xf32>) -> tensor<11x1xf32>
    %1 = tosa.concat %arg0, %arg0 {axis = 1 : i32} : (tensor<5x1xf32>, tensor<5x1xf32>) -> tensor<5x2xf32>
    return
  }
}

// -----
module {
  func.func @concat_non_axis_dyn(%arg0: tensor<5x?xf32>, %arg1: tensor<6x?xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<5x?xf32>, tensor<6x?xf32>) -> tensor<11x?xf32>
    return
  }
}

// -----
module {
  func.func @concat_axis_dyn(%arg0: tensor<?x3xf32>, %arg1: tensor<?x3xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<?x3xf32>, tensor<?x3xf32>) -> tensor<?x3xf32>
    return
  }
}

// -----
module {
  func.func @concat_axis_dyn_mixed(%arg0: tensor<?x1xf32>, %arg1: tensor<?x1xf32>, %arg2: tensor<?x1xf32>) {
    %0 = tosa.concat %arg0, %arg1, %arg2 {axis = 0 : i32} : (tensor<?x1xf32>, tensor<?x1xf32>, tensor<?x1xf32>) -> tensor<5x1xf32>
    return
  }
}

// -----
module {
  func.func @concat_non_axis_dyn_mixed(%arg0: tensor<?x1xf32>, %arg1: tensor<?x1xf32>, %arg2: tensor<?x1xf32>) {
    %0 = tosa.concat %arg0, %arg1, %arg2 {axis = 1 : i32} : (tensor<?x1xf32>, tensor<?x1xf32>, tensor<?x1xf32>) -> tensor<5x3xf32>
    return
  }
}

// -----
module {
  func.func @pad_variable_pad_const(%arg0: tensor<2x2xi32>, %arg1: tensor<1xi32>) -> tensor<4x5xi32> {
    %0 = tosa.const_shape  {values = dense<[1, 1, 0, 3]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.pad %arg0, %0, %arg1 : (tensor<2x2xi32>, !tosa.shape<4>, tensor<1xi32>) -> tensor<4x5xi32>
    return %1 : tensor<4x5xi32>
  }
}

