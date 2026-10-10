module {
}

// -----
module {
  func.func @test_argmax(%arg0: tensor<?xf32>) -> tensor<i32> {
    %0 = tosa.argmax %arg0 {axis = 0 : i32} : (tensor<?xf32>) -> tensor<i32>
    return %0 : tensor<i32>
  }
}

