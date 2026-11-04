module {
  func.func @step_var(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) {
    affine.for %arg2 = 5 to 15 step 4 {
      affine.for %arg3 = 3 to 19 step 7 {
        %0 = memref.load %arg0[%arg2, %arg3] : memref<?x?xf32>
        memref.store %0, %arg1[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    return
  }
}

