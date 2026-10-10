module {
  func.func @vector_maskedload(%arg0: memref<4x5xf32>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = vector.create_mask %c1 : vector<4xi1>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = vector.broadcast %cst : f32 to vector<4xf32>
    %2 = vector.maskedload %arg0[%c0, %c4], %0, %1 : memref<4x5xf32>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %2 : vector<4xf32>
  }
  func.func @vector_maskedload_with_alignment(%arg0: memref<4x5xf32>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = vector.create_mask %c1 : vector<4xi1>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = vector.broadcast %cst : f32 to vector<4xf32>
    %2 = vector.maskedload %arg0[%c0, %c4], %0, %1 {alignment = 8 : i64} : memref<4x5xf32>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %2 : vector<4xf32>
  }
  func.func @vector_maskedstore(%arg0: memref<4x5xf32>, %arg1: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = vector.create_mask %c1 : vector<4xi1>
    vector.maskedstore %arg0[%c0, %c4], %0, %arg1 : memref<4x5xf32>, vector<4xi1>, vector<4xf32>
    return
  }
  func.func @vector_maskedstore_with_alignment(%arg0: memref<4x5xf32>, %arg1: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = vector.create_mask %c1 : vector<4xi1>
    vector.maskedstore %arg0[%c0, %c4], %0, %arg1 {alignment = 8 : i64} : memref<4x5xf32>, vector<4xi1>, vector<4xf32>
    return
  }
  func.func @vector_maskedload_rank0(%arg0: memref<f32>, %arg1: vector<1xi1>, %arg2: vector<1xf32>) -> vector<1xf32> {
    %0 = vector.maskedload %arg0[], %arg1, %arg2 : memref<f32>, vector<1xi1>, vector<1xf32> into vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @vector_maskedstore_rank0(%arg0: memref<f32>, %arg1: vector<1xi1>, %arg2: vector<1xf32>) {
    vector.maskedstore %arg0[], %arg1, %arg2 : memref<f32>, vector<1xi1>, vector<1xf32>
    return
  }
}

