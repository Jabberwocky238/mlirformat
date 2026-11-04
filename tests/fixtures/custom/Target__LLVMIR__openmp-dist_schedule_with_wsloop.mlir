module {
  llvm.func @distribute_wsloop_dist_schedule_chunked_schedule_chunked(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(64 : i32) : i32
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static dist_schedule_chunk_size(%arg3 : i32) {
          omp.wsloop schedule(static = %2 : i32) {
            omp.loop_nest (%arg4) : i32 = (%0) to (%arg0) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
  llvm.func @distribute_wsloop_dist_schedule_chunked_schedule_chunked_i64(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(1024 : i64) : i64
    %3 = llvm.mlir.constant(64 : i64) : i64
    %4 = llvm.zext %arg0 : i32 to i64
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static dist_schedule_chunk_size(%2 : i64) {
          omp.wsloop schedule(static = %3 : i64) {
            omp.loop_nest (%arg3) : i64 = (%0) to (%4) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @distribute_wsloop_dist_schedule_chunked(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(1024 : i32) : i32
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static dist_schedule_chunk_size(%2 : i32) {
          omp.wsloop schedule(static) {
            omp.loop_nest (%arg3) : i32 = (%0) to (%arg0) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
  llvm.func @distribute_wsloop_dist_schedule_chunked_i64(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(1024 : i64) : i64
    %3 = llvm.zext %arg0 : i32 to i64
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static dist_schedule_chunk_size(%2 : i64) {
          omp.wsloop schedule(static) {
            omp.loop_nest (%arg3) : i64 = (%0) to (%3) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @distribute_wsloop_schedule_chunked(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(64 : i32) : i32
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static {
          omp.wsloop schedule(static = %2 : i32) {
            omp.loop_nest (%arg3) : i32 = (%0) to (%arg0) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
  llvm.func @distribute_wsloop_schedule_chunked_i64(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(64 : i64) : i64
    %3 = llvm.zext %arg0 : i32 to i64
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static {
          omp.wsloop schedule(static = %2 : i64) {
            omp.loop_nest (%arg3) : i64 = (%0) to (%3) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @distribute_wsloop_no_chunks(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static {
          omp.wsloop schedule(static) {
            omp.loop_nest (%arg3) : i32 = (%0) to (%arg0) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
  llvm.func @distribute_wsloop_no_chunks_i64(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.zext %arg0 : i32 to i64
    omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
      omp.parallel {
        omp.distribute dist_schedule_static {
          omp.wsloop schedule(static) {
            omp.loop_nest (%arg3) : i64 = (%0) to (%2) step (%1) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
}

