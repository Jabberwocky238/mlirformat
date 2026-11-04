module {
  func.func @entry() {
    %cst = arith.constant dense<[-1.000000e+03, -1.100000e+00, 0.000000e+00, 1.100000e+00, 1.000000e+03]> : vector<5xf64>
    vector.print %cst : vector<5xf64>
    %cst_0 = arith.constant dense<[-1.000000e+03, -1.100000e+00, 0.000000e+00, 1.100000e+00, 1.000000e+03]> : vector<5xf32>
    vector.print %cst_0 : vector<5xf32>
    %cst_1 = arith.constant dense<[-1.000000e+03, -1.099610e+00, 0.000000e+00, 1.099610e+00, 1.000000e+03]> : vector<5xf16>
    vector.print %cst_1 : vector<5xf16>
    %cst_2 = arith.constant dense<[-1.000000e+03, -1.101560e+00, 0.000000e+00, 1.101560e+00, 1.000000e+03]> : vector<5xbf16>
    vector.print %cst_2 : vector<5xbf16>
    return
  }
}

