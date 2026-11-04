module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 3.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<64xf32>
    %1 = vector.insert %cst_0, %0 [11] : f32 into vector<64xf32>
    %2 = vector.insert %cst_1, %1 [52] : f32 into vector<64xf32>
    vector.print %2 : vector<64xf32>
    %3 = vector.reduction <add>, %2 : vector<64xf32> into f32
    vector.print %3 : f32
    %4 = vector.reduction <mul>, %2 : vector<64xf32> into f32
    vector.print %4 : f32
    %5 = vector.reduction <minimumf>, %2 : vector<64xf32> into f32
    vector.print %5 : f32
    %6 = vector.reduction <maximumf>, %2 : vector<64xf32> into f32
    vector.print %6 : f32
    %7 = vector.reduction <minnumf>, %2 : vector<64xf32> into f32
    vector.print %7 : f32
    %8 = vector.reduction <maxnumf>, %2 : vector<64xf32> into f32
    vector.print %8 : f32
    return
  }
}

