module {
  func.func @one_d_loop(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    affine.for %arg2 = 0 to 42 {
      %0 = memref.load %arg0[%arg2] : memref<?xf32>
      memref.store %0, %arg1[%arg2] : memref<?xf32>
    }
    return
  }
}

