module {
  func.func @main() {
    %alloc = memref.alloc() : memref<2x6xf32>
    %alloc_0 = memref.alloc() : memref<2xf32>
    %alloc_1 = memref.alloc() : memref<2xf32>
    %c1 = arith.constant 1 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c1, %arg10 = %c1, %arg11 = %c1) {
      %0 = memref.load %alloc[%arg0, %arg3] : memref<2x6xf32>
      %1 = gpu.all_reduce  add %0 uniform {
      } : (f32) -> f32
      memref.store %1, %alloc_0[%arg0] : memref<2xf32>
      %2 = gpu.all_reduce  mul %0 uniform {
      } : (f32) -> f32
      memref.store %2, %alloc_1[%arg0] : memref<2xf32>
      gpu.terminator
    }
    return
  }
}

