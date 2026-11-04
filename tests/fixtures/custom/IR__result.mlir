module {
  func.func @correct_variadic_result() -> tensor<f32> {
    %output1:2, %output2, %output3:2 = "test.mixed_normal_variadic_result"() : () -> (tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>)
    return %output3#1 : tensor<f32>
  }
}

// -----
// -----
// -----
