module {
  func.func @test_subview_folding(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<64x64xf16, 3>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %subview = memref.subview %alloc_0[0, 0] [32, 64] [1, 1] : memref<64x128xf16> to memref<32x64xf16, strided<[128, 1]>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %subview[%arg0, %arg1], %alloc[%c0, %c0] : vector<8xf16>, memref<32x64xf16, strided<[128, 1]>>, memref<64x64xf16, 3>
    return
  }
}

// -----
module {
  func.func @subview_folding_offset(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<64x64xf16, 3>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %subview = memref.subview %alloc_0[32, 64] [32, 64] [1, 1] : memref<64x128xf16> to memref<32x64xf16, strided<[128, 1], offset: 4160>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %subview[%arg0, %arg1], %alloc[%c0, %c0] : vector<8xf16>, memref<32x64xf16, strided<[128, 1], offset: 4160>>, memref<64x64xf16, 3>
    return
  }
}

// -----
module {
  func.func @test_expand_shape(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4096xf16, 3>
    %alloc_0 = memref.alloc() : memref<8192xf16>
    %expand_shape = memref.expand_shape %alloc_0 [[0, 1]] output_shape [64, 128] : memref<8192xf16> into memref<64x128xf16>
    %expand_shape_1 = memref.expand_shape %alloc [[0, 1]] output_shape [64, 64] : memref<4096xf16, 3> into memref<64x64xf16, 3>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %expand_shape[%arg0, %arg1], %expand_shape_1[%c0, %c0] : vector<8xf16>, memref<64x128xf16>, memref<64x64xf16, 3>
    return
  }
}

// -----
module {
  func.func @test_collapse_shape(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<64x64xf16, 3>
    %collapse_shape = memref.collapse_shape %alloc [[0, 1]] : memref<64x64xf16, 3> into memref<4096xf16, 3>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %collapse_shape_1 = memref.collapse_shape %alloc_0 [[0, 1]] : memref<64x128xf16> into memref<8192xf16>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %collapse_shape_1[%arg0], %collapse_shape[%arg1] : vector<8xf16>, memref<8192xf16>, memref<4096xf16, 3>
    return
  }
}

// -----
module {
  func.func @test_expand_shape_src_raw_buffer(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4096xf16, 3>
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [64, 128] : memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>> into memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %expand_shape[%arg1, %arg2], %alloc[%c0] : vector<8xf16>, memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>, memref<4096xf16, 3>
    return
  }
}

// -----
module {
  func.func @test_expand_shape_dst_only(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4096xf16, 3>
    %alloc_0 = memref.alloc() : memref<8192xf16>
    %expand_shape = memref.expand_shape %alloc [[0, 1]] output_shape [64, 64] : memref<4096xf16, 3> into memref<64x64xf16, 3>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %alloc_0[%arg0], %expand_shape[%arg1, %c0] : vector<8xf16>, memref<8192xf16>, memref<64x64xf16, 3>
    return
  }
}

// -----
module {
  func.func @test_nop(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4096xf16, 3>
    amdgpu.gather_to_lds %arg0[%arg1], %alloc[%arg2] : vector<8xf16>, memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, memref<4096xf16, 3>
    return
  }
}

