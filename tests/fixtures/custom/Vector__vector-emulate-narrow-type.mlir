module {
  func.func @vector_load_i8(%arg0: index, %arg1: index) -> vector<4xi8> {
    %alloc = memref.alloc() : memref<3x4xi8>
    %0 = vector.load %alloc[%arg0, %arg1] : memref<3x4xi8>, vector<4xi8>
    return %0 : vector<4xi8>
  }
}

// -----
module {
  func.func @vector_load_i4(%arg0: index, %arg1: index) -> vector<3x8xi4> {
    %alloc = memref.alloc() : memref<3x8xi4>
    %cst = arith.constant dense<0> : vector<3x8xi4>
    %0 = vector.load %alloc[%arg0, %arg1] : memref<3x8xi4>, vector<8xi4>
    %1 = vector.insert %0, %cst [0] : vector<8xi4> into vector<3x8xi4>
    return %1 : vector<3x8xi4>
  }
}

// -----
module {
  func.func @vector_load_f4(%arg0: index, %arg1: index) -> vector<3x8xf4E2M1FN> {
    %alloc = memref.alloc() : memref<3x8xf4E2M1FN>
    %cst = arith.constant dense<0.000000e+00> : vector<3x8xf4E2M1FN>
    %0 = vector.load %alloc[%arg0, %arg1] : memref<3x8xf4E2M1FN>, vector<8xf4E2M1FN>
    %1 = vector.insert %0, %cst [0] : vector<8xf4E2M1FN> into vector<3x8xf4E2M1FN>
    return %1 : vector<3x8xf4E2M1FN>
  }
}

