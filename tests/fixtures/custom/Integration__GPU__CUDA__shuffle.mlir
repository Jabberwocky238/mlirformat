module {
  func.func @main() {
    %alloc = memref.alloc() : memref<13xf32>
    %cast = memref.cast %alloc : memref<13xf32> to memref<?xf32>
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %cast, %c0 : memref<?xf32>
    %cast_0 = memref.cast %cast : memref<?xf32> to memref<*xf32>
    gpu.host_register %cast_0 : memref<*xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %dim, %arg10 = %c1, %arg11 = %c1) {
      %0 = arith.index_cast %arg3 : index to i32
      %1 = arith.sitofp %0 : i32 to f32
      %2 = arith.index_cast %arg9 : index to i32
      %c4_i32 = arith.constant 4 : i32
      %shuffleResult, %valid = gpu.shuffle xor %1, %c4_i32, %2 : f32
      cf.cond_br %valid, ^bb2(%shuffleResult : f32), ^bb1
    ^bb1:  // pred: ^bb0
      %cst = arith.constant -1.000000e+00 : f32
      cf.br ^bb2(%cst : f32)
    ^bb2(%3: f32):  // 2 preds: ^bb0, ^bb1
      memref.store %3, %cast[%arg3] : memref<?xf32>
      gpu.terminator
    }
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

