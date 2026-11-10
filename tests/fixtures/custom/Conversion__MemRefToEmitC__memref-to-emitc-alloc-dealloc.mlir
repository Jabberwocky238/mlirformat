module {
  func.func @alloc_and_dealloc() {
    %alloc = memref.alloc() : memref<999xi32>
    memref.dealloc %alloc : memref<999xi32>
    return
  }
  func.func @alloc_and_dealloc_aligned() {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<999xf32>
    memref.dealloc %alloc : memref<999xf32>
    return
  }
  func.func @allocating_and_deallocating_multi() {
    %alloc = memref.alloc() : memref<7x999xi32>
    memref.dealloc %alloc : memref<7x999xi32>
    return
  }
  func.func @alloc_and_dealloc_rank0() {
    %alloc = memref.alloc() : memref<i32>
    memref.dealloc %alloc : memref<i32>
    return
  }
}

