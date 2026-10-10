module {
}

// -----
module {
  func.func @test_simple(%arg0: tensor<1x1x1x1xf32>, %arg1: tensor<1x1x1x1xf32>) -> tensor<1x1x1x1xf32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<1x1x1x1xf32>, tensor<1x1x1x1xf32>) -> tensor<1x1x1x1xf32>
    return %0 : tensor<1x1x1x1xf32>
  }
}

