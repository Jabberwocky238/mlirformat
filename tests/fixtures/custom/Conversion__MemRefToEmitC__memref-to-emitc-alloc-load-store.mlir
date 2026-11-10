module {
  func.func private @memref_alloc_store(%arg0: f32, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x8xf32>
    memref.store %arg0, %alloc[%arg1, %arg2] : memref<4x8xf32>
    return
  }
  func.func private @memref_alloc_load(%arg0: index, %arg1: index) -> f32 {
    %alloc = memref.alloc() : memref<4x8xf32>
    %0 = memref.load %alloc[%arg0, %arg1] : memref<4x8xf32>
    return %0 : f32
  }
  func.func @memref_load_store(%arg0: memref<2xf32>, %arg1: memref<4x8xf32>, %arg2: index, %arg3: index) {
    %0 = memref.load %arg0[%arg2] : memref<2xf32>
    memref.store %0, %arg1[%arg2, %arg3] : memref<4x8xf32>
    return
  }
  func.func private @memref_alloc_store_rank0(%arg0: i32) {
    %alloc = memref.alloc() : memref<i32>
    memref.store %arg0, %alloc[] : memref<i32>
    return
  }
  func.func private @memref_alloc_load_rank0() -> i32 {
    %alloc = memref.alloc() : memref<i32>
    %0 = memref.load %alloc[] : memref<i32>
    return %0 : i32
  }
  func.func @memref_load_store_rank0(%arg0: memref<i32>, %arg1: memref<i32>) {
    %0 = memref.load %arg0[] : memref<i32>
    memref.store %0, %arg1[] : memref<i32>
    return
  }
}

