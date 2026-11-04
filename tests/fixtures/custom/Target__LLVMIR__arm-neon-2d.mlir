module {
  func.func @arm_neon_sdot2d_4x4_i8i8(%arg0: vector<4xi32>, %arg1: vector<4x4xi8>, %arg2: vector<4x4xi8>) -> vector<4xi32> {
    %0 = arm_neon.2d.sdot %arg0, %arg1, %arg2 : vector<4x4xi8>, vector<4x4xi8> to vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @arm_neon_sdot2d_2x4_i8i8(%arg0: vector<2xi32>, %arg1: vector<2x4xi8>, %arg2: vector<2x4xi8>) -> vector<2xi32> {
    %0 = arm_neon.2d.sdot %arg0, %arg1, %arg2 : vector<2x4xi8>, vector<2x4xi8> to vector<2xi32>
    return %0 : vector<2xi32>
  }
}

