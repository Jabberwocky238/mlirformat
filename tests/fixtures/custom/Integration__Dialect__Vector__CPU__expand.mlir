module {
  func.func @expand16(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.expandload %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @expand16_at8(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %c8 = arith.constant 8 : index
    %0 = vector.expandload %arg0[%c8], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %alloc = memref.alloc(%c16) : memref<?xf32>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %20 = arith.index_cast %arg0 : index to i32
      %21 = arith.sitofp %20 : i32 to f32
      memref.store %21, %alloc[%arg0] : memref<?xf32>
    }
    %cst = arith.constant -7.000000e+00 : f32
    %cst_0 = arith.constant 7.6999998 : f32
    %0 = vector.broadcast %cst : f32 to vector<16xf32>
    %false = arith.constant false
    %true = arith.constant true
    %1 = vector.constant_mask [0] : vector<16xi1>
    %2 = vector.constant_mask [16] : vector<16xi1>
    %3 = vector.constant_mask [4] : vector<16xi1>
    %4 = vector.insert %false, %3 [0] : i1 into vector<16xi1>
    %5 = vector.insert %true, %4 [7] : i1 into vector<16xi1>
    %6 = vector.insert %true, %5 [11] : i1 into vector<16xi1>
    %7 = vector.insert %true, %6 [13] : i1 into vector<16xi1>
    %8 = vector.insert %true, %7 [15] : i1 into vector<16xi1>
    %9 = vector.insert %false, %8 [2] : i1 into vector<16xi1>
    %10 = call @expand16(%alloc, %1, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %10 : vector<16xf32>
    %11 = call @expand16(%alloc, %2, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %11 : vector<16xf32>
    %12 = call @expand16(%alloc, %3, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %12 : vector<16xf32>
    %13 = call @expand16(%alloc, %8, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %13 : vector<16xf32>
    %14 = call @expand16(%alloc, %9, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %14 : vector<16xf32>
    %15 = vector.insert %cst_0, %0 [1] : f32 into vector<16xf32>
    %16 = vector.insert %cst_0, %15 [2] : f32 into vector<16xf32>
    %17 = vector.insert %cst_0, %16 [14] : f32 into vector<16xf32>
    %18 = call @expand16(%alloc, %9, %17) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %18 : vector<16xf32>
    %19 = call @expand16_at8(%alloc, %3, %0) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    vector.print %19 : vector<16xf32>
    memref.dealloc %alloc : memref<?xf32>
    return
  }
}

