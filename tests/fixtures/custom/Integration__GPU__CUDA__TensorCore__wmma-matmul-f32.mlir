module {
  func.func @main() {
    %alloc = memref.alloc() : memref<16x16xf16>
    %alloc_0 = memref.alloc() : memref<16x16xf32>
    %alloc_1 = memref.alloc() : memref<16x16xf32>
    %cst = arith.constant 1.000000e+00 : f16
    %cst_2 = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst, %alloc[%arg0, %arg1] : memref<16x16xf16>
      }
    }
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst_2, %alloc_0[%arg0, %arg1] : memref<16x16xf32>
      }
    }
    %cast = memref.cast %alloc : memref<16x16xf16> to memref<*xf16>
    %cast_3 = memref.cast %alloc_0 : memref<16x16xf32> to memref<*xf32>
    %cast_4 = memref.cast %alloc_1 : memref<16x16xf32> to memref<*xf32>
    gpu.host_register %cast : memref<*xf16>
    gpu.host_register %cast_3 : memref<*xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c1, %arg11 = %c1) {
      %0 = gpu.subgroup_mma_load_matrix %alloc[%c0, %c0] {leadDimension = 16 : index} : memref<16x16xf16> -> !gpu.mma_matrix<16x16xf16, "AOp">
      %1 = gpu.subgroup_mma_load_matrix %alloc[%c0, %c0] {leadDimension = 16 : index} : memref<16x16xf16> -> !gpu.mma_matrix<16x16xf16, "BOp">
      %2 = gpu.subgroup_mma_load_matrix %alloc_0[%c0, %c0] {leadDimension = 16 : index} : memref<16x16xf32> -> !gpu.mma_matrix<16x16xf32, "COp">
      %3 = gpu.subgroup_mma_compute %0, %1, %2 : !gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp"> -> !gpu.mma_matrix<16x16xf32, "COp">
      gpu.subgroup_mma_store_matrix %3, %alloc_0[%c0, %c0] {leadDimension = 16 : index} : !gpu.mma_matrix<16x16xf32, "COp">, memref<16x16xf32>
      gpu.terminator
    }
    call @printMemrefF32(%cast_3) : (memref<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

