module {
  func.func @combined() -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %0 = index.casts %c0_i32 : i32 to index
    %1 = index.casts %c4_i32 : i32 to index
    %c1 = arith.constant 1 : index
    %2 = vector.broadcast %cst_0 : f32 to vector<4xf32>
    %3 = scf.for %arg0 = %0 to %1 step %c1 iter_args(%arg1 = %cst) -> (f32) {
      %5 = vector.extract %2[0] : f32 from vector<4xf32>
      %6 = arith.addf %arg1, %5 : f32
      %7 = vector.insert %6, %2 [0] : f32 into vector<4xf32>
      scf.yield %6 : f32
    }
    %4 = ub.poison : f32
    return %4 : f32
  }
}

