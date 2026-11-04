module {
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 1.000000e+00 : f64
    %cst_1 = arith.constant 2.000000e+00 : f64
    %cst_2 = arith.constant 3.000000e+00 : f64
    %cst_3 = arith.constant 4.000000e+00 : f64
    %cst_4 = arith.constant 5.000000e+00 : f64
    %cst_5 = arith.constant 6.000000e+00 : f64
    %cst_6 = arith.constant 7.000000e+00 : f64
    %0 = vector.broadcast %cst : f64 to vector<4xf64>
    %1 = vector.insert %cst_0, %0 [1] : f64 into vector<4xf64>
    %2 = vector.insert %cst_1, %1 [2] : f64 into vector<4xf64>
    %3 = vector.insert %cst_2, %2 [3] : f64 into vector<4xf64>
    %4 = vector.broadcast %cst_3 : f64 to vector<4xf64>
    %5 = vector.insert %cst_4, %4 [1] : f64 into vector<4xf64>
    %6 = vector.insert %cst_5, %5 [2] : f64 into vector<4xf64>
    %7 = vector.insert %cst_6, %6 [3] : f64 into vector<4xf64>
    %8 = vector.broadcast %cst : f64 to vector<6xf64>
    %9 = vector.insert %cst_0, %8 [1] : f64 into vector<6xf64>
    %10 = vector.insert %cst_1, %9 [2] : f64 into vector<6xf64>
    %11 = vector.insert %cst_2, %10 [3] : f64 into vector<6xf64>
    %12 = vector.insert %cst_3, %11 [4] : f64 into vector<6xf64>
    %13 = vector.insert %cst_4, %12 [5] : f64 into vector<6xf64>
    vector.print %3 : vector<4xf64>
    vector.print %7 : vector<4xf64>
    vector.print %13 : vector<6xf64>
    %14 = llvm.intr.matrix.transpose %3 {columns = 2 : i32, rows = 2 : i32} : vector<4xf64> into vector<4xf64>
    %15 = llvm.intr.matrix.transpose %7 {columns = 2 : i32, rows = 2 : i32} : vector<4xf64> into vector<4xf64>
    %16 = llvm.intr.matrix.transpose %13 {columns = 3 : i32, rows = 2 : i32} : vector<6xf64> into vector<6xf64>
    %17 = llvm.intr.matrix.transpose %13 {columns = 2 : i32, rows = 3 : i32} : vector<6xf64> into vector<6xf64>
    vector.print %14 : vector<4xf64>
    vector.print %15 : vector<4xf64>
    vector.print %16 : vector<6xf64>
    vector.print %17 : vector<6xf64>
    return
  }
}

