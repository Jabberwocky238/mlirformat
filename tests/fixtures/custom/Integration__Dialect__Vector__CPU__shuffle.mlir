module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<2x4xf32>
    %1 = vector.broadcast %cst_0 : f32 to vector<2x4xf32>
    vector.print %0 : vector<2x4xf32>
    vector.print %1 : vector<2x4xf32>
    %2 = vector.shuffle %0, %1 [3, 1, 2] : vector<2x4xf32>, vector<2x4xf32>
    vector.print %2 : vector<3x4xf32>
    return
  }
}

