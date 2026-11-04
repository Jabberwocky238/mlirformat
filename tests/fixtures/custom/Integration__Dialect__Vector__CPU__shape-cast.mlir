module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 3.000000e+00 : f32
    %cst_2 = arith.constant 4.000000e+00 : f32
    %cst_3 = arith.constant 5.000000e+00 : f32
    %cst_4 = arith.constant 6.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<3x2xf32>
    %1 = vector.insert %cst_0, %0 [0, 1] : f32 into vector<3x2xf32>
    %2 = vector.insert %cst_1, %1 [1, 0] : f32 into vector<3x2xf32>
    %3 = vector.insert %cst_2, %2 [1, 1] : f32 into vector<3x2xf32>
    %4 = vector.insert %cst_3, %3 [2, 0] : f32 into vector<3x2xf32>
    %5 = vector.insert %cst_4, %4 [2, 1] : f32 into vector<3x2xf32>
    vector.print %5 : vector<3x2xf32>
    %6 = vector.shape_cast %5 : vector<3x2xf32> to vector<3x2xf32>
    %7 = vector.shape_cast %5 : vector<3x2xf32> to vector<2x3xf32>
    %8 = vector.shape_cast %5 : vector<3x2xf32> to vector<6xf32>
    %9 = vector.shape_cast %8 : vector<6xf32> to vector<2x3xf32>
    %10 = vector.shape_cast %8 : vector<6xf32> to vector<3x2xf32>
    vector.print %6 : vector<3x2xf32>
    vector.print %7 : vector<2x3xf32>
    vector.print %8 : vector<6xf32>
    vector.print %9 : vector<2x3xf32>
    vector.print %10 : vector<3x2xf32>
    return
  }
}

