module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 3.000000e+00 : f32
    %cst_1 = arith.constant 7.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<8xf32>
    %1 = vector.broadcast %cst_0 : f32 to vector<8xf32>
    %2 = vector.broadcast %cst_1 : f32 to vector<8xf32>
    vector.print %0 : vector<8xf32>
    vector.print %1 : vector<8xf32>
    vector.print %2 : vector<8xf32>
    %3 = vector.fma %1, %2, %0 : vector<8xf32>
    vector.print %3 : vector<8xf32>
    return
  }
}

