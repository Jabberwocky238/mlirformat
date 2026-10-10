module {
  func.func @dim_const(%arg0: memref<3x5xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<3x5xi32>
    return %dim : index
  }
}

// -----
module {
  func.func @dim_any_static(%arg0: memref<3x5xi32>, %arg1: index) -> index {
    %dim = memref.dim %arg0, %arg1 : memref<3x5xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

// -----
module {
  func.func @dim_dynamic(%arg0: memref<?x5xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x5xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

// -----
module {
  func.func @dim_any_dynamic(%arg0: memref<?x5xi32>, %arg1: index) -> index {
    %dim = memref.dim %arg0, %arg1 : memref<?x5xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

// -----
module {
  func.func @dim_some_omitting_dynamic(%arg0: memref<?x3x5xi32>, %arg1: index) -> index {
    %c1 = arith.constant 1 : index
    %0 = arith.maxsi %arg1, %c1 : index
    %dim = memref.dim %arg0, %0 : memref<?x3x5xi32>
    %1 = test.reflect_bounds %dim : index
    return %1 : index
  }
}

// -----
module {
  func.func @dim_unranked(%arg0: memref<*xi32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<*xi32>
    %0 = test.reflect_bounds %dim : index
    return %0 : index
  }
}

