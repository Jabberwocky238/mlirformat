module {
  func.func @rectangular(%arg0: memref<?x?xf32>) {
    %c2 = arith.constant 2 : index
    %c44 = arith.constant 44 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c2 to %c44 step %c1 {
      scf.for %arg2 = %c1 to %c44 step %c2 {
        %0 = memref.load %arg0[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    return
  }
  func.func @triangular(%arg0: memref<?x?xf32>) {
    %c2 = arith.constant 2 : index
    %c44 = arith.constant 44 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c2 to %c44 step %c1 {
      scf.for %arg2 = %c1 to %arg1 step %c2 {
        %0 = memref.load %arg0[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    return
  }
}

