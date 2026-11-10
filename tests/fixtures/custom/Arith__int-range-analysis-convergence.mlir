module {
  func.func @grouped_gemm_while_hang(%arg0: i32, %arg1: i1) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %c7_i32 = arith.constant 7 : i32
    %c127_i32 = arith.constant 127 : i32
    %0 = arith.cmpi slt, %c0_i32, %arg0 : i32
    %1:2 = scf.while (%arg2 = %c0_i32, %arg3 = %0) : (i32, i1) -> (i32, i1) {
      scf.condition(%arg3) %arg2, %arg3 : i32, i1
    } do {
    ^bb0(%arg2: i32, %arg3: i1):
      %3 = arith.addi %arg2, %c1_i32 : i32
      %4 = arith.cmpi slt, %3, %arg0 : i32
      %5:2 = scf.while (%arg4 = %3, %arg5 = %4) : (i32, i1) -> (i32, i1) {
        scf.condition(%arg5) %arg4, %arg5 : i32, i1
      } do {
      ^bb0(%arg4: i32, %arg5: i1):
        %7 = scf.if %arg1 -> (i32) {
          %11 = arith.addi %arg4, %c1_i32 : i32
          %12 = arith.muli %11, %c7_i32 : i32
          %13 = arith.remui %12, %c127_i32 : i32
          scf.yield %13 : i32
        } else {
          %11 = arith.addi %arg4, %c3_i32 : i32
          %12 = arith.muli %11, %c7_i32 : i32
          %13 = arith.remui %12, %c127_i32 : i32
          scf.yield %13 : i32
        }
        %8 = scf.if %arg1 -> (i32) {
          %11 = arith.addi %7, %c1_i32 : i32
          %12 = arith.muli %11, %c7_i32 : i32
          %13 = arith.remui %12, %c127_i32 : i32
          scf.yield %13 : i32
        } else {
          %11 = arith.addi %7, %c3_i32 : i32
          %12 = arith.muli %11, %c7_i32 : i32
          %13 = arith.remui %12, %c127_i32 : i32
          scf.yield %13 : i32
        }
        %9 = arith.cmpi slt, %8, %arg0 : i32
        %10 = test.reflect_bounds %8 : i32
        scf.yield %8, %9 : i32, i1
      }
      %6 = arith.cmpi slt, %5#0, %arg0 : i32
      scf.yield %5#0, %6 : i32, i1
    }
    %2 = test.reflect_bounds %1#0 : i32
    return %2 : i32
  }
}

