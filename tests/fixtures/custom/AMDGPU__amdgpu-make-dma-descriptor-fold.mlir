module {
  func.func @make_dma_descriptor_fold(%arg0: !amdgpu.tdm_base<i32>, %arg1: index, %arg2: i32) -> !amdgpu.tdm_descriptor {
    %c64 = arith.constant 64 : index
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [%c64, %c64] globalStride [%c64, 1] sharedSize [%c64, %c64] iterate %arg1, %arg2, %arg1 : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

// -----
module {
  func.func @make_gather_dma_descriptor_fold(%arg0: !amdgpu.tdm_gather_base<i32, i32>, %arg1: index, %arg2: i32, %arg3: vector<8xi32>) -> !amdgpu.tdm_descriptor {
    %c64 = arith.constant 64 : index
    %0 = amdgpu.make_gather_dma_descriptor %arg0[%arg3] globalSize [%c64, %c64] globalStride [%c64, 1] sharedSize [%c64, %c64] iterate %arg1, %arg2, %arg1 : !amdgpu.tdm_gather_base<i32, i32>, vector<8xi32> -> !amdgpu.tdm_descriptor
    return %0 : !amdgpu.tdm_descriptor
  }
}

