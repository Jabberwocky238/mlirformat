module attributes {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} {
  llvm.func @_QPopenmp_target(%arg0: i16, %arg1: i32, %arg2: i64) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i16) : i16
    omp.target kernel_type(generic) device(%1 : i16) host_eval(%0 -> %arg3, %0 -> %arg4, %0 -> %arg5 : i32, i32, i32) {
      omp.terminator
    }
    %2 = llvm.mlir.constant(2 : i32) : i32
    omp.target kernel_type(generic) device(%2 : i32) host_eval(%0 -> %arg3, %0 -> %arg4, %0 -> %arg5 : i32, i32, i32) {
      omp.terminator
    }
    %3 = llvm.mlir.constant(3 : i64) : i64
    omp.target kernel_type(generic) device(%3 : i64) host_eval(%0 -> %arg3, %0 -> %arg4, %0 -> %arg5 : i32, i32, i32) {
      omp.terminator
    }
    omp.target kernel_type(generic) device(%arg0 : i16) host_eval(%0 -> %arg3, %0 -> %arg4, %0 -> %arg5 : i32, i32, i32) {
      omp.terminator
    }
    omp.target kernel_type(generic) device(%arg1 : i32) host_eval(%0 -> %arg3, %0 -> %arg4, %0 -> %arg5 : i32, i32, i32) {
      omp.terminator
    }
    omp.target kernel_type(generic) device(%arg2 : i64) host_eval(%0 -> %arg3, %0 -> %arg4, %0 -> %arg5 : i32, i32, i32) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} {
  llvm.func @_QPopenmp_target_data(%arg0: i16, %arg1: i32, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %3 = llvm.mlir.constant(1 : i16) : i16
    omp.target_data device(%3 : i16) map_entries(%2 : !llvm.ptr) {
      omp.terminator
    }
    %4 = llvm.mlir.constant(2 : i32) : i32
    omp.target_data device(%4 : i32) map_entries(%2 : !llvm.ptr) {
      omp.terminator
    }
    %5 = llvm.mlir.constant(3 : i64) : i64
    omp.target_data device(%5 : i64) map_entries(%2 : !llvm.ptr) {
      omp.terminator
    }
    omp.target_data device(%arg0 : i16) map_entries(%2 : !llvm.ptr) {
      omp.terminator
    }
    omp.target_data device(%arg1 : i32) map_entries(%2 : !llvm.ptr) {
      omp.terminator
    }
    omp.target_data device(%arg2 : i64) map_entries(%2 : !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} {
  llvm.func @_QPomp_target_enter_exit(%arg0: i16, %arg1: i32, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = "var"}
    %3 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = "var"}
    %4 = llvm.mlir.constant(1 : i16) : i16
    omp.target_enter_data device(%4 : i16) map_entries(%2 : !llvm.ptr)
    %5 = llvm.mlir.constant(2 : i32) : i32
    omp.target_enter_data device(%5 : i32) map_entries(%2 : !llvm.ptr)
    %6 = llvm.mlir.constant(3 : i64) : i64
    omp.target_enter_data device(%6 : i64) map_entries(%2 : !llvm.ptr)
    omp.target_enter_data device(%arg0 : i16) map_entries(%2 : !llvm.ptr)
    omp.target_enter_data device(%arg1 : i32) map_entries(%2 : !llvm.ptr)
    omp.target_enter_data device(%arg2 : i64) map_entries(%2 : !llvm.ptr)
    omp.target_exit_data device(%4 : i16) map_entries(%3 : !llvm.ptr)
    omp.target_exit_data device(%5 : i32) map_entries(%3 : !llvm.ptr)
    omp.target_exit_data device(%6 : i64) map_entries(%3 : !llvm.ptr)
    omp.target_exit_data device(%arg0 : i16) map_entries(%3 : !llvm.ptr)
    omp.target_exit_data device(%arg1 : i32) map_entries(%3 : !llvm.ptr)
    omp.target_exit_data device(%arg2 : i64) map_entries(%3 : !llvm.ptr)
    llvm.return
  }
}

// -----
module attributes {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} {
  llvm.func @target_update_dev_clause(%arg0: i16, %arg1: i32, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = "var"}
    %3 = llvm.mlir.constant(1 : i16) : i16
    omp.target_update device(%3 : i16) map_entries(%2 : !llvm.ptr)
    %4 = llvm.mlir.constant(2 : i32) : i32
    omp.target_update device(%4 : i32) map_entries(%2 : !llvm.ptr)
    %5 = llvm.mlir.constant(3 : i64) : i64
    omp.target_update device(%5 : i64) map_entries(%2 : !llvm.ptr)
    omp.target_update device(%arg0 : i16) map_entries(%2 : !llvm.ptr)
    omp.target_update device(%arg1 : i32) map_entries(%2 : !llvm.ptr)
    omp.target_update device(%arg2 : i64) map_entries(%2 : !llvm.ptr)
    llvm.return
  }
}

