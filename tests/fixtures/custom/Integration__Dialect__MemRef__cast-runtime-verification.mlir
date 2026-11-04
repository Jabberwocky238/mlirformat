module {
  func.func @cast_to_static_dim(%arg0: memref<?xf32>) -> memref<10xf32> {
    %cast = memref.cast %arg0 : memref<?xf32> to memref<10xf32>
    return %cast : memref<10xf32>
  }
  func.func @cast_to_ranked(%arg0: memref<*xf32>) -> memref<f32> {
    %cast = memref.cast %arg0 : memref<*xf32> to memref<f32>
    return %cast : memref<f32>
  }
  func.func @cast_to_static_strides(%arg0: memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>> {
    %cast = memref.cast %arg0 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[9], offset: 5>>
    return %cast : memref<?xf32, strided<[9], offset: 5>>
  }
  func.func @valid_cast(%arg0: memref<*xf32>) -> memref<?xf32> {
    %cast = memref.cast %arg0 : memref<*xf32> to memref<?xf32>
    return %cast : memref<?xf32>
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<5xf32>
    %cast = memref.cast %alloc : memref<5xf32> to memref<?xf32>
    %0 = call @cast_to_static_dim(%cast) : (memref<?xf32>) -> memref<10xf32>
    %cast_0 = memref.cast %alloc : memref<5xf32> to memref<*xf32>
    %1 = call @cast_to_ranked(%cast_0) : (memref<*xf32>) -> memref<f32>
    %cast_1 = memref.cast %alloc : memref<5xf32> to memref<?xf32, strided<[?], offset: ?>>
    %2 = call @cast_to_static_strides(%cast_1) : (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>>
    %3 = call @valid_cast(%cast_0) : (memref<*xf32>) -> memref<?xf32>
    memref.dealloc %alloc : memref<5xf32>
    return
  }
}

