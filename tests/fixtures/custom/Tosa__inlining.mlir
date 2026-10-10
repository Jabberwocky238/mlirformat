module {
  func.func @inlined_if_fn(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<f32>, tensor<f32>) -> tensor<f32> {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      %1 = func.call @add(%arg3, %arg4) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    } else {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      %1 = func.call @sub(%arg3, %arg4) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
  func.func private @add(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func private @sub(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = tosa.sub %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @inlined_while_fn(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<10xi32>) -> tensor<10xi32> {
    %0:4 = tosa.while_loop (%arg4 = %arg0, %arg5 = %arg1, %arg6 = %arg2, %arg7 = %arg3) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) {
      %1 = func.call @while_cond_40(%arg4, %arg5, %arg6, %arg7) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> tensor<i1>
      tosa.yield %1 : tensor<i1>
    } do {
    ^bb0(%arg4: tensor<i32>, %arg5: tensor<i32>, %arg6: tensor<i32>, %arg7: tensor<10xi32>):
      %1:4 = func.call @while_body_50(%arg4, %arg5, %arg6, %arg7) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>)
      tosa.yield %1#0, %1#1, %1#2, %1#3 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>
    }
    return %0#3 : tensor<10xi32>
  }
  func.func private @while_body_50(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<10xi32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) {
    %0 = tosa.add %arg0, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    %1 = tosa.const_shape  {values = dense<1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %2 = tosa.reshape %0, %1 : (tensor<i32>, !tosa.shape<1>) -> tensor<1xi32>
    %3 = tosa.add %arg3, %2 : (tensor<10xi32>, tensor<1xi32>) -> tensor<10xi32>
    return %0, %arg1, %arg2, %3 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>
  }
  func.func private @while_cond_40(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<10xi32>) -> tensor<i1> {
    %0 = tosa.greater_equal %arg0, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
    %1 = tosa.logical_not %0 : (tensor<i1>) -> tensor<i1>
    return %1 : tensor<i1>
  }
}

