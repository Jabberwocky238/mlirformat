module {
  llvm.func @omp_atomic_update_multiple_step_update(%arg0: !llvm.ptr, %arg1: i32) {
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg2: i32):
      %0 = llvm.mul %arg2, %arg1 : i32
      %1 = llvm.sdiv %0, %arg1 : i32
      %2 = llvm.add %arg2, %1 : i32
      omp.yield(%2 : i32)
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_update_multiple_step_update(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32) {
    omp.atomic.capture memory_order(seq_cst) {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg3: i32):
        %0 = llvm.mul %arg3, %arg2 : i32
        %1 = llvm.sdiv %0, %arg2 : i32
        %2 = llvm.add %arg3, %1 : i32
        omp.yield(%2 : i32)
      }
    }
    llvm.return
  }
}

