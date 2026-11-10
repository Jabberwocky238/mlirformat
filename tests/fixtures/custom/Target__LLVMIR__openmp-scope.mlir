module {
  llvm.func @scope_basic() {
    omp.parallel {
      omp.scope {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @scope_nowait() {
    omp.parallel {
      omp.scope nowait {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  }
  llvm.func @scope_reduction(%arg0: !llvm.ptr) {
    omp.parallel {
      omp.scope reduction(@add_f32 %arg0 -> %arg1 : !llvm.ptr) {
        %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
        %1 = llvm.load %arg1 : !llvm.ptr -> f32
        %2 = llvm.fadd %1, %0 : f32
        llvm.store %2, %arg1 : f32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.declare_reduction @add_f32_2 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  }
  llvm.func @scope_reduction_nowait(%arg0: !llvm.ptr) {
    omp.parallel {
      omp.scope nowait reduction(@add_f32_2 %arg0 -> %arg1 : !llvm.ptr) {
        %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
        %1 = llvm.load %arg1 : !llvm.ptr -> f32
        %2 = llvm.fadd %1, %0 : f32
        llvm.store %2, %arg1 : f32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.private {type = private} @x_private_i32 : i32
  llvm.func @scope_private(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.parallel {
      omp.scope private(@x_private_i32 %arg0 -> %arg1 : !llvm.ptr) {
        llvm.store %0, %arg1 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  omp.private {type = firstprivate} @x_firstprivate_i32 : i32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @scope_firstprivate(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.parallel {
      omp.scope private(@x_firstprivate_i32 %arg0 -> %arg1 : !llvm.ptr) {
        %1 = llvm.load %arg1 : !llvm.ptr -> i32
        %2 = llvm.add %1, %0 : i32
        llvm.store %2, %arg1 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

