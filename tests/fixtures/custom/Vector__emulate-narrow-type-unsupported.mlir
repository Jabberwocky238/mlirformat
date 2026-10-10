module {
  func.func @vector_load_2d_i8_negative(%arg0: index, %arg1: index) -> vector<2x4xi8> {
    %alloc = memref.alloc() : memref<3x4xi8>
    %0 = vector.load %alloc[%arg0, %arg1] : memref<3x4xi8>, vector<2x4xi8>
    return %0 : vector<2x4xi8>
  }
}

// -----
module {
  func.func @vector_transfer_read_2d_i4_negative(%arg0: index, %arg1: index) -> vector<2x8xi4> {
    %c0_i4 = arith.constant 0 : i4
    %alloc = memref.alloc() : memref<3x8xi4>
    %0 = vector.transfer_read %alloc[%arg0, %arg1], %c0_i4 {in_bounds = [true, true]} : memref<3x8xi4>, vector<2x8xi4>
    return %0 : vector<2x8xi4>
  }
}

// -----
module {
  func.func @vector_maskedload_2d_i8_negative(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<2x4xi8>) -> vector<2x4xi8> {
    %alloc = memref.alloc() : memref<3x4xi8>
    %0 = vector.create_mask %arg2, %arg2 : vector<2x4xi1>
    %1 = vector.maskedload %alloc[%arg0, %arg1], %0, %arg3 : memref<3x4xi8>, vector<2x4xi1>, vector<2x4xi8> into vector<2x4xi8>
    return %1 : vector<2x4xi8>
  }
}

// -----
module {
  func.func @vector_extract_maskedload_2d_i4_negative(%arg0: index) -> vector<8x8x16xi4> {
    %alloc = memref.alloc() : memref<8x8x16xi4>
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant dense<0> : vector<8x8x16xi4>
    %cst_0 = arith.constant dense<0> : vector<8x16xi4>
    %0 = vector.create_mask %c8, %arg0, %c16 : vector<8x8x16xi1>
    %1 = vector.extract %0[0] : vector<8x16xi1> from vector<8x8x16xi1>
    %2 = vector.maskedload %alloc[%c0, %c0, %c0], %1, %cst_0 : memref<8x8x16xi4>, vector<8x16xi1>, vector<8x16xi4> into vector<8x16xi4>
    %3 = vector.insert %2, %cst [0] : vector<8x16xi4> into vector<8x8x16xi4>
    return %3 : vector<8x8x16xi4>
  }
}

// -----
module {
  func.func @vector_store_2d_i8_negative(%arg0: vector<2x8xi8>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x8xi8>
    vector.store %arg0, %alloc[%arg1, %arg2] : memref<4x8xi8>, vector<2x8xi8>
    return
  }
}

// -----
module {
  func.func @vector_maskedstore_2d_i8_negative(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<2x8xi8>) {
    %alloc = memref.alloc() : memref<3x8xi8>
    %0 = vector.create_mask %arg2, %arg2 : vector<2x8xi1>
    vector.maskedstore %alloc[%arg0, %arg1], %0, %arg3 : memref<3x8xi8>, vector<2x8xi1>, vector<2x8xi8>
    return
  }
}

