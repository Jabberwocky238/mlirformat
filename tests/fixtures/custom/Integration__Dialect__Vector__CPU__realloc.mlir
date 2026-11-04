module {
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %alloc = memref.alloc() : memref<8xf32>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %5 = arith.index_cast %arg0 : index to i32
      %6 = arith.sitofp %5 : i32 to f32
      memref.store %6, %alloc[%arg0] : memref<8xf32>
    }
    %cst = arith.constant -1.000000e+00 : f32
    %0 = vector.transfer_read %alloc[%c0], %cst : memref<8xf32>, vector<8xf32>
    vector.print %0 : vector<8xf32>
    %1 = memref.realloc %alloc : memref<8xf32> to memref<10xf32>
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c8 to %c10 step %c1 {
      %5 = arith.index_cast %arg0 : index to i32
      %6 = arith.sitofp %5 : i32 to f32
      memref.store %6, %1[%arg0] : memref<10xf32>
    }
    %2 = vector.transfer_read %1[%c0], %cst : memref<10xf32>, vector<10xf32>
    vector.print %2 : vector<10xf32>
    %cast = memref.cast %1 : memref<10xf32> to memref<?xf32>
    %c13 = arith.constant 13 : index
    %3 = memref.realloc %cast(%c13) : memref<?xf32> to memref<?xf32>
    %cast_0 = memref.cast %3 : memref<?xf32> to memref<13xf32>
    scf.for %arg0 = %c10 to %c13 step %c1 {
      %5 = arith.index_cast %arg0 : index to i32
      %6 = arith.sitofp %5 : i32 to f32
      memref.store %6, %cast_0[%arg0] : memref<13xf32>
    }
    %4 = vector.transfer_read %cast_0[%c0], %cst : memref<13xf32>, vector<13xf32>
    vector.print %4 : vector<13xf32>
    memref.dealloc %cast_0 : memref<13xf32>
    return
  }
}

