module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 3.000000e+00 : f32
    %cst_2 = arith.constant 4.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<4xf32>
    %1 = vector.broadcast %cst_0 : f32 to vector<3xf32>
    %2 = vector.broadcast %cst_1 : f32 to vector<4x4xf32>
    %3 = vector.broadcast %cst_2 : f32 to vector<1xf32>
    %4 = vector.insert_strided_slice %0, %2 {offsets = [2, 0], strides = [1]} : vector<4xf32> into vector<4x4xf32>
    %5 = vector.insert_strided_slice %1, %4 {offsets = [1, 1], strides = [1]} : vector<3xf32> into vector<4x4xf32>
    %6 = vector.insert_strided_slice %1, %5 {offsets = [0, 0], strides = [1]} : vector<3xf32> into vector<4x4xf32>
    %7 = vector.insert_strided_slice %3, %6 {offsets = [3, 3], strides = [1]} : vector<1xf32> into vector<4x4xf32>
    vector.print %2 : vector<4x4xf32>
    vector.print %4 : vector<4x4xf32>
    vector.print %5 : vector<4x4xf32>
    vector.print %6 : vector<4x4xf32>
    vector.print %7 : vector<4x4xf32>
    return
  }
}

