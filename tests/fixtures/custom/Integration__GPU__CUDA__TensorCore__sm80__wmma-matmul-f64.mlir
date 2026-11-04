module {
  func.func @main() {
    %alloc = memref.alloc() : memref<8x4xf64>
    %alloc_0 = memref.alloc() : memref<4x8xf64>
    %alloc_1 = memref.alloc() : memref<8x8xf64>
    %alloc_2 = memref.alloc() : memref<8x8xf64>
    %cst = arith.constant 1.000000e+00 : f64
    %cst_3 = arith.constant 3.140000e+00 : f64
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c4 step %c1 {
        memref.store %cst, %alloc[%arg0, %arg1] : memref<8x4xf64>
        memref.store %cst, %alloc_0[%arg1, %arg0] : memref<4x8xf64>
      }
    }
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c8 step %c1 {
        memref.store %cst_3, %alloc_1[%arg0, %arg1] : memref<8x8xf64>
      }
    }
    %cast = memref.cast %alloc : memref<8x4xf64> to memref<*xf64>
    %cast_4 = memref.cast %alloc_0 : memref<4x8xf64> to memref<*xf64>
    %cast_5 = memref.cast %alloc_1 : memref<8x8xf64> to memref<*xf64>
    %cast_6 = memref.cast %alloc_2 : memref<8x8xf64> to memref<*xf64>
    gpu.host_register %cast : memref<*xf64>
    gpu.host_register %cast_4 : memref<*xf64>
    gpu.host_register %cast_5 : memref<*xf64>
    gpu.host_register %cast_6 : memref<*xf64>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c1, %arg11 = %c1) {
      %0 = gpu.subgroup_mma_load_matrix %alloc[%c0, %c0] {leadDimension = 4 : index} : memref<8x4xf64> -> !gpu.mma_matrix<8x4xf64, "AOp">
      %1 = gpu.subgroup_mma_load_matrix %alloc_0[%c0, %c0] {leadDimension = 8 : index} : memref<4x8xf64> -> !gpu.mma_matrix<4x8xf64, "BOp">
      %2 = gpu.subgroup_mma_load_matrix %alloc_1[%c0, %c0] {leadDimension = 8 : index} : memref<8x8xf64> -> !gpu.mma_matrix<8x8xf64, "COp">
      %3 = gpu.subgroup_mma_compute %0, %1, %2 : !gpu.mma_matrix<8x4xf64, "AOp">, !gpu.mma_matrix<4x8xf64, "BOp"> -> !gpu.mma_matrix<8x8xf64, "COp">
      gpu.subgroup_mma_store_matrix %3, %alloc_2[%c0, %c0] {leadDimension = 8 : index} : !gpu.mma_matrix<8x8xf64, "COp">, memref<8x8xf64>
      gpu.terminator
    }
    call @printMemrefF64(%cast_6) : (memref<*xf64>) -> ()
    return
  }
  func.func private @printMemrefF64(memref<*xf64>)
}

