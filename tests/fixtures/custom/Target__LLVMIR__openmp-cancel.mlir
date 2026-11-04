module {
  llvm.func @cancel_parallel() {
    omp.parallel {
      omp.cancel cancellation_construct_type(parallel)
      omp.terminator
    }
    llvm.return
  }
  llvm.func @cancel_parallel_if(%arg0: i1) {
    omp.parallel {
      omp.cancel cancellation_construct_type(parallel) if(%arg0)
      omp.terminator
    }
    llvm.return
  }
  llvm.func @cancel_sections_if(%arg0: i1) {
    omp.sections {
      omp.section {
        omp.cancel cancellation_construct_type(sections) if(%arg0)
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @cancel_wsloop_if(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i1) {
    omp.wsloop {
      omp.loop_nest (%arg4) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.cancel cancellation_construct_type(loop) if(%arg3)
        omp.yield
      }
    }
    llvm.return
  }
  omp.private {type = firstprivate} @i32_priv : i32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @do_something(!llvm.ptr)
  llvm.func @cancel_taskgroup(%arg0: !llvm.ptr) {
    omp.taskgroup {
      omp.task private(@i32_priv %arg0 -> %arg1 : !llvm.ptr) {
        omp.cancel cancellation_construct_type(taskgroup)
        llvm.call @do_something(%arg1) : (!llvm.ptr) -> ()
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

