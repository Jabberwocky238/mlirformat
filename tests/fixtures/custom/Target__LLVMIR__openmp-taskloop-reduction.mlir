module {
  omp.declare_reduction @add_i32 : i32 init {
  ^bb0(%arg0: i32):
    %0 = llvm.mlir.constant(0 : i32) : i32
    omp.yield(%0 : i32)
  } combiner {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = llvm.add %arg0, %arg1 : i32
    omp.yield(%0 : i32)
  }
  llvm.func @taskloop_reduction_single(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32) {
    omp.taskloop.context reduction(@add_i32 %arg0 -> %arg4 : !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5) : i32 = (%arg1) to (%arg2) step (%arg3) {
          %0 = llvm.load %arg4 : !llvm.ptr -> i32
          %1 = llvm.add %0, %arg5 : i32
          llvm.store %1, %arg4 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
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
  }
  omp.declare_reduction @mul_i64 : i64 init {
  ^bb0(%arg0: i64):
    %0 = llvm.mlir.constant(1 : i64) : i64
    omp.yield(%0 : i64)
  } combiner {
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = llvm.mul %arg0, %arg1 : i64
    omp.yield(%0 : i64)
  }
  llvm.func @taskloop_reduction_multi(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32) {
    omp.taskloop.context reduction(@add_i32 %arg0 -> %arg5, @mul_i64 %arg1 -> %arg6 : !llvm.ptr, !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg7) : i32 = (%arg2) to (%arg3) step (%arg4) {
          %0 = llvm.load %arg5 : !llvm.ptr -> i32
          %1 = llvm.add %0, %arg7 : i32
          llvm.store %1, %arg5 : i32, !llvm.ptr
          %2 = llvm.load %arg6 : !llvm.ptr -> i64
          %3 = llvm.sext %arg7 : i32 to i64
          %4 = llvm.mul %2, %3 : i64
          llvm.store %4, %arg6 : i64, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
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
  }
  llvm.func @taskloop_inreduction(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32) {
    omp.taskgroup task_reduction(@add_i32 %arg0 -> %arg4 : !llvm.ptr) {
      omp.taskloop.context in_reduction(@add_i32 %arg0 -> %arg5 : !llvm.ptr) {
        omp.taskloop.wrapper {
          omp.loop_nest (%arg6) : i32 = (%arg1) to (%arg2) step (%arg3) {
            %0 = llvm.load %arg5 : !llvm.ptr -> i32
            %1 = llvm.add %0, %arg6 : i32
            llvm.store %1, %arg5 : i32, !llvm.ptr
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
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
  }
  llvm.func @taskloop_nogroup_inreduction(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32) {
    omp.taskloop.context nogroup in_reduction(@add_i32 %arg0 -> %arg4 : !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5) : i32 = (%arg1) to (%arg2) step (%arg3) {
          %0 = llvm.load %arg4 : !llvm.ptr -> i32
          %1 = llvm.add %0, %arg5 : i32
          llvm.store %1, %arg4 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_i32_as1 : i32 init {
  ^bb0(%arg0: i32):
    %0 = llvm.mlir.constant(0 : i32) : i32
    omp.yield(%0 : i32)
  } combiner {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = llvm.add %arg0, %arg1 : i32
    omp.yield(%0 : i32)
  }
  llvm.func @taskloop_reduction_as1(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32) {
    omp.taskloop.context reduction(@add_i32_as1 %arg0 -> %arg4 : !llvm.ptr<1>) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5) : i32 = (%arg1) to (%arg2) step (%arg3) {
          %0 = llvm.load %arg4 : !llvm.ptr<1> -> i32
          %1 = llvm.add %0, %arg5 : i32
          llvm.store %1, %arg4 : i32, !llvm.ptr<1>
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_i32_as1 : i32 init {
  ^bb0(%arg0: i32):
    %0 = llvm.mlir.constant(0 : i32) : i32
    omp.yield(%0 : i32)
  } combiner {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = llvm.add %arg0, %arg1 : i32
    omp.yield(%0 : i32)
  }
  llvm.func @taskloop_inreduction_as1(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32) {
    omp.taskgroup task_reduction(@add_i32_as1 %arg0 -> %arg4 : !llvm.ptr<1>) {
      omp.taskloop.context in_reduction(@add_i32_as1 %arg0 -> %arg5 : !llvm.ptr<1>) {
        omp.taskloop.wrapper {
          omp.loop_nest (%arg6) : i32 = (%arg1) to (%arg2) step (%arg3) {
            %0 = llvm.load %arg5 : !llvm.ptr<1> -> i32
            %1 = llvm.add %0, %arg6 : i32
            llvm.store %1, %arg5 : i32, !llvm.ptr<1>
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
      omp.terminator
    }
    llvm.return
  }
}

