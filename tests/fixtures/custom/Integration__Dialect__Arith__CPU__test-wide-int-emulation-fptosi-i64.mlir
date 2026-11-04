module {
  func.func @emulate_fptosi(%arg0: f64) -> i64 {
    %0 = arith.fptosi %arg0 : f64 to i64
    return %0 : i64
  }
  func.func @check_fptosi(%arg0: f64) {
    %0 = call @emulate_fptosi(%arg0) : (f64) -> i64
    vector.print %0 : i64
    return
  }
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant -0.000000e+00 : f64
    %cst_1 = arith.constant 1.000000e+00 : f64
    %cst_2 = arith.constant -1.000000e+00 : f64
    %cst_3 = arith.constant -1.500000e+00 : f64
    %cst_4 = arith.constant 0x4130000000000000 : f64
    %cst_5 = arith.constant 0xC130000000000000 : f64
    %cst_6 = arith.constant 0x41EFFFFFFFE00000 : f64
    %cst_7 = arith.constant 0xC1F0000000000000 : f64
    %cst_8 = arith.constant 0x41F0000000000000 : f64
    %cst_9 = arith.constant 0xC1F0000000100000 : f64
    %cst_10 = arith.constant 0x4270000000000000 : f64
    %cst_11 = arith.constant 0xC270000000000000 : f64
    %cst_12 = arith.constant 0x4270000100000000 : f64
    %cst_13 = arith.constant 0xC270000100000000 : f64
    %cst_14 = arith.constant 0x4340000000000000 : f64
    %cst_15 = arith.constant 0xC340000000000000 : f64
    call @check_fptosi(%cst) : (f64) -> ()
    call @check_fptosi(%cst_0) : (f64) -> ()
    call @check_fptosi(%cst_1) : (f64) -> ()
    call @check_fptosi(%cst_2) : (f64) -> ()
    call @check_fptosi(%cst_3) : (f64) -> ()
    call @check_fptosi(%cst_4) : (f64) -> ()
    call @check_fptosi(%cst_5) : (f64) -> ()
    call @check_fptosi(%cst_6) : (f64) -> ()
    call @check_fptosi(%cst_7) : (f64) -> ()
    call @check_fptosi(%cst_8) : (f64) -> ()
    call @check_fptosi(%cst_9) : (f64) -> ()
    call @check_fptosi(%cst_10) : (f64) -> ()
    call @check_fptosi(%cst_11) : (f64) -> ()
    call @check_fptosi(%cst_12) : (f64) -> ()
    call @check_fptosi(%cst_13) : (f64) -> ()
    call @check_fptosi(%cst_14) : (f64) -> ()
    call @check_fptosi(%cst_15) : (f64) -> ()
    return
  }
}

