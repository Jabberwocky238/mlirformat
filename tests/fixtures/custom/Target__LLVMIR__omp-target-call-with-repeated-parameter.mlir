module {
  llvm.func @caller_() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %3 = omp.map.info var_ptr(%1 : !llvm.ptr, f32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "x"}
    %4 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
    omp.target kernel_type(generic) map_entries(%3 -> %arg0, %4 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      %5 = llvm.load %arg1 : !llvm.ptr -> i32
      %6 = llvm.sitofp %5 : i32 to f32
      llvm.store %6, %arg0 : f32, !llvm.ptr
      llvm.call @callee_(%arg0, %arg0) : (!llvm.ptr, !llvm.ptr) -> ()
      omp.terminator
    }
    llvm.return
  }
  llvm.func @callee_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    llvm.return
  }
}

