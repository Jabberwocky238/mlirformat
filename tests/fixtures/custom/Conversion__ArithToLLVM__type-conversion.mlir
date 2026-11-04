module {
  func.func @arith_select(%arg0: i1, %arg1: i17, %arg2: i17) -> i17 {
    %0 = arith.select %arg0, %arg1, %arg2 : i17
    return %0 : i17
  }
}

