module {
  func.func @dim_const(%arg0: tensor<3x5xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<3x5xi32>
    return %dim : index
  }
}

// -----
module {
  func.func @dim_any_static(%arg0: tensor<3x5xi32>, %arg1: index) -> index {
    %dim = tensor.dim %arg0, %arg1 : tensor<3x5xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

// -----
module {
  func.func @dim_dynamic(%arg0: tensor<?x5xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x5xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

// -----
module {
  func.func @dim_any_dynamic(%arg0: tensor<?x5xi32>, %arg1: index) -> index {
    %dim = tensor.dim %arg0, %arg1 : tensor<?x5xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

// -----
module {
  func.func @dim_some_omitting_dynamic(%arg0: tensor<?x3x5xi32>, %arg1: index) -> index {
    %c1 = arith.constant 1 : index
    %0 = arith.maxsi %arg1, %c1 : index
    %dim = tensor.dim %arg0, %0 : tensor<?x3x5xi32>
    %1 = test.reflect_bounds %dim : index
    return %1 : index
  }
}

// -----
module {
  func.func @dim_unranked(%arg0: tensor<*xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<*xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

