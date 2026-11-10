module {
  func.func @test_subview_folding(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<64x64xf16, #gpu.address_space<workgroup>>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %subview = memref.subview %alloc_0[0, 0] [32, 64] [1, 1] : memref<64x128xf16> to memref<32x64xf16, strided<[128, 1]>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %subview[%arg0, %arg1], %alloc[%c0, %c0] : vector<8xf16>, memref<32x64xf16, strided<[128, 1]>>, memref<64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @subview_folding_offset(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<64x64xf16, #gpu.address_space<workgroup>>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %subview = memref.subview %alloc_0[32, 64] [32, 64] [1, 1] : memref<64x128xf16> to memref<32x64xf16, strided<[128, 1], offset: 4160>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %subview[%arg0, %arg1], %alloc[%c0, %c0] : vector<8xf16>, memref<32x64xf16, strided<[128, 1], offset: 4160>>, memref<64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_expand_shape(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4096xf16, #gpu.address_space<workgroup>>
    %alloc_0 = memref.alloc() : memref<8192xf16>
    %expand_shape = memref.expand_shape %alloc_0 [[0, 1]] output_shape [64, 128] : memref<8192xf16> into memref<64x128xf16>
    %expand_shape_1 = memref.expand_shape %alloc [[0, 1]] output_shape [64, 64] : memref<4096xf16, #gpu.address_space<workgroup>> into memref<64x64xf16, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %expand_shape[%arg0, %arg1], %expand_shape_1[%c0, %c0] : vector<8xf16>, memref<64x128xf16>, memref<64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_collapse_shape(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<64x64xf16, #gpu.address_space<workgroup>>
    %collapse_shape = memref.collapse_shape %alloc [[0, 1]] : memref<64x64xf16, #gpu.address_space<workgroup>> into memref<4096xf16, #gpu.address_space<workgroup>>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %collapse_shape_1 = memref.collapse_shape %alloc_0 [[0, 1]] : memref<64x128xf16> into memref<8192xf16>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %collapse_shape_1[%arg0], %collapse_shape[%arg1] : vector<8xf16>, memref<8192xf16>, memref<4096xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_expand_shape_src_raw_buffer(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4096xf16, #gpu.address_space<workgroup>>
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [64, 128] : memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>> into memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %expand_shape[%arg1, %arg2], %alloc[%c0] : vector<8xf16>, memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>, memref<4096xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_src_raw_buffer_collapse_shape(%arg0: memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index) {
    %alloc = memref.alloc() : memref<4096xf16, #gpu.address_space<workgroup>>
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>> into memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %collapse_shape[%arg1], %alloc[%c0] : vector<8xf16>, memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, memref<4096xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_expand_shape_dst_only(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4096xf16, #gpu.address_space<workgroup>>
    %alloc_0 = memref.alloc() : memref<8192xf16>
    %expand_shape = memref.expand_shape %alloc [[0, 1]] output_shape [64, 64] : memref<4096xf16, #gpu.address_space<workgroup>> into memref<64x64xf16, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %alloc_0[%arg0], %expand_shape[%arg1, %c0] : vector<8xf16>, memref<8192xf16>, memref<64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_nop(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4096xf16, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%arg1], %alloc[%arg2] : vector<8xf16>, memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, memref<4096xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_async_flag_preserved(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<64x64xf16, #gpu.address_space<workgroup>>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %subview = memref.subview %alloc_0[0, 0] [32, 64] [1, 1] : memref<64x128xf16> to memref<32x64xf16, strided<[128, 1]>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds async %subview[%arg0, %arg1], %alloc[%c0, %c0] : vector<8xf16>, memref<32x64xf16, strided<[128, 1]>>, memref<64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_transpose_load_subview(%arg0: index, %arg1: index) -> vector<4xf16> {
    %alloc = memref.alloc() : memref<64x128xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %alloc[0, 0] [32, 64] [1, 1] : memref<64x128xf16, #gpu.address_space<workgroup>> to memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<workgroup>>
    %0 = amdgpu.transpose_load %subview[%arg0, %arg1] : memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<workgroup>> -> vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @test_transpose_load_subview_offset(%arg0: index, %arg1: index) -> vector<4xf16> {
    %alloc = memref.alloc() : memref<64x128xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %alloc[32, 64] [32, 64] [1, 1] : memref<64x128xf16, #gpu.address_space<workgroup>> to memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<workgroup>>
    %0 = amdgpu.transpose_load %subview[%arg0, %arg1] : memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<workgroup>> -> vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @test_transpose_load_expand_shape(%arg0: index, %arg1: index) -> vector<4xf16> {
    %alloc = memref.alloc() : memref<4096xf16, #gpu.address_space<workgroup>>
    %expand_shape = memref.expand_shape %alloc [[0, 1]] output_shape [32, 128] : memref<4096xf16, #gpu.address_space<workgroup>> into memref<32x128xf16, #gpu.address_space<workgroup>>
    %0 = amdgpu.transpose_load %expand_shape[%arg0, %arg1] : memref<32x128xf16, #gpu.address_space<workgroup>> -> vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @test_transpose_load_collapse_shape(%arg0: index) -> vector<4xf16> {
    %alloc = memref.alloc() : memref<32x128xf16, #gpu.address_space<workgroup>>
    %collapse_shape = memref.collapse_shape %alloc [[0, 1]] : memref<32x128xf16, #gpu.address_space<workgroup>> into memref<4096xf16, #gpu.address_space<workgroup>>
    %0 = amdgpu.transpose_load %collapse_shape[%arg0] : memref<4096xf16, #gpu.address_space<workgroup>> -> vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @test_transpose_load_nop(%arg0: index, %arg1: index) -> vector<4xf16> {
    %alloc = memref.alloc() : memref<32x128xf16, #gpu.address_space<workgroup>>
    %0 = amdgpu.transpose_load %alloc[%arg0, %arg1] : memref<32x128xf16, #gpu.address_space<workgroup>> -> vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @test_make_dma_base_subview(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> !amdgpu.tdm_base<f16> {
    %subview = memref.subview %arg0[0, 0] [32, 64] [1, 1] : memref<64x128xf16, #gpu.address_space<global>> to memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>
    %0 = amdgpu.make_dma_base %subview[%arg2, %arg3], %arg1[%arg4, %arg5] : memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>> -> !amdgpu.tdm_base<f16>
    return %0 : !amdgpu.tdm_base<f16>
  }
}

// -----
module {
  func.func @test_make_dma_base_expand_shape(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<4096xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> !amdgpu.tdm_base<f16> {
    %expand_shape = memref.expand_shape %arg1 [[0, 1]] output_shape [64, 64] : memref<4096xf16, #gpu.address_space<workgroup>> into memref<64x64xf16, #gpu.address_space<workgroup>>
    %0 = amdgpu.make_dma_base %arg0[%arg2, %arg3], %expand_shape[%arg4, %arg5] : memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>> -> !amdgpu.tdm_base<f16>
    return %0 : !amdgpu.tdm_base<f16>
  }
}

// -----
module {
  func.func @test_make_gather_dma_base_subview(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> !amdgpu.tdm_gather_base<f16, i16> {
    %subview = memref.subview %arg0[0, 0] [32, 64] [1, 1] : memref<64x128xf16, #gpu.address_space<global>> to memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>
    %0 = amdgpu.make_gather_dma_base %subview[%arg2, %arg3], %arg1[%arg4, %arg5] : memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>> -> !amdgpu.tdm_gather_base<f16, i16>
    return %0 : !amdgpu.tdm_gather_base<f16, i16>
  }
}

// -----
module {
  func.func @test_make_gather_dma_base_collapse_shape(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index) -> !amdgpu.tdm_gather_base<f16, i16> {
    %collapse_shape = memref.collapse_shape %arg1 [[0, 1]] : memref<64x64xf16, #gpu.address_space<workgroup>> into memref<4096xf16, #gpu.address_space<workgroup>>
    %0 = amdgpu.make_gather_dma_base %arg0[%arg2, %arg3], %collapse_shape[%arg4] : memref<64x128xf16, #gpu.address_space<global>>, memref<4096xf16, #gpu.address_space<workgroup>> -> !amdgpu.tdm_gather_base<f16, i16>
    return %0 : !amdgpu.tdm_gather_base<f16, i16>
  }
}

// -----
module {
  func.func @test_make_dma_base_both_fold(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<4096xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> !amdgpu.tdm_base<f16> {
    %subview = memref.subview %arg0[32, 64] [32, 64] [1, 1] : memref<64x128xf16, #gpu.address_space<global>> to memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>
    %expand_shape = memref.expand_shape %arg1 [[0, 1]] output_shape [64, 64] : memref<4096xf16, #gpu.address_space<workgroup>> into memref<64x64xf16, #gpu.address_space<workgroup>>
    %0 = amdgpu.make_dma_base %subview[%arg2, %arg3], %expand_shape[%arg4, %arg5] : memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>> -> !amdgpu.tdm_base<f16>
    return %0 : !amdgpu.tdm_base<f16>
  }
}

// -----
module {
  func.func @test_make_dma_base_nop(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> !amdgpu.tdm_base<f16> {
    %0 = amdgpu.make_dma_base %arg0[%arg2, %arg3], %arg1[%arg4, %arg5] : memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>> -> !amdgpu.tdm_base<f16>
    return %0 : !amdgpu.tdm_base<f16>
  }
}

// -----
module {
  func.func @test_make_gather_dma_base_nop(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> !amdgpu.tdm_gather_base<f16, i16> {
    %0 = amdgpu.make_gather_dma_base %arg0[%arg2, %arg3], %arg1[%arg4, %arg5] : memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>> -> !amdgpu.tdm_gather_base<f16, i16>
    return %0 : !amdgpu.tdm_gather_base<f16, i16>
  }
}

// -----
module {
  func.func @test_global_load_async_to_lds_both_fold_masked(%arg0: memref<64x128xf32, #gpu.address_space<global>>, %arg1: memref<4096xf32, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: i1) {
    %subview = memref.subview %arg0[32, 64] [32, 64] [1, 1] : memref<64x128xf32, #gpu.address_space<global>> to memref<32x64xf32, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>
    %expand_shape = memref.expand_shape %arg1 [[0, 1]] output_shape [64, 64] : memref<4096xf32, #gpu.address_space<workgroup>> into memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %subview[%arg2, %arg3], %expand_shape[%arg4, %arg5], %arg6 : vector<4xf32>, memref<32x64xf32, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_global_load_async_to_lds_no_mask_dst_collapse(%arg0: memref<8192xi32, #gpu.address_space<global>>, %arg1: memref<64x64xi32, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index) {
    %collapse_shape = memref.collapse_shape %arg1 [[0, 1]] : memref<64x64xi32, #gpu.address_space<workgroup>> into memref<4096xi32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%arg2], %collapse_shape[%arg3] : i32, memref<8192xi32, #gpu.address_space<global>>, memref<4096xi32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_global_load_async_to_lds_masked_dst_collapse(%arg0: memref<8192xi32, #gpu.address_space<global>>, %arg1: memref<64x64xi32, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: i1) {
    %collapse_shape = memref.collapse_shape %arg1 [[0, 1]] : memref<64x64xi32, #gpu.address_space<workgroup>> into memref<4096xi32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%arg2], %collapse_shape[%arg3], %arg4 : i32, memref<8192xi32, #gpu.address_space<global>>, memref<4096xi32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @test_global_transpose_load_expand_shape(%arg0: memref<8192xf16, #gpu.address_space<global>>, %arg1: index, %arg2: index) -> vector<8xf16> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [64, 128] : memref<8192xf16, #gpu.address_space<global>> into memref<64x128xf16, #gpu.address_space<global>>
    %0 = amdgpu.global_transpose_load %expand_shape[%arg1, %arg2] : memref<64x128xf16, #gpu.address_space<global>> -> vector<8xf16>
    return %0 : vector<8xf16>
  }
}

// -----
module {
  func.func @test_ds_barrier_ops_expand_shape(%arg0: memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg1: index, %arg2: index, %arg3: i32, %arg4: i64) -> !amdgpu.ds_barrier_state {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 4] : memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>> into memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    amdgpu.ds_barrier_init %expand_shape[%arg1, %arg2], %arg3 : memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i32
    %0 = amdgpu.ds_barrier_poll_state %expand_shape[%arg1, %arg2] : memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>> -> !amdgpu.ds_barrier_state
    amdgpu.ds_async_barrier_arrive %expand_shape[%arg1, %arg2] : memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    %1 = amdgpu.ds_barrier_arrive %expand_shape[%arg1, %arg2], %arg4 : memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i64 -> !amdgpu.ds_barrier_state
    return %1 : !amdgpu.ds_barrier_state
  }
}

// -----
module {
  func.func @test_make_dma_descriptor_atomic_barrier_expand_shape(%arg0: !amdgpu.tdm_base<i32>, %arg1: memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index) -> !amdgpu.tdm_descriptor {
    %expand_shape = memref.expand_shape %arg1 [[0, 1]] output_shape [4, 4] : memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>> into memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] atomicBarrier(%expand_shape[%arg2, %arg3] : memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @test_make_gather_dma_descriptor_atomic_barrier_expand_shape(%arg0: !amdgpu.tdm_gather_base<i32, i32>, %arg1: vector<8xi32>, %arg2: memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg3: index, %arg4: index) -> !amdgpu.tdm_descriptor {
    %expand_shape = memref.expand_shape %arg2 [[0, 1]] output_shape [4, 4] : memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>> into memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    %0 = amdgpu.make_gather_dma_descriptor %arg0[%arg1] globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] atomicBarrier(%expand_shape[%arg3, %arg4] : memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) : !amdgpu.tdm_gather_base<i32, i32>, vector<8xi32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @test_make_dma_descriptor_no_atomic_barrier(%arg0: !amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

