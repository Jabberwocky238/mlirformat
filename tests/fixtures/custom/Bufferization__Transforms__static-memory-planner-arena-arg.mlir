module {
}

// -----
module {
  func.func @arena_from_arg(%arg0: memref<8192xi8>) {
    %alloc = memref.alloc() : memref<1024xf32>
    memref.dealloc %alloc : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<512xf32>
    memref.dealloc %alloc_0 : memref<512xf32>
    return
  }
}

