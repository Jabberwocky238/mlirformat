module {
  func.func @omp_fuse_raw(%arg0: i32, %arg1: i32) {
    %canonloop_s0 = omp.new_cli
    %canonloop_s1 = omp.new_cli
    %fused = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg0) {
      omp.terminator
    }
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg1) {
      omp.terminator
    }
    omp.fuse (%fused) <- (%canonloop_s0, %canonloop_s1)
    return
  }
  func.func @omp_fuse_pretty(%arg0: i32, %arg1: i32) {
    %canonloop_s0 = omp.new_cli
    %canonloop_s1 = omp.new_cli
    %fused = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg0) {
      omp.terminator
    }
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg1) {
      omp.terminator
    }
    omp.fuse (%fused) <- (%canonloop_s0, %canonloop_s1)
    return
  }
  func.func @omp_fuse_optionalgen_pretty(%arg0: i32, %arg1: i32) {
    %canonloop_s0 = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg0) {
      omp.terminator
    }
    %canonloop_s1 = omp.new_cli
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg1) {
      omp.terminator
    }
    omp.fuse  <- (%canonloop_s0, %canonloop_s1)
    return
  }
  func.func @omp_fuse_looprange(%arg0: i32, %arg1: i32, %arg2: i32) {
    %canonloop_s0 = omp.new_cli
    %canonloop_s1 = omp.new_cli
    %canonloop_s2 = omp.new_cli
    %fused = omp.new_cli
    %canonloop_fuse = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg0) {
      omp.terminator
    }
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg1) {
      omp.terminator
    }
    omp.canonical_loop(%canonloop_s2) %iv_s2 : i32 in range(%arg2) {
      omp.terminator
    }
    omp.fuse (%canonloop_fuse, %fused) <- (%canonloop_s0, %canonloop_s1, %canonloop_s2) looprange(first = 1, count = 2)
    return
  }
}

