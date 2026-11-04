module {
  func.func @entry() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<[1.250000e-01, 2.500000e-01, 5.000000e-01, 1.000000e+00, 2.000000e+00, 4.000000e+00, 8.000000e+00, 1.600000e+01]> : vector<8xf32>
    %0 = x86vector.avx.rsqrt %cst : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return %c0_i32 : i32
  }
}

