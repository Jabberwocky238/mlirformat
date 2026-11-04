module {
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_i8() {
    %cst = arith.constant dense<0> : vector<[16]x[16]xi8>
    "prevent.dce"(%cst) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_i16() {
    %cst = arith.constant dense<0> : vector<[8]x[8]xi16>
    "prevent.dce"(%cst) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_i32() {
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    "prevent.dce"(%cst) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_i64() {
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    "prevent.dce"(%cst) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_f16() {
    %cst = arith.constant dense<0.000000e+00> : vector<[8]x[8]xf16>
    "prevent.dce"(%cst) : (vector<[8]x[8]xf16>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_bf16() {
    %cst = arith.constant dense<0.000000e+00> : vector<[8]x[8]xbf16>
    "prevent.dce"(%cst) : (vector<[8]x[8]xbf16>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_f32() {
    %cst = arith.constant dense<0.000000e+00> : vector<[4]x[4]xf32>
    "prevent.dce"(%cst) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_zero_f64() {
    %cst = arith.constant dense<0.000000e+00> : vector<[2]x[2]xf64>
    "prevent.dce"(%cst) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_nonzero_i8() {
    %cst = arith.constant dense<2> : vector<[16]x[16]xi8>
    "prevent.dce"(%cst) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @arith_constant_dense_2d_nonzero_f64() {
    %cst = arith.constant dense<2.000000e+00> : vector<[2]x[2]xf64>
    "prevent.dce"(%cst) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

