module {
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %0 = vector.broadcast %cst_0 : f32 to vector<8xf32>
    %1 = vector.broadcast %cst_1 : f32 to vector<8xf32>
    %2 = vector.broadcast %cst_2 : f32 to vector<8xf32>
    %3 = vector.broadcast %cst_3 : f32 to vector<8xf32>
    %4 = vector.broadcast %cst : f32 to vector<4x4x8xf32>
    %5 = vector.insert %0, %4 [1, 1] : vector<8xf32> into vector<4x4x8xf32>
    %6 = vector.insert %1, %5 [1, 2] : vector<8xf32> into vector<4x4x8xf32>
    %7 = vector.insert %2, %6 [2, 1] : vector<8xf32> into vector<4x4x8xf32>
    %8 = vector.insert %3, %7 [2, 2] : vector<8xf32> into vector<4x4x8xf32>
    %9 = vector.extract_strided_slice %8 {offsets = [1, 1], sizes = [2, 2], strides = [1, 1]} : vector<4x4x8xf32> to vector<2x2x8xf32>
    vector.print %9 : vector<2x2x8xf32>
    return
  }
}

