module {
  func.func @delinearize_static_basis(%arg0: index) -> (index, index, index) {
    %0:3 = affine.delinearize_index %arg0 into (16, 224, 224) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @delinearize_dynamic_basis(%arg0: index, %arg1: memref<?x?x?xf32>) -> (index, index, index) {
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

// -----
module {
  func.func @linearize_dynamic_disjoint(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> index {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (%arg3, %arg4) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_sort_adds(%arg0: memref<?xi32>, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0_i32 = arith.constant 0 : i32
    scf.for %arg3 = %c0 to %arg2 step %c1 {
      scf.for %arg4 = %c0 to %c4 step %c1 {
        %0 = affine.linearize_index disjoint [%arg1, %arg4, %arg3] by (4, %arg2) : index
        memref.store %c0_i32, %arg0[%0] : memref<?xi32>
      }
    }
    return
  }
}

