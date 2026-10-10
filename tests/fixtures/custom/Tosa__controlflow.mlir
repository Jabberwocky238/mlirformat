module {
}

// -----
module {
  func.func @condif_cond_type_check(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
      %1 = tosa.add %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    } else {
      %1 = tosa.sub %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @condif_block_args_check(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<f32>, tensor<f32>) -> tensor<f32> {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      %1 = tosa.add %arg3, %arg4 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    } else {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      %1 = tosa.sub %arg3, %arg4 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

