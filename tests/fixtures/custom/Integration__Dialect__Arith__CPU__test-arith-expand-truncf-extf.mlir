module {
  func.func @check_extf(%arg0: f4E2M1FN) {
    %0 = arith.extf %arg0 : f4E2M1FN to f32
    vector.print %0 : f32
    return
  }
  func.func @check_truncf(%arg0: f32) {
    %0 = arith.truncf %arg0 : f32 to f4E2M1FN
    %1 = arith.bitcast %0 : f4E2M1FN to i4
    %2 = arith.extui %1 : i4 to i64
    vector.print %2 : i64
    return
  }
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 1.500000e+00 : f32
    %cst_3 = arith.constant 2.000000e+00 : f32
    %cst_4 = arith.constant 3.000000e+00 : f32
    %cst_5 = arith.constant 4.000000e+00 : f32
    %cst_6 = arith.constant 6.000000e+00 : f32
    %cst_7 = arith.constant -0.000000e+00 : f32
    %cst_8 = arith.constant -5.000000e-01 : f32
    %cst_9 = arith.constant -1.000000e+00 : f32
    %cst_10 = arith.constant -1.500000e+00 : f32
    %cst_11 = arith.constant -2.000000e+00 : f32
    %cst_12 = arith.constant -3.000000e+00 : f32
    %cst_13 = arith.constant -4.000000e+00 : f32
    %cst_14 = arith.constant -6.000000e+00 : f32
    %cst_15 = arith.constant -1.000000e+06 : f32
    %cst_16 = arith.constant 1.000000e+06 : f32
    %cst_17 = arith.constant -3.140000e+00 : f32
    %cst_18 = arith.constant 3.73148927E-34 : f32
    call @check_truncf(%cst) : (f32) -> ()
    call @check_truncf(%cst_0) : (f32) -> ()
    call @check_truncf(%cst_1) : (f32) -> ()
    call @check_truncf(%cst_2) : (f32) -> ()
    call @check_truncf(%cst_3) : (f32) -> ()
    call @check_truncf(%cst_4) : (f32) -> ()
    call @check_truncf(%cst_5) : (f32) -> ()
    call @check_truncf(%cst_6) : (f32) -> ()
    call @check_truncf(%cst_8) : (f32) -> ()
    call @check_truncf(%cst_9) : (f32) -> ()
    call @check_truncf(%cst_10) : (f32) -> ()
    call @check_truncf(%cst_11) : (f32) -> ()
    call @check_truncf(%cst_12) : (f32) -> ()
    call @check_truncf(%cst_13) : (f32) -> ()
    call @check_truncf(%cst_14) : (f32) -> ()
    call @check_truncf(%cst_16) : (f32) -> ()
    call @check_truncf(%cst_15) : (f32) -> ()
    call @check_truncf(%cst_17) : (f32) -> ()
    call @check_truncf(%cst_18) : (f32) -> ()
    %0 = arith.truncf %cst : f32 to f4E2M1FN
    call @check_extf(%0) : (f4E2M1FN) -> ()
    %1 = arith.truncf %cst_0 : f32 to f4E2M1FN
    call @check_extf(%1) : (f4E2M1FN) -> ()
    %2 = arith.truncf %cst_1 : f32 to f4E2M1FN
    call @check_extf(%2) : (f4E2M1FN) -> ()
    %3 = arith.truncf %cst_2 : f32 to f4E2M1FN
    call @check_extf(%3) : (f4E2M1FN) -> ()
    %4 = arith.truncf %cst_3 : f32 to f4E2M1FN
    call @check_extf(%4) : (f4E2M1FN) -> ()
    %5 = arith.truncf %cst_4 : f32 to f4E2M1FN
    call @check_extf(%5) : (f4E2M1FN) -> ()
    %6 = arith.truncf %cst_5 : f32 to f4E2M1FN
    call @check_extf(%6) : (f4E2M1FN) -> ()
    %7 = arith.truncf %cst_16 : f32 to f4E2M1FN
    call @check_extf(%7) : (f4E2M1FN) -> ()
    %8 = arith.truncf %cst_7 : f32 to f4E2M1FN
    call @check_extf(%8) : (f4E2M1FN) -> ()
    %9 = arith.truncf %cst_8 : f32 to f4E2M1FN
    call @check_extf(%9) : (f4E2M1FN) -> ()
    %10 = arith.truncf %cst_9 : f32 to f4E2M1FN
    call @check_extf(%10) : (f4E2M1FN) -> ()
    %11 = arith.truncf %cst_10 : f32 to f4E2M1FN
    call @check_extf(%11) : (f4E2M1FN) -> ()
    %12 = arith.truncf %cst_11 : f32 to f4E2M1FN
    call @check_extf(%12) : (f4E2M1FN) -> ()
    %13 = arith.truncf %cst_12 : f32 to f4E2M1FN
    call @check_extf(%13) : (f4E2M1FN) -> ()
    %14 = arith.truncf %cst_13 : f32 to f4E2M1FN
    call @check_extf(%14) : (f4E2M1FN) -> ()
    %15 = arith.truncf %cst_15 : f32 to f4E2M1FN
    call @check_extf(%15) : (f4E2M1FN) -> ()
    %16 = arith.truncf %cst_17 : f32 to f4E2M1FN
    call @check_extf(%16) : (f4E2M1FN) -> ()
    return
  }
}

