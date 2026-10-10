module {
  func.func @reallow_lowering_example(%arg0: index, %arg1: index) -> memref<?xf32> {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    %0 = memref.realloc %alloc(%arg1) {alignment = 8 : i64} : memref<?xf32> to memref<?xf32>
    return %0 : memref<?xf32>
  }
}

// -----
module {
  func.func @reallow_lowering_example() -> memref<4xf32> {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = memref.realloc %alloc {alignment = 8 : i64} : memref<2xf32> to memref<4xf32>
    return %0 : memref<4xf32>
  }
}

// -----
module {
  func.func @reallow_lowering_example(%arg0: index) -> memref<4xf32> {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    %0 = memref.realloc %alloc : memref<?xf32> to memref<4xf32>
    return %0 : memref<4xf32>
  }
}

// -----
module {
  func.func @reallow_lowering_example(%arg0: index) -> memref<?xf32> {
    %alloc = memref.alloc() : memref<2xf32>
    %0 = memref.realloc %alloc(%arg0) : memref<2xf32> to memref<?xf32>
    return %0 : memref<?xf32>
  }
}

