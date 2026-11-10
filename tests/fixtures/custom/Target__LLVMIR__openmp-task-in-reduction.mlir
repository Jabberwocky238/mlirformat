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
  llvm.func @task_in_reduction_single(%arg0: !llvm.ptr) {
    omp.task in_reduction(@add_i32 %arg0 -> %arg1 : !llvm.ptr) {
      %0 = llvm.load %arg1 : !llvm.ptr -> i32
      %1 = llvm.mlir.constant(1 : i32) : i32
      %2 = llvm.add %0, %1 : i32
      llvm.store %2, %arg1 : i32, !llvm.ptr
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
  llvm.func @task_in_reduction_multi(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.task in_reduction(@add_i32 %arg0 -> %arg2, @add_i32 %arg1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      %0 = llvm.load %arg2 : !llvm.ptr -> i32
      %1 = llvm.mlir.constant(1 : i32) : i32
      %2 = llvm.add %0, %1 : i32
      llvm.store %2, %arg2 : i32, !llvm.ptr
      %3 = llvm.load %arg3 : !llvm.ptr -> i32
      %4 = llvm.mlir.constant(2 : i32) : i32
      %5 = llvm.add %3, %4 : i32
      llvm.store %5, %arg3 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @task_plain(%arg0: !llvm.ptr) {
    omp.task {
      %0 = llvm.mlir.constant(1 : i32) : i32
      llvm.store %0, %arg0 : i32, !llvm.ptr
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
  llvm.func @task_in_reduction_nested(%arg0: !llvm.ptr) {
    omp.taskgroup task_reduction(@add_i32 %arg0 -> %arg1 : !llvm.ptr) {
      omp.task in_reduction(@add_i32 %arg0 -> %arg2 : !llvm.ptr) {
        %0 = llvm.load %arg2 : !llvm.ptr -> i32
        %1 = llvm.mlir.constant(1 : i32) : i32
        %2 = llvm.add %0, %1 : i32
        llvm.store %2, %arg2 : i32, !llvm.ptr
        omp.terminator
      }
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
  llvm.func @task_in_reduction_as1(%arg0: !llvm.ptr<1>) {
    omp.task in_reduction(@add_i32_as1 %arg0 -> %arg1 : !llvm.ptr<1>) {
      %0 = llvm.load %arg1 : !llvm.ptr<1> -> i32
      %1 = llvm.mlir.constant(1 : i32) : i32
      %2 = llvm.add %0, %1 : i32
      llvm.store %2, %arg1 : i32, !llvm.ptr<1>
      omp.terminator
    }
    llvm.return
  }
}

