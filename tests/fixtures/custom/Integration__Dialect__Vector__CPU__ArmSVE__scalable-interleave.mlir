module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<[4]xf32>
    %1 = vector.broadcast %cst_0 : f32 to vector<[4]xf32>
    vector.print %0 : vector<[4]xf32>
    vector.print %1 : vector<[4]xf32>
    %2 = vector.interleave %0, %1 : vector<[4]xf32> -> vector<[8]xf32>
    vector.print %2 : vector<[8]xf32>
    return
  }
}

