module {
  func.func @arm_neon_smull(%arg0: vector<8xi8>, %arg1: vector<8xi8>) -> (vector<8xi16>, vector<4xi32>, vector<2xi64>) {
    %0 = arm_neon.intr.smull %arg0, %arg1 : vector<8xi8> to vector<8xi16>
    %1 = vector.extract_strided_slice %0 {offsets = [3], sizes = [4], strides = [1]} : vector<8xi16> to vector<4xi16>
    %2 = arm_neon.intr.smull %1, %1 : vector<4xi16> to vector<4xi32>
    %3 = vector.extract_strided_slice %2 {offsets = [1], sizes = [2], strides = [1]} : vector<4xi32> to vector<2xi32>
    %4 = arm_neon.intr.smull %3, %3 : vector<2xi32> to vector<2xi64>
    return %0, %2, %4 : vector<8xi16>, vector<4xi32>, vector<2xi64>
  }
}

// -----
module {
  func.func @arm_neon_sdot(%arg0: vector<2xi32>, %arg1: vector<8xi8>, %arg2: vector<8xi8>) -> vector<2xi32> {
    %0 = arm_neon.intr.sdot %arg0, %arg1, %arg2 : vector<8xi8>, vector<8xi8> to vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @arm_neon_smmla(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>) -> vector<4xi32> {
    %0 = arm_neon.intr.smmla %arg2, %arg0, %arg1 : vector<16xi8> to vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @arm_neon_ummla(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>) -> vector<4xi32> {
    %0 = arm_neon.intr.ummla %arg2, %arg0, %arg1 : vector<16xi8> to vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @arm_neon_usmmla(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>) -> vector<4xi32> {
    %0 = arm_neon.intr.usmmla %arg2, %arg0, %arg1 : vector<16xi8> to vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @arm_neon_bfmmla(%arg0: vector<8xbf16>, %arg1: vector<8xbf16>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = arm_neon.intr.bfmmla %arg2, %arg0, %arg1 : vector<8xbf16> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

