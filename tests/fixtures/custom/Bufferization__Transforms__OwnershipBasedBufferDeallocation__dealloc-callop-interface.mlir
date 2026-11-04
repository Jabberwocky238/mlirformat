module {
  func.func private @f(%arg0: memref<f64>) -> memref<f64> {
    return %arg0 : memref<f64>
  }
  func.func @function_call() {
    %alloc = memref.alloc() : memref<f64>
    %alloc_0 = memref.alloc() : memref<f64>
    %0 = call @f(%alloc) : (memref<f64>) -> memref<f64>
    test.copy(%0, %alloc_0) : (memref<f64>, memref<f64>)
    return
  }
}

// -----
module {
  func.func @f(%arg0: memref<f64>) -> memref<f64> {
    return %arg0 : memref<f64>
  }
  func.func @function_call_non_private() {
    %alloc = memref.alloc() : memref<f64>
    %alloc_0 = memref.alloc() : memref<f64>
    %0 = call @f(%alloc) : (memref<f64>) -> memref<f64>
    test.copy(%0, %alloc_0) : (memref<f64>, memref<f64>)
    return
  }
}

// -----
module {
  func.func private @f(%arg0: memref<f64>) -> memref<f64> {
    return %arg0 : memref<f64>
  }
  func.func @function_call_requries_merged_ownership_mid_block(%arg0: i1) {
    %alloc = memref.alloc() : memref<f64>
    %alloca = memref.alloca() : memref<f64>
    %0 = arith.select %arg0, %alloc, %alloca : memref<f64>
    %1 = call @f(%0) : (memref<f64>) -> memref<f64>
    test.copy(%1, %alloc) : (memref<f64>, memref<f64>)
    return
  }
}

// -----
module {
  func.func private @f(memref<f32>) -> memref<f32>
  func.func @g(%arg0: memref<f32>) -> memref<f32> {
    %0 = call @f(%arg0) : (memref<f32>) -> memref<f32>
    return %0 : memref<f32>
  }
}

// -----
module {
  func.func @func_call_indirect(%arg0: memref<?xf32>, %arg1: (memref<?xf32>) -> memref<?xf32>) {
    %0 = call_indirect %arg1(%arg0) : (memref<?xf32>) -> memref<?xf32>
    return
  }
}

