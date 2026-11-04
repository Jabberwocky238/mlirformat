module {
  func.func @simple1() {
    return
  }
  func.func @simple2(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = "test.op_crash_long"(%arg0, %arg1, %arg2) : (i32, i32, i32) -> i32
    return
  }
  func.func @simple5() {
    return
  }
}

