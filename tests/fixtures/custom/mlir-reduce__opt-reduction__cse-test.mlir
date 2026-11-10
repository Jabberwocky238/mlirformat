module {
  func.func @cse_on_func(%arg0: i32, %arg1: i32) {
    %0 = arith.addi %arg0, %arg1 : i32
    %1 = arith.addi %arg0, %arg1 : i32
    %2 = "test.op_crash_long"(%0, %0, %1) : (i32, i32, i32) -> i32
    return
  }
}

