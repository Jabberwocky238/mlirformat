module {
  func.func @scaled_ext_packed_matrix_fp4(%arg0: vector<8xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf4E2M1FN>, vector<4xf8E8M0FNU> -> vector<8xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf4E2M1FN>, vector<4xf8E8M0FNU> -> vector<8xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf4E2M1FN>, vector<4xf8E8M0FNU> -> vector<8xf32>
    return %0, %1, %2 : vector<8xf16>, vector<8xbf16>, vector<8xf32>
  }
  func.func @scaled_ext_packed_matrix_fp8(%arg0: vector<8xf8E4M3FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E4M3FN>, vector<4xf8E8M0FNU> -> vector<8xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E4M3FN>, vector<4xf8E8M0FNU> -> vector<8xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E4M3FN>, vector<4xf8E8M0FNU> -> vector<8xf32>
    return %0, %1, %2 : vector<8xf16>, vector<8xbf16>, vector<8xf32>
  }
  func.func @scaled_ext_packed_matrix_bf8(%arg0: vector<8xf8E5M2>, %arg1: vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E5M2>, vector<4xf8E8M0FNU> -> vector<8xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E5M2>, vector<4xf8E8M0FNU> -> vector<8xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E5M2>, vector<4xf8E8M0FNU> -> vector<8xf32>
    return %0, %1, %2 : vector<8xf16>, vector<8xbf16>, vector<8xf32>
  }
  func.func @scaled_ext_packed_matrix_fp6(%arg0: vector<16xf6E2M3FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E2M3FN>, vector<4xf8E8M0FNU> -> vector<16xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E2M3FN>, vector<4xf8E8M0FNU> -> vector<16xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E2M3FN>, vector<4xf8E8M0FNU> -> vector<16xf32>
    return %0, %1, %2 : vector<16xf16>, vector<16xbf16>, vector<16xf32>
  }
  func.func @scaled_ext_packed_matrix_bf6(%arg0: vector<16xf6E3M2FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E3M2FN>, vector<4xf8E8M0FNU> -> vector<16xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E3M2FN>, vector<4xf8E8M0FNU> -> vector<16xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E3M2FN>, vector<4xf8E8M0FNU> -> vector<16xf32>
    return %0, %1, %2 : vector<16xf16>, vector<16xbf16>, vector<16xf32>
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @make_dma_base(%arg0: index, %arg1: memref<8xi32, #gpu.address_space<global>>, %arg2: memref<8xi32, #gpu.address_space<workgroup>>) -> !amdgpu.tdm_base<i32> {
    %0 = amdgpu.make_dma_base %arg1[%arg0], %arg2[%arg0] : memref<8xi32, #gpu.address_space<global>>, memref<8xi32, #gpu.address_space<workgroup>> -> !amdgpu.tdm_base<i32>
    return %0 : !amdgpu.tdm_base<i32>
  }
}

// -----
module {
  func.func @make_gather_dma_base(%arg0: index, %arg1: memref<8xi32, #gpu.address_space<global>>, %arg2: memref<8xi32, #gpu.address_space<workgroup>>) -> (!amdgpu.tdm_gather_base<i32, i16>, !amdgpu.tdm_gather_base<i32, i32>) {
    %0 = amdgpu.make_gather_dma_base %arg1[%arg0], %arg2[%arg0] : memref<8xi32, #gpu.address_space<global>>, memref<8xi32, #gpu.address_space<workgroup>> -> !amdgpu.tdm_gather_base<i32, i16>
    %1 = amdgpu.make_gather_dma_base %arg1[%arg0], %arg2[%arg0] : memref<8xi32, #gpu.address_space<global>>, memref<8xi32, #gpu.address_space<workgroup>> -> !amdgpu.tdm_gather_base<i32, i32>
    return %0, %1 : !amdgpu.tdm_gather_base<i32, i16>, !amdgpu.tdm_gather_base<i32, i32>
  }
}

// -----
module {
  func.func @make_dma_descriptor(%arg0: !amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @make_dma_descriptor_atomic_barrier(%arg0: !amdgpu.tdm_base<i32>, %arg1: memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg2: index) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] atomicBarrier(%arg1[%arg2] : memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @make_dma_descriptor_iterate(%arg0: !amdgpu.tdm_base<i32>, %arg1: index, %arg2: i32) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] iterate %arg1, %arg2, %arg1 : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @make_dma_descriptor_pad_enable(%arg0: !amdgpu.tdm_base<i32>, %arg1: i32, %arg2: i32) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] padShared(%arg1 every %arg2) : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @make_dma_descriptor_dynamic(%arg0: !amdgpu.tdm_base<i32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [%arg2, %arg1] globalStride [%arg3, 1] sharedSize [%arg5, %arg4] : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @make_dma_descriptor(%arg0: !amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64, 64, 128, 64] globalStride [64, 64, 64, 64, 1] sharedSize [64, 64, 64, 128, 64] : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @make_dma_descriptor_workgroup_mask(%arg0: !amdgpu.tdm_base<i32>, %arg1: vector<16xi1>, %arg2: i1) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] workgroupMask %arg1 earlyTimeout %arg2 : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
  func.func @tensor_load_to_lds(%arg0: !amdgpu.tdm_descriptor) {
    amdgpu.tensor_load_to_lds %arg0 : !amdgpu.tdm_descriptor
    return
  }
  func.func @tensor_store_from_lds(%arg0: !amdgpu.tdm_descriptor) {
    amdgpu.tensor_store_from_lds %arg0 : !amdgpu.tdm_descriptor
    return
  }
  func.func @make_gather_dma_descriptor(%arg0: !amdgpu.tdm_gather_base<i32, i16>, %arg1: vector<13xi16>) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_gather_dma_descriptor %arg0[%arg1] globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] : !amdgpu.tdm_gather_base<i32, i16>, vector<13xi16> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
  func.func @ds_barrier_init(%arg0: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg1: i32) {
    amdgpu.ds_barrier_init %arg0[], %arg1 : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i32
    return
  }
  func.func @ds_barrier_poll_state(%arg0: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> !amdgpu.ds_barrier_state {
    %0 = amdgpu.ds_barrier_poll_state %arg0[] : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>> -> !amdgpu.ds_barrier_state
    return %0 : !amdgpu.ds_barrier_state
  }
  func.func @ds_async_barrier_arrive(%arg0: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) {
    amdgpu.ds_async_barrier_arrive %arg0[] : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    return
  }
  func.func @ds_barrier_arrive(%arg0: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg1: i64) -> !amdgpu.ds_barrier_state {
    %0 = amdgpu.ds_barrier_arrive %arg0[], %arg1 : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i64 -> !amdgpu.ds_barrier_state
    return %0 : !amdgpu.ds_barrier_state
  }
  func.func @ds_barrier_state_phase(%arg0: !amdgpu.ds_barrier_state) -> i32 {
    %0 = amdgpu.ds_barrier_state_phase %arg0 : !amdgpu.ds_barrier_state -> i32
    return %0 : i32
  }
  func.func @ds_barrier_state_pending_count(%arg0: !amdgpu.ds_barrier_state) -> i32 {
    %0 = amdgpu.ds_barrier_state_pending_count %arg0 : !amdgpu.ds_barrier_state -> i32
    return %0 : i32
  }
  func.func @ds_barrier_state_init_count(%arg0: !amdgpu.ds_barrier_state) -> i32 {
    %0 = amdgpu.ds_barrier_state_init_count %arg0 : !amdgpu.ds_barrier_state -> i32
    return %0 : i32
  }
  func.func @ds_barrier_state_phase_parity(%arg0: !amdgpu.ds_barrier_state) -> i1 {
    %0 = amdgpu.ds_barrier_state_phase_parity %arg0 : !amdgpu.ds_barrier_state -> i1
    return %0 : i1
  }
}

