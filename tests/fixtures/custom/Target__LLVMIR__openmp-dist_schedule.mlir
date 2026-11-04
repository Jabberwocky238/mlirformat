module {
  llvm.func @distribute_dist_schedule_chunk_size(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    %0 = llvm.mlir.constant(1024 : i32) : i32
    omp.distribute dist_schedule_static dist_schedule_chunk_size(%0 : i32) {
      omp.loop_nest (%arg4) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @distribute_dist_schedule(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    omp.distribute dist_schedule_static {
      omp.loop_nest (%arg4) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    llvm.return
  }
}

