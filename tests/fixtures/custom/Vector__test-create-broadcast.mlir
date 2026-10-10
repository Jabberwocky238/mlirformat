module {
  func.func @foo(%arg0: f32) -> vector<1x2xf32> {
    %0 = "test_create_broadcast"(%arg0) {broadcast_dims = array<i64: 0, 1>} : (f32) -> vector<1x2xf32>
    return %0 : vector<1x2xf32>
  }
}

// -----
module {
  func.func @foo(%arg0: vector<2x2xf32>) -> vector<2x2x3xf32> {
    %0 = "test_create_broadcast"(%arg0) {broadcast_dims = array<i64: 2>} : (vector<2x2xf32>) -> vector<2x2x3xf32>
    return %0 : vector<2x2x3xf32>
  }
}

// -----
module {
  func.func @foo(%arg0: vector<3x3xf32>) -> vector<4x3x3xf32> {
    %0 = "test_create_broadcast"(%arg0) {broadcast_dims = array<i64: 0>} : (vector<3x3xf32>) -> vector<4x3x3xf32>
    return %0 : vector<4x3x3xf32>
  }
}

// -----
module {
  func.func @foo(%arg0: vector<2x4xf32>) -> vector<1x2x3x4x5xf32> {
    %0 = "test_create_broadcast"(%arg0) {broadcast_dims = array<i64: 0, 2, 4>} : (vector<2x4xf32>) -> vector<1x2x3x4x5xf32>
    return %0 : vector<1x2x3x4x5xf32>
  }
}

