module {
  func.func @single_loop(%arg0: memref<?xi32>, %arg1: index, %arg2: i32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %arg1 step %c1 {
      %0 = arith.addi %arg2, %arg2 : i32
      memref.store %0, %arg0[%arg3] : memref<?xi32>
    }
    return
  }
}

// -----
module {
  func.func @nested_loop(%arg0: memref<?xi32>, %arg1: index, %arg2: i32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %arg1 step %c1 {
      scf.for %arg4 = %c0 to %arg1 step %c1 {
        %0 = arith.addi %arg2, %arg2 : i32
        memref.store %0, %arg0[%arg3] : memref<?xi32>
        memref.store %0, %arg0[%arg4] : memref<?xi32>
      }
    }
    return
  }
}

// -----
module {
  func.func @for_iter_args(%arg0: index, %arg1: index, %arg2: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0:2 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %cst, %arg5 = %cst) -> (f32, f32) {
      %1 = arith.addf %arg4, %arg5 : f32
      scf.yield %1, %1 : f32, f32
    }
    return %0#1 : f32
  }
}

// -----
module {
  func.func @exec_region_multiple_yields(%arg0: i32, %arg1: index, %arg2: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    %0 = scf.for %arg3 = %c0 to %arg1 step %c1 iter_args(%arg4 = %arg0) -> (i32) {
      %1 = scf.execute_region -> i32 {
        %2 = arith.cmpi slt, %arg3, %c1 : index
        cf.cond_br %2, ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        %3 = arith.subi %arg4, %arg0 : i32
        scf.yield %3 : i32
      ^bb2:  // pred: ^bb0
        %4 = arith.muli %arg4, %arg2 : i32
        scf.yield %4 : i32
      }
      scf.yield %1 : i32
    }
    return %0 : i32
  }
}

