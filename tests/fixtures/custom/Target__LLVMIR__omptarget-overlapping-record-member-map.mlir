module attributes {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "main"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<"_QFTdtype", (f32, i32)> {bindc_name = "dtypev"} : (i64) -> !llvm.ptr
    %2 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"_QFTdtype", (f32, i32)>
    %3 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "dtypev%value2"}
    %4 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.struct<"_QFTdtype", (f32, i32)>) map_clauses(to) capture(ByRef) members(%3 : [1] : !llvm.ptr) -> !llvm.ptr {name = "dtypev"}
    omp.target map_entries(%4 -> %arg0, %3 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

