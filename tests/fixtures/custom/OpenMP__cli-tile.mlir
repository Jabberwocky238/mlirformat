module {
  func.func @omp_tile_raw(%arg0: i32, %arg1: i32) {
    %canonloop = omp.new_cli
    %grid1 = omp.new_cli
    %intratile1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.terminator
    }
    omp.tile (%grid1, %intratile1) <- (%canonloop) sizes(%arg1 : i32)
    return
  }
  func.func @omp_tile_pretty(%arg0: i32, %arg1: i32) {
    %canonloop = omp.new_cli
    %grid1 = omp.new_cli
    %intratile1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.terminator
    }
    omp.tile (%grid1, %intratile1) <- (%canonloop) sizes(%arg1 : i32)
    return
  }
  func.func @omp_tile_optionalgen_pretty(%arg0: i32, %arg1: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.terminator
    }
    omp.tile  <- (%canonloop) sizes(%arg1 : i32)
    return
  }
  func.func @omp_tile_2d_pretty(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    %grid1 = omp.new_cli
    %grid2 = omp.new_cli
    %intratile1 = omp.new_cli
    %intratile2 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg1) {
        omp.terminator
      }
      omp.terminator
    }
    omp.tile (%grid1, %grid2, %intratile1, %intratile2) <- (%canonloop, %canonloop_d1) sizes(%arg2, %arg3 : i32, i32)
    return
  }
  func.func @omp_tile_3d_pretty(%arg0: i32, %arg1: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    %canonloop_d2 = omp.new_cli
    %grid1 = omp.new_cli
    %grid2 = omp.new_cli
    %grid3 = omp.new_cli
    %intratile1 = omp.new_cli
    %intratile2 = omp.new_cli
    %intratile3 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg0) {
        omp.canonical_loop(%canonloop_d2) %iv_d2 : i32 in range(%arg0) {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    omp.tile (%grid1, %grid2, %grid3, %intratile1, %intratile2, %intratile3) <- (%canonloop, %canonloop_d1, %canonloop_d2) sizes(%arg1, %arg1, %arg1 : i32, i32, i32)
    return
  }
}

