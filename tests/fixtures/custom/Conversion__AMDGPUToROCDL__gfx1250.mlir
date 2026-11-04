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
  func.func @make_dma_base(%arg0: index, %arg1: memref<8xi32, 1>, %arg2: memref<8xi32, 3>) -> !amdgpu.tdm_base<i32> {
    %0 = amdgpu.make_dma_base %arg1[%arg0], %arg2[%arg0] : memref<8xi32, 1>, memref<8xi32, 3> -> !amdgpu.tdm_base<i32>
    return %0 : !amdgpu.tdm_base<i32>
  }
}

// -----
module {
  func.func @make_gather_dma_base(%arg0: index, %arg1: memref<8xi32, 1>, %arg2: memref<8xi32, 3>) -> (!amdgpu.tdm_gather_base<i32, i16>, !amdgpu.tdm_gather_base<i32, i32>) {
    %0 = amdgpu.make_gather_dma_base %arg1[%arg0], %arg2[%arg0] : memref<8xi32, 1>, memref<8xi32, 3> -> !amdgpu.tdm_gather_base<i32, i16>
    %1 = amdgpu.make_gather_dma_base %arg1[%arg0], %arg2[%arg0] : memref<8xi32, 1>, memref<8xi32, 3> -> !amdgpu.tdm_gather_base<i32, i32>
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
  func.func @make_dma_descriptor_atomic_barrier(%arg0: !amdgpu.tdm_base<i32>, %arg1: memref<8xi32, 3>, %arg2: index) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] atomicBarrier(%arg1[%arg2] : memref<8xi32, 3>) : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
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
}

// -----
module {
  func.func @make_gather_dma_descriptor(%arg0: !amdgpu.tdm_gather_base<i32, i16>, %arg1: vector<13xi16>) -> !amdgpu.tdm_descriptor {
    %0 = amdgpu.make_gather_dma_descriptor %arg0[%arg1] globalSize [128, 64] globalStride [64, 1] sharedSize [128, 64] : !amdgpu.tdm_gather_base<i32, i16>, vector<13xi16> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

