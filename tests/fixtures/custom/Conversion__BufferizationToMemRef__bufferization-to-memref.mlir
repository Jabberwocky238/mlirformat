module {
  func.func @conversion_static(%arg0: memref<2xf32>) -> memref<2xf32> {
    %0 = bufferization.clone %arg0 : memref<2xf32> to memref<2xf32>
    memref.dealloc %arg0 : memref<2xf32>
    return %0 : memref<2xf32>
  }
}

// -----
module {
  func.func @conversion_dynamic(%arg0: memref<?xf32>) -> memref<?xf32> {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<?xf32>
    memref.dealloc %arg0 : memref<?xf32>
    return %0 : memref<?xf32>
  }
}

// -----
module {
  func.func @conversion_unknown(%arg0: memref<*xf32>) -> memref<*xf32> {
    %0 = bufferization.clone %arg0 : memref<*xf32> to memref<*xf32>
    memref.dealloc %arg0 : memref<*xf32>
    return %0 : memref<*xf32>
  }
}

// -----
module {
  func.func @conversion_with_layout_map(%arg0: memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[?], offset: ?>> {
    %0 = bufferization.clone %arg0 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
    memref.dealloc %arg0 : memref<?xf32, strided<[?], offset: ?>>
    return %0 : memref<?xf32, strided<[?], offset: ?>>
  }
}

// -----
module {
  func.func @conversion_dealloc_simple(%arg0: memref<2xf32>, %arg1: i1) {
    bufferization.dealloc (%arg0 : memref<2xf32>) if (%arg1)
    return
  }
}

