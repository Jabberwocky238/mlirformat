module {
  func.func @copying(%arg0: memref<9x4x5x7xf32>, %arg1: memref<9x4x5x7xf32>) {
    memref.copy %arg0, %arg1 : memref<9x4x5x7xf32> to memref<9x4x5x7xf32>
    return
  }
}

