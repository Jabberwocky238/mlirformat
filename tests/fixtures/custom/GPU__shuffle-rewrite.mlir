module {
  func.func @shuffleF64(%arg0: index, %arg1: f64, %arg2: i32, %arg3: i32, %arg4: memref<f64, 1>) {
    gpu.launch blocks(%arg5, %arg6, %arg7) in (%arg11 = %arg0, %arg12 = %arg0, %arg13 = %arg0) threads(%arg8, %arg9, %arg10) in (%arg14 = %arg0, %arg15 = %arg0, %arg16 = %arg0) {
      %shuffleResult, %valid = gpu.shuffle  xor %arg1, %arg2, %arg3 : f64
      memref.store %shuffleResult, %arg4[] : memref<f64, 1>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @shuffleI64(%arg0: index, %arg1: i64, %arg2: i32, %arg3: i32, %arg4: memref<i64, 1>) {
    gpu.launch blocks(%arg5, %arg6, %arg7) in (%arg11 = %arg0, %arg12 = %arg0, %arg13 = %arg0) threads(%arg8, %arg9, %arg10) in (%arg14 = %arg0, %arg15 = %arg0, %arg16 = %arg0) {
      %shuffleResult, %valid = gpu.shuffle  xor %arg1, %arg2, %arg3 : i64
      memref.store %shuffleResult, %arg4[] : memref<i64, 1>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @gpu_shuffle_unsupported(%arg0: vector<4xf16>) -> vector<4xf16> {
    %c4_i32 = arith.constant 4 : i32
    %c64_i32 = arith.constant 64 : i32
    %shuffleResult, %valid = gpu.shuffle  xor %arg0, %c4_i32, %c64_i32 : vector<4xf16>
    return %shuffleResult : vector<4xf16>
  }
}

