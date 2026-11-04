module {
  func.func @simple_std_for_loop(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c1 = arith.constant 1 : index
    }
    return
  }
  func.func @simple_std_2_for_loops(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c1 = arith.constant 1 : index
      scf.for %arg4 = %arg0 to %arg1 step %arg2 {
        %c1_0 = arith.constant 1 : index
      }
    }
    return
  }
  func.func @for_yield(%arg0: index, %arg1: index, %arg2: index) -> (f32, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:2 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %cst, %arg5 = %cst_0) -> (f32, f32) {
      %1 = arith.addf %arg4, %arg5 : f32
      scf.yield %1, %1 : f32, f32
    }
    return %0#0, %0#1 : f32, f32
  }
  func.func @nested_for_yield(%arg0: index, %arg1: index, %arg2: index) -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %cst) -> (f32) {
      %1 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg4) -> (f32) {
        %2 = arith.addf %arg6, %arg6 : f32
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @for_yield_index(%arg0: index, %arg1: index, %arg2: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %c0) -> (index) {
      scf.yield %arg4 : index
    }
    return %0 : index
  }
  func.func @for_yield_update_loop_carried_var(%arg0: index, %arg1: index, %arg2: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %c0) -> (index) {
      %1 = arith.addi %arg4, %arg4 : index
      scf.yield %1 : index
    }
    return %0 : index
  }
}

