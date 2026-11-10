module {
  func.func private @add(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>) -> tensor<2xf32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>
    return %0 : tensor<2xf32>
  }
}

