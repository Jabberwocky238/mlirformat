module {
  func.func @test_tensor_dim_unranked(%arg0: tensor<*xf32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<*xf32>
    return %dim : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @test_no_constant_dim(%arg0: tensor<?xf64, #sparse>, %arg1: index) -> index {
    %dim = tensor.dim %arg0, %arg1 : tensor<?xf64, #sparse>
    return %dim : index
  }
}

// -----
module {
  func.func @test_tensor_dim_no_encoding(%arg0: tensor<?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @test_tensor_reshape_unranked(%arg0: tensor<*xf32>, %arg1: tensor<1xi32>) -> tensor<?xf32> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<1xi32>) -> tensor<?xf32>
    return %reshape : tensor<?xf32>
  }
}

// -----
module {
  func.func @test_tensor_reshape_no_encoding(%arg0: tensor<?x?xf32>, %arg1: tensor<1xi32>) -> tensor<?xf32> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<?x?xf32>, tensor<1xi32>) -> tensor<?xf32>
    return %reshape : tensor<?xf32>
  }
}

