module {
  func.func @vecadd(%arg0: memref<5xf32>, %arg1: memref<5xf32>, %arg2: memref<5xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    gpu.launch blocks(%arg3, %arg4, %arg5) in (%arg9 = %c1, %arg10 = %c1, %arg11 = %c1) threads(%arg6, %arg7, %arg8) in (%arg12 = %c5, %arg13 = %c1, %arg14 = %c1) {
      %0 = memref.load %arg0[%arg6] : memref<5xf32>
      %1 = memref.load %arg1[%arg6] : memref<5xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg2[%arg6] : memref<5xf32>
      gpu.terminator
    }
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    %cst = arith.constant 1.230000e+00 : f32
    %alloc = memref.alloc() : memref<5xf32>
    %alloc_0 = memref.alloc() : memref<5xf32>
    %alloc_1 = memref.alloc() : memref<5xf32>
    %cast = memref.cast %alloc : memref<5xf32> to memref<?xf32>
    %cast_2 = memref.cast %alloc_0 : memref<5xf32> to memref<?xf32>
    %cast_3 = memref.cast %alloc_1 : memref<5xf32> to memref<?xf32>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      memref.store %cst, %cast[%arg0] : memref<?xf32>
      memref.store %cst, %cast_2[%arg0] : memref<?xf32>
    }
    %cast_4 = memref.cast %cast : memref<?xf32> to memref<*xf32>
    %cast_5 = memref.cast %cast_2 : memref<?xf32> to memref<*xf32>
    %cast_6 = memref.cast %cast_3 : memref<?xf32> to memref<*xf32>
    gpu.host_register %cast_4 : memref<*xf32>
    gpu.host_register %cast_5 : memref<*xf32>
    gpu.host_register %cast_6 : memref<*xf32>
    %0 = call @mgpuMemGetDeviceMemRef1dFloat(%cast) : (memref<?xf32>) -> memref<?xf32>
    %1 = call @mgpuMemGetDeviceMemRef1dFloat(%cast_2) : (memref<?xf32>) -> memref<?xf32>
    %2 = call @mgpuMemGetDeviceMemRef1dFloat(%cast_3) : (memref<?xf32>) -> memref<?xf32>
    %cast_7 = memref.cast %0 : memref<?xf32> to memref<5xf32>
    %cast_8 = memref.cast %1 : memref<?xf32> to memref<5xf32>
    %cast_9 = memref.cast %2 : memref<?xf32> to memref<5xf32>
    call @vecadd(%cast_7, %cast_8, %cast_9) : (memref<5xf32>, memref<5xf32>, memref<5xf32>) -> ()
    call @printMemrefF32(%cast_6) : (memref<*xf32>) -> ()
    return
  }
  func.func private @mgpuMemGetDeviceMemRef1dFloat(memref<?xf32>) -> memref<?xf32>
  func.func private @printMemrefF32(memref<*xf32>)
}

