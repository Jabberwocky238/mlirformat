module {
  func.func @omp_canonloop_raw(%arg0: i32) {
    omp.canonical_loop %iv : i32 in range(%arg0) {
      %0 = llvm.add %iv, %iv : i32
      omp.terminator
    }
    return
  }
  func.func @omp_canonloop_sequential_raw(%arg0: i32) {
    %canonloop_s0 = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg0) {
      %0 = llvm.add %iv_s0, %iv_s0 : i32
      omp.terminator
    }
    %canonloop_s1 = omp.new_cli
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg0) {
      omp.terminator
    }
    return
  }
  func.func @omp_nested_canonloop_raw(%arg0: i32, %arg1: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg1) {
        %0 = llvm.add %iv, %iv_d1 : i32
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_canonloop_pretty(%arg0: i32) {
    omp.canonical_loop %iv : i32 in range(%arg0) {
      %0 = llvm.add %iv, %iv : i32
      omp.terminator
    }
    return
  }
  func.func @omp_canonloop_constant_pretty() {
    %0 = llvm.mlir.constant(4 : i32) : i32
    omp.canonical_loop %iv : i32 in range(%0) {
      %1 = llvm.add %iv, %iv : i32
      omp.terminator
    }
    return
  }
  func.func @omp_canonloop_sequential_pretty(%arg0: i32) {
    %canonloop_s0 = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg0) {
      omp.terminator
    }
    %canonloop_s1 = omp.new_cli
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg0) {
      omp.terminator
    }
    %canonloop_s2 = omp.new_cli
    omp.canonical_loop(%canonloop_s2) %iv_s2 : i32 in range(%arg0) {
      omp.terminator
    }
    return
  }
  func.func @omp_canonloop_2d_nested_pretty(%arg0: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg0) {
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_canonloop_3d_nested_pretty(%arg0: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    %canonloop_d2 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg0) {
        omp.canonical_loop(%canonloop_d2) %iv_d2 : i32 in range(%arg0) {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_canonloop_sequential_nested_pretty(%arg0: i32) {
    %canonloop_s0 = omp.new_cli
    %canonloop_s0_d1 = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_s0_d1) %iv_s0_d1 : i32 in range(%arg0) {
        omp.terminator
      }
      omp.terminator
    }
    %canonloop_s1 = omp.new_cli
    %canonloop_s1_d1 = omp.new_cli
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg0) {
      omp.canonical_loop(%canonloop_s1_d1) %iv_s1_d1 : i32 in range(%arg0) {
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_newcli_unused() {
    %cli = omp.new_cli
    return
  }
  func.func @omp_canonloop_multiregion_isolatedfromabove() {
    omp.private {type = firstprivate} @x.privatizer : !llvm.ptr init {
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %c42_i32 = arith.constant 42 : i32
      omp.canonical_loop %iv : i32 in range(%c42_i32) {
        omp.terminator
      }
      omp.yield(%arg0 : !llvm.ptr)
    } copy {
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %c42_i32 = arith.constant 42 : i32
      omp.canonical_loop %iv : i32 in range(%c42_i32) {
        omp.canonical_loop %iv_d1 : i32 in range(%c42_i32) {
          omp.terminator
        }
        omp.terminator
      }
      omp.yield(%arg0 : !llvm.ptr)
    } dealloc {
    ^bb0(%arg0: !llvm.ptr):
      %c42_i32 = arith.constant 42 : i32
      omp.canonical_loop %iv_s0 : i32 in range(%c42_i32) {
        omp.terminator
      }
      omp.canonical_loop %iv_s1 : i32 in range(%c42_i32) {
        omp.terminator
      }
      omp.yield
    }
    return
  }
  func.func @omp_canonloop_multiregion(%arg0: i1) {
    %c42_i32 = arith.constant 42 : i32
    %canonloop_r0 = omp.new_cli
    %canonloop_r1_s0 = omp.new_cli
    %canonloop_r1_s1 = omp.new_cli
    scf.if %arg0 {
      omp.canonical_loop(%canonloop_r0) %iv_r0 : i32 in range(%c42_i32) {
        omp.terminator
      }
    } else {
      omp.canonical_loop(%canonloop_r1_s0) %iv_r1_s0 : i32 in range(%c42_i32) {
        omp.terminator
      }
      omp.canonical_loop(%canonloop_r1_s1) %iv_r1_s1 : i32 in range(%c42_i32) {
        omp.terminator
      }
    }
    return
  }
}

