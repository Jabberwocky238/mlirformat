module {
  func.func @if_yield(%arg0: i1) -> f32 {
    %0 = scf.if %arg0 -> (f32) {
      %cst = arith.constant 0.000000e+00 : f32
      %1 = math.sqrt %cst : f32
      scf.yield %1 : f32
    } else {
      %cst = arith.constant 1.000000e+00 : f32
      %1 = math.exp %cst : f32
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @while(%arg0: i32, %arg1: i32) -> i32 {
    %c2_i32 = arith.constant 2 : i32
    %0 = scf.while (%arg2 = %arg0) : (i32) -> i32 {
      %1 = arith.cmpi slt, %arg2, %arg1 : i32
      scf.condition(%1) %arg2 : i32
    } do {
    ^bb0(%arg2: i32):
      %1 = arith.muli %arg2, %c2_i32 : i32
      scf.yield %1 : i32
    }
    return %0 : i32
  }
  func.func @for() {
    %c4 = arith.constant 4 : index
    %c42 = arith.constant 42 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:2 = scf.for %arg0 = %c4 to %c42 step %c2 iter_args(%arg1 = %cst, %arg2 = %cst_0) -> (f32, f32) {
      %1 = arith.addf %arg1, %arg1 : f32
      scf.yield %1, %1 : f32, f32
    }
    return
  }
}

