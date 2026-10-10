module {
  func.func @wrapping_op(%arg0: i32, %arg1: f32) -> (i3, i2, i1) {
    %0:3 = test.wrapping_region wraps "some.op"(%arg1, %arg0) {test.attr = "attr"} : (f32, i32) -> (i1, i2, i3)
    return %0#2, %0#1, %0#0 : i3, i2, i1
  }
}

