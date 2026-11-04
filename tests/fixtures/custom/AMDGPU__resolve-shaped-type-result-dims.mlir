module {
  func.func @fat_raw_buffer_cast_static_dim(%arg0: memref<2x3xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = amdgpu.fat_raw_buffer_cast %arg0 : memref<2x3xf32> to memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>
    %dim = memref.dim %0, %c0 : memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>
    %dim_0 = memref.dim %0, %c1 : memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @fat_raw_buffer_cast_dynamic_dim(%arg0: memref<4x?xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = amdgpu.fat_raw_buffer_cast %arg0 : memref<4x?xf32> to memref<4x?xf32, #amdgpu.address_space<fat_raw_buffer>>
    %dim = memref.dim %0, %c0 : memref<4x?xf32, #amdgpu.address_space<fat_raw_buffer>>
    %dim_0 = memref.dim %0, %c1 : memref<4x?xf32, #amdgpu.address_space<fat_raw_buffer>>
    return %dim, %dim_0 : index, index
  }
}

