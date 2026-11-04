module {
  func.func @vector_outerproduct_splat_8x8(%arg0: i64, %arg1: i64, %arg2: i64) -> vector<8x8xi64> {
    %0 = vector.broadcast %arg0 : i64 to vector<8xi64>
    %1 = vector.broadcast %arg1 : i64 to vector<8xi64>
    %2 = vector.broadcast %arg2 : i64 to vector<8x8xi64>
    %3 = vector.outerproduct %0, %1, %2 {kind = #vector.kind<add>} : vector<8xi64>, vector<8xi64>
    return %3 : vector<8x8xi64>
  }
  func.func @vector_outerproduct_vec_2x3(%arg0: vector<2xi64>, %arg1: vector<3xi64>) -> vector<2x3xi64> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xi64>, vector<3xi64>
    return %0 : vector<2x3xi64>
  }
  func.func @vector_outerproduct_vec_2x3_acc(%arg0: vector<2xi64>, %arg1: vector<3xi64>, %arg2: vector<2x3xi64>) -> vector<2x3xi64> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xi64>, vector<3xi64>
    return %0 : vector<2x3xi64>
  }
  func.func @entry() {
    %c0_i64 = arith.constant 0 : i64
    %c1_i64 = arith.constant 1 : i64
    %c2_i64 = arith.constant 2 : i64
    %c3_i64 = arith.constant 3 : i64
    %c4_i64 = arith.constant 4 : i64
    %c5_i64 = arith.constant 5 : i64
    %c10_i64 = arith.constant 10 : i64
    %0 = call @vector_outerproduct_splat_8x8(%c1_i64, %c2_i64, %c10_i64) : (i64, i64, i64) -> vector<8x8xi64>
    vector.print %0 : vector<8x8xi64>
    %1 = vector.broadcast %c1_i64 : i64 to vector<2xi64>
    %2 = vector.insert %c2_i64, %1 [1] : i64 into vector<2xi64>
    %3 = vector.broadcast %c3_i64 : i64 to vector<3xi64>
    %4 = vector.insert %c4_i64, %3 [1] : i64 into vector<3xi64>
    %5 = vector.insert %c5_i64, %4 [2] : i64 into vector<3xi64>
    %6 = call @vector_outerproduct_vec_2x3(%2, %5) : (vector<2xi64>, vector<3xi64>) -> vector<2x3xi64>
    vector.print %6 : vector<2x3xi64>
    %7 = call @vector_outerproduct_vec_2x3_acc(%2, %5, %6) : (vector<2xi64>, vector<3xi64>, vector<2x3xi64>) -> vector<2x3xi64>
    vector.print %7 : vector<2x3xi64>
    %8 = vector.broadcast %c0_i64 : i64 to vector<7xi64>
    %9 = vector.insert %c1_i64, %8 [1] : i64 into vector<7xi64>
    %10 = vector.insert %c2_i64, %9 [2] : i64 into vector<7xi64>
    %11 = vector.insert %c3_i64, %10 [3] : i64 into vector<7xi64>
    %12 = vector.insert %c4_i64, %11 [4] : i64 into vector<7xi64>
    %13 = vector.insert %c5_i64, %12 [5] : i64 into vector<7xi64>
    %14 = vector.insert %c10_i64, %13 [6] : i64 into vector<7xi64>
    %15 = vector.broadcast %c1_i64 : i64 to vector<7xi64>
    %16 = vector.outerproduct %14, %c2_i64 : vector<7xi64>, i64
    %17 = vector.outerproduct %14, %c2_i64, %15 {kind = #vector.kind<add>} : vector<7xi64>, i64
    vector.print %16 : vector<7xi64>
    vector.print %17 : vector<7xi64>
    return
  }
}

