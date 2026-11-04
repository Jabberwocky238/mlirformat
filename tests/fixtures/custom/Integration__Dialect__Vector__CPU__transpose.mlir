module {
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %cst_5 = arith.constant 6.000000e+00 : f32
    %cst_6 = arith.constant 7.000000e+00 : f32
    %cst_7 = arith.constant 8.000000e+00 : f32
    %0 = vector.broadcast %cst_0 : f32 to vector<2xf32>
    %1 = vector.insert %cst_1, %0 [1] : f32 into vector<2xf32>
    %2 = vector.broadcast %cst_2 : f32 to vector<2xf32>
    %3 = vector.insert %cst_3, %2 [1] : f32 into vector<2xf32>
    %4 = vector.broadcast %cst_4 : f32 to vector<2xf32>
    %5 = vector.insert %cst_5, %4 [1] : f32 into vector<2xf32>
    %6 = vector.broadcast %cst_6 : f32 to vector<2xf32>
    %7 = vector.insert %cst_7, %6 [1] : f32 into vector<2xf32>
    %8 = vector.broadcast %cst : f32 to vector<2x2xf32>
    %9 = vector.insert %1, %8 [0] : vector<2xf32> into vector<2x2xf32>
    %10 = vector.insert %3, %9 [1] : vector<2xf32> into vector<2x2xf32>
    %11 = vector.broadcast %cst : f32 to vector<2x2xf32>
    %12 = vector.insert %5, %11 [0] : vector<2xf32> into vector<2x2xf32>
    %13 = vector.insert %7, %12 [1] : vector<2xf32> into vector<2x2xf32>
    %14 = vector.broadcast %cst : f32 to vector<3x2xf32>
    %15 = vector.insert %1, %14 [0] : vector<2xf32> into vector<3x2xf32>
    %16 = vector.insert %3, %15 [1] : vector<2xf32> into vector<3x2xf32>
    %17 = vector.insert %5, %16 [2] : vector<2xf32> into vector<3x2xf32>
    %cst_8 = arith.constant dense<0.000000e+00> : vector<2x4xf32>
    %18 = vector.insert_strided_slice %10, %cst_8 {offsets = [0, 0], strides = [1, 1]} : vector<2x2xf32> into vector<2x4xf32>
    %19 = vector.insert_strided_slice %13, %18 {offsets = [0, 2], strides = [1, 1]} : vector<2x2xf32> into vector<2x4xf32>
    vector.print %10 : vector<2x2xf32>
    vector.print %13 : vector<2x2xf32>
    vector.print %17 : vector<3x2xf32>
    vector.print %19 : vector<2x4xf32>
    %20 = vector.transpose %10, [1, 0] : vector<2x2xf32> to vector<2x2xf32>
    %21 = vector.transpose %13, [1, 0] : vector<2x2xf32> to vector<2x2xf32>
    %22 = vector.transpose %17, [1, 0] : vector<3x2xf32> to vector<2x3xf32>
    %23 = vector.transpose %19, [1, 0] : vector<2x4xf32> to vector<4x2xf32>
    vector.print %20 : vector<2x2xf32>
    vector.print %21 : vector<2x2xf32>
    vector.print %22 : vector<2x3xf32>
    vector.print %23 : vector<4x2xf32>
    %24 = vector.transpose %19, [0, 1] : vector<2x4xf32> to vector<2x4xf32>
    %25 = vector.transpose %23, [1, 0] : vector<4x2xf32> to vector<2x4xf32>
    vector.print %24 : vector<2x4xf32>
    vector.print %25 : vector<2x4xf32>
    %26 = vector.broadcast %cst_0 : f32 to vector<2x2x2xf32>
    %27 = vector.insert %cst_1, %26 [0, 0, 1] : f32 into vector<2x2x2xf32>
    %28 = vector.insert %cst_2, %27 [0, 1, 0] : f32 into vector<2x2x2xf32>
    %29 = vector.insert %cst_3, %28 [0, 1, 1] : f32 into vector<2x2x2xf32>
    %30 = vector.insert %cst_4, %29 [1, 0, 0] : f32 into vector<2x2x2xf32>
    %31 = vector.insert %cst_5, %30 [1, 0, 1] : f32 into vector<2x2x2xf32>
    %32 = vector.insert %cst_6, %31 [1, 1, 0] : f32 into vector<2x2x2xf32>
    %33 = vector.insert %cst_7, %32 [1, 1, 1] : f32 into vector<2x2x2xf32>
    vector.print %33 : vector<2x2x2xf32>
    %34 = vector.transpose %33, [0, 1, 2] : vector<2x2x2xf32> to vector<2x2x2xf32>
    %35 = vector.transpose %33, [0, 2, 1] : vector<2x2x2xf32> to vector<2x2x2xf32>
    %36 = vector.transpose %33, [1, 0, 2] : vector<2x2x2xf32> to vector<2x2x2xf32>
    %37 = vector.transpose %33, [2, 0, 1] : vector<2x2x2xf32> to vector<2x2x2xf32>
    %38 = vector.transpose %33, [1, 2, 0] : vector<2x2x2xf32> to vector<2x2x2xf32>
    %39 = vector.transpose %33, [2, 1, 0] : vector<2x2x2xf32> to vector<2x2x2xf32>
    vector.print %34 : vector<2x2x2xf32>
    vector.print %35 : vector<2x2x2xf32>
    vector.print %36 : vector<2x2x2xf32>
    vector.print %37 : vector<2x2x2xf32>
    vector.print %38 : vector<2x2x2xf32>
    vector.print %39 : vector<2x2x2xf32>
    return
  }
}

