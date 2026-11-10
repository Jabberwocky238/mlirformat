module {
  func.func @warp_scf_for_yield_loop_carried_arg(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (index) {
      %1 = scf.for %arg1 = %c0 to %c1 step %c1 iter_args(%arg2 = %c0) -> (index) {
        scf.yield %arg2 : index
      }
      gpu.yield %1 : index
    }
    return %0 : index
  }
}

