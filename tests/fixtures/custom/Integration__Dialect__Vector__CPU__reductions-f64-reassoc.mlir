module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f64
    %cst_0 = arith.constant 2.000000e+00 : f64
    %cst_1 = arith.constant 3.000000e+00 : f64
    %0 = vector.broadcast %cst : f64 to vector<64xf64>
    %1 = vector.insert %cst_0, %0 [11] : f64 into vector<64xf64>
    %2 = vector.insert %cst_1, %1 [52] : f64 into vector<64xf64>
    vector.print %2 : vector<64xf64>
    %3 = vector.reduction <add>, %2 : vector<64xf64> into f64
    vector.print %3 : f64
    %4 = vector.reduction <mul>, %2 : vector<64xf64> into f64
    vector.print %4 : f64
    %5 = vector.reduction <minimumf>, %2 : vector<64xf64> into f64
    vector.print %5 : f64
    %6 = vector.reduction <maximumf>, %2 : vector<64xf64> into f64
    vector.print %6 : f64
    %7 = vector.reduction <minnumf>, %2 : vector<64xf64> into f64
    vector.print %7 : f64
    %8 = vector.reduction <maxnumf>, %2 : vector<64xf64> into f64
    vector.print %8 : f64
    return
  }
}

