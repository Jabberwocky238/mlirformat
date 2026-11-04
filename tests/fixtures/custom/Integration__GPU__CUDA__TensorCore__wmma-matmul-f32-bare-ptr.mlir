module {
  func.func @main() {
    %alloc = memref.alloc() : memref<16x16xf16>
    %alloc_0 = memref.alloc() : memref<16x16xf32>
    %cst = arith.constant 1.000000e+00 : f16
    %cst_1 = arith.constant 0.000000e+00 : f32
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
        memref.store %cst_1, %alloc_0[%arg0, %arg1] : memref<16x16xf32>
      }
    }
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<16x16xf16>
    %memref_2, %asyncToken_3 = gpu.alloc async [%0] () : memref<16x16xf32>
    %1 = gpu.memcpy async [%0] %memref, %alloc : memref<16x16xf16>, memref<16x16xf16>
    %2 = gpu.memcpy async [%0] %memref_2, %alloc_0 : memref<16x16xf32>, memref<16x16xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c1, %arg11 = %c1) {
      %5 = gpu.subgroup_mma_load_matrix %memref[%c0, %c0] {leadDimension = 16 : index} : memref<16x16xf16> -> !gpu.mma_matrix<16x16xf16, "AOp">
      %6 = gpu.subgroup_mma_load_matrix %memref[%c0, %c0] {leadDimension = 16 : index} : memref<16x16xf16> -> !gpu.mma_matrix<16x16xf16, "BOp">
      %7 = gpu.subgroup_mma_load_matrix %memref_2[%c0, %c0] {leadDimension = 16 : index} : memref<16x16xf32> -> !gpu.mma_matrix<16x16xf32, "COp">
      %8 = gpu.subgroup_mma_compute %5, %6, %7 : !gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp"> -> !gpu.mma_matrix<16x16xf32, "COp">
      gpu.subgroup_mma_store_matrix %8, %memref_2[%c0, %c0] {leadDimension = 16 : index} : !gpu.mma_matrix<16x16xf32, "COp">, memref<16x16xf32>
      gpu.printf "Success\0A"
      gpu.terminator
    }
    %3 = gpu.dealloc async [%0] %memref : memref<16x16xf16>
    %4 = gpu.dealloc async [%0] %memref_2 : memref<16x16xf32>
    gpu.wait [%0]
    return
  }
}

