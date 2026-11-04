module {
  func.func @base_test(%arg0: !test.i32, %arg1: f32) {
    return
  }
}

// -----
module {
  func.func @base_test(%arg0: i32, %arg1: f32) {
    return
  }
}

