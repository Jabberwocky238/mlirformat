module {
  func.func @compress16(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c0 = arith.constant 0 : index
    vector.compressstore %arg0[%c0], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @compress16_at8(%arg0: memref<?xf32>, %arg1: vector<16xi1>, %arg2: vector<16xf32>) {
    %c8 = arith.constant 8 : index
    vector.compressstore %arg0[%c8], %arg1, %arg2 : memref<?xf32>, vector<16xi1>, vector<16xf32>
    return
  }
  func.func @printmem16(%arg0: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<16xf32>
    %1 = scf.for %arg1 = %c0 to %c16 step %c1 iter_args(%arg2 = %0) -> (vector<16xf32>) {
      %2 = memref.load %arg0[%arg1] : memref<?xf32>
      %3 = vector.insert %2, %arg2 [%arg1] : f32 into vector<16xf32>
      scf.yield %3 : vector<16xf32>
    }
    vector.print %1 : vector<16xf32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %alloc = memref.alloc(%c16) : memref<?xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<16xf32>
    %1 = scf.for %arg0 = %c0 to %c16 step %c1 iter_args(%arg1 = %0) -> (vector<16xf32>) {
      memref.store %cst, %alloc[%arg0] : memref<?xf32>
      %11 = arith.index_cast %arg0 : index to i32
      %12 = arith.sitofp %11 : i32 to f32
      %13 = vector.insert %12, %arg1 [%arg0] : f32 into vector<16xf32>
      scf.yield %13 : vector<16xf32>
    }
    %false = arith.constant false
    %true = arith.constant true
    %2 = vector.constant_mask [0] : vector<16xi1>
    %3 = vector.constant_mask [16] : vector<16xi1>
    %4 = vector.constant_mask [4] : vector<16xi1>
    %5 = vector.insert %false, %4 [0] : i1 into vector<16xi1>
    %6 = vector.insert %true, %5 [7] : i1 into vector<16xi1>
    %7 = vector.insert %true, %6 [11] : i1 into vector<16xi1>
    %8 = vector.insert %true, %7 [13] : i1 into vector<16xi1>
    %9 = vector.insert %true, %8 [15] : i1 into vector<16xi1>
    %10 = vector.insert %false, %9 [2] : i1 into vector<16xi1>
    call @compress16(%alloc, %2, %1) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    call @printmem16(%alloc) : (memref<?xf32>) -> ()
    call @compress16(%alloc, %3, %1) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    call @printmem16(%alloc) : (memref<?xf32>) -> ()
    call @compress16(%alloc, %10, %1) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    call @printmem16(%alloc) : (memref<?xf32>) -> ()
    call @compress16(%alloc, %9, %1) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    call @printmem16(%alloc) : (memref<?xf32>) -> ()
    call @compress16(%alloc, %4, %1) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    call @printmem16(%alloc) : (memref<?xf32>) -> ()
    call @compress16_at8(%alloc, %4, %1) : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    call @printmem16(%alloc) : (memref<?xf32>) -> ()
    memref.dealloc %alloc : memref<?xf32>
    return
  }
}

