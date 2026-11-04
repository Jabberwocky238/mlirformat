module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  llvm.func @simple_reduction(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add_f32 %1 -> %arg3 : !llvm.ptr) {
        omp.loop_nest (%arg4) : i64 = (%arg0) to (%arg1) step (%arg2) {
          %2 = llvm.mlir.constant(2.000000e+00 : f32) : f32
          %3 = llvm.load %arg3 : !llvm.ptr -> f32
          %4 = llvm.fadd %2, %3 : f32
          llvm.store %4, %arg3 : f32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  llvm.func @reuse_declaration(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add_f32 %1 -> %arg3, @add_f32 %2 -> %arg4 : !llvm.ptr, !llvm.ptr) {
        omp.loop_nest (%arg5) : i64 = (%arg0) to (%arg1) step (%arg2) {
          %3 = llvm.mlir.constant(2.000000e+00 : f32) : f32
          %4 = llvm.load %arg3 : !llvm.ptr -> f32
          %5 = llvm.fadd %4, %3 : f32
          llvm.store %5, %arg3 : f32, !llvm.ptr
          %6 = llvm.load %arg4 : !llvm.ptr -> f32
          %7 = llvm.fadd %6, %3 : f32
          llvm.store %7, %arg4 : f32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  llvm.func @missing_omp_reduction(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add_f32 %1 -> %arg3, @add_f32 %2 -> %arg4 : !llvm.ptr, !llvm.ptr) {
        omp.loop_nest (%arg5) : i64 = (%arg0) to (%arg1) step (%arg2) {
          %3 = llvm.mlir.constant(2.000000e+00 : f32) : f32
          %4 = llvm.load %arg3 : !llvm.ptr -> f32
          %5 = llvm.fadd %4, %3 : f32
          llvm.store %5, %arg3 : f32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  llvm.func @double_reference(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add_f32 %1 -> %arg3 : !llvm.ptr) {
        omp.loop_nest (%arg4) : i64 = (%arg0) to (%arg1) step (%arg2) {
          %2 = llvm.mlir.constant(2.000000e+00 : f32) : f32
          %3 = llvm.load %arg3 : !llvm.ptr -> f32
          %4 = llvm.fadd %3, %2 : f32
          llvm.store %4, %arg3 : f32, !llvm.ptr
          %5 = llvm.load %arg3 : !llvm.ptr -> f32
          %6 = llvm.fadd %5, %2 : f32
          llvm.store %6, %arg3 : f32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  omp.declare_reduction @mul_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fmul %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  }
  llvm.func @no_atomic(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add_f32 %1 -> %arg3, @mul_f32 %2 -> %arg4 : !llvm.ptr, !llvm.ptr) {
        omp.loop_nest (%arg5) : i64 = (%arg0) to (%arg1) step (%arg2) {
          %3 = llvm.mlir.constant(2.000000e+00 : f32) : f32
          %4 = llvm.load %arg3 : !llvm.ptr -> f32
          %5 = llvm.fadd %4, %3 : f32
          llvm.store %5, %arg3 : f32, !llvm.ptr
          %6 = llvm.load %arg4 : !llvm.ptr -> f32
          %7 = llvm.fmul %6, %3 : f32
          llvm.store %7, %arg4 : f32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  llvm.func @simple_reduction_parallel() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel reduction(@add_f32 %1 -> %arg0 : !llvm.ptr) {
      %2 = llvm.mlir.constant(2.000000e+00 : f32) : f32
      %3 = llvm.load %arg0 : !llvm.ptr -> f32
      %4 = llvm.fadd %3, %2 : f32
      llvm.store %4, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_i32 : i32 init {
  ^bb0(%arg0: i32):
    %0 = llvm.mlir.constant(0 : i32) : i32
    omp.yield(%0 : i32)
  } combiner {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = llvm.add %arg0, %arg1 : i32
    omp.yield(%0 : i32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> i32
    %1 = llvm.atomicrmw add %arg0, %0 monotonic : !llvm.ptr, i32
    omp.yield
  }
  llvm.func @parallel_nested_workshare_reduction(%arg0: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    omp.parallel {
      omp.wsloop reduction(@add_i32 %1 -> %arg1 : !llvm.ptr) {
        omp.loop_nest (%arg2) : i64 = (%2) to (%arg0) step (%3) {
          %4 = llvm.trunc %arg2 : i64 to i32
          %5 = llvm.load %arg1 : !llvm.ptr -> i32
          %6 = llvm.add %5, %4 : i32
          llvm.store %6, %arg1 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  llvm.func @wsloop_simd_reduction(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add_f32 %1 -> %arg3 : !llvm.ptr) {
        omp.simd reduction(@add_f32 %arg3 -> %arg4 : !llvm.ptr) {
          omp.loop_nest (%arg5) : i64 = (%arg0) to (%arg1) step (%arg2) {
            %2 = llvm.mlir.constant(2.000000e+00 : f32) : f32
            %3 = llvm.load %arg4 : !llvm.ptr -> f32
            %4 = llvm.fadd %2, %3 : f32
            llvm.store %4, %arg4 : f32, !llvm.ptr
            omp.yield
          }
        } {omp.composite}
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
}

