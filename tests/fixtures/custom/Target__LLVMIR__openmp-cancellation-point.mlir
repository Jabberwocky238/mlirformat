module {
  llvm.func @cancellation_point_parallel() {
    omp.parallel {
      omp.cancellation_point cancellation_construct_type(parallel)
      omp.terminator
    }
    llvm.return
  }
  llvm.func @cancellation_point_sections() {
    omp.sections {
      omp.section {
        omp.cancellation_point cancellation_construct_type(sections)
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @cancellation_point_wsloop(%arg0: i32, %arg1: i32, %arg2: i32) {
    omp.wsloop {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.cancellation_point cancellation_construct_type(loop)
        omp.yield
      }
    }
    llvm.return
  }
  llvm.func @cancellation_point_taskgroup() {
    omp.taskgroup {
      omp.task {
        omp.cancellation_point cancellation_construct_type(taskgroup)
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

