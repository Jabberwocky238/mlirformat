module {
  func.func @correct_variadic_operand(%arg0: tensor<f32>, %arg1: f32) {
    "test.mixed_normal_variadic_operand"(%arg0, %arg0, %arg0, %arg0, %arg0) : (tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>) -> ()
    return
  }
}

// -----
// -----
// -----
// -----
