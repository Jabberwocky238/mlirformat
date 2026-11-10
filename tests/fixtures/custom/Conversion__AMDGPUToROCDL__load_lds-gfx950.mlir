module {
  func.func @fat_buffer_load_to_rocdl_f96(%arg0: memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : vector<16xf6E3M2FN>, memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @fat_buffer_load_to_rocdl_f128(%arg0: memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : f128, memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

