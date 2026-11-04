module {
  func.func @vector_outerproduct_splat_8x8(%arg0: f32, %arg1: f32, %arg2: f32) -> vector<8x8xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<8xf32>
    %1 = vector.broadcast %arg1 : f32 to vector<8xf32>
    %2 = vector.broadcast %arg2 : f32 to vector<8x8xf32>
    %3 = vector.outerproduct %0, %1, %2 {kind = #vector.kind<add>} : vector<8xf32>, vector<8xf32>
    return %3 : vector<8x8xf32>
  }
  func.func @vector_outerproduct_vec_2x3(%arg0: vector<2xf32>, %arg1: vector<3xf32>) -> vector<2x3xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xf32>, vector<3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @vector_outerproduct_vec_2x3_acc(%arg0: vector<2xf32>, %arg1: vector<3xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xf32>, vector<3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %cst_5 = arith.constant 1.000000e+01 : f32
    %0 = call @vector_outerproduct_splat_8x8(%cst_0, %cst_1, %cst_5) : (f32, f32, f32) -> vector<8x8xf32>
    vector.print %0 : vector<8x8xf32>
    %1 = vector.broadcast %cst_0 : f32 to vector<2xf32>
    %2 = vector.insert %cst_1, %1 [1] : f32 into vector<2xf32>
    %3 = vector.broadcast %cst_2 : f32 to vector<3xf32>
    %4 = vector.insert %cst_3, %3 [1] : f32 into vector<3xf32>
    %5 = vector.insert %cst_4, %4 [2] : f32 into vector<3xf32>
    %6 = call @vector_outerproduct_vec_2x3(%2, %5) : (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32>
    vector.print %6 : vector<2x3xf32>
    %7 = call @vector_outerproduct_vec_2x3_acc(%2, %5, %6) : (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    vector.print %7 : vector<2x3xf32>
    %8 = vector.broadcast %cst : f32 to vector<7xf32>
    %9 = vector.insert %cst_0, %8 [1] : f32 into vector<7xf32>
    %10 = vector.insert %cst_1, %9 [2] : f32 into vector<7xf32>
    %11 = vector.insert %cst_2, %10 [3] : f32 into vector<7xf32>
    %12 = vector.insert %cst_3, %11 [4] : f32 into vector<7xf32>
    %13 = vector.insert %cst_4, %12 [5] : f32 into vector<7xf32>
    %14 = vector.insert %cst_5, %13 [6] : f32 into vector<7xf32>
    %15 = vector.broadcast %cst_0 : f32 to vector<7xf32>
    %16 = vector.outerproduct %14, %cst_1 : vector<7xf32>, f32
    %17 = vector.outerproduct %14, %cst_1, %15 {kind = #vector.kind<add>} : vector<7xf32>, f32
    vector.print %16 : vector<7xf32>
    vector.print %17 : vector<7xf32>
    return
  }
}

