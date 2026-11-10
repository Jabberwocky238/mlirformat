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
  func.func @loop_with_iter_args(%arg0: memref<1024xf32>, %arg1: index, %arg2: index, %arg3: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg4] : memref<1024xf32>
      %2 = arith.addf %arg5, %1 : f32
      scf.yield %2 : f32
    }
    return %0 : f32
  }
}

