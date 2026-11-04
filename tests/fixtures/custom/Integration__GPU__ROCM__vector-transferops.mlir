module {
  func.func @vectransferx2(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c1 = arith.constant 1 : index
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) {
      %cst = arith.constant 0.000000e+00 : f32
      %c0_i32 = arith.constant 0 : i32
      %0 = amdgpu.raw_buffer_load %arg0[%c0_i32] : memref<?xf32>, i32 -> vector<2xf32>
      %1 = arith.addf %0, %0 : vector<2xf32>
      %c1_i32 = arith.constant 1 : i32
      amdgpu.raw_buffer_store {boundsCheck = false} %1 -> %arg1[%c1_i32] : vector<2xf32> -> memref<?xf32>, i32
      gpu.terminator
    }
    return
  }
  func.func @vectransferx4(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c1 = arith.constant 1 : index
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %c1, %arg12 = %c1, %arg13 = %c1) {
      %cst = arith.constant 0.000000e+00 : f32
      %c0_i32 = arith.constant 0 : i32
      %0 = amdgpu.raw_buffer_load {boundsCheck = false} %arg0[%c0_i32] : memref<?xf32>, i32 -> vector<4xf32>
      %1 = arith.addf %0, %0 : vector<4xf32>
      amdgpu.raw_buffer_store {boundsCheck = false} %1 -> %arg1[%c0_i32] : vector<4xf32> -> memref<?xf32>, i32
      gpu.terminator
    }
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 1.230000e+00 : f32
    %alloc = memref.alloc() : memref<4xf32>
    %alloc_1 = memref.alloc() : memref<4xf32>
    %cast = memref.cast %alloc : memref<4xf32> to memref<?xf32>
    %cast_2 = memref.cast %alloc_1 : memref<4xf32> to memref<?xf32>
    scf.for %arg0 = %c0 to %c4 step %c1 {
      memref.store %cst_0, %cast[%arg0] : memref<?xf32>
      memref.store %cst_0, %cast_2[%arg0] : memref<?xf32>
    }
    %cast_3 = memref.cast %cast : memref<?xf32> to memref<*xf32>
    %cast_4 = memref.cast %cast_2 : memref<?xf32> to memref<*xf32>
    gpu.host_register %cast_3 : memref<*xf32>
    gpu.host_register %cast_4 : memref<*xf32>
    %0 = call @mgpuMemGetDeviceMemRef1dFloat(%cast) : (memref<?xf32>) -> memref<?xf32>
    %1 = call @mgpuMemGetDeviceMemRef1dFloat(%cast_2) : (memref<?xf32>) -> memref<?xf32>
    call @vectransferx2(%0, %1) : (memref<?xf32>, memref<?xf32>) -> ()
    call @printMemrefF32(%cast_4) : (memref<*xf32>) -> ()
    call @vectransferx4(%0, %1) : (memref<?xf32>, memref<?xf32>) -> ()
    call @printMemrefF32(%cast_4) : (memref<*xf32>) -> ()
    return
  }
  func.func private @mgpuMemGetDeviceMemRef1dFloat(memref<?xf32>) -> memref<?xf32>
  func.func private @printMemrefF32(memref<*xf32>)
}

