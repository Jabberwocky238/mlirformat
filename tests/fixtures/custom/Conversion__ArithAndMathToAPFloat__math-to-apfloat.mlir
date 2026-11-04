module {
  func.func @full_example() {
    %cst = arith.constant -1.375000e+00 : f8E4M3FN
    %0 = math.absf %cst : f8E4M3FN
    %cst_0 = arith.constant 2.000000e+00 : f8E8M0FNU
    %cst_1 = arith.constant 4.000000e+00 : f8E8M0FNU
    %cst_2 = arith.constant 8.000000e+00 : f8E8M0FNU
    %1 = math.fma %cst_1, %cst_0, %cst_2 : f8E8M0FNU
    %2 = math.isinf %cst : f8E4M3FN
    %3 = math.isnan %cst : f8E4M3FN
    %4 = math.isnormal %cst : f8E4M3FN
    %5 = math.isfinite %cst : f8E4M3FN
    return
  }
}

