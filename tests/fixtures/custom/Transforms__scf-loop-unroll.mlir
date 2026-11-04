module {
  func.func @scf_loop_unroll_single(%arg0: f32, %arg1: f32) -> f32 {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg2 = %c0 to %c10 step %c1 iter_args(%arg3 = %arg0) -> (f32) {
      %1 = arith.addf %arg3, %arg1 : f32
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @scf_loop_unroll_double_symbolic_ub(%arg0: f32, %arg1: f32, %arg2: index) -> (f32, f32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0:2 = scf.for %arg3 = %c0 to %arg2 step %c1 iter_args(%arg4 = %arg0, %arg5 = %arg1) -> (f32, f32) {
      %1 = arith.addf %arg4, %arg0 : f32
      %2 = arith.addf %arg5, %arg1 : f32
      scf.yield %1, %2 : f32, f32
    }
    return %0#0, %0#1 : f32, f32
  }
  func.func @scf_loop_unroll_factor_1_promote() {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c1_0 = arith.constant 1 : index
    scf.for %arg0 = %c0 to %c1_0 step %c1 {
      %0 = "test.foo"(%arg0) : (index) -> i32
    }
    return
  }
  func.func @scf_loop_unroll_full_single(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %c1) -> (index) {
      %1 = arith.addi %arg2, %arg0 : index
      scf.yield %1 : index
    }
    return %0 : index
  }
  func.func @scf_loop_unroll_full_outter_loops(%arg0: vector<4x4xindex>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %c0) -> (index) {
      %1 = scf.for %arg3 = %c0 to %c4 step %c1 iter_args(%arg4 = %arg2) -> (index) {
        %2 = vector.extract %arg0[%arg1, %arg3] : index from vector<4x4xindex>
        %3 = arith.addi %2, %arg4 : index
        scf.yield %2 : index
      }
      scf.yield %1 : index
    }
    return %0 : index
  }
}

