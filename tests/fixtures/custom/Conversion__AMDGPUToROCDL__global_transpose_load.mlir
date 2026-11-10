module {
  func.func @global_transpose_load_8xf16(%arg0: index, %arg1: index, %arg2: memref<128x256xf16, #gpu.address_space<global>>) -> vector<8xf16> {
    %0 = amdgpu.global_transpose_load %arg2[%arg0, %arg1] : memref<128x256xf16, #gpu.address_space<global>> -> vector<8xf16>
    return %0 : vector<8xf16>
  }
}

// -----
module {
  func.func @global_transpose_load_8xi8(%arg0: index, %arg1: index, %arg2: memref<128x256xi8, #gpu.address_space<global>>) -> vector<8xi8> {
    %0 = amdgpu.global_transpose_load %arg2[%arg0, %arg1] : memref<128x256xi8, #gpu.address_space<global>> -> vector<8xi8>
    return %0 : vector<8xi8>
  }
}

