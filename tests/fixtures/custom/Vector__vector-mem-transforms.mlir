module {
  func.func @fold_maskedload_all_true_dynamic(%arg0: memref<?xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    %1 = vector.maskedload %arg0[%c0], %0, %arg1 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @fold_maskedload_all_true_static(%arg0: memref<16xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    %1 = vector.maskedload %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @fold_maskedload_all_false_static(%arg0: memref<16xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [0] : vector<16xi1>
    %1 = vector.maskedload %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @fold_maskedload_dynamic_non_zero_idx(%arg0: memref<?xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c8 = arith.constant 8 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    %1 = vector.maskedload %arg0[%c8], %0, %arg1 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @fold_maskedstore_all_true(%arg0: memref<16xf32>, %arg1: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    vector.maskedstore %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @fold_maskedstore_all_false(%arg0: memref<16xf32>, %arg1: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [0] : vector<16xi1>
    vector.maskedstore %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @no_fold_gather_all_true(%arg0: memref<16xf32>, %arg1: vector<16xi32>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    %1 = vector.gather %arg0[%c0] [%arg1], %0, %arg2 : memref<16xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @fold_gather_all_true(%arg0: memref<16xf32>, %arg1: vector<16xi32>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [0] : vector<16xi1>
    %1 = vector.gather %arg0[%c0] [%arg1], %0, %arg2 : memref<16xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @no_fold_scatter_all_true(%arg0: memref<16xf32>, %arg1: vector<16xi32>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    vector.scatter %arg0[%c0] [%arg1], %0, %arg2 : memref<16xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @fold_scatter_all_false(%arg0: memref<16xf32>, %arg1: vector<16xi32>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.type_cast %arg0 : memref<16xf32> to memref<vector<16xf32>>
    %1 = vector.constant_mask [0] : vector<16xi1>
    vector.scatter %arg0[%c0] [%arg1], %1, %arg2 : memref<16xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @fold_expandload_all_true(%arg0: memref<16xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    %1 = vector.expandload %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @fold_expandload_all_false(%arg0: memref<16xf32>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [0] : vector<16xi1>
    %1 = vector.expandload %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @fold_compressstore_all_true(%arg0: memref<16xf32>, %arg1: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<16xi1>
    vector.compressstore %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @fold_compressstore_all_false(%arg0: memref<16xf32>, %arg1: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [0] : vector<16xi1>
    vector.compressstore %arg0[%c0], %0, %arg1 : memref<16xf32>, vector<16xi1>, vector<16xf32>
    return
  }
}

