module {
}

// -----
module {
  func.func @transpose_load_to_rocdl_16xi4(%arg0: index, %arg1: index, %arg2: memref<128x16xi4, 3>) -> vector<16xi4> {
    %0 = amdgpu.transpose_load %arg2[%arg0, %arg1] : memref<128x16xi4, 3> -> vector<16xi4>
    return %0 : vector<16xi4>
  }
}

// -----
module {
  func.func @transpose_load_to_rocdl_16xi6(%arg0: index, %arg1: index, %arg2: memref<128x32xi6, 3>) -> vector<16xi6> {
    %0 = amdgpu.transpose_load %arg2[%arg0, %arg1] : memref<128x32xi6, 3> -> vector<16xi6>
    return %0 : vector<16xi6>
  }
}

