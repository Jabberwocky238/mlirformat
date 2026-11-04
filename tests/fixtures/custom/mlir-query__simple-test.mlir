module {
  func.func @simple1() {
    %c1_i32 = arith.constant 1 : i32
    return
  }
  func.func @simple2() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = arith.addf %cst, %cst_0 : f32
    return
  }
}

