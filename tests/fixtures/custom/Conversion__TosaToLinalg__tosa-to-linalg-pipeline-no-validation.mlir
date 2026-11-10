module {
  func.func @simple_abs(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
    %0 = tosa.abs %arg0 : (tensor<2x3xf32>) -> tensor<2x3xf32>
    return %0 : tensor<2x3xf32>
  }
}

