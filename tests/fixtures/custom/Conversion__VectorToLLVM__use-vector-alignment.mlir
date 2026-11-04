module {
  func.func @load(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<8xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @load_with_alignment_attribute(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<8xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] {alignment = 8 : i64} : memref<200x100xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @store(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<4xf32>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<4xf32>
    return
  }
}

// -----
module {
  func.func @store_with_alignment_attribute(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<4xf32>
    vector.store %cst, %arg0[%arg1, %arg2] {alignment = 8 : i64} : memref<200x100xf32>, vector<4xf32>
    return
  }
}

// -----
module {
  func.func @masked_load(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @masked_load_with_alignment_attribute(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 {alignment = 8 : i64} : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @masked_store(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    vector.maskedstore %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
}

// -----
module {
  func.func @masked_store_with_alignment_attribute(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    vector.maskedstore %arg0[%c0], %arg1, %arg2 {alignment = 8 : i64} : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
}

// -----
module {
  func.func @scatter(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32>
    return
  }
}

// -----
module {
  func.func @scatter_with_alignment_attribute(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 {alignment = 8 : i64} : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32>
    return
  }
}

// -----
module {
  func.func @gather(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) -> vector<3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @gather_with_alignment_attribute(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) -> vector<3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 {alignment = 8 : i64} : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

