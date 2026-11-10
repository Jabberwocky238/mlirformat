module {
  func.func @test_gather_i8_i32(%arg0: tensor<13x27x3xi8>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi8> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x27x3xi8>, tensor<13x26xi32>) -> tensor<13x26x3xi8>
    return %0 : tensor<13x26x3xi8>
  }
}

// -----
module {
  func.func @test_scatter_i8_i32(%arg0: tensor<13x27x3xi8>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi8>) -> tensor<13x27x3xi8> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x27x3xi8>, tensor<13x26xi32>, tensor<13x26x3xi8>) -> tensor<13x27x3xi8>
    return %0 : tensor<13x27x3xi8>
  }
}

