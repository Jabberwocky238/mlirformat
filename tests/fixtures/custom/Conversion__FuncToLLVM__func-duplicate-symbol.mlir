module {
  func.func @dealloc_with_user_free(%arg0: memref<?xf32>) {
    memref.dealloc %arg0 : memref<?xf32>
    return
  }
  func.func private @free(!llvm.ptr)
}

