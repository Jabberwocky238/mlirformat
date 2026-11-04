module {
  func.func private @emptyUsesValue(%arg0: memref<4xf32>) {
    %alloc = memref.alloc() : memref<4xf32>
    "test.read_buffer"(%alloc) : (memref<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @emptyUsesValue(%arg0: memref<4xf32>) {
    %alloc = memref.alloc() : memref<4xf32>
    "test.read_buffer"(%alloc) : (memref<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func private @redundantOperations(%arg0: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg0 : memref<2xf32>) out(%alloc : memref<2xf32>)
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%alloc : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    return
  }
}

// -----
module {
  func.func private @memref_in_function_results(%arg0: memref<5xf32>, %arg1: memref<10xf32>, %arg2: memref<5xf32>) -> (memref<10xf32>, memref<15xf32>) {
    %alloc = memref.alloc() : memref<15xf32>
    %alloc_0 = memref.alloc() : memref<5xf32>
    test.buffer_based in(%arg0 : memref<5xf32>) out(%alloc_0 : memref<5xf32>)
    test.copy(%alloc_0, %arg2) : (memref<5xf32>, memref<5xf32>)
    return %arg1, %alloc : memref<10xf32>, memref<15xf32>
  }
}

// -----
module {
  func.func private @private_callee(%arg0: memref<f32>) -> memref<f32> {
    %alloc = memref.alloc() : memref<f32>
    return %alloc : memref<f32>
  }
  func.func @caller() -> f32 {
    %alloc = memref.alloc() : memref<f32>
    %0 = call @private_callee(%alloc) : (memref<f32>) -> memref<f32>
    %1 = memref.load %0[] : memref<f32>
    return %1 : f32
  }
}

