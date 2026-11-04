module {
  func.func @loop_1d(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xf32>) {
    scf.parallel (%arg4) = (%arg0) to (%arg1) step (%arg2) {
      %cst = arith.constant 1.000000e+00 : f32
      memref.store %cst, %arg3[%arg4] : memref<?xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @loop_2d(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: memref<?x?xf32>) {
    scf.parallel (%arg7, %arg8) = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) {
      %cst = arith.constant 1.000000e+00 : f32
      memref.store %cst, %arg6[%arg7, %arg8] : memref<?x?xf32>
      scf.reduce 
    }
    return
  }
}

