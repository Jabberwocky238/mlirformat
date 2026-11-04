module {
  func.func @entry() {
    %cst = arith.constant -1.375000e+00 : f8E4M3FN
    %0 = math.absf %cst : f8E4M3FN
    vector.print %0 : f8E4M3FN
    %cst_0 = arith.constant 2.000000e+00 : f8E8M0FNU
    %cst_1 = arith.constant 4.000000e+00 : f8E8M0FNU
    %cst_2 = arith.constant 8.000000e+00 : f8E8M0FNU
    %1 = math.fma %cst_1, %cst_0, %cst_2 : f8E8M0FNU
    vector.print %1 : f8E8M0FNU
    %2 = math.isinf %cst : f8E4M3FN
    vector.print %2 : i1
    %3 = math.isnan %cst : f8E4M3FN
    vector.print %3 : i1
    %4 = math.isnormal %cst : f8E4M3FN
    vector.print %4 : i1
    %5 = math.isfinite %cst : f8E4M3FN
    vector.print %5 : i1
    %cst_3 = arith.constant -1.400000e+00 : f32
    %6 = math.absf %cst_3 : f32
    vector.print %6 : f32
    %cst_4 = arith.constant 2.000000e+00 : f32
    %cst_5 = arith.constant 4.000000e+00 : f32
    %cst_6 = arith.constant 8.000000e+00 : f32
    %7 = math.fma %cst_5, %cst_4, %cst_6 : f32
    vector.print %7 : f32
    %8 = math.isinf %cst_3 : f32
    vector.print %8 : i1
    %9 = math.isnan %cst_3 : f32
    vector.print %9 : i1
    %10 = math.isnormal %cst_3 : f32
    vector.print %10 : i1
    %11 = math.isfinite %cst_3 : f32
    vector.print %11 : i1
    return
  }
}

