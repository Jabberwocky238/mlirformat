module {
  func.func @maskedload16(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @maskedload16_at8(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c8 = arith.constant 8 : index
    %0 = vector.maskedload %arg0[%c8], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %alloc = memref.alloc(%c16) : memref<?xf32>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %13 = arith.index_cast %arg0 : index to i32
      %14 = arith.sitofp %13 : i32 to f32
      memref.store %14, %alloc[%arg0] : memref<?xf32>
    }
    %cst = arith.constant -7.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<16xf32>
    %false = arith.constant false
    %true = arith.constant true
    %1 = vector.constant_mask [0] : vector<16xi1>
    %2 = vector.constant_mask [16] : vector<16xi1>
    %3 = vector.constant_mask [8] : vector<16xi1>
    %4 = vector.insert %false, %3 [0] : i1 into vector<16xi1>
    %5 = vector.insert %true, %4 [13] : i1 into vector<16xi1>
    %6 = vector.insert %true, %5 [14] : i1 into vector<16xi1>
    %7 = vector.insert %true, %6 [14] : i1 into vector<16xi1>
    %8 = call @maskedload16(%alloc, %1, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %8 : vector<16xf32>
    %9 = call @maskedload16(%alloc, %2, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %9 : vector<16xf32>
    %10 = call @maskedload16(%alloc, %3, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %10 : vector<16xf32>
    %11 = call @maskedload16(%alloc, %7, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %11 : vector<16xf32>
    %12 = call @maskedload16_at8(%alloc, %3, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %12 : vector<16xf32>
    memref.dealloc %alloc : memref<?xf32>
    return
  }
}

