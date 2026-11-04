module {
  func.func @entry() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<[1.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00, 4.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00, 8.000000e+00, 1.000000e+00, 5.000000e+00, 5.000000e+00, 3.000000e+00, 1.000000e+00, 0.000000e+00, 7.000000e+00]> : vector<16xf32>
    %cst_0 = arith.constant dense<[true, false, true, true, true, false, false, false, false, false, true, true, true, true, true, false]> : vector<16xi1>
    %0 = x86vector.avx512.mask.compress %cst_0, %cst : vector<16xf32>
    %1 = x86vector.avx512.mask.compress %cst_0, %cst {constant_src = dense<5.000000e+00> : vector<16xf32>} : vector<16xf32>
    vector.print %0 : vector<16xf32>
    vector.print %1 : vector<16xf32>
    %cst_1 = arith.constant dense<[0.000000e+00, 2.000000e+00, 1.000000e+00, 8.000000e+00, 6.000000e+00, 4.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 8.000000e+00, 5.000000e+00, 6.000000e+00, 3.000000e+00, 7.000000e+00, 6.000000e+00, 9.000000e+00]> : vector<16xf32>
    %2 = x86vector.avx512.mask.compress %cst_0, %cst, %cst_1 : vector<16xf32>, vector<16xf32>
    vector.print %2 : vector<16xf32>
    return %c0_i32 : i32
  }
}

