module {
  func.func @static_basis(%arg0: index) -> (index, index, index) {
    %0:3 = affine.delinearize_index %arg0 into (16, 224, 224) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @dynamic_basis(%arg0: index, %arg1: memref<?x?x?xf32>) -> (index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg1, %c1 : memref<?x?x?xf32>
    %dim_0 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    %0:3 = affine.delinearize_index %arg0 into (%dim, %dim_0) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @linearize_static(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.linearize_index [%arg0, %arg1, %arg2] by (2, 3, 5) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_dynamic(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> index {
    %0 = affine.linearize_index [%arg0, %arg1, %arg2] by (%arg3, %arg4) : index
    return %0 : index
  }
}

