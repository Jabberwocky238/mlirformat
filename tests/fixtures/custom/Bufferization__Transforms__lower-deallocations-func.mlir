module {
  func.func @conversion_dealloc_simple(%arg0: memref<2xf32>, %arg1: i1) {
    bufferization.dealloc (%arg0 : memref<2xf32>) if (%arg1)
    return
  }
}

