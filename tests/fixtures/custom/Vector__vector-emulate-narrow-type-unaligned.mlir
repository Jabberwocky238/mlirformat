module {
  func.func @vector_load_i2() -> vector<3x3xi2> {
    %alloc = memref.alloc() : memref<3x3xi2>
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant dense<0> : vector<3x3xi2>
    %0 = vector.load %alloc[%c2, %c0] : memref<3x3xi2>, vector<3xi2>
    %1 = vector.insert %0, %cst [0] : vector<3xi2> into vector<3x3xi2>
    return %1 : vector<3x3xi2>
  }
}

// -----
module {
  func.func @vector_transfer_read_i2() -> vector<3xi2> {
    %alloc = memref.alloc() : memref<3x3xi2>
    %c0_i2 = arith.constant 0 : i2
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %0 = vector.transfer_read %alloc[%c2, %c0], %c0_i2 {in_bounds = [true]} : memref<3x3xi2>, vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @vector_constant_mask_maskedload_i2(%arg0: vector<5xi2>) -> vector<5xi2> {
    %alloc = memref.alloc() : memref<3x5xi2>
    %0 = vector.constant_mask [3] : vector<5xi1>
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %1 = vector.maskedload %alloc[%c2, %c0], %0, %arg0 : memref<3x5xi2>, vector<5xi1>, vector<5xi2> into vector<5xi2>
    return %1 : vector<5xi2>
  }
}

// -----
module {
  func.func @unaligned_create_mask_dynamic_i2(%arg0: index, %arg1: vector<5xi2>) -> vector<5xi2> {
    %alloc = memref.alloc() : memref<3x5xi2>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.create_mask %arg0 : vector<5xi1>
    %1 = vector.maskedload %alloc[%c1, %c0], %0, %arg1 : memref<3x5xi2>, vector<5xi1>, vector<5xi2> into vector<5xi2>
    return %1 : vector<5xi2>
  }
}

// -----
module {
  func.func @check_unaligned_create_mask_static_i2(%arg0: vector<7xi2>) -> vector<7xi2> {
    %alloc = memref.alloc() : memref<3x7xi2>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %0 = vector.create_mask %c3 : vector<7xi1>
    %1 = vector.maskedload %alloc[%c1, %c0], %0, %arg0 : memref<3x7xi2>, vector<7xi1>, vector<7xi2> into vector<7xi2>
    return %1 : vector<7xi2>
  }
}

// -----
module {
  func.func @vector_constant_mask_maskedload_i2_multidim(%arg0: vector<5xi2>) -> vector<5xi2> {
    %alloc = memref.alloc() : memref<4x3x5xi2>
    %0 = vector.constant_mask [2, 2] : vector<3x5xi1>
    %1 = vector.extract %0[1] : vector<5xi1> from vector<3x5xi1>
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %2 = vector.maskedload %alloc[%c2, %c0, %c0], %1, %arg0 : memref<4x3x5xi2>, vector<5xi1>, vector<5xi2> into vector<5xi2>
    return %2 : vector<5xi2>
  }
}

// -----
module {
  func.func @vector_load_i2_dynamic_indexing(%arg0: index, %arg1: index) -> vector<3xi2> {
    %alloc = memref.alloc() : memref<3x3xi2>
    %cst = arith.constant dense<0> : vector<3x3xi2>
    %0 = vector.load %alloc[%arg0, %arg1] : memref<3x3xi2>, vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @vector_load_i2_dynamic_indexing_mixed(%arg0: index) -> vector<3xi2> {
    %alloc = memref.alloc() : memref<3x3xi2>
    %c2 = arith.constant 2 : index
    %cst = arith.constant dense<1> : vector<3x3xi2>
    %0 = vector.load %alloc[%arg0, %c2] : memref<3x3xi2>, vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @vector_transfer_read_i2_dynamic_indexing(%arg0: index, %arg1: index) -> vector<3xi2> {
    %alloc = memref.alloc() : memref<3x3xi2>
    %c0_i2 = arith.constant 0 : i2
    %0 = vector.transfer_read %alloc[%arg0, %arg1], %c0_i2 {in_bounds = [true]} : memref<3x3xi2>, vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @vector_transfer_read_i2_dynamic_indexing_mixed(%arg0: index) -> vector<3xi2> {
    %alloc = memref.alloc() : memref<3x3xi2>
    %c2 = arith.constant 2 : index
    %c0_i2 = arith.constant 0 : i2
    %0 = vector.transfer_read %alloc[%arg0, %c2], %c0_i2 {in_bounds = [true]} : memref<3x3xi2>, vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @vector_maskedload_i2_dynamic_indexing_mixed(%arg0: vector<3xi2>, %arg1: index) -> vector<3xi2> {
    %alloc = memref.alloc() : memref<3x3xi2>
    %cst = arith.constant dense<0> : vector<3x3xi2>
    %c2 = arith.constant 2 : index
    %0 = vector.constant_mask [3] : vector<3xi1>
    %1 = vector.maskedload %alloc[%arg1, %c2], %0, %arg0 : memref<3x3xi2>, vector<3xi1>, vector<3xi2> into vector<3xi2>
    return %1 : vector<3xi2>
  }
}

// -----
module {
  func.func @vector_maskedload_i2_constant_mask_unaligned(%arg0: vector<5xi2>) -> vector<5xi2> {
    %alloc = memref.alloc() : memref<3x5xi2>
    %cst = arith.constant dense<[false, true, true, true, false]> : vector<5xi1>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.maskedload %alloc[%c1, %c0], %cst, %arg0 : memref<3x5xi2>, vector<5xi1>, vector<5xi2> into vector<5xi2>
    return %0 : vector<5xi2>
  }
}

// -----
module {
  func.func @vector_store_i2_const_index_no_partial_store(%arg0: vector<4xi2>) {
    %alloc = memref.alloc() : memref<13xi2>
    %c4 = arith.constant 4 : index
    vector.store %arg0, %alloc[%c4] : memref<13xi2>, vector<4xi2>
    return
  }
}

// -----
module {
  func.func @vector_store_i2_const_index_two_partial_stores(%arg0: vector<4xi2>) {
    %alloc = memref.alloc() : memref<13xi2>
    %c3 = arith.constant 3 : index
    vector.store %arg0, %alloc[%c3] : memref<13xi2>, vector<4xi2>
    return
  }
}

// -----
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

