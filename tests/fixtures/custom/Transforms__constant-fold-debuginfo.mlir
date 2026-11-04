module {
  func.func @fold_and_merge() -> (i32, i32) {
    %c1_i32 = arith.constant 1 : i32
    %c5_i32 = arith.constant 5 : i32
    %0 = arith.addi %c1_i32, %c5_i32 : i32
    %c6_i32 = arith.constant 6 : i32
    return %0, %c6_i32 : i32, i32
  }
}

// -----
module {
  func.func @materialize_different_dialect() -> (f32, f32) {
    %cst = arith.constant -1.000000e+00 : f32
    %0 = math.absf %cst : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    return %0, %cst_0 : f32, f32
  }
}

// -----
module {
  func.func @materialize_in_front(%arg0: memref<8xi32>) {
    affine.for %arg1 = 0 to 8 {
      %c1_i32 = arith.constant 1 : i32
      %c5_i32 = arith.constant 5 : i32
      %0 = arith.addi %c1_i32, %c5_i32 : i32
      memref.store %0, %arg0[%arg1] : memref<8xi32>
    }
    return
  }
}

