module {
  func.func private @zero() -> index {
    %c0 = arith.constant 0 : index
    return %c0 : index
  }
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c9 = arith.constant 9 : index
    %alloc = memref.alloc() : memref<9xf32>
    %cast = memref.cast %alloc : memref<9xf32> to memref<*xf32>
    scf.parallel (%arg0) = (%c0) to (%c9) step (%c1) {
      memref.store %cst, %alloc[%arg0] : memref<9xf32>
      scf.reduce 
    }
    scf.parallel (%arg0) = (%c0) to (%c9) step (%c1) {
      %2 = arith.index_cast %arg0 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = memref.load %alloc[%arg0] : memref<9xf32>
      %5 = arith.addf %3, %4 : f32
      memref.store %5, %alloc[%arg0] : memref<9xf32>
      scf.reduce 
    }
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    scf.parallel (%arg0) = (%c0) to (%c9) step (%c1) {
      memref.store %cst, %alloc[%arg0] : memref<9xf32>
      scf.reduce 
    }
    scf.parallel (%arg0) = (%c0) to (%c9) step (%c2) {
      %2 = arith.index_cast %arg0 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = memref.load %alloc[%arg0] : memref<9xf32>
      %5 = arith.addf %3, %4 : f32
      memref.store %5, %alloc[%arg0] : memref<9xf32>
      scf.reduce 
    }
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    scf.parallel (%arg0) = (%c0) to (%c9) step (%c1) {
      memref.store %cst, %alloc[%arg0] : memref<9xf32>
      scf.reduce 
    }
    %c-20 = arith.constant -20 : index
    %c-11 = arith.constant -11 : index
    scf.parallel (%arg0) = (%c-20) to (%c-11) step (%c3) {
      %2 = arith.index_cast %arg0 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %c20 = arith.constant 20 : index
      %4 = arith.addi %arg0, %c20 : index
      %5 = memref.load %alloc[%4] : memref<9xf32>
      %6 = arith.addf %3, %5 : f32
      memref.store %6, %alloc[%4] : memref<9xf32>
      scf.reduce 
    }
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %0 = call @zero() : () -> index
    %1 = call @zero() : () -> index
    scf.parallel (%arg0) = (%0) to (%1) step (%c1) {
      %false = arith.constant false
      cf.assert %false, "should never be executed"
      scf.reduce 
    }
    memref.dealloc %alloc : memref<9xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

