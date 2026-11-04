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
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<5xf32>
    %c5_i32 = arith.constant 5 : i32
    %cast = memref.cast %alloc : memref<5xf32> to memref<?xf32>
    %cast_0 = memref.cast %cast : memref<?xf32> to memref<*xf32>
    gpu.host_register %cast_0 : memref<*xf32>
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    %cst_1 = arith.constant 1.000000e+00 : f32
    call @other_func(%cst_1, %cast) : (f32, memref<?xf32>) -> ()
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    %0 = vector.transfer_read %alloc[%c0], %cst : memref<5xf32>, vector<2xf32>
    vector.print %0 : vector<2xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

