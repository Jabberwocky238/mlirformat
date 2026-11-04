module {
  func.func @main() {
    %alloc = memref.alloc() : memref<13xi32>
    %cast = memref.cast %alloc : memref<13xi32> to memref<?xi32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %cast, %c0 : memref<?xi32>
    %cast_0 = memref.cast %cast : memref<?xi32> to memref<*xi32>
    gpu.host_register %cast_0 : memref<*xi32>
    %0 = call @mgpuMemGetDeviceMemRef1dInt32(%cast) : (memref<?xi32>) -> memref<?xi32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %dim, %arg10 = %c1, %arg11 = %c1) {
      %1 = arith.index_cast %arg3 : index to i32
      memref.store %1, %0[%arg3] : memref<?xi32>
      gpu.terminator
    }
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %dim, %arg10 = %c1, %arg11 = %c1) {
      %1 = arith.index_cast %arg3 : index to i32
      memref.store %1, %0[%arg3] : memref<?xi32>
      gpu.terminator
    }
    call @printMemrefI32(%cast_0) : (memref<*xi32>) -> ()
    return
  }
  func.func private @mgpuMemGetDeviceMemRef1dInt32(memref<?xi32>) -> memref<?xi32>
  func.func private @printMemrefI32(memref<*xi32>)
}