// -----
module {
  func.func @vector_load_i4_dynamic(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> vector<8xi4> {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xi4>
    %0 = vector.load %alloc[%arg2, %arg3] : memref<?x?xi4>, vector<8xi4>
    return %0 : vector<8xi4>
  }
}

// -----
module {
  func.func @vector_transfer_read_i4(%arg0: index, %arg1: index) -> vector<8xi4> {
    %c0_i4 = arith.constant 0 : i4
    %alloc = memref.alloc() : memref<3x8xi4>
    %0 = vector.transfer_read %alloc[%arg0, %arg1], %c0_i4 {in_bounds = [true]} : memref<3x8xi4>, vector<8xi4>
    return %0 : vector<8xi4>
  }
}

// -----
module {
  func.func @vector_transfer_read_f4(%arg0: index, %arg1: index) -> vector<8xf4E2M1FN> {
    %cst = arith.constant 0.000000e+00 : f4E2M1FN
    %alloc = memref.alloc() : memref<3x8xf4E2M1FN>
    %0 = vector.transfer_read %alloc[%arg0, %arg1], %cst {in_bounds = [true]} : memref<3x8xf4E2M1FN>, vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
}

// -----
module {
  func.func @vector_maskedload_i8(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<4xi8>) -> vector<4xi8> {
    %alloc = memref.alloc() : memref<3x4xi8>
    %0 = vector.create_mask %arg2 : vector<4xi1>
    %1 = vector.maskedload %alloc[%arg0, %arg1], %0, %arg3 : memref<3x4xi8>, vector<4xi1>, vector<4xi8> into vector<4xi8>
    return %1 : vector<4xi8>
  }
}

// -----
module {
  func.func @vector_maskedload_i4(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<8xi4>) -> vector<3x8xi4> {
    %alloc = memref.alloc() : memref<3x8xi4>
    %cst = arith.constant dense<0> : vector<3x8xi4>
    %0 = vector.create_mask %arg2 : vector<8xi1>
    %1 = vector.maskedload %alloc[%arg0, %arg1], %0, %arg3 : memref<3x8xi4>, vector<8xi1>, vector<8xi4> into vector<8xi4>
    %2 = vector.insert %1, %cst [0] : vector<8xi4> into vector<3x8xi4>
    return %2 : vector<3x8xi4>
  }
}

// -----
module {
  func.func @vector_maskedload_i8_constant_mask(%arg0: index, %arg1: index, %arg2: vector<4xi8>) -> vector<4xi8> {
    %alloc = memref.alloc() : memref<3x4xi8>
    %0 = vector.constant_mask [2] : vector<4xi1>
    %1 = vector.maskedload %alloc[%arg0, %arg1], %0, %arg2 : memref<3x4xi8>, vector<4xi1>, vector<4xi8> into vector<4xi8>
    return %1 : vector<4xi8>
  }
}

// -----
module {
  func.func @vector_maskedload_i4_constant_mask(%arg0: index, %arg1: index, %arg2: vector<8xi4>) -> vector<3x8xi4> {
    %alloc = memref.alloc() : memref<3x8xi4>
    %cst = arith.constant dense<0> : vector<3x8xi4>
    %0 = vector.constant_mask [4] : vector<8xi1>
    %1 = vector.maskedload %alloc[%arg0, %arg1], %0, %arg2 : memref<3x8xi4>, vector<8xi1>, vector<8xi4> into vector<8xi4>
    %2 = vector.insert %1, %cst [0] : vector<8xi4> into vector<3x8xi4>
    return %2 : vector<3x8xi4>
  }
}

// -----
module {
  func.func @vector_maskedload_i4_arith_constant(%arg0: vector<8xi4>) -> vector<8xi4> {
    %alloc = memref.alloc() : memref<3x8xi4>
    %cst = arith.constant dense<0> : vector<8xi4>
    %cst_0 = arith.constant dense<[false, true, true, true, true, false, false, false]> : vector<8xi1>
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %alloc[%c0, %c0], %cst_0, %arg0 : memref<3x8xi4>, vector<8xi1>, vector<8xi4> into vector<8xi4>
    return %0 : vector<8xi4>
  }
  func.func @vector_extract_maskedload_i4(%arg0: index) -> vector<8x8x16xi4> {
    %alloc = memref.alloc() : memref<8x8x16xi4>
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant dense<0> : vector<8x8x16xi4>
    %cst_0 = arith.constant dense<0> : vector<16xi4>
    %0 = vector.create_mask %c8, %arg0, %c16 : vector<8x8x16xi1>
    %1 = vector.extract %0[0] : vector<8x16xi1> from vector<8x8x16xi1>
    %2 = vector.extract %1[0] : vector<16xi1> from vector<8x16xi1>
    %3 = vector.maskedload %alloc[%c0, %c0, %c0], %2, %cst_0 : memref<8x8x16xi4>, vector<16xi1>, vector<16xi4> into vector<16xi4>
    %4 = vector.insert %3, %cst [0, 0] : vector<16xi4> into vector<8x8x16xi4>
    return %4 : vector<8x8x16xi4>
  }
}

// -----
module {
  func.func @vector_extract_cst_maskedload_i4() -> vector<8x8x16xi4> {
    %alloc = memref.alloc() : memref<8x8x16xi4>
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0> : vector<8x8x16xi4>
    %cst_0 = arith.constant dense<0> : vector<16xi4>
    %0 = vector.constant_mask [8, 4, 16] : vector<8x8x16xi1>
    %1 = vector.extract %0[0] : vector<8x16xi1> from vector<8x8x16xi1>
    %2 = vector.extract %1[0] : vector<16xi1> from vector<8x16xi1>
    %3 = vector.maskedload %alloc[%c0, %c0, %c0], %2, %cst_0 : memref<8x8x16xi4>, vector<16xi1>, vector<16xi4> into vector<16xi4>
    %4 = vector.insert %3, %cst [0, 0] : vector<16xi4> into vector<8x8x16xi4>
    return %4 : vector<8x8x16xi4>
  }
}

// -----
module {
  func.func @vector_store_i8(%arg0: vector<8xi8>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x8xi8>
    vector.store %arg0, %alloc[%arg1, %arg2] : memref<4x8xi8>, vector<8xi8>
    return
  }
}

// -----
module {
  func.func @vector_store_i4(%arg0: vector<8xi4>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x8xi4>
    vector.store %arg0, %alloc[%arg1, %arg2] : memref<4x8xi4>, vector<8xi4>
    return
  }
}

// -----
module {
  func.func @vector_store_f4(%arg0: vector<8xf4E2M1FN>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x8xf4E2M1FN>
    vector.store %arg0, %alloc[%arg1, %arg2] : memref<4x8xf4E2M1FN>, vector<8xf4E2M1FN>
    return
  }
}

// -----
module {
  func.func @vector_store_i4_dynamic(%arg0: vector<8xi4>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %alloc = memref.alloc(%arg1, %arg2) : memref<?x?xi4>
    vector.store %arg0, %alloc[%arg3, %arg4] : memref<?x?xi4>, vector<8xi4>
    return
  }
}

// -----
module {
  func.func @vector_maskedstore_i8(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<8xi8>) {
    %alloc = memref.alloc() : memref<3x8xi8>
    %0 = vector.create_mask %arg2 : vector<8xi1>
    vector.maskedstore %alloc[%arg0, %arg1], %0, %arg3 : memref<3x8xi8>, vector<8xi1>, vector<8xi8>
    return
  }
}

// -----
module {
  func.func @vector_maskedstore_i4(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<8xi4>) {
    %alloc = memref.alloc() : memref<3x8xi4>
    %0 = vector.create_mask %arg2 : vector<8xi1>
    vector.maskedstore %alloc[%arg0, %arg1], %0, %arg3 : memref<3x8xi4>, vector<8xi1>, vector<8xi4>
    return
  }
}

// -----
module {
  func.func @vector_maskedstore_i8_constant_mask(%arg0: index, %arg1: index, %arg2: vector<8xi8>) {
    %alloc = memref.alloc() : memref<3x8xi8>
    %0 = vector.constant_mask [4] : vector<8xi1>
    vector.maskedstore %alloc[%arg0, %arg1], %0, %arg2 : memref<3x8xi8>, vector<8xi1>, vector<8xi8>
    return
  }
}

// -----
module {
  func.func @vector_maskedstore_i4_constant_mask(%arg0: index, %arg1: index, %arg2: vector<8xi4>) {
    %alloc = memref.alloc() : memref<3x8xi4>
    %0 = vector.constant_mask [4] : vector<8xi1>
    vector.maskedstore %alloc[%arg0, %arg1], %0, %arg2 : memref<3x8xi4>, vector<8xi1>, vector<8xi4>
    return
  }
}

// -----
module {
  func.func @vector_maskedstore_i4_arith_constant(%arg0: vector<8xi4>) {
    %alloc = memref.alloc() : memref<5x8xi4>
    %cst = arith.constant dense<0> : vector<8xi4>
    %cst_0 = arith.constant dense<[false, true, true, true, true, true, false, false]> : vector<8xi1>
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    vector.maskedstore %alloc[%c3, %c0], %cst_0, %arg0 : memref<5x8xi4>, vector<8xi1>, vector<8xi4>
    return
  }
}

