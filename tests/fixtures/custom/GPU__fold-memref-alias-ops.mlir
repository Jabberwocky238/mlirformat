module {
  func.func @fold_gpu_subgroup_mma_load_matrix_1d(%arg0: memref<?xvector<4xf32>>, %arg1: index, %arg2: index) -> !gpu.mma_matrix<16x16xf16, "COp"> {
    %subview = memref.subview %arg0[%arg1] [81920] [1] : memref<?xvector<4xf32>> to memref<81920xvector<4xf32>, strided<[1], offset: ?>>
    %0 = gpu.subgroup_mma_load_matrix %subview[%arg2] {leadDimension = 160 : index} : memref<81920xvector<4xf32>, strided<[1], offset: ?>> -> !gpu.mma_matrix<16x16xf16, "COp">
    return %0 : !gpu.mma_matrix<16x16xf16, "COp">
  }
}

// -----
module {
  func.func @fold_gpu_subgroup_mma_store_matrix_1d(%arg0: memref<?xvector<4xf32>>, %arg1: index, %arg2: index, %arg3: !gpu.mma_matrix<16x16xf16, "COp">) {
    %subview = memref.subview %arg0[%arg1] [81920] [1] : memref<?xvector<4xf32>> to memref<81920xvector<4xf32>, strided<[1], offset: ?>>
    gpu.subgroup_mma_store_matrix %arg3, %subview[%arg2] {leadDimension = 160 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<81920xvector<4xf32>, strided<[1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_gpu_subgroup_mma_load_matrix_2d(%arg0: memref<128x128xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> !gpu.mma_matrix<16x16xf16, "COp"> {
    %subview = memref.subview %arg0[%arg1, %arg2] [64, 32] [2, 1] : memref<128x128xf32> to memref<64x32xf32, strided<[256, 1], offset: ?>>
    %0 = gpu.subgroup_mma_load_matrix %subview[%arg3, %arg4] {leadDimension = 32 : index} : memref<64x32xf32, strided<[256, 1], offset: ?>> -> !gpu.mma_matrix<16x16xf16, "COp">
    return %0 : !gpu.mma_matrix<16x16xf16, "COp">
  }
}

// -----
module {
  func.func @fold_gpu_subgroup_mma_load_matrix_2d(%arg0: memref<128x128xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: !gpu.mma_matrix<16x16xf16, "COp">) {
    %subview = memref.subview %arg0[%arg1, %arg2] [64, 32] [2, 1] : memref<128x128xf32> to memref<64x32xf32, strided<[256, 1], offset: ?>>
    gpu.subgroup_mma_store_matrix %arg5, %subview[%arg3, %arg4] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<64x32xf32, strided<[256, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_gpu_subgroup_mma_load_matrix_expand_shape(%arg0: memref<4096xf32>, %arg1: index, %arg2: index) -> !gpu.mma_matrix<16x16xf16, "COp"> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [64, 64] : memref<4096xf32> into memref<64x64xf32>
    %0 = gpu.subgroup_mma_load_matrix %expand_shape[%arg1, %arg2] {leadDimension = 64 : index} : memref<64x64xf32> -> !gpu.mma_matrix<16x16xf16, "COp">
    return %0 : !gpu.mma_matrix<16x16xf16, "COp">
  }
}

// -----
module {
  func.func @fold_gpu_subgroup_mma_store_matrix_expand_shape(%arg0: memref<4096xf32>, %arg1: index, %arg2: index, %arg3: !gpu.mma_matrix<16x16xf16, "COp">) {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [64, 64] : memref<4096xf32> into memref<64x64xf32>
    gpu.subgroup_mma_store_matrix %arg3, %expand_shape[%arg1, %arg2] {leadDimension = 64 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<64x64xf32>
    return
  }
}

