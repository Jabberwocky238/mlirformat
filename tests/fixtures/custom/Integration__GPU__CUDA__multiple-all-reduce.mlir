module {
  func.func @main() {
    %alloc = memref.alloc() : memref<2x6xf32>
    %alloc_0 = memref.alloc() : memref<2xf32>
    %alloc_1 = memref.alloc() : memref<2xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %cst_2 = arith.constant 1.000000e+00 : f32
    %cst_3 = arith.constant 2.000000e+00 : f32
    %cst_4 = arith.constant 4.000000e+00 : f32
    %cst_5 = arith.constant 8.000000e+00 : f32
    %cst_6 = arith.constant 1.600000e+01 : f32
    %cst_7 = arith.constant 3.000000e+00 : f32
    %cst_8 = arith.constant 6.000000e+00 : f32
    %cst_9 = arith.constant 7.000000e+00 : f32
    %cst_10 = arith.constant 1.000000e+01 : f32
    %cst_11 = arith.constant 1.100000e+01 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %cast = memref.cast %alloc : memref<2x6xf32> to memref<*xf32>
    gpu.host_register %cast : memref<*xf32>
    %cast_12 = memref.cast %alloc_0 : memref<2xf32> to memref<*xf32>
    gpu.host_register %cast_12 : memref<*xf32>
    %cast_13 = memref.cast %alloc_1 : memref<2xf32> to memref<*xf32>
    gpu.host_register %cast_13 : memref<*xf32>
    memref.store %cst, %alloc[%c0, %c0] : memref<2x6xf32>
    memref.store %cst_2, %alloc[%c0, %c1] : memref<2x6xf32>
    memref.store %cst_3, %alloc[%c0, %c2] : memref<2x6xf32>
    memref.store %cst_4, %alloc[%c0, %c3] : memref<2x6xf32>
    memref.store %cst_5, %alloc[%c0, %c4] : memref<2x6xf32>
    memref.store %cst_6, %alloc[%c0, %c5] : memref<2x6xf32>
    memref.store %cst_3, %alloc[%c1, %c0] : memref<2x6xf32>
    memref.store %cst_7, %alloc[%c1, %c1] : memref<2x6xf32>
    memref.store %cst_8, %alloc[%c1, %c2] : memref<2x6xf32>
    memref.store %cst_9, %alloc[%c1, %c3] : memref<2x6xf32>
    memref.store %cst_10, %alloc[%c1, %c4] : memref<2x6xf32>
    memref.store %cst_11, %alloc[%c1, %c5] : memref<2x6xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c2, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c6, %arg10 = %c1, %arg11 = %c1) {
      %0 = memref.load %alloc[%arg0, %arg3] : memref<2x6xf32>
      %1 = gpu.all_reduce add %0 uniform {
      } : (f32) -> f32
      memref.store %1, %alloc_0[%arg0] : memref<2xf32>
      %2 = gpu.all_reduce mul %0 uniform {
      } : (f32) -> f32
      memref.store %2, %alloc_1[%arg0] : memref<2xf32>
      gpu.terminator
    }
    call @printMemrefF32(%cast_12) : (memref<*xf32>) -> ()
    call @printMemrefF32(%cast_13) : (memref<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

