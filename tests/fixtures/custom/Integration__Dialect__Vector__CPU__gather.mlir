module {
  func.func @gather8(%arg0: memref<?x?xf32>, %arg1: vector<8xi32>, %arg2: vector<8xi1>, %arg3: vector<8xf32>) -> vector<8xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0, %c0] [%arg1], %arg2, %arg3 : memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c5 = arith.constant 5 : index
    %alloc = memref.alloc(%c10, %c5) : memref<?x?xf32>
    scf.for %arg0 = %c0 to %c10 step %c1 {
      scf.for %arg1 = %c0 to %c5 step %c1 {
        %17 = arith.muli %arg0, %c10 : index
        %18 = arith.addi %arg1, %17 : index
        %19 = arith.index_cast %18 : index to i32
        %20 = arith.sitofp %19 : i32 to f32
        memref.store %20, %alloc[%arg0, %arg1] : memref<?x?xf32>
      }
    }
    %cast = memref.cast %alloc : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.broadcast %c0_i32 : i32 to vector<8xi32>
    %c16_i32 = arith.constant 16 : i32
    %1 = vector.insert %c16_i32, %0 [1] : i32 into vector<8xi32>
    %c11_i32 = arith.constant 11 : i32
    %2 = vector.insert %c11_i32, %1 [2] : i32 into vector<8xi32>
    %c33_i32 = arith.constant 33 : i32
    %3 = vector.insert %c33_i32, %2 [3] : i32 into vector<8xi32>
    %c5_i32 = arith.constant 5 : i32
    %4 = vector.insert %c5_i32, %3 [4] : i32 into vector<8xi32>
    %c44_i32 = arith.constant 44 : i32
    %5 = vector.insert %c44_i32, %4 [5] : i32 into vector<8xi32>
    %c19_i32 = arith.constant 19 : i32
    %6 = vector.insert %c19_i32, %5 [6] : i32 into vector<8xi32>
    %c22_i32 = arith.constant 22 : i32
    %7 = vector.insert %c22_i32, %6 [7] : i32 into vector<8xi32>
    %cst = arith.constant -7.000000e+00 : f32
    %8 = vector.broadcast %cst : f32 to vector<8xf32>
    %true = arith.constant true
    %9 = vector.constant_mask [0] : vector<8xi1>
    %10 = vector.constant_mask [8] : vector<8xi1>
    %11 = vector.constant_mask [4] : vector<8xi1>
    %12 = vector.insert %true, %11 [7] : i1 into vector<8xi1>
    %13 = call @gather8(%alloc, %7, %10, %8) : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %13 : vector<8xf32>
    %14 = call @gather8(%alloc, %7, %9, %8) : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %14 : vector<8xf32>
    %15 = call @gather8(%alloc, %7, %11, %8) : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %15 : vector<8xf32>
    %16 = call @gather8(%alloc, %7, %12, %8) : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    vector.print %16 : vector<8xf32>
    memref.dealloc %alloc : memref<?x?xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

