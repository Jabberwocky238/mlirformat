module {
  func.func @copying(%arg0: memref<9x4x5x7xf32>, %arg1: memref<9x4x5x7xf32>) {
    memref.copy %arg0, %arg1 : memref<9x4x5x7xf32> to memref<9x4x5x7xf32>
    return
  }
}

// -----
module {
  func.func @copying_rank0(%arg0: memref<i32>, %arg1: memref<i32>) {
    memref.copy %arg0, %arg1 : memref<i32> to memref<i32>
    return
  }
}

