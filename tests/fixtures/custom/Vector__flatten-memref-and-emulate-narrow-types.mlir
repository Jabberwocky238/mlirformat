module {
  func.func @vector_load_2d_i4(%arg0: index) -> vector<8xi4> {
    %alloc = memref.alloc() : memref<4x8xi4>
    %0 = vector.load %alloc[%arg0, %arg0] : memref<4x8xi4>, vector<8xi4>
    return %0 : vector<8xi4>
  }
}

// -----
module {
  func.func @vector_maskedload_2d_i4(%arg0: index, %arg1: vector<8xi4>) -> vector<8xi4> {
    %alloc = memref.alloc() : memref<4x8xi4>
    %0 = vector.constant_mask [6] : vector<8xi1>
    %1 = vector.maskedload %alloc[%arg0, %arg0], %0, %arg1 : memref<4x8xi4>, vector<8xi1>, vector<8xi4> into vector<8xi4>
    return %1 : vector<8xi4>
  }
}

// -----
module {
  func.func @vector_maskedstore_2d_i4(%arg0: index, %arg1: vector<8xi4>) {
    %alloc = memref.alloc() : memref<4x8xi4>
    %0 = vector.constant_mask [5] : vector<8xi1>
    vector.maskedstore %alloc[%arg0, %arg0], %0, %arg1 : memref<4x8xi4>, vector<8xi1>, vector<8xi4>
    return
  }
}

// -----
module {
  func.func @vector_store_2d_i4(%arg0: index, %arg1: vector<8xi4>) {
    %alloc = memref.alloc() : memref<4x8xi4>
    vector.store %arg1, %alloc[%arg0, %arg0] : memref<4x8xi4>, vector<8xi4>
    return
  }
}

// -----
module {
  func.func @vector_transfer_read_2d_i4(%arg0: index, %arg1: i4) -> vector<8xi4> {
    %alloc = memref.alloc() : memref<4x8xi4>
    %0 = vector.transfer_read %alloc[%arg0, %arg0], %arg1 {in_bounds = [true]} : memref<4x8xi4>, vector<8xi4>
    return %0 : vector<8xi4>
  }
}

