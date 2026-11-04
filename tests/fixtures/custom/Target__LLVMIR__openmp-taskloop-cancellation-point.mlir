module {
  omp.private {type = private} @_QFtestEi_private_i32 : i32
  omp.private {type = firstprivate} @_QFtestEarg_firstprivate_i32 : i32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @_init(%arg0, %arg1) : (!llvm.ptr, !llvm.ptr) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @_copy(%arg0, %arg1) : (!llvm.ptr, !llvm.ptr) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @_dealloc(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @_QPtest(%arg0: !llvm.ptr {fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(100 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    omp.taskloop private(@_QFtestEarg_firstprivate_i32 %arg0 -> %arg1, @_QFtestEi_private_i32 %3 -> %arg2 : !llvm.ptr, !llvm.ptr) {
      omp.loop_nest (%arg3) : i32 = (%0) to (%1) inclusive step (%0) {
        llvm.store %arg3, %arg2 : i32, !llvm.ptr
        llvm.call @_QPbefore(%arg1) : (!llvm.ptr) -> ()
        omp.cancellation_point cancellation_construct_type(taskgroup)
        llvm.call @_QPafter(%arg1) : (!llvm.ptr) -> ()
        omp.yield
      }
    }
    llvm.return
  }
  llvm.func @_QPtest2(%arg0: !llvm.ptr {fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(100 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    omp.taskgroup {
      omp.taskloop nogroup private(@_QFtestEarg_firstprivate_i32 %arg0 -> %arg1, @_QFtestEi_private_i32 %3 -> %arg2 : !llvm.ptr, !llvm.ptr) {
        omp.loop_nest (%arg3) : i32 = (%0) to (%1) inclusive step (%0) {
          llvm.store %arg3, %arg2 : i32, !llvm.ptr
          llvm.call @_QPbefore(%arg1) : (!llvm.ptr) -> ()
          omp.cancellation_point cancellation_construct_type(taskgroup)
          llvm.call @_QPafter(%arg1) : (!llvm.ptr) -> ()
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @_QPbefore(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @_QPafter(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @_init(!llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @_copy(!llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @_dealloc(!llvm.ptr) attributes {sym_visibility = "private"}
}

