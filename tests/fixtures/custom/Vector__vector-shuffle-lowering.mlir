module {
  func.func @shuffle_smaller_lhs_arbitrary(%arg0: vector<2xf32>, %arg1: vector<4xf32>) -> vector<5xf32> {
    %0 = vector.shuffle %arg0, %arg1 [1, 3, 0, 4, 5] : vector<2xf32>, vector<4xf32>
    return %0 : vector<5xf32>
  }
}

// -----
module {
  func.func @shuffle_smaller_rhs_arbitrary(%arg0: vector<4xi32>, %arg1: vector<2xi32>) -> vector<6xi32> {
    %0 = vector.shuffle %arg0, %arg1 [3, 5, 1, 4, 0, 2] : vector<4xi32>, vector<2xi32>
    return %0 : vector<6xi32>
  }
}

// -----
module {
  func.func @shuffle_smaller_lhs_concat(%arg0: vector<3xf64>, %arg1: vector<5xf64>) -> vector<8xf64> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 2, 3, 4, 5, 6, 7] : vector<3xf64>, vector<5xf64>
    return %0 : vector<8xf64>
  }
}

// -----
module {
  func.func @shuffle_smaller_rhs_concat(%arg0: vector<4xi16>, %arg1: vector<2xi16>) -> vector<6xi16> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 2, 3, 4, 5] : vector<4xi16>, vector<2xi16>
    return %0 : vector<6xi16>
  }
}

// -----
module {
  func.func @negative_shuffle_same_input_sizes(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> vector<6xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 4, 5, 2, 6] : vector<4xf32>, vector<4xf32>
    return %0 : vector<6xf32>
  }
}

// -----
module {
  func.func @negative_shuffle_2d_vectors(%arg0: vector<2x4xf32>, %arg1: vector<3x4xf32>) -> vector<4x4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 2, 3] : vector<2x4xf32>, vector<3x4xf32>
    return %0 : vector<4x4xf32>
  }
}