// -----
module {
  func.func @global_load_async_to_lds_b32(%arg0: memref<128x72xf32, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32, #gpu.address_space<global>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @global_load_async_to_lds_b8(%arg0: memref<128x72xi8, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<64x64xi8, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%c0, %c0], %alloc[%c0, %c0] : i8, memref<128x72xi8, #gpu.address_space<global>>, memref<64x64xi8, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @global_load_async_to_lds_b64(%arg0: memref<128x72xf32, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%c0, %c0], %alloc[%c0, %c0] : vector<2xf32>, memref<128x72xf32, #gpu.address_space<global>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @global_load_async_to_lds_b128(%arg0: memref<128x72xf32, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%c0, %c0], %alloc[%c0, %c0] : vector<4xf32>, memref<128x72xf32, #gpu.address_space<global>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @global_load_async_to_lds_dynamic_indices(%arg0: memref<512xi32, #gpu.address_space<global>>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<256xi32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%arg1], %alloc[%arg2] : i32, memref<512xi32, #gpu.address_space<global>>, memref<256xi32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @global_load_async_to_lds_b128_masked(%arg0: memref<128x72xf32, #gpu.address_space<global>>, %arg1: i1) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg0[%c0, %c0], %alloc[%c0, %c0], %arg1 : vector<4xf32>, memref<128x72xf32, #gpu.address_space<global>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

