module {
  func.func @bitwise(%arg0: i32, %arg1: i32) {
    %0 = emitc.bitwise_and %arg0, %arg1 : (i32, i32) -> i32
    %1 = emitc.bitwise_left_shift %arg0, %arg1 : (i32, i32) -> i32
    %2 = emitc.bitwise_not %arg0 : (i32) -> i32
    %3 = emitc.bitwise_or %arg0, %arg1 : (i32, i32) -> i32
    %4 = emitc.bitwise_right_shift %arg0, %arg1 : (i32, i32) -> i32
    %5 = emitc.bitwise_xor %arg0, %arg1 : (i32, i32) -> i32
    return
  }
}

