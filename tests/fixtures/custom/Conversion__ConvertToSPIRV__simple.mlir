module {
  func.func @return_scalar(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @return_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    return %arg0 : vector<4xi32>
  }
}

