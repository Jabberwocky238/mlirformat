module {
  func.func @entry() {
    %cst = arith.constant 1.500000e+00 : f64
    %cst_0 = arith.constant 2.000000e+00 : f64
    %cst_1 = arith.constant 3.000000e+00 : f64
    %cst_2 = arith.constant 4.000000e+00 : f64
    %cst_3 = arith.constant 5.000000e+00 : f64
    %cst_4 = arith.constant -1.000000e+00 : f64
    %cst_5 = arith.constant -2.000000e+00 : f64
    %cst_6 = arith.constant -4.000000e+00 : f64
    %cst_7 = arith.constant -2.500000e-01 : f64
    %cst_8 = arith.constant -1.600000e+01 : f64
    %0 = vector.broadcast %cst : f64 to vector<10xf64>
    %1 = vector.insert %cst_0, %0 [1] : f64 into vector<10xf64>
    %2 = vector.insert %cst_1, %1 [2] : f64 into vector<10xf64>
    %3 = vector.insert %cst_2, %2 [3] : f64 into vector<10xf64>
    %4 = vector.insert %cst_3, %3 [4] : f64 into vector<10xf64>
    %5 = vector.insert %cst_4, %4 [5] : f64 into vector<10xf64>
    %6 = vector.insert %cst_5, %5 [6] : f64 into vector<10xf64>
    %7 = vector.insert %cst_6, %6 [7] : f64 into vector<10xf64>
    %8 = vector.insert %cst_7, %7 [8] : f64 into vector<10xf64>
    %9 = vector.insert %cst_8, %8 [9] : f64 into vector<10xf64>
    vector.print %9 : vector<10xf64>
    %10 = vector.reduction <add>, %9 : vector<10xf64> into f64
    vector.print %10 : f64
    %11 = vector.reduction <mul>, %9 : vector<10xf64> into f64
    vector.print %11 : f64
    %12 = vector.reduction <minimumf>, %9 : vector<10xf64> into f64
    vector.print %12 : f64
    %13 = vector.reduction <maximumf>, %9 : vector<10xf64> into f64
    vector.print %13 : f64
    %14 = vector.reduction <minnumf>, %9 : vector<10xf64> into f64
    vector.print %14 : f64
    %15 = vector.reduction <maxnumf>, %9 : vector<10xf64> into f64
    vector.print %15 : f64
    return
  }
}

