module {
  func.func @main() {
    %alloc = memref.alloc() : memref<35xf32>
    %cast = memref.cast %alloc : memref<35xf32> to memref<?xf32>
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %cast, %c0 : memref<?xf32>
    %cast_0 = memref.cast %cast : memref<?xf32> to memref<*xf32>
    gpu.host_register %cast_0 : memref<*xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %dim, %arg10 = %c1, %arg11 = %c1) {
      %0 = arith.index_cast %arg3 : index to i32
      %1 = gpu.all_reduce  %0 uniform {
      ^bb0(%arg12: i32, %arg13: i32):
        %3 = arith.xori %arg12, %arg13 : i32
        gpu.yield %3 : i32
      } : (i32) -> i32
      %2 = arith.sitofp %1 : i32 to f32
      memref.store %2, %cast[%arg3] : memref<?xf32>
      gpu.terminator
    }
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

