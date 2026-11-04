module {
  func.func @omp_unroll_heuristic_raw(%arg0: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.terminator
    }
    omp.unroll_heuristic(%canonloop)
    return
  }
  func.func @omp_unroll_heuristic_pretty(%arg0: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.terminator
    }
    omp.unroll_heuristic(%canonloop)
    return
  }
  func.func @omp_unroll_heuristic_nested_pretty(%arg0: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg0) {
        omp.terminator
      }
      omp.terminator
    }
    omp.unroll_heuristic(%canonloop)
    omp.unroll_heuristic(%canonloop_d1)
    return
  }
}

