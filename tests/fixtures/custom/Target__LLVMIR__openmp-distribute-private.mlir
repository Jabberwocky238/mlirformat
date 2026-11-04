module {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.private {type = private} @_QFEpriv_val_dist_private_f32 : f32
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 {bindc_name = "priv_val_dist"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(3.140000e+00 : f32) : f32
    %4 = llvm.mlir.constant(1000 : i32) : i32
    %5 = llvm.mlir.constant(1 : i32) : i32
    omp.teams {
      omp.distribute private(@_QFEpriv_val_dist_private_f32 %1 -> %arg0, @_QFEi_private_i32 %2 -> %arg1 : !llvm.ptr, !llvm.ptr) {
        omp.loop_nest (%arg2) : i32 = (%5) to (%4) inclusive step (%5) {
          llvm.store %arg2, %arg1 : i32, !llvm.ptr
          llvm.store %3, %arg0 : f32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo_free(!llvm.ptr)
  omp.private {type = firstprivate} @_QFEpriv_val_dist_firstprivate_f32 : f32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.store %0, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @foo_free(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 {bindc_name = "priv_val_dist"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(3.140000e+00 : f32) : f32
    %3 = llvm.mlir.constant(1 : i32) : i32
    omp.distribute private(@_QFEpriv_val_dist_firstprivate_f32 %1 -> %arg0 : !llvm.ptr) {
      omp.loop_nest (%arg1) : i32 = (%3) to (%3) inclusive step (%3) {
        llvm.store %2, %arg0 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

