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
  llvm.func @taskgroup_task_reduction_single(%arg0: !llvm.ptr) {
    omp.taskgroup task_reduction(@add_i32 %arg0 -> %arg1 : !llvm.ptr) {
      omp.terminator
    }
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
  llvm.func @taskgroup_task_reduction_single_as1(%arg0: !llvm.ptr<1>) {
    omp.taskgroup task_reduction(@add_i32_as1 %arg0 -> %arg1 : !llvm.ptr<1>) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @keep_ptr : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  }
  llvm.func @taskgroup_task_reduction_ptr(%arg0: !llvm.ptr) {
    omp.taskgroup task_reduction(@keep_ptr %arg0 -> %arg1 : !llvm.ptr) {
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
  omp.declare_reduction @mul_i64 : i64 init {
  ^bb0(%arg0: i64):
    %0 = llvm.mlir.constant(1 : i64) : i64
    omp.yield(%0 : i64)
  } combiner {
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = llvm.mul %arg0, %arg1 : i64
    omp.yield(%0 : i64)
  }
  llvm.func @taskgroup_task_reduction_multi(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.taskgroup task_reduction(@add_i32 %arg0 -> %arg2, @mul_i64 %arg1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @taskgroup_plain() {
    omp.taskgroup {
      omp.terminator
    }
    llvm.return
  }
}

