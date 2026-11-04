module {
  func.func @add_scalar(%arg0: i32) -> i32 {
    %0 = arith.addi %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @add_index(%arg0: index) -> index {
    %0 = arith.addi %arg0, %arg0 : index
    return %0 : index
  }
}

