module {
  func.func @fold_static_stride_subview_with_load(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
    %0 = memref.load %subview[%arg3, %arg4] : memref<4x4xf32, strided<[64, 3], offset: ?>>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_dynamic_stride_subview_with_load(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> f32 {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [%arg5, %arg6] : memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
    %0 = memref.load %subview[%arg3, %arg4] : memref<4x4xf32, strided<[?, ?], offset: ?>>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_store(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: f32) {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
    memref.store %arg5, %subview[%arg3, %arg4] : memref<4x4xf32, strided<[64, 3], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_dynamic_stride_subview_with_store(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: f32) {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [%arg5, %arg6] : memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
    memref.store %arg7, %subview[%arg3, %arg4] : memref<4x4xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_subview_with_transfer_read_0d(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<f32> {
    %cst = arith.constant 1.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, %arg2] [1, 1] [1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
    %0 = vector.transfer_read %subview[], %cst : memref<f32, strided<[], offset: ?>>, vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @fold_subview_with_transfer_read(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> vector<4xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [%arg5, %arg6] : memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
    %0 = vector.transfer_read %subview[%arg3, %arg4], %cst {in_bounds = [true]} : memref<4x4xf32, strided<[?, ?], offset: ?>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_transfer_write_0d(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<f32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, %arg2] [1, 1] [1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
    vector.transfer_write %arg4, %subview[] : vector<f32>, memref<f32, strided<[], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_transfer_write(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: vector<4xf32>) {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [%arg5, %arg6] : memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
    vector.transfer_write %arg7, %subview[%arg3, %arg4] {in_bounds = [true]} : vector<4xf32>, memref<4x4xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_rank_reducing_subview_with_load(%arg0: memref<?x?x?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index) -> f32 {
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3, %arg4, %arg5, %arg6] [4, 1, 1, 4, 1, 1] [%arg7, %arg8, %arg9, %arg10, %arg11, %arg12] : memref<?x?x?x?x?x?xf32> to memref<4x1x4x1xf32, strided<[?, ?, ?, ?], offset: ?>>
    %0 = memref.load %subview[%arg13, %arg14, %arg15, %arg16] : memref<4x1x4x1xf32, strided<[?, ?, ?, ?], offset: ?>>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_vector_transfer_read_with_rank_reduced_subview(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[0, %arg1, %arg2] [1, %arg3, %arg4] [1, 1, 1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    %0 = vector.transfer_read %subview[%arg5, %arg6], %cst {in_bounds = [true]} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fold_vector_transfer_write_with_rank_reduced_subview(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: vector<4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[0, %arg2, %arg3] [1, %arg4, %arg5] [1, 1, 1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    vector.transfer_write %arg1, %subview[%arg6, %arg7] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_vector_transfer_write_with_inner_rank_reduced_subview(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: vector<4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg2, %arg3, 0] [%arg4, %arg5, 1] [1, 1, 1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    vector.transfer_write %arg1, %subview[%arg6, %arg7] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_masked_vector_transfer_read_with_subview(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: vector<4xi1>) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg3, %arg4] [1, 1] : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    %0 = vector.transfer_read %subview[%arg5, %arg6], %cst, %arg7 {in_bounds = [true]} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @fold_masked_vector_transfer_read_with_rank_reducing_subview(%arg0: memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: vector<4x3xi1>) -> vector<3x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[0, %arg1, 0, %arg2] [1, %arg3, 1, %arg4] [1, 1, 1, 1] : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    %0 = vector.transfer_read %subview[%arg5, %arg6], %cst, %arg7 {in_bounds = [true, true], permutation_map = #map} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<3x4xf32>
    return %0 : vector<3x4xf32>
  }
}

// -----
module {
  func.func @fold_masked_vector_transfer_write_with_subview(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: vector<4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: vector<4xi1>) {
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg2, %arg3] [%arg4, %arg5] [1, 1] : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    vector.transfer_write %arg1, %subview[%arg6, %arg7], %arg8 {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @fold_masked_vector_transfer_write_with_rank_reducing_subview(%arg0: memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg1: vector<3x4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: vector<4x3xi1>) {
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[0, %arg2, 0, %arg3] [1, %arg4, 1, %arg5] [1, 1, 1, 1] : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    vector.transfer_write %arg1, %subview[%arg6, %arg7], %arg8 {in_bounds = [true, true], permutation_map = #map} : vector<3x4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @fold_dynamic_subview_with_memref_load_expand_shape(%arg0: memref<16x?xf32, strided<[16, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> f32 {
    %c0 = arith.constant 0 : index
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 16, %arg3, 1] : memref<16x?xf32, strided<[16, 1]>> into memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
    %0 = memref.load %expand_shape[%c0, %arg1, %arg2, %c0] {nontemporal = true} : memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_dynamic_subview_with_memref_store_expand_shape(%arg0: memref<16x?xf32, strided<[16, 1]>>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 16, %arg3, 1] : memref<16x?xf32, strided<[16, 1]>> into memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
    memref.store %cst, %expand_shape[%c0, %arg1, %arg2, %c0] {nontemporal = true} : memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
    return
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_memref_expand_shape_with_constant_access_index(%arg0: memref<1024x1024xf32>, %arg1: memref<1xf32>, %arg2: index) -> f32 {
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 1024, 1024, 1] : memref<1024x1024xf32> into memref<1x1024x1024x1xf32>
    %c0 = arith.constant 0 : index
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 1024 {
        affine.for %arg5 = 0 to 1020 {
          affine.for %arg6 = 0 to 1 {
            %1 = memref.load %expand_shape[%arg3, %c0, %arg5, %arg6] : memref<1x1024x1024x1xf32>
            memref.store %1, %arg1[%arg2] : memref<1xf32>
          }
        }
      }
    }
    %0 = memref.load %arg1[%arg2] : memref<1xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @subview_of_subview(%arg0: memref<8x1024xf32, 3>, %arg1: index) -> memref<f32, strided<[], offset: ?>, 3> {
    %subview = memref.subview %arg0[3, %arg1] [5, 7] [1, 1] : memref<8x1024xf32, 3> to memref<5x7xf32, strided<[1024, 1], offset: ?>, 3>
    %subview_0 = memref.subview %subview[1, 2] [1, 1] [1, 1] : memref<5x7xf32, strided<[1024, 1], offset: ?>, 3> to memref<f32, strided<[], offset: ?>, 3>
    return %subview_0 : memref<f32, strided<[], offset: ?>, 3>
  }
}

// -----
module {
  func.func @subview_of_subview_rank_reducing(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index) -> memref<f32, strided<[], offset: ?>> {
    %subview = memref.subview %arg0[3, 1, 8] [1, %arg1, 1] [1, 1, 1] : memref<?x?x?xf32> to memref<?xf32, strided<[?], offset: ?>>
    %subview_0 = memref.subview %subview[6] [1] [1] : memref<?xf32, strided<[?], offset: ?>> to memref<f32, strided<[], offset: ?>>
    return %subview_0 : memref<f32, strided<[], offset: ?>>
  }
}

// -----
module {
  func.func @fold_load_keep_nontemporal(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
    %0 = memref.load %subview[%arg3, %arg4] {nontemporal = true} : memref<4x4xf32, strided<[64, 3], offset: ?>>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_store_keep_nontemporal(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: f32) {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
    memref.store %arg5, %subview[%arg3, %arg4] {nontemporal = true} : memref<4x4xf32, strided<[64, 3], offset: ?>>
    return
  }
}

// -----
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
  func.func @fold_nvgpu_device_async_copy_zero_sub_idx(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [1, 1, 8] [1, 1, 1] : memref<2x128x768xf16> to memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %0 = nvgpu.device_async_copy %subview[%c0, %c0], %alloc[%c0, %c0, %c0, %c0], 8 {bypassL1} : memref<1x8xf16, strided<[98304, 1], offset: ?>> to memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @fold_src_nvgpu_device_async_copy(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [1, 1, 8] [1, 1, 1] : memref<2x128x768xf16> to memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %0 = nvgpu.device_async_copy %subview[%arg4, %arg5], %alloc[%c0, %c0, %c0, %c0], 8 {bypassL1} : memref<1x8xf16, strided<[98304, 1], offset: ?>> to memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @fold_src_fold_dest_nvgpu_device_async_copy(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [1, 1, 8] [1, 1, 1] : memref<2x128x768xf16> to memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %subview_0 = memref.subview %alloc[%arg6, %arg7, %arg8, %arg9] [1, 1, 1, 8] [1, 1, 1, 1] : memref<5x1x64x64xf16, #gpu.address_space<workgroup>> to memref<1x8xf16, strided<[4096, 1], offset: ?>, #gpu.address_space<workgroup>>
    %0 = nvgpu.device_async_copy %subview[%arg4, %arg5], %subview_0[%arg10, %arg11], 8 {bypassL1} : memref<1x8xf16, strided<[98304, 1], offset: ?>> to memref<1x8xf16, strided<[4096, 1], offset: ?>, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 4)>
#map1 = affine_map<()[s0] -> (-s0 + 32)>
module {
  func.func @test_ldmatrix(%arg0: memref<4x32x32xf16, 3>, %arg1: index, %arg2: index, %arg3: index) -> vector<4x2xf16> {
    %c0 = arith.constant 0 : index
    %0 = affine.apply #map()[%arg1]
    %1 = affine.apply #map1()[%arg2]
    %2 = affine.apply #map1()[%arg3]
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [%0, %1, %2] [1, 1, 1] : memref<4x32x32xf16, 3> to memref<?x?x?xf16, strided<[1024, 32, 1], offset: ?>, 3>
    %3 = nvgpu.ldmatrix %subview[%c0, %c0, %c0] {numTiles = 4 : i32, transpose = false} : memref<?x?x?xf16, strided<[1024, 32, 1], offset: ?>, 3> -> vector<4x2xf16>
    return %3 : vector<4x2xf16>
  }
}

// -----
module {
  func.func @fold_vector_load_subview(%arg0: memref<24x64xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> vector<12x32xf32> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg3, %arg4] [1, 1] : memref<24x64xf32> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    %0 = vector.load %subview[%arg5, %arg5] : memref<?x?xf32, strided<[64, 1], offset: ?>>, vector<12x32xf32>
    return %0 : vector<12x32xf32>
  }
}

// -----
module {
  func.func @fold_vector_maskedload_subview(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: vector<32xi1>, %arg4: vector<32xf32>) -> vector<32xf32> {
    %subview = memref.subview %arg0[%arg1, %arg2] [1, 1] [1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
    %0 = vector.maskedload %subview[], %arg3, %arg4 : memref<f32, strided<[], offset: ?>>, vector<32xi1>, vector<32xf32> into vector<32xf32>
    return %0 : vector<32xf32>
  }
}

// -----
module {
  func.func @fold_vector_store_subview(%arg0: memref<24x64xf32>, %arg1: index, %arg2: index, %arg3: vector<2x32xf32>, %arg4: index, %arg5: index, %arg6: index) {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg5, %arg6] [1, 1] : memref<24x64xf32> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    vector.store %arg3, %subview[%arg4, %arg4] : memref<?x?xf32, strided<[64, 1], offset: ?>>, vector<2x32xf32>
    return
  }
}

// -----
module {
  func.func @fold_vector_maskedstore_subview(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: vector<32xi1>, %arg4: vector<32xf32>) {
    %subview = memref.subview %arg0[%arg1, %arg2] [1, 1] [1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
    vector.maskedstore %subview[], %arg3, %arg4 : memref<f32, strided<[], offset: ?>>, vector<32xi1>, vector<32xf32>
    return
  }
}

// -----
module {
  func.func @fold_vector_load_expand_shape(%arg0: memref<32xf32>, %arg1: index) -> vector<8xf32> {
    %c0 = arith.constant 0 : index
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
    %0 = vector.load %expand_shape[%arg1, %c0] {nontemporal = true} : memref<4x8xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @fold_vector_maskedload_expand_shape(%arg0: memref<32xf32>, %arg1: index, %arg2: vector<8xi1>, %arg3: vector<8xf32>) -> vector<8xf32> {
    %c0 = arith.constant 0 : index
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
    %0 = vector.maskedload %expand_shape[%arg1, %c0], %arg2, %arg3 : memref<4x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @fold_vector_store_expand_shape(%arg0: memref<32xf32>, %arg1: index, %arg2: vector<8xf32>) {
    %c0 = arith.constant 0 : index
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
    vector.store %arg2, %expand_shape[%arg1, %c0] {nontemporal = true} : memref<4x8xf32>, vector<8xf32>
    return
  }
}

// -----
module {
  func.func @fold_vector_maskedstore_expand_shape(%arg0: memref<32xf32>, %arg1: index, %arg2: vector<8xi1>, %arg3: vector<8xf32>) {
    %c0 = arith.constant 0 : index
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
    vector.maskedstore %expand_shape[%arg1, %c0], %arg2, %arg3 : memref<4x8xf32>, vector<8xi1>, vector<8xf32>
    return
  }
}

// -----
module {
  func.func @fold_vector_transfer_read_expand_shape(%arg0: memref<32xf32>, %arg1: index) -> vector<8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : f32
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
    %1 = vector.transfer_read %expand_shape[%arg1, %c0], %0 {in_bounds = [true]} : memref<4x8xf32>, vector<8xf32>
    return %1 : vector<8xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @fold_vector_transfer_read_with_perm_map(%arg0: memref<32xf32>, %arg1: index) -> vector<4x4xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : f32
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
    %1 = vector.transfer_read %expand_shape[%arg1, %c0], %0 {in_bounds = [true, true], permutation_map = #map} : memref<4x8xf32>, vector<4x4xf32>
    return %1 : vector<4x4xf32>
  }
}

// -----
module {
  func.func @fold_vector_transfer_read_rank_mismatch(%arg0: memref<32xf32>, %arg1: index) -> vector<4x4xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : f32
    %expand_shape = memref.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 4, 4] : memref<32xf32> into memref<2x4x4xf32>
    %1 = vector.transfer_read %expand_shape[%arg1, %c0, %c0], %0 {in_bounds = [true, true]} : memref<2x4x4xf32>, vector<4x4xf32>
    return %1 : vector<4x4xf32>
  }
}

// -----
module {
  func.func @fold_vector_load_collapse_shape(%arg0: memref<4x8xf32>, %arg1: index) -> vector<8xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
    %0 = vector.load %collapse_shape[%arg1] {nontemporal = true} : memref<32xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @fold_vector_maskedload_collapse_shape(%arg0: memref<4x8xf32>, %arg1: index, %arg2: vector<8xi1>, %arg3: vector<8xf32>) -> vector<8xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
    %0 = vector.maskedload %collapse_shape[%arg1], %arg2, %arg3 : memref<32xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @fold_vector_store_collapse_shape(%arg0: memref<4x8xf32>, %arg1: index, %arg2: vector<8xf32>) {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
    vector.store %arg2, %collapse_shape[%arg1] {nontemporal = true} : memref<32xf32>, vector<8xf32>
    return
  }
}

// -----
module {
  func.func @fold_vector_maskedstore_collapse_shape(%arg0: memref<4x8xf32>, %arg1: index, %arg2: vector<8xi1>, %arg3: vector<8xf32>) {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
    vector.maskedstore %collapse_shape[%arg1], %arg2, %arg3 : memref<32xf32>, vector<8xi1>, vector<8xf32>
    return
  }
}

