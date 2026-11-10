module {
  func.func @transpose_load_to_rocdl_8xf16(%arg0: index, %arg1: index, %arg2: memref<128x72xf16, 3>) -> vector<8xf16> {
    %0 = amdgpu.transpose_load %arg2[%arg0, %arg1] : memref<128x72xf16, 3> -> vector<8xf16>
    return %0 : vector<8xf16>
  }
}

// -----
module {
  func.func @transpose_load_to_rocdl_8xi8(%arg0: index, %arg1: index, %arg2: memref<128x128xi8, 3>) -> vector<8xi8> {
    %0 = amdgpu.transpose_load %arg2[%arg0, %arg1] : memref<128x128xi8, 3> -> vector<8xi8>
    return %0 : vector<8xi8>
  }
}

// -----
module {
  func.func @transpose_load_to_rocdl_16xi4(%arg0: index, %arg1: index, %arg2: memref<128x32xi8, 3>) -> vector<16xi4> {
    %0 = amdgpu.transpose_load %arg2[%arg0, %arg1] : memref<128x32xi8, 3> -> vector<16xi4>
    return %0 : vector<16xi4>
  }
}

// -----
module {
  func.func @transpose_load_to_rocdl_16xi6(%arg0: index, %arg1: index, %arg2: memref<128x32xi8, 3>) -> vector<16xi6> {
    %0 = amdgpu.transpose_load %arg2[%arg0, %arg1] : memref<128x32xi8, 3> -> vector<16xi6>
    return %0 : vector<16xi6>
  }
}

