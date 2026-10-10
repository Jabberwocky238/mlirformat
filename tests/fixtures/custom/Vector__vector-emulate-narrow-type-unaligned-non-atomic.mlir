module {
  func.func @vector_store_i2_const_index_two_partial_stores(%arg0: vector<3xi2>) {
    %alloc = memref.alloc() : memref<3x3xi2>
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    vector.store %arg0, %alloc[%c2, %c0] : memref<3x3xi2>, vector<3xi2>
    return
  }
}

// -----
module {
  func.func @vector_store_i2_two_partial_one_full_stores(%arg0: vector<7xi2>) {
    %alloc = memref.alloc() : memref<3x7xi2>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    vector.store %arg0, %alloc[%c1, %c0] : memref<3x7xi2>, vector<7xi2>
    return
  }
}

// -----
module {
  func.func @vector_store_i2_const_index_one_partial_store(%arg0: vector<1xi2>) {
    %alloc = memref.alloc() : memref<4x1xi2>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    vector.store %arg0, %alloc[%c1, %c0] : memref<4x1xi2>, vector<1xi2>
    return
  }
}

