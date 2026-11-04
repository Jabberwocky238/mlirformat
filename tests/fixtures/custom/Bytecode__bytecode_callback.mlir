module {
  func.func @base_test(%arg0: i32) -> f32 {
    %0 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.cast"(%0) : (i32) -> f32
    return %1 : f32
  }
}

