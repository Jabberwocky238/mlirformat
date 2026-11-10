module {
  func.func @func1() {
    return
  }
  func.func @func2(%arg0: i1) -> f32 {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %cst = arith.constant 2.200000e+00 : f32
    %cst_0 = arith.constant 5.300000e+00 : f32
    %0 = arith.addi %c1_i32, %c2_i32 : i32
    %1 = arith.addf %cst, %cst_0 : f32
    %2 = arith.muli %0, %0 : i32
    %3 = arith.subi %2, %0 : i32
    %4 = arith.select %arg0, %1, %cst : f32
    %5 = arith.addf %cst, %4 : f32
    return %5 : f32
  }
}

