module {
  func.func @global_load_to_rocdl_f32(%arg0: memref<128x72xf32, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32, #gpu.address_space<global>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_to_rocdl_wg_mem(%arg0: memref<128x72xf32>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_to_rocdl_0d(%arg0: memref<f32>) {
    %alloc = memref.alloc() : memref<f32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[], %alloc[] : f32, memref<f32>, memref<f32, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_to_rocdl_i8(%arg0: memref<128x72xi8, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xi8, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : i8, memref<128x72xi8, #gpu.address_space<global>>, memref<64x64xi8, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_to_rocdl_vec(%arg0: memref<128x72xi16, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x128xi16, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : vector<2xi16>, memref<128x72xi16, #gpu.address_space<global>>, memref<64x128xi16, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_to_rocdl_dynamic_indices(%arg0: memref<512xi32, #gpu.address_space<global>>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x64xi32, #gpu.address_space<workgroup>>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %arg0[%arg1], %alloc[%arg2, %c0] : i32, memref<512xi32, #gpu.address_space<global>>, memref<4x64xi32, #gpu.address_space<workgroup>>
    return
  }
  func.func @fat_buffer_load_to_rocdl_f32(%arg0: memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_to_rocdl_async_f32(%arg0: memref<128x72xf32, #gpu.address_space<global>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds async %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32, #gpu.address_space<global>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_to_rocdl_async_f32_fat_raw_buffer(%arg0: memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds async %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>, memref<64x64xf32, #gpu.address_space<workgroup>>
    return
  }
}

