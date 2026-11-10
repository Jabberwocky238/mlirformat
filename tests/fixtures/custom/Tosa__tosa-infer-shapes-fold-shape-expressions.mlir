module {
}

// -----
module {
  func.func @test_simple_shape_expression(%arg0: tensor<7x12xi32>, %arg1: tensor<80xi32>, %arg2: tensor<4xi32>) -> tensor<?xi32> {
    %0 = tosa.dim %arg1 {axis = 0 : i32} : (tensor<80xi32>) -> !tosa.shape<1>
    %1 = tosa.dim %arg2 {axis = 0 : i32} : (tensor<4xi32>) -> !tosa.shape<1>
    %2 = tosa.add_shape %0, %1 : (!tosa.shape<1>, !tosa.shape<1>) -> !tosa.shape<1>
    %3 = tosa.reshape %arg0, %2 : (tensor<7x12xi32>, !tosa.shape<1>) -> tensor<?xi32>
    %4 = tosa.dim %3 {axis = 0 : i32} : (tensor<?xi32>) -> !tosa.shape<1>
    %5 = tosa.tile %3, %4 : (tensor<?xi32>, !tosa.shape<1>) -> tensor<?xi32>
    return %5 : tensor<?xi32>
  }
}

// -----
module {
  func.func @test_cond_if_with_shape_expressions(%arg0: tensor<3xf32>, %arg1: tensor<3xf32>, %arg2: tensor<i1>) {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<3xf32>, tensor<3xf32>) -> tensor<?xf32> {
    ^bb0(%arg3: tensor<?xf32>, %arg4: tensor<?xf32>):
      %1 = tosa.dim %arg3 {axis = 0 : i32} : (tensor<?xf32>) -> !tosa.shape<1>
      %2 = tosa.reshape %arg3, %1 : (tensor<?xf32>, !tosa.shape<1>) -> tensor<?xf32>
      tosa.yield %2 : tensor<?xf32>
    } else {
    ^bb0(%arg3: tensor<?xf32>, %arg4: tensor<?xf32>):
      tosa.yield %arg4 : tensor<?xf32>
    }
    return
  }
}

// -----
module {
  func.func @test_no_fold_shape_expression(%arg0: tensor<1x?x3xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = tosa.dim %arg0 {axis = 1 : i32} : (tensor<1x?x3xf32>) -> !tosa.shape<1>
    %1 = tosa.tile %arg1, %0 : (tensor<?xf32>, !tosa.shape<1>) -> tensor<?xf32>
    return %1 : tensor<?xf32>
  }
}

