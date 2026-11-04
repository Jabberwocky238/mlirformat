module {
  func.func @cond(%arg0: i1, %arg1: i32, %arg2: i32) {
    %0 = emitc.conditional %arg0, %arg1, %arg2 : i32
    return
  }
}

