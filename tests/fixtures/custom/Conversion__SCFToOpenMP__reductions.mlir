module {
  func.func @reduction1(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.parallel (%arg5, %arg6) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) init (%cst) -> f32 {
      %cst_0 = arith.constant 1.000000e+00 : f32
      scf.reduce(%cst_0 : f32) {
      ^bb0(%arg7: f32, %arg8: f32):
        %1 = arith.addf %arg7, %arg8 : f32
        scf.reduce.return %1 : f32
      }
    }
    return
  }
}

// -----
module {
  func.func @reduction2(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.parallel (%arg5, %arg6) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) init (%cst) -> f32 {
      %cst_0 = arith.constant 1.000000e+00 : f32
      scf.reduce(%cst_0 : f32) {
      ^bb0(%arg7: f32, %arg8: f32):
        %1 = arith.mulf %arg7, %arg8 : f32
        scf.reduce.return %1 : f32
      }
    }
    return
  }
}

// -----
module {
  func.func @reduction_muli(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %c1 = arith.constant 1 : index
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.parallel (%arg5, %arg6) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) init (%c1_i32) -> i32 {
      %c2_i32 = arith.constant 2 : i32
      scf.reduce(%c2_i32 : i32) {
      ^bb0(%arg7: i32, %arg8: i32):
        %1 = arith.muli %arg7, %arg8 : i32
        scf.reduce.return %1 : i32
      }
    }
    return
  }
}

// -----
module {
  func.func @reduction3(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.parallel (%arg5, %arg6) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) init (%cst) -> f32 {
      %cst_0 = arith.constant 1.000000e+00 : f32
      scf.reduce(%cst_0 : f32) {
      ^bb0(%arg7: f32, %arg8: f32):
        %1 = arith.cmpf oge, %arg7, %arg8 : f32
        %2 = arith.select %1, %arg7, %arg8 : f32
        scf.reduce.return %2 : f32
      }
    }
    return
  }
}

// -----
module {
  func.func @reduction4(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (f32, i64) {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c1_i64 = arith.constant 1 : i64
    %0:2 = scf.parallel (%arg5, %arg6) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c1) init (%cst, %c1_i64) -> (f32, i64) {
      %cst_0 = arith.constant 1.000000e+00 : f32
      %1 = arith.fptosi %cst_0 : f32 to i64
      scf.reduce(%cst_0, %1 : f32, i64) {
      ^bb0(%arg7: f32, %arg8: f32):
        %2 = arith.cmpf oge, %arg7, %arg8 : f32
        %3 = arith.select %2, %arg7, %arg8 : f32
        scf.reduce.return %3 : f32
      }, {
      ^bb0(%arg7: i64, %arg8: i64):
        %2 = arith.cmpi slt, %arg7, %arg8 : i64
        %3 = arith.select %2, %arg8, %arg7 : i64
        scf.reduce.return %3 : i64
      }
    }
    return %0#0, %0#1 : f32, i64
  }
}

