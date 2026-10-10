module {
  func.func @identity_f32(%arg0: f32) -> f32 {
    return %arg0 : f32
  }
  func.func @identity_i32(%arg0: vector<2xi32>) -> vector<2xi32> {
    return %arg0 : vector<2xi32>
  }
  func.func @identity_scalar(%arg0: i4) -> i4 {
    return %arg0 : i4
  }
  func.func @identity_vector(%arg0: vector<4xi4>) -> vector<4xi4> {
    return %arg0 : vector<4xi4>
  }
  func.func @identity_vector2d(%arg0: vector<3x4xi4>) -> vector<3x4xi4> {
    return %arg0 : vector<3x4xi4>
  }
  func.func @call(%arg0: vector<4xi4>) -> vector<4xi4> {
    %0 = call @identity_vector(%arg0) : (vector<4xi4>) -> vector<4xi4>
    return %0 : vector<4xi4>
  }
}

