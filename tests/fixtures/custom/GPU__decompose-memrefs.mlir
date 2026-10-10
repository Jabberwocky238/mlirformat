module {
  func.func @decompose_store(%arg0: f32, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg1, %c0 : memref<?x?x?xf32>
    %dim_0 = memref.dim %arg1, %c1 : memref<?x?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %dim, %arg12 = %dim_0, %arg13 = %dim_1) {
      memref.store %arg0, %arg1[%arg5, %arg6, %arg7] : memref<?x?x?xf32>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @decompose_store_strided(%arg0: f32, %arg1: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg1, %c0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %dim_0 = memref.dim %arg1, %c1 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %dim, %arg12 = %dim_0, %arg13 = %dim_1) {
      memref.store %arg0, %arg1[%arg5, %arg6, %arg7] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @decompose_load(%arg0: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?xf32>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?xf32>
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %dim, %arg11 = %dim_0, %arg12 = %dim_1) {
      %0 = memref.load %arg0[%arg4, %arg5, %arg6] : memref<?x?x?xf32>
      "test.test"(%0) : (f32) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @decompose_subview(%arg0: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?xf32>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?xf32>
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %dim, %arg11 = %dim_0, %arg12 = %dim_1) {
      %subview = memref.subview %arg0[%arg4, %arg5, %arg6] [%c2, %c2, %c2] [%c1, %c1, %c1] : memref<?x?x?xf32> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
      "test.test"(%subview) : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @decompose_subview_strided(%arg0: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?xf32>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?xf32>
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %dim, %arg11 = %dim_0, %arg12 = %dim_1) {
      %subview = memref.subview %arg0[%arg4, %arg5, %arg6] [%c2, %c2, %c2] [2, 3, 4] : memref<?x?x?xf32> to memref<?x?x?xf32, strided<[?, ?, 4], offset: ?>>
      "test.test"(%subview) : (memref<?x?x?xf32, strided<[?, ?, 4], offset: ?>>) -> ()
      gpu.terminator
    }
    return
  }
}

