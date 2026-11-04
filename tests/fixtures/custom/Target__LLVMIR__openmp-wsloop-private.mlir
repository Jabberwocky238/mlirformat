module {
  omp.private {type = private} @_QFwsloop_privateEi_private_ref_i32 : i32
  llvm.func @foo_free(!llvm.ptr)
  omp.private {type = firstprivate} @_QFwsloop_privateEc_firstprivate_ref_c8 : !llvm.array<1 x i8> copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> !llvm.array<1 x i8>
    llvm.store %0, %arg1 : !llvm.array<1 x i8>, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @foo_free(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  omp.declare_reduction @max_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(-3.40282347E+38 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.intr.maxnum(%arg0, %arg1) {fastmathFlags = #llvm.fastmath<contract>} : (f32, f32) -> f32
    omp.yield(%0 : f32)
  }
  llvm.func @wsloop_private_(%arg0: !llvm.ptr {fir.bindc_name = "y"}) attributes {fir.internal_name = "_QPwsloop_private", frame_pointer = #llvm.framePointerKind<all>, target_cpu = "x86-64"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %3 = llvm.alloca %0 x !llvm.array<1 x i8> {bindc_name = "c"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(10 : i32) : i32
    %6 = llvm.mlir.constant(0 : i32) : i32
    omp.parallel {
      omp.wsloop private(@_QFwsloop_privateEc_firstprivate_ref_c8 %3 -> %arg1, @_QFwsloop_privateEi_private_ref_i32 %2 -> %arg2 : !llvm.ptr, !llvm.ptr) private_barrier reduction(@max_f32 %1 -> %arg3 : !llvm.ptr) {
        omp.loop_nest (%arg4) : i32 = (%6) to (%5) inclusive step (%4) {
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

