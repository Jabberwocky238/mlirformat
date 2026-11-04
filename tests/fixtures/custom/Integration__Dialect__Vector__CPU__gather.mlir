module {
  func.func @gather8(%arg0: memref<?xf32>, %arg1: vector<8xi32>, %arg2: vector<8xi1>, %arg3: vector<8xf32>) -> vector<8xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %alloc = memref.alloc(%c10) : memref<?xf32>
    scf.for %arg0 = %c0 to %c10 step %c1 {
      %18 = arith.index_cast %arg0 : index to i32
      %19 = arith.sitofp %18 : i32 to f32
      memref.store %19, %alloc[%arg0] : memref<?xf32>
    }
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %c5_i32 = arith.constant 5 : i32
    %c6_i32 = arith.constant 6 : i32
    %c9_i32 = arith.constant 9 : i32
    %0 = vector.broadcast %c0_i32 : i32 to vector<8xi32>
    %1 = vector.insert %c6_i32, %0 [1] : i32 into vector<8xi32>
    %2 = vector.insert %c1_i32, %1 [2] : i32 into vector<8xi32>
    %3 = vector.insert %c3_i32, %2 [3] : i32 into vector<8xi32>
    %4 = vector.insert %c5_i32, %3 [4] : i32 into vector<8xi32>
    %5 = vector.insert %c4_i32, %4 [5] : i32 into vector<8xi32>
    %6 = vector.insert %c9_i32, %5 [6] : i32 into vector<8xi32>
    %7 = vector.insert %c2_i32, %6 [7] : i32 into vector<8xi32>
    %cst = arith.constant -7.000000e+00 : f32
    %8 = vector.broadcast %cst : f32 to vector<8xf32>
    %true = arith.constant true
    %9 = vector.constant_mask [0] : vector<8xi1>
    %10 = vector.constant_mask [8] : vector<8xi1>
    %11 = vector.constant_mask [4] : vector<8xi1>
    %12 = vector.insert %true, %11 [7] : i1 into vector<8xi1>
    %13 = call @gather8(%alloc, %7, %10, %8) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %13 : vector<8xf32>
    %14 = call @gather8(%alloc, %7, %9, %8) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %14 : vector<8xf32>
    %15 = call @gather8(%alloc, %7, %11, %8) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %15 : vector<8xf32>
    %16 = call @gather8(%alloc, %7, %12, %8) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %16 : vector<8xf32>
    %17 = call @gather8(%alloc, %7, %10, %8) : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %17 : vector<8xf32>
    memref.dealloc %alloc : memref<?xf32>
    return
  }
}

