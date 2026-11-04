module {
  func.func @alloc() {
    %alloc = memref.alloc() : memref<999xi32>
    return
  }
  func.func @alloc_aligned() {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<999xf32>
    return
  }
  func.func @allocating_multi() {
    %alloc = memref.alloc() : memref<7x999xi32>
    return
  }
}

