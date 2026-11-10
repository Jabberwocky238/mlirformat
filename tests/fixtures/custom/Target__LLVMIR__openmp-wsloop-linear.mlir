module {
}

// -----
module {
  llvm.func @wsloop_linear_post_use(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr) {
    omp.wsloop linear(%arg3 : !llvm.ptr = %arg2 : i32) {
      omp.loop_nest (%arg5) : i32 = (%arg0) to (%arg1) step (%arg2) {
        %1 = llvm.load %arg3 : !llvm.ptr -> i32
        llvm.store %1, %arg4 : i32, !llvm.ptr
        omp.yield
      }
    } {linear_var_types = [i32]}
    %0 = llvm.load %arg3 : !llvm.ptr -> i32
    llvm.store %0, %arg4 : i32, !llvm.ptr
    llvm.return
  }
}

