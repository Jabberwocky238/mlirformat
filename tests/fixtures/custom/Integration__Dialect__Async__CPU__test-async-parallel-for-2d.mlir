module {
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %c8_0 = arith.constant 8 : index
    %alloc = memref.alloc() : memref<8x8xf32>
    %cast = memref.cast %alloc : memref<8x8xf32> to memref<*xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8_0, %c8_0) step (%c1, %c1) {
      memref.store %cst, %alloc[%arg0, %arg1] : memref<8x8xf32>
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8_0, %c8_0) step (%c1, %c1) {
      %0 = arith.muli %arg0, %c8 : index
      %1 = arith.addi %arg1, %0 : index
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = memref.load %alloc[%arg0, %arg1] : memref<8x8xf32>
      %5 = arith.addf %3, %4 : f32
      memref.store %5, %alloc[%arg0, %arg1] : memref<8x8xf32>
      scf.reduce 
    }
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8_0, %c8_0) step (%c1, %c1) {
      memref.store %cst, %alloc[%arg0, %arg1] : memref<8x8xf32>
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8_0, %c8_0) step (%c2, %c1) {
      %0 = arith.muli %arg0, %c8 : index
      %1 = arith.addi %arg1, %0 : index
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = memref.load %alloc[%arg0, %arg1] : memref<8x8xf32>
      %5 = arith.addf %3, %4 : f32
      memref.store %5, %alloc[%arg0, %arg1] : memref<8x8xf32>
      scf.reduce 
    }
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8_0, %c8_0) step (%c1, %c1) {
      memref.store %cst, %alloc[%arg0, %arg1] : memref<8x8xf32>
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c8_0, %c8_0) step (%c1, %c2) {
      %0 = arith.muli %arg0, %c8 : index
      %1 = arith.addi %arg1, %0 : index
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = memref.load %alloc[%arg0, %arg1] : memref<8x8xf32>
      %5 = arith.addf %3, %4 : f32
      memref.store %5, %alloc[%arg0, %arg1] : memref<8x8xf32>
      scf.reduce 
    }
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<8x8xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

