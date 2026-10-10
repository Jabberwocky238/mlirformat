module {
}

// -----
module {
  func.func @test_cond_if_isolated_from_above(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<f32>, tensor<f32>) -> tensor<f32> {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      tosa.yield %arg3 : tensor<f32>
    } else {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      tosa.yield %arg4 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @test_while_loop_isolated_from_above(%arg0: tensor<f32>, %arg1: tensor<i32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1:3 = tosa.while_loop (%arg2 = %0, %arg3 = %arg0, %arg4 = %arg1) : (tensor<i32>, tensor<f32>, tensor<i32>) -> (tensor<i32>, tensor<f32>, tensor<i32>) {
      %2 = tosa.greater_equal %arg2, %arg4 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %3 = tosa.logical_not %2 : (tensor<i1>) -> tensor<i1>
      tosa.yield %3 : tensor<i1>
    } do {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<f32>, %arg4: tensor<i32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.add %arg2, %2 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %3, %arg3, %arg4 : tensor<i32>, tensor<f32>, tensor<i32>
    }
    return
  }
}

