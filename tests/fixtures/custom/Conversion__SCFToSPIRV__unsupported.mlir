module {
  func.func @func(%arg0: i64) {
    %0 = arith.index_cast %arg0 : i64 to index
    %alloc = memref.alloc() : memref<16xf32>
    scf.parallel (%arg1) = (%0) to (%0) step (%0) {
      %cst = arith.constant 1.000000e+00 : f32
      memref.store %cst, %alloc[%arg1] : memref<16xf32>
      scf.reduce 
    }
    return
  }
}

