module {
  func.func @omp_unroll_partial_raw(%arg0: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.terminator
    }
    omp.unroll_partial(%canonloop) {unroll_factor = 4 : i64}
    return
  }
  func.func @omp_unroll_partial_pretty(%arg0: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.terminator
    }
    omp.unroll_partial(%canonloop) {unroll_factor = 8 : i64}
    return
  }
  func.func @omp_unroll_partial_nested_pretty(%arg0: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg0) {
        omp.terminator
      }
      omp.terminator
    }
    omp.unroll_partial(%canonloop) {unroll_factor = 4 : i64}
    omp.unroll_partial(%canonloop_d1) {unroll_factor = 2 : i64}
    return
  }
}

