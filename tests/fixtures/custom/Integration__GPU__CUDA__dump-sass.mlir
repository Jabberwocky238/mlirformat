module {
  func.func @other_func(%arg0: f32, %arg1: memref<?xf32>) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg1, %c0 : memref<?xf32>
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %dim, %arg12 = %c1, %arg13 = %c1) {
      memref.store %arg0, %arg1[%arg5] : memref<?xf32>
      gpu.terminator
    }
    return
  }
}

