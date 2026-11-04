module {
  func.func @zero_d_alloc() -> memref<f32> {
    %alloc = memref.alloc() : memref<f32>
    return %alloc : memref<f32>
  }
}

// -----
module {
  func.func @dealloc(%arg0: memref<f32>) {
    memref.dealloc %arg0 : memref<f32>
    return
  }
}

