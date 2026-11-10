module {
}

// -----
module {
}

// -----
module {
  func.func @func_exp2f(%arg0: f64) {
    %0 = math.exp2 %arg0 : f64
    vector.print %0 : f64
    return
  }
  func.func @exp2f() {
    %cst = arith.constant 1.000000e+00 : f64
    call @func_exp2f(%cst) : (f64) -> ()
    %cst_0 = arith.constant 2.000000e+00 : f64
    call @func_exp2f(%cst_0) : (f64) -> ()
    %cst_1 = arith.constant 2.500000e+00 : f64
    call @func_exp2f(%cst_1) : (f64) -> ()
    %cst_2 = arith.constant -1.750000e+00 : f64
    call @func_exp2f(%cst_2) : (f64) -> ()
    %cst_3 = arith.constant 1.320000e-01 : f64
    call @func_exp2f(%cst_3) : (f64) -> ()
    %cst_4 = arith.constant 0.000000e+00 : f64
    %cst_5 = arith.constant 1.000000e+00 : f64
    %0 = arith.divf %cst_5, %cst_4 : f64
    call @func_exp2f(%0) : (f64) -> ()
    %cst_6 = arith.constant 0x415338D6C0000000 : f64
    call @func_exp2f(%cst_6) : (f64) -> ()
    %cst_7 = arith.constant -1.4044477616111843E+306 : f64
    call @func_exp2f(%cst_7) : (f64) -> ()
    %cst_8 = arith.constant 2.2471164185778949E+307 : f64
    call @func_exp2f(%cst_8) : (f64) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @func_roundf(%arg0: f32) {
    %0 = math.round %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @func_roundf$bitcast_result_to_int(%arg0: f32) {
    %0 = math.round %arg0 : f32
    %1 = arith.bitcast %0 : f32 to i32
    vector.print %1 : i32
    return
  }
  func.func @func_roundf$vector(%arg0: vector<1xf32>) {
    %0 = math.round %arg0 : vector<1xf32>
    vector.print %0 : vector<1xf32>
    return
  }
  func.func @roundf() {
    %cst = arith.constant 3.800000e+00 : f32
    call @func_roundf(%cst) : (f32) -> ()
    %cst_0 = arith.constant -3.800000e+00 : f32
    call @func_roundf(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant -4.200000e+00 : f32
    call @func_roundf(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant -4.950000e+02 : f32
    call @func_roundf(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 4.950000e+02 : f32
    call @func_roundf(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 8.500000e+00 : f32
    call @func_roundf(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant -8.500000e+00 : f32
    call @func_roundf(%cst_5) : (f32) -> ()
    %cst_6 = arith.constant -4.000000e-01 : f32
    call @func_roundf(%cst_6) : (f32) -> ()
    %cst_7 = arith.constant -0.000000e+00 : f32
    %cst_8 = arith.constant 0.000000e+00 : f32
    %c2139095040_i32 = arith.constant 2139095040 : i32
    %0 = arith.bitcast %c2139095040_i32 : i32 to f32
    %c-8388608_i32 = arith.constant -8388608 : i32
    %1 = arith.bitcast %c-8388608_i32 : i32 to f32
    %c2143289344_i32 = arith.constant 2143289344 : i32
    %2 = arith.bitcast %c2143289344_i32 : i32 to f32
    %c-4194304_i32 = arith.constant -4194304 : i32
    %3 = arith.bitcast %c-4194304_i32 : i32 to f32
    call @func_roundf(%cst_7) : (f32) -> ()
    call @func_roundf(%cst_8) : (f32) -> ()
    call @func_roundf(%0) : (f32) -> ()
    call @func_roundf(%1) : (f32) -> ()
    call @func_roundf$bitcast_result_to_int(%2) : (f32) -> ()
    vector.print %c2143289344_i32 : i32
    call @func_roundf$bitcast_result_to_int(%3) : (f32) -> ()
    vector.print %c-4194304_i32 : i32
    %cst_9 = arith.constant 1.268000e+30 : f32
    call @func_roundf(%cst_9) : (f32) -> ()
    %cst_10 = arith.constant 8388606.5 : f32
    %cst_11 = arith.constant 0x4AFFFFFE : f32
    %cst_12 = arith.constant 8388607.5 : f32
    %cst_13 = arith.constant 0x4B000000 : f32
    %cst_14 = arith.constant 0x4B000001 : f32
    call @func_roundf$bitcast_result_to_int(%cst_10) : (f32) -> ()
    call @func_roundf$bitcast_result_to_int(%cst_11) : (f32) -> ()
    call @func_roundf$bitcast_result_to_int(%cst_12) : (f32) -> ()
    call @func_roundf$bitcast_result_to_int(%cst_13) : (f32) -> ()
    call @func_roundf$bitcast_result_to_int(%cst_14) : (f32) -> ()
    %cst_15 = arith.constant dense<5.000000e-01> : vector<1xf32>
    call @func_roundf$vector(%cst_15) : (vector<1xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @func_powff64(%arg0: f64, %arg1: f64) {
    %0 = math.powf %arg0, %arg1 : f64
    vector.print %0 : f64
    return
  }
  func.func @func_powff32(%arg0: f32, %arg1: f32) {
    %0 = math.powf %arg0, %arg1 : f32
    vector.print %0 : f32
    return
  }
  func.func @powf() {
    %cst = arith.constant 4.000000e+00 : f64
    %cst_0 = arith.constant 2.000000e+00 : f64
    call @func_powff64(%cst, %cst_0) : (f64, f64) -> ()
    %cst_1 = arith.constant 2.343000e+00 : f64
    %cst_2 = arith.constant 1.000000e+00 : f64
    call @func_powff64(%cst_1, %cst_2) : (f64, f64) -> ()
    %cst_3 = arith.constant 4.250000e+00 : f64
    %cst_4 = arith.constant -1.200000e+00 : f64
    call @func_powff64(%cst_3, %cst_4) : (f64, f64) -> ()
    %cst_5 = arith.constant 4.385000e+00 : f64
    %cst_6 = arith.constant 0.000000e+00 : f64
    call @func_powff64(%cst_5, %cst_6) : (f64, f64) -> ()
    %cst_7 = arith.constant 4.835000e+00 : f64
    %cst_8 = arith.constant 1.200000e+00 : f64
    call @func_powff64(%cst_7, %cst_8) : (f64, f64) -> ()
    %cst_9 = arith.constant 1.000000e+00 : f64
    %cst_10 = arith.constant 0x7FFFFFFFFFFFFFFF : f64
    call @func_powff64(%cst_9, %cst_10) : (f64, f64) -> ()
    %cst_11 = arith.constant 2.938500e+04 : f64
    %cst_12 = arith.constant 2.359800e+04 : f64
    call @func_powff64(%cst_11, %cst_12) : (f64, f64) -> ()
    %cst_13 = arith.constant 1.000000e+00 : f64
    %cst_14 = arith.constant 0xFFF0000001000000 : f64
    call @func_powff64(%cst_13, %cst_14) : (f64, f64) -> ()
    %cst_15 = arith.constant 1.000000e+00 : f32
    %cst_16 = arith.constant 0xFFFFFFFF : f32
    call @func_powff32(%cst_15, %cst_16) : (f32, f32) -> ()
    %cst_17 = arith.constant 0.000000e+00 : f32
    %0 = math.powf %cst_17, %cst_17 : f32
    vector.print %0 : f32
    %cst_18 = arith.constant -2.000000e+00 : f32
    %cst_19 = arith.constant 2.000000e+00 : f32
    %1 = math.powf %cst_18, %cst_19 : f32
    vector.print %1 : f32
    %cst_20 = arith.constant -2.000000e+00 : f32
    %cst_21 = arith.constant -2.000000e+00 : f32
    %2 = math.powf %cst_18, %cst_21 : f32
    vector.print %2 : f32
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @func_roundeven32(%arg0: f32) {
    %0 = math.roundeven %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @func_roundeven32$bitcast_result_to_int(%arg0: f32) {
    %0 = math.roundeven %arg0 : f32
    %1 = arith.bitcast %0 : f32 to i32
    vector.print %1 : i32
    return
  }
  func.func @func_roundeven32$vector(%arg0: vector<1xf32>) {
    %0 = math.roundeven %arg0 : vector<1xf32>
    vector.print %0 : vector<1xf32>
    return
  }
  func.func @roundeven32() {
    %cst = arith.constant 2.500000e-01 : f32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 7.500000e-01 : f32
    %cst_2 = arith.constant 1.000000e+00 : f32
    %cst_3 = arith.constant 1.250000e+00 : f32
    %cst_4 = arith.constant 1.500000e+00 : f32
    %cst_5 = arith.constant 1.750000e+00 : f32
    %cst_6 = arith.constant 2.000000e+00 : f32
    %cst_7 = arith.constant 2.250000e+00 : f32
    %cst_8 = arith.constant 2.500000e+00 : f32
    %cst_9 = arith.constant 2.750000e+00 : f32
    %cst_10 = arith.constant 3.000000e+00 : f32
    %cst_11 = arith.constant 3.250000e+00 : f32
    %cst_12 = arith.constant 3.500000e+00 : f32
    %cst_13 = arith.constant 3.750000e+00 : f32
    %cst_14 = arith.constant -2.500000e-01 : f32
    %cst_15 = arith.constant -5.000000e-01 : f32
    %cst_16 = arith.constant -7.500000e-01 : f32
    %cst_17 = arith.constant -1.000000e+00 : f32
    %cst_18 = arith.constant -1.250000e+00 : f32
    %cst_19 = arith.constant -1.500000e+00 : f32
    %cst_20 = arith.constant -1.750000e+00 : f32
    %cst_21 = arith.constant -2.000000e+00 : f32
    %cst_22 = arith.constant -2.250000e+00 : f32
    %cst_23 = arith.constant -2.500000e+00 : f32
    %cst_24 = arith.constant -2.750000e+00 : f32
    %cst_25 = arith.constant -3.000000e+00 : f32
    %cst_26 = arith.constant -3.250000e+00 : f32
    %cst_27 = arith.constant -3.500000e+00 : f32
    %cst_28 = arith.constant -3.750000e+00 : f32
    call @func_roundeven32(%cst) : (f32) -> ()
    call @func_roundeven32(%cst_0) : (f32) -> ()
    call @func_roundeven32(%cst_1) : (f32) -> ()
    call @func_roundeven32(%cst_2) : (f32) -> ()
    call @func_roundeven32(%cst_3) : (f32) -> ()
    call @func_roundeven32(%cst_4) : (f32) -> ()
    call @func_roundeven32(%cst_5) : (f32) -> ()
    call @func_roundeven32(%cst_6) : (f32) -> ()
    call @func_roundeven32(%cst_7) : (f32) -> ()
    call @func_roundeven32(%cst_8) : (f32) -> ()
    call @func_roundeven32(%cst_9) : (f32) -> ()
    call @func_roundeven32(%cst_10) : (f32) -> ()
    call @func_roundeven32(%cst_11) : (f32) -> ()
    call @func_roundeven32(%cst_12) : (f32) -> ()
    call @func_roundeven32(%cst_13) : (f32) -> ()
    call @func_roundeven32(%cst_14) : (f32) -> ()
    call @func_roundeven32(%cst_15) : (f32) -> ()
    call @func_roundeven32(%cst_16) : (f32) -> ()
    call @func_roundeven32(%cst_17) : (f32) -> ()
    call @func_roundeven32(%cst_18) : (f32) -> ()
    call @func_roundeven32(%cst_19) : (f32) -> ()
    call @func_roundeven32(%cst_20) : (f32) -> ()
    call @func_roundeven32(%cst_21) : (f32) -> ()
    call @func_roundeven32(%cst_22) : (f32) -> ()
    call @func_roundeven32(%cst_23) : (f32) -> ()
    call @func_roundeven32(%cst_24) : (f32) -> ()
    call @func_roundeven32(%cst_25) : (f32) -> ()
    call @func_roundeven32(%cst_26) : (f32) -> ()
    call @func_roundeven32(%cst_27) : (f32) -> ()
    call @func_roundeven32(%cst_28) : (f32) -> ()
    %cst_29 = arith.constant -0.000000e+00 : f32
    %cst_30 = arith.constant 0.000000e+00 : f32
    %c2139095040_i32 = arith.constant 2139095040 : i32
    %0 = arith.bitcast %c2139095040_i32 : i32 to f32
    %c-8388608_i32 = arith.constant -8388608 : i32
    %1 = arith.bitcast %c-8388608_i32 : i32 to f32
    %c2143289344_i32 = arith.constant 2143289344 : i32
    %2 = arith.bitcast %c2143289344_i32 : i32 to f32
    %c-4194304_i32 = arith.constant -4194304 : i32
    %3 = arith.bitcast %c-4194304_i32 : i32 to f32
    call @func_roundeven32(%cst_29) : (f32) -> ()
    call @func_roundeven32(%cst_30) : (f32) -> ()
    call @func_roundeven32(%0) : (f32) -> ()
    call @func_roundeven32(%1) : (f32) -> ()
    call @func_roundeven32$bitcast_result_to_int(%2) : (f32) -> ()
    vector.print %c2143289344_i32 : i32
    call @func_roundeven32$bitcast_result_to_int(%3) : (f32) -> ()
    vector.print %c-4194304_i32 : i32
    %cst_31 = arith.constant 8388606.5 : f32
    %cst_32 = arith.constant 0x4AFFFFFE : f32
    %cst_33 = arith.constant 8388607.5 : f32
    %cst_34 = arith.constant 0x4B000000 : f32
    %cst_35 = arith.constant 0x4B000001 : f32
    call @func_roundeven32$bitcast_result_to_int(%cst_31) : (f32) -> ()
    call @func_roundeven32$bitcast_result_to_int(%cst_32) : (f32) -> ()
    call @func_roundeven32$bitcast_result_to_int(%cst_33) : (f32) -> ()
    call @func_roundeven32$bitcast_result_to_int(%cst_34) : (f32) -> ()
    call @func_roundeven32$bitcast_result_to_int(%cst_35) : (f32) -> ()
    %cst_36 = arith.constant dense<5.000000e-01> : vector<1xf32>
    call @func_roundeven32$vector(%cst_36) : (vector<1xf32>) -> ()
    return
  }
  func.func @func_roundeven64(%arg0: f64) {
    %0 = math.roundeven %arg0 : f64
    vector.print %0 : f64
    return
  }
  func.func @func_roundeven64$bitcast_result_to_int(%arg0: f64) {
    %0 = math.roundeven %arg0 : f64
    %1 = arith.bitcast %0 : f64 to i64
    vector.print %1 : i64
    return
  }
  func.func @func_roundeven64$vector(%arg0: vector<1xf64>) {
    %0 = math.roundeven %arg0 : vector<1xf64>
    vector.print %0 : vector<1xf64>
    return
  }
  func.func @roundeven64() {
    %cst = arith.constant 2.500000e-01 : f64
    %cst_0 = arith.constant 5.000000e-01 : f64
    %cst_1 = arith.constant 7.500000e-01 : f64
    %cst_2 = arith.constant 1.000000e+00 : f64
    %cst_3 = arith.constant 1.250000e+00 : f64
    %cst_4 = arith.constant 1.500000e+00 : f64
    %cst_5 = arith.constant 1.750000e+00 : f64
    %cst_6 = arith.constant 2.000000e+00 : f64
    %cst_7 = arith.constant 2.250000e+00 : f64
    %cst_8 = arith.constant 2.500000e+00 : f64
    %cst_9 = arith.constant 2.750000e+00 : f64
    %cst_10 = arith.constant 3.000000e+00 : f64
    %cst_11 = arith.constant 3.250000e+00 : f64
    %cst_12 = arith.constant 3.500000e+00 : f64
    %cst_13 = arith.constant 3.750000e+00 : f64
    %cst_14 = arith.constant -2.500000e-01 : f64
    %cst_15 = arith.constant -5.000000e-01 : f64
    %cst_16 = arith.constant -7.500000e-01 : f64
    %cst_17 = arith.constant -1.000000e+00 : f64
    %cst_18 = arith.constant -1.250000e+00 : f64
    %cst_19 = arith.constant -1.500000e+00 : f64
    %cst_20 = arith.constant -1.750000e+00 : f64
    %cst_21 = arith.constant -2.000000e+00 : f64
    %cst_22 = arith.constant -2.250000e+00 : f64
    %cst_23 = arith.constant -2.500000e+00 : f64
    %cst_24 = arith.constant -2.750000e+00 : f64
    %cst_25 = arith.constant -3.000000e+00 : f64
    %cst_26 = arith.constant -3.250000e+00 : f64
    %cst_27 = arith.constant -3.500000e+00 : f64
    %cst_28 = arith.constant -3.750000e+00 : f64
    call @func_roundeven64(%cst) : (f64) -> ()
    call @func_roundeven64(%cst_0) : (f64) -> ()
    call @func_roundeven64(%cst_1) : (f64) -> ()
    call @func_roundeven64(%cst_2) : (f64) -> ()
    call @func_roundeven64(%cst_3) : (f64) -> ()
    call @func_roundeven64(%cst_4) : (f64) -> ()
    call @func_roundeven64(%cst_5) : (f64) -> ()
    call @func_roundeven64(%cst_6) : (f64) -> ()
    call @func_roundeven64(%cst_7) : (f64) -> ()
    call @func_roundeven64(%cst_8) : (f64) -> ()
    call @func_roundeven64(%cst_9) : (f64) -> ()
    call @func_roundeven64(%cst_10) : (f64) -> ()
    call @func_roundeven64(%cst_11) : (f64) -> ()
    call @func_roundeven64(%cst_12) : (f64) -> ()
    call @func_roundeven64(%cst_13) : (f64) -> ()
    call @func_roundeven64(%cst_14) : (f64) -> ()
    call @func_roundeven64(%cst_15) : (f64) -> ()
    call @func_roundeven64(%cst_16) : (f64) -> ()
    call @func_roundeven64(%cst_17) : (f64) -> ()
    call @func_roundeven64(%cst_18) : (f64) -> ()
    call @func_roundeven64(%cst_19) : (f64) -> ()
    call @func_roundeven64(%cst_20) : (f64) -> ()
    call @func_roundeven64(%cst_21) : (f64) -> ()
    call @func_roundeven64(%cst_22) : (f64) -> ()
    call @func_roundeven64(%cst_23) : (f64) -> ()
    call @func_roundeven64(%cst_24) : (f64) -> ()
    call @func_roundeven64(%cst_25) : (f64) -> ()
    call @func_roundeven64(%cst_26) : (f64) -> ()
    call @func_roundeven64(%cst_27) : (f64) -> ()
    call @func_roundeven64(%cst_28) : (f64) -> ()
    %cst_29 = arith.constant -0.000000e+00 : f64
    %cst_30 = arith.constant 0.000000e+00 : f64
    %c9218868437227405312_i64 = arith.constant 9218868437227405312 : i64
    %0 = arith.bitcast %c9218868437227405312_i64 : i64 to f64
    %c-4503599627370496_i64 = arith.constant -4503599627370496 : i64
    %1 = arith.bitcast %c-4503599627370496_i64 : i64 to f64
    %c9218868437227405313_i64 = arith.constant 9218868437227405313 : i64
    %2 = arith.bitcast %c9218868437227405313_i64 : i64 to f64
    %c-4503599627370495_i64 = arith.constant -4503599627370495 : i64
    %3 = arith.bitcast %c-4503599627370495_i64 : i64 to f64
    call @func_roundeven64(%cst_29) : (f64) -> ()
    call @func_roundeven64(%cst_30) : (f64) -> ()
    call @func_roundeven64(%0) : (f64) -> ()
    call @func_roundeven64(%1) : (f64) -> ()
    %cst_31 = arith.constant 4503599627370494.5 : f64
    %cst_32 = arith.constant 0x432FFFFFFFFFFFFE : f64
    %cst_33 = arith.constant 4503599627370495.5 : f64
    %cst_34 = arith.constant 0x4330000000000000 : f64
    %cst_35 = arith.constant 0x4330000000000001 : f64
    call @func_roundeven64$bitcast_result_to_int(%cst_31) : (f64) -> ()
    call @func_roundeven64$bitcast_result_to_int(%cst_32) : (f64) -> ()
    call @func_roundeven64$bitcast_result_to_int(%cst_33) : (f64) -> ()
    call @func_roundeven64$bitcast_result_to_int(%cst_34) : (f64) -> ()
    call @func_roundeven64$bitcast_result_to_int(%cst_35) : (f64) -> ()
    %cst_36 = arith.constant dense<5.000000e-01> : vector<1xf64>
    call @func_roundeven64$vector(%cst_36) : (vector<1xf64>) -> ()
    return
  }
  func.func @roundeven() {
    call @roundeven32() : () -> ()
    call @roundeven64() : () -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @sinh_f32(%arg0: f32) {
    %0 = math.sinh %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @sinh_4xf32(%arg0: vector<4xf32>) {
    %0 = math.sinh %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @sinh_8xf32(%arg0: vector<8xf32>) {
    %0 = math.sinh %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @sinh() {
    %cst = arith.constant 1.250000e+00 : f32
    call @sinh_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>
    call @sinh_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>
    call @sinh_8xf32(%cst_1) : (vector<8xf32>) -> ()
    %cst_2 = arith.constant dense<[-1.000000e-01, -2.000000e-01, -3.000000e-01, -4.000000e-01, -5.000000e-01, -6.000000e-01, -0.699999988, -8.000000e-01]> : vector<8xf32>
    call @sinh_8xf32(%cst_2) : (vector<8xf32>) -> ()
    %cst_3 = arith.constant 0x7FC00000 : f32
    call @sinh_f32(%cst_3) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @cosh_f32(%arg0: f32) {
    %0 = math.cosh %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @cosh_4xf32(%arg0: vector<4xf32>) {
    %0 = math.cosh %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @cosh_8xf32(%arg0: vector<8xf32>) {
    %0 = math.cosh %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @cosh() {
    %cst = arith.constant 1.250000e+00 : f32
    call @cosh_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>
    call @cosh_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>
    call @cosh_8xf32(%cst_1) : (vector<8xf32>) -> ()
    %cst_2 = arith.constant dense<[-1.000000e-01, -2.000000e-01, -3.000000e-01, -4.000000e-01, -5.000000e-01, -6.000000e-01, -0.699999988, -8.000000e-01]> : vector<8xf32>
    call @cosh_8xf32(%cst_2) : (vector<8xf32>) -> ()
    %cst_3 = arith.constant 0x7FC00000 : f32
    call @cosh_f32(%cst_3) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @tanh_8xf32(%arg0: vector<8xf32>) {
    %0 = math.tanh %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @tanh() {
    %cst = arith.constant dense<[0xFF800000, -1.000000e+00, -3.000000e-01, 0.000000e+00, 3.000000e-01, 1.000000e+00, 1.000000e+01, 0x7F800000]> : vector<8xf32>
    call @tanh_8xf32(%cst) : (vector<8xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @asinh_f32(%arg0: f32) {
    %0 = math.asinh %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @asinh_3xf32(%arg0: vector<3xf32>) {
    %0 = math.asinh %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @asinh() {
    %cst = arith.constant 0.000000e+00 : f32
    call @asinh_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 1.000000e+00 : f32
    call @asinh_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant -1.000000e+00 : f32
    call @asinh_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant 3.000000e+00 : f32
    call @asinh_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant dense<[2.500000e-01, 8.750000e-01, 2.000000e+00]> : vector<3xf32>
    call @asinh_3xf32(%cst_3) : (vector<3xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @acosh_f32(%arg0: f32) {
    %0 = math.acosh %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @acosh_3xf32(%arg0: vector<3xf32>) {
    %0 = math.acosh %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @acosh() {
    %cst = arith.constant 1.000000e+00 : f32
    call @acosh_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 2.000000e+00 : f32
    call @acosh_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant 1.000000e+01 : f32
    call @acosh_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant dense<[1.500000e+00, 3.000000e+00, 6.000000e+00]> : vector<3xf32>
    call @acosh_3xf32(%cst_2) : (vector<3xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @atanh_f32(%arg0: f32) {
    %0 = math.atanh %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @atanh_3xf32(%arg0: vector<3xf32>) {
    %0 = math.atanh %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @atanh() {
    %cst = arith.constant 0.000000e+00 : f32
    call @atanh_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 5.000000e-01 : f32
    call @atanh_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant -5.000000e-01 : f32
    call @atanh_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant 1.000000e+00 : f32
    call @atanh_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant dense<[2.500000e-01, 3.750000e-01, 9.950000e-01]> : vector<3xf32>
    call @atanh_3xf32(%cst_3) : (vector<3xf32>) -> ()
    return
  }
}

// -----
module {
}

