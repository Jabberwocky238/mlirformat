module {
  func.func private @single_buffer_return(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32, %arg2: index) -> memref<?xf32, strided<[?], offset: ?>> {
    memref.store %arg1, %arg0[%arg2] : memref<?xf32, strided<[?], offset: ?>>
    return %arg0 : memref<?xf32, strided<[?], offset: ?>>
  }
  func.func @caller(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32, %arg2: index) -> f32 {
    %0 = call @single_buffer_return(%arg0, %arg1, %arg2) : (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>>
    %1 = memref.load %0[%arg2] : memref<?xf32, strided<[?], offset: ?>>
    return %1 : f32
  }
}

// -----
module {
  func.func private @multiple_buffer_returns(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?x?xf32>, %arg2: f32, %arg3: index) -> (memref<?x?xf32>, memref<?xf32, strided<[?], offset: ?>>) {
    memref.store %arg2, %arg0[%arg3] : memref<?xf32, strided<[?], offset: ?>>
    memref.store %arg2, %arg1[%arg3, %arg3] : memref<?x?xf32>
    return %arg1, %arg0 : memref<?x?xf32>, memref<?xf32, strided<[?], offset: ?>>
  }
}

// -----
module {
  func.func private @multiple_mixed_returns(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?x?xf32>, %arg2: f32, %arg3: index) -> (memref<?x?xf32>, i32, memref<?xf32, strided<[?], offset: ?>>) {
    memref.store %arg2, %arg0[%arg3] : memref<?xf32, strided<[?], offset: ?>>
    memref.store %arg2, %arg1[%arg3, %arg3] : memref<?x?xf32>
    %c1_i32 = arith.constant 1 : i32
    return %arg1, %c1_i32, %arg0 : memref<?x?xf32>, i32, memref<?xf32, strided<[?], offset: ?>>
  }
}

// -----
module {
  func.func @public_function(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32, %arg2: index) -> memref<?xf32, strided<[?], offset: ?>> {
    memref.store %arg1, %arg0[%arg2] : memref<?xf32, strided<[?], offset: ?>>
    return %arg0 : memref<?xf32, strided<[?], offset: ?>>
  }
  func.func @caller(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32, %arg2: index) -> f32 {
    %0 = call @public_function(%arg0, %arg1, %arg2) : (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>>
    %1 = memref.load %0[%arg2] : memref<?xf32, strided<[?], offset: ?>>
    return %1 : f32
  }
}

// -----
module {
  func.func private @negative_external_function(memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[?], offset: ?>>
}

