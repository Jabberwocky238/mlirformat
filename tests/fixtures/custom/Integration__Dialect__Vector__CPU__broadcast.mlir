module {
  func.func @entry() {
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %0 = vector.broadcast %c2147483647_i32 : i32 to vector<2xi32>
    %1 = vector.broadcast %c9223372036854775807_i64 : i64 to vector<2xi64>
    %2 = vector.broadcast %cst_0 : f32 to vector<2x2x2xf32>
    vector.print %0 : vector<2xi32>
    vector.print %1 : vector<2xi64>
    vector.print %2 : vector<2x2x2xf32>
    %3 = vector.broadcast %cst_0 : f32 to vector<4xf32>
    %4 = vector.insert %cst_1, %3 [1] : f32 into vector<4xf32>
    %5 = vector.insert %cst_2, %4 [2] : f32 into vector<4xf32>
    %6 = vector.insert %cst_3, %5 [3] : f32 into vector<4xf32>
    %7 = vector.broadcast %6 : vector<4xf32> to vector<3x4xf32>
    %8 = vector.broadcast %6 : vector<4xf32> to vector<2x2x4xf32>
    vector.print %6 : vector<4xf32>
    vector.print %7 : vector<3x4xf32>
    vector.print %8 : vector<2x2x4xf32>
    %9 = vector.broadcast %cst_4 : f32 to vector<1xf32>
    %10 = vector.broadcast %9 : vector<1xf32> to vector<8xf32>
    vector.print %10 : vector<8xf32>
    %11 = vector.broadcast %6 : vector<4xf32> to vector<1x4xf32>
    %12 = vector.broadcast %11 : vector<1x4xf32> to vector<3x4xf32>
    vector.print %11 : vector<1x4xf32>
    vector.print %12 : vector<3x4xf32>
    %13 = vector.broadcast %cst_0 : f32 to vector<3x1xf32>
    %14 = vector.insert %cst_1, %13 [1, 0] : f32 into vector<3x1xf32>
    %15 = vector.insert %cst_2, %14 [2, 0] : f32 into vector<3x1xf32>
    %16 = vector.broadcast %15 : vector<3x1xf32> to vector<3x4xf32>
    vector.print %15 : vector<3x1xf32>
    vector.print %16 : vector<3x4xf32>
    %17 = vector.broadcast %cst : f32 to vector<3x1x2xf32>
    %18 = vector.insert %cst_0, %17 [0, 0, 1] : f32 into vector<3x1x2xf32>
    %19 = vector.insert %cst_1, %18 [1, 0, 0] : f32 into vector<3x1x2xf32>
    %20 = vector.insert %cst_2, %19 [1, 0, 1] : f32 into vector<3x1x2xf32>
    %21 = vector.insert %cst_3, %20 [2, 0, 0] : f32 into vector<3x1x2xf32>
    %22 = vector.insert %cst_4, %21 [2, 0, 1] : f32 into vector<3x1x2xf32>
    %23 = vector.broadcast %22 : vector<3x1x2xf32> to vector<3x4x2xf32>
    vector.print %22 : vector<3x1x2xf32>
    vector.print %23 : vector<3x4x2xf32>
    return
  }
}

