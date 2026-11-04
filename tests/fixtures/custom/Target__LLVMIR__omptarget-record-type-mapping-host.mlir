module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(10 : index) : i64
    %1 = llvm.mlir.constant(4 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x !llvm.struct<(f32, array<10 x i32>, i32)> : (i64) -> !llvm.ptr
    %5 = llvm.mlir.constant(2 : i32) : i32
    %6 = llvm.getelementptr %4[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(f32, array<10 x i32>, i32)>
    %7 = omp.map.info var_ptr(%6 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %8 = llvm.mlir.constant(1 : i32) : i32
    %9 = llvm.getelementptr %4[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(f32, array<10 x i32>, i32)>
    %10 = omp.map.bounds lower_bound(%2 : i64) upper_bound(%1 : i64) extent(%0 : i64) stride(%2 : i64) start_idx(%2 : i64)
    %11 = omp.map.info var_ptr(%9 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%10) -> !llvm.ptr
    %12 = omp.map.info var_ptr(%4 : !llvm.ptr, !llvm.struct<(f32, array<10 x i32>, i32)>) map_clauses(tofrom) capture(ByRef) members(%7, %11 : [2], [1] : !llvm.ptr, !llvm.ptr) -> !llvm.ptr {partial_map = true}
    omp.target map_entries(%7 -> %arg0, %11 -> %arg1, %12 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

