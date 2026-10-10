module {
  func.func @test_cancel_transpose_transpose(%arg0: tensor<1x2x3xi32>) -> tensor<1x2x3xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 2, 0>} : (tensor<1x2x3xi32>) -> tensor<2x3x1xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 2, 0, 1>} : (tensor<2x3x1xi32>) -> tensor<1x2x3xi32>
    return %1 : tensor<1x2x3xi32>
  }
}

// -----
module {
  func.func @test_remove_identity_transpose(%arg0: tensor<1x2x3xi32>) -> tensor<1x2x3xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 1, 2>} : (tensor<1x2x3xi32>) -> tensor<1x2x3xi32>
    return %0 : tensor<1x2x3xi32>
  }
}

// -----
module {
  func.func @test_do_not_cancel_different_transpose(%arg0: tensor<2x3x4x5xi32>) -> tensor<5x4x3x2xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 2, 0, 3>} : (tensor<2x3x4x5xi32>) -> tensor<3x4x2x5xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 3, 1, 0, 2>} : (tensor<3x4x2x5xi32>) -> tensor<5x4x3x2xi32>
    return %1 : tensor<5x4x3x2xi32>
  }
}

// -----
module {
  func.func @test_prefer_compose_transpose(%arg0: tensor<1x2x3x4xi32>) -> tensor<4x3x2x1xi32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 2, 0, 3>} : (tensor<1x2x3x4xi32>) -> tensor<2x3x1x4xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 3, 1, 0, 2>} : (tensor<2x3x1x4xi32>) -> tensor<4x3x2x1xi32>
    return %1 : tensor<4x3x2x1xi32>
  }
}

