module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @target_if_nowait(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "cond"} : (i64) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i32
    %3 = llvm.mlir.constant(0 : i64) : i32
    %4 = llvm.icmp "ne" %2, %3 : i32
    %5 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "cond"}
    %6 = omp.map.info var_ptr(%arg0 : !llvm.ptr, f32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "var"}
    %7 = omp.map.info var_ptr(%arg1 : !llvm.ptr, f32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "val"}
    omp.target if(%4) nowait map_entries(%6 -> %arg2, %7 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      %8 = llvm.load %arg3 : !llvm.ptr -> f32
      llvm.store %8, %arg2 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

