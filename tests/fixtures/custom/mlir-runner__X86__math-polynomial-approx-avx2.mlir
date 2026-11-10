module {
}

// -----
module {
}

// -----
module {
  func.func @rsqrt() {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = math.rsqrt %cst : f32
    vector.print %0 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %1 = math.rsqrt %cst_0 : f32
    vector.print %1 : f32
    %cst_1 = arith.constant dense<2.000000e+00> : vector<8xf32>
    %2 = math.rsqrt %cst_1 : vector<8xf32>
    vector.print %2 : vector<8xf32>
    return
  }
  func.func @main() {
    call @rsqrt() : () -> ()
    return
  }
}

