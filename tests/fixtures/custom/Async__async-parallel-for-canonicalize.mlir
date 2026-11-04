module {
  func.func @loop_1d(%arg0: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg1) = (%c0) to (%c100) step (%c1) {
      %cst = arith.constant 1.000000e+00 : f32
      memref.store %cst, %arg0[%arg1] : memref<?xf32>
      scf.reduce 
    }
    return
  }
}

