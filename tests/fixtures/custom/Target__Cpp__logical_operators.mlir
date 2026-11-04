module {
  func.func @logical(%arg0: i32, %arg1: i32) {
    %0 = emitc.logical_and %arg0, %arg1 : i32, i32
    %1 = emitc.logical_not %arg0 : i32
    %2 = emitc.logical_or %arg0, %arg1 : i32, i32
    return
  }
}

