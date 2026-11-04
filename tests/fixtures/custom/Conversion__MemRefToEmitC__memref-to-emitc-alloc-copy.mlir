module {
  func.func @alloc_copy(%arg0: memref<999xi32>) {
    %alloc = memref.alloc() : memref<999xi32>
    memref.copy %arg0, %alloc : memref<999xi32> to memref<999xi32>
    %alloc_0 = memref.alloc() : memref<999xi32>
    memref.copy %arg0, %alloc_0 : memref<999xi32> to memref<999xi32>
    return
  }
}

