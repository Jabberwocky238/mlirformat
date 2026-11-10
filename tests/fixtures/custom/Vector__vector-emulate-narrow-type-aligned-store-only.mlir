module {
  func.func @vector_store_i4_aligned_const(%arg0: vector<8xi4>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x8xi4>
    vector.store %arg0, %alloc[%arg1, %arg2] : memref<4x8xi4>, vector<8xi4>
    return
  }
}

// -----
module {
  func.func @vector_store_i4_aligned_dynamic(%arg0: vector<8xi4>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %alloc = memref.alloc(%arg1, %arg2) : memref<?x?xi4>
    vector.store %arg0, %alloc[%arg3, %arg4] : memref<?x?xi4>, vector<8xi4>
    return
  }
}

