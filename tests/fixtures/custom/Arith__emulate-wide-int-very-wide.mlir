module {
  func.func @muli_scalar(%arg0: i1024, %arg1: i1024) -> i1024 {
    %0 = arith.muli %arg0, %arg1 : i1024
    return %0 : i1024
  }
}

