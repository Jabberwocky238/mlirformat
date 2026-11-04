module {
  func.func @while_test(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = tosa.while_loop (%arg1 = %arg0) : (tensor<i32>) -> tensor<i32> {
      %1 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32>
      %2 = tosa.greater_equal %1, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      tosa.yield %2 : tensor<i1>
    } do {
    ^bb0(%arg1: tensor<i32>):
      %1 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %2 = tosa.add %arg1, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %2 : tensor<i32>
    }
    return %0 : tensor<i32>
  }
}

// -----
module {
  func.func @if_test(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
      tosa.yield %arg0 : tensor<f32>
    } else {
      tosa.yield %arg1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @scatter_test(%arg0: tensor<3x7x5xi32>, %arg1: tensor<3x6xi32>, %arg2: tensor<3x6x5xi32>) -> tensor<3x7x5xi32> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<3x7x5xi32>, tensor<3x6xi32>, tensor<3x6x5xi32>) -> tensor<3x7x5xi32>
    return %0 : tensor<3x7x5xi32>
  }
}

