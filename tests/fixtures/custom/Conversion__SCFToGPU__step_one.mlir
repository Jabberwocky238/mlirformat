module {
  func.func @step_1(%arg0: memref<?x?x?x?xf32>, %arg1: memref<?x?x?x?xf32>) {
    affine.for %arg2 = 0 to 42 {
      affine.for %arg3 = 0 to 10 {
        affine.for %arg4 = 2 to 16 {
          affine.for %arg5 = 5 to 17 {
            %0 = memref.load %arg0[%arg2, %arg3, %arg4, %arg5] : memref<?x?x?x?xf32>
            memref.store %0, %arg1[%arg2, %arg3, %arg4, %arg5] : memref<?x?x?x?xf32>
          }
        }
      }
    }
    return
  }
}

