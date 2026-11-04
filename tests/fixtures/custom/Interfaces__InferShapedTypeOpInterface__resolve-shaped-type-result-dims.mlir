module {
  func.func @result_shape(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>) -> (index, index, index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %result1, %result2 = "test.op_with_result_shape_interface"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %dim = tensor.dim %result1, %c0 : tensor<?x5xf32>
    %dim_0 = tensor.dim %result1, %c1 : tensor<?x5xf32>
    %dim_1 = tensor.dim %result2, %c0 : tensor<2x3x?xf32>
    %dim_2 = tensor.dim %result2, %c1 : tensor<2x3x?xf32>
    %dim_3 = tensor.dim %result2, %c2 : tensor<2x3x?xf32>
    return %dim, %dim_0, %dim_1, %dim_2, %dim_3 : index, index, index, index, index
  }
}

// -----
module {
  func.func @reify_shaped_type_using_reify_result_shapes(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>) -> (index, index, index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %result1, %result2 = "test.reify_shaped_type_using_reify_result_shapes"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %dim = tensor.dim %result1, %c0 : tensor<?x5xf32>
    %dim_0 = tensor.dim %result1, %c1 : tensor<?x5xf32>
    %dim_1 = tensor.dim %result2, %c0 : tensor<2x3x?xf32>
    %dim_2 = tensor.dim %result2, %c1 : tensor<2x3x?xf32>
    %dim_3 = tensor.dim %result2, %c2 : tensor<2x3x?xf32>
    return %dim, %dim_0, %dim_1, %dim_2, %dim_3 : index, index, index, index, index
  }
}

// -----
module {
  func.func @reify_shaped_type_using_reify_shape_of_result(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>) -> (index, index, index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %result1, %result2 = "test.reify_shaped_type_using_reify_result_shapes"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %dim = tensor.dim %result1, %c0 : tensor<?x5xf32>
    %dim_0 = tensor.dim %result1, %c1 : tensor<?x5xf32>
    %dim_1 = tensor.dim %result2, %c0 : tensor<2x3x?xf32>
    %dim_2 = tensor.dim %result2, %c1 : tensor<2x3x?xf32>
    %dim_3 = tensor.dim %result2, %c2 : tensor<2x3x?xf32>
    return %dim, %dim_0, %dim_1, %dim_2, %dim_3 : index, index, index, index, index
  }
}

// -----
module {
  func.func @reify_shaped_type_using_reify_dim_of_result(%arg0: tensor<2x3x?xf32>, %arg1: tensor<?x5xf32>) -> (index, index, index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %result1, %result2 = "test.reify_shaped_type_using_reify_result_shapes"(%arg0, %arg1) : (tensor<2x3x?xf32>, tensor<?x5xf32>) -> (tensor<?x5xf32>, tensor<2x3x?xf32>)
    %dim = tensor.dim %result1, %c0 : tensor<?x5xf32>
    %dim_0 = tensor.dim %result1, %c1 : tensor<?x5xf32>
    %dim_1 = tensor.dim %result2, %c0 : tensor<2x3x?xf32>
    %dim_2 = tensor.dim %result2, %c1 : tensor<2x3x?xf32>
    %dim_3 = tensor.dim %result2, %c2 : tensor<2x3x?xf32>
    return %dim, %dim_0, %dim_1, %dim_2, %dim_3 : index, index, index, index, index
  }
}

// -----
module {
  func.func @test_unreifiable_result_shapes(%arg0: tensor<?x?xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = "test.unreifiable_result_shapes"(%arg0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @test_unreifiable_result_shape(%arg0: tensor<?x?xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = "test.unreifiable_result_shape"(%arg0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @test_unreifiable_dim_of_result_shape(%arg0: tensor<?x?xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = "test.unreifiable_dim_of_result_shape"(%arg0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    return %dim, %dim_0 : index, index
  }
}

