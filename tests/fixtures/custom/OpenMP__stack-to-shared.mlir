module attributes {omp.is_target_device = true} {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  omp.private {type = private} @privatizer_i32 : i32
  omp.private {type = firstprivate} @firstprivatizer_f32 : !llvm.ptr copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  }
  llvm.func @foo(!llvm.ptr) attributes {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>}
  llvm.func @device_func(%arg0: i64, %arg1: i1) attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} {
    %0 = llvm.alloca %arg0 x i64 : (i64) -> !llvm.ptr
    %1 = llvm.alloca %arg0 x f32 {alignment = 128 : i64} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %arg0 x vector<16xf32> : (i64) -> !llvm.ptr
    %3 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr<5>
    %4 = llvm.addrspacecast %3 : !llvm.ptr<5> to !llvm.ptr
    %5 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr
    %6 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr
    llvm.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    omp.parallel reduction(@add_f32 %0 -> %arg2 : !llvm.ptr) {
      %8 = llvm.load %2 : !llvm.ptr -> vector<16xf32>
      %9 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr
      omp.wsloop private(@privatizer_i32 %5 -> %arg3, @firstprivatizer_f32 %1 -> %arg4 : !llvm.ptr, !llvm.ptr) {
        omp.loop_nest (%arg5) : i64 = (%arg0) to (%arg0) inclusive step (%arg0) {
          llvm.call @foo(%arg2) : (!llvm.ptr) -> ()
          llvm.call @foo(%9) : (!llvm.ptr) -> ()
          llvm.call @foo(%arg3) : (!llvm.ptr) -> ()
          llvm.call @foo(%arg4) : (!llvm.ptr) -> ()
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.call @foo(%4) : (!llvm.ptr) -> ()
    %7 = llvm.load %6 : !llvm.ptr -> i32
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.return
  }
  llvm.func @host_func(%arg0: i64) {
    %0 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr
    omp.parallel {
      llvm.call @foo(%0) : (!llvm.ptr) -> ()
      omp.target kernel_type(generic) {
        %1 = llvm.mlir.constant(1 : i64) : i64
        %2 = llvm.alloca %1 x i32 : (i64) -> !llvm.ptr
        llvm.call @foo(%2) : (!llvm.ptr) -> ()
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @target_spmd() {
    omp.target kernel_type(spmd) {
      %0 = llvm.mlir.constant(1 : i64) : i64
      %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
      omp.teams {
        %2 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
        omp.parallel {
          %3 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
          %4 = llvm.load %1 : !llvm.ptr -> i32
          %5 = llvm.load %2 : !llvm.ptr -> i32
          omp.distribute {
            omp.wsloop {
              omp.loop_nest (%arg0) : i64 = (%0) to (%0) inclusive step (%0) {
                %6 = llvm.load %3 : !llvm.ptr -> i32
                omp.yield
              }
            } {omp.composite}
          } {omp.composite}
          omp.terminator
        } {omp.composite}
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    llvm.return
  }
}

