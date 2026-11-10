module {
  omp.private {type = private} @_QFsimple_teams_reductionEindex__private_i32 : i32
  omp.declare_reduction @add_reduction_i32 : i32 init {
  ^bb0(%arg0: i32):
    %0 = llvm.mlir.constant(0 : i32) : i32
    omp.yield(%0 : i32)
  } combiner {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = llvm.add %arg0, %arg1 : i32
    omp.yield(%0 : i32)
  }
  llvm.func @simple_teams_reduction_() attributes {fir.internal_name = "_QPsimple_teams_reduction", frame_pointer = #llvm.framePointerKind<all>, target_cpu = "x86-64"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "sum"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "index_"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(10000 : i32) : i32
    %5 = llvm.mlir.constant(1 : i32) : i32
    %6 = llvm.mlir.constant(0 : i32) : i32
    %7 = llvm.mlir.constant(1 : i64) : i64
    %8 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %6, %1 : i32, !llvm.ptr
    omp.teams reduction(@add_reduction_i32 %1 -> %arg0 : !llvm.ptr) {
      omp.distribute private(@_QFsimple_teams_reductionEindex__private_i32 %3 -> %arg1 : !llvm.ptr) {
        omp.loop_nest (%arg2) : i32 = (%5) to (%4) inclusive step (%5) {
          llvm.store %arg2, %arg1 : i32, !llvm.ptr
          %9 = llvm.load %arg0 : !llvm.ptr -> i32
          %10 = llvm.load %arg1 : !llvm.ptr -> i32
          %11 = llvm.add %9, %10 : i32
          llvm.store %11, %arg0 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @teams_reduction_multiple_distribute_() attributes {fir.internal_name = "_QPteams_reduction_multiple_distribute", frame_pointer = #llvm.framePointerKind<all>, target_cpu = "x86-64"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "sum"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(0 : i32) : i32
    llvm.store %3, %1 : i32, !llvm.ptr
    omp.teams reduction(@add_reduction_i32 %1 -> %arg0 : !llvm.ptr) {
      omp.distribute {
        omp.loop_nest (%arg1) : i32 = (%2) to (%2) inclusive step (%2) {
          omp.yield
        }
      }
      omp.distribute {
        omp.loop_nest (%arg1) : i32 = (%2) to (%2) inclusive step (%2) {
          %4 = llvm.load %arg0 : !llvm.ptr -> i32
          %5 = llvm.add %4, %arg1 : i32
          llvm.store %5, %arg0 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

