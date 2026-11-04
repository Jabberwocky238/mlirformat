module {
  func.func @emulate_fptoui(%arg0: f64) -> i64 {
    %0 = arith.fptoui %arg0 : f64 to i64
    return %0 : i64
  }
  func.func @check_fptoui(%arg0: f64) {
    %0 = call @emulate_fptoui(%arg0) : (f64) -> i64
    vector.print %0 : i64
    return
  }
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 1.000000e+00 : f64
    %cst_1 = arith.constant 1.500000e+00 : f64
    %cst_2 = arith.constant 0x4130000000000000 : f64
    %cst_3 = arith.constant 0x41EFFFFFFFE00000 : f64
    %cst_4 = arith.constant 0x41F0000000000000 : f64
    %cst_5 = arith.constant 0x4270000000000000 : f64
    %cst_6 = arith.constant 0x4270000100000000 : f64
    %cst_7 = arith.constant -0.000000e+00 : f64
    call @check_fptoui(%cst) : (f64) -> ()
    call @check_fptoui(%cst_0) : (f64) -> ()
    call @check_fptoui(%cst_1) : (f64) -> ()
    call @check_fptoui(%cst_2) : (f64) -> ()
    call @check_fptoui(%cst_3) : (f64) -> ()
    call @check_fptoui(%cst_4) : (f64) -> ()
    call @check_fptoui(%cst_5) : (f64) -> ()
    call @check_fptoui(%cst_6) : (f64) -> ()
    call @check_fptoui(%cst_7) : (f64) -> ()
    return
  }
}

