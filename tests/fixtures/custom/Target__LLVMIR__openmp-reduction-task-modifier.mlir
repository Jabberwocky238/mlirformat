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
  llvm.func @parallel_task_reduction(%arg0: !llvm.ptr) {
    omp.parallel reduction(mod: task, @add_i32 %arg0 -> %arg1 : !llvm.ptr) {
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
  llvm.func @wsloop_task_reduction(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(10 : i32) : i32
    %2 = llvm.mlir.constant(1 : i32) : i32
    omp.wsloop reduction(mod: task, @add_i32 %arg0 -> %arg1 : !llvm.ptr) {
      omp.loop_nest (%arg2) : i32 = (%0) to (%1) inclusive step (%2) {
        omp.yield
      }
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
  llvm.func @sections_task_reduction(%arg0: !llvm.ptr) {
    omp.sections reduction(mod: task, @add_i32 %arg0 -> %arg1 : !llvm.ptr) {
      omp.section {
      ^bb0(%arg2: !llvm.ptr):
        omp.terminator
      }
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
  llvm.func @parallel_two_task_reductions(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.parallel reduction(mod: task, @add_i32 %arg0 -> %arg2, @add_i32 %arg1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
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
  llvm.func @empty_sections_task_reduction(%arg0: !llvm.ptr) {
    omp.sections reduction(mod: task, @add_i32 %arg0 -> %arg1 : !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @parallel_task_mod_no_reductions() {
    omp.parallel {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @wsloop_task_mod_no_reductions() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(10 : i32) : i32
    %2 = llvm.mlir.constant(1 : i32) : i32
    omp.wsloop {
      omp.loop_nest (%arg0) : i32 = (%0) to (%1) inclusive step (%2) {
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @sections_task_mod_no_reductions() {
    omp.sections {
      omp.section {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

