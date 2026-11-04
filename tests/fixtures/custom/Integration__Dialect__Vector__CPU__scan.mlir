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
    %6 = vector.broadcast %cst_4 : f32 to vector<2xf32>
    %7 = vector.broadcast %cst_4 : f32 to vector<3xf32>
    %dest, %accumulated_value = vector.scan <add>, %5, %6 {inclusive = true, reduction_dim = 0 : i64} : vector<3x2xf32>, vector<2xf32>
    %dest_5, %accumulated_value_6 = vector.scan <add>, %5, %7 {inclusive = true, reduction_dim = 1 : i64} : vector<3x2xf32>, vector<3xf32>
    %dest_7, %accumulated_value_8 = vector.scan <add>, %5, %6 {inclusive = false, reduction_dim = 0 : i64} : vector<3x2xf32>, vector<2xf32>
    %dest_9, %accumulated_value_10 = vector.scan <add>, %5, %7 {inclusive = false, reduction_dim = 1 : i64} : vector<3x2xf32>, vector<3xf32>
    vector.print %dest : vector<3x2xf32>
    vector.print %accumulated_value : vector<2xf32>
    vector.print %dest_5 : vector<3x2xf32>
    vector.print %accumulated_value_6 : vector<3xf32>
    vector.print %dest_7 : vector<3x2xf32>
    vector.print %accumulated_value_8 : vector<2xf32>
    vector.print %dest_9 : vector<3x2xf32>
    vector.print %accumulated_value_10 : vector<3xf32>
    return
  }
}

