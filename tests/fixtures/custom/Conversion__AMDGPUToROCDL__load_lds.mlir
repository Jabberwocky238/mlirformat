module {
  func.func @global_load_to_rocdl_f32(%arg0: memref<128x72xf32, 1>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, 3>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32, 1>, memref<64x64xf32, 3>
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
  func.func @global_load_to_rocdl_i8(%arg0: memref<128x72xi8, 1>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xi8, 3>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : i8, memref<128x72xi8, 1>, memref<64x64xi8, 3>
    return
  }
  func.func @global_load_to_rocdl_vec(%arg0: memref<128x72xi16, 1>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x128xi16, 3>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : vector<2xi16>, memref<128x72xi16, 1>, memref<64x128xi16, 3>
    return
  }
  func.func @global_load_to_rocdl_dynamic_indices(%arg0: memref<512xi32, 1>, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<4x64xi32, 3>
    %c0 = arith.constant 0 : index
    amdgpu.gather_to_lds %arg0[%arg1], %alloc[%arg2, %c0] : i32, memref<512xi32, 1>, memref<4x64xi32, 3>
    return
  }
  func.func @fat_buffer_load_to_rocdl_f32(%arg0: memref<128x72xf32, 7>) {
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<64x64xf32, 3>
    amdgpu.gather_to_lds %arg0[%c12, %c0], %alloc[%c32, %c0] : f32, memref<128x72xf32, 7>, memref<64x64xf32, 3>
    return
  }
}

