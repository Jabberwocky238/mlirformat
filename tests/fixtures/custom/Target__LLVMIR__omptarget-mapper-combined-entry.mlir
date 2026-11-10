module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  omp.declare_mapper @mapper : !llvm.struct<"S", (i32, i32)> {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.getelementptr %arg0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"S", (i32, i32)>
    %1 = omp.map.info var_ptr(%0 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %2 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<"S", (i32, i32)>) map_clauses(tofrom) capture(ByRef) members(%1 : [0] : !llvm.ptr) -> !llvm.ptr {name = "", partial_map = true}
    omp.declare_mapper.info map_entries(%2, %1 : !llvm.ptr, !llvm.ptr)
  }
  llvm.func @test_mapper_combined_entries() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<"S", (i32, i32)> : (i64) -> !llvm.ptr
    %2 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"S", (i32, i32)>
    %3 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "s.f0"}
    %4 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.struct<"S", (i32, i32)>) map_clauses(tofrom) capture(ByRef) mapper(@mapper) members(%3 : [0] : !llvm.ptr) -> !llvm.ptr {name = "s"}
    omp.target kernel_type(generic) map_entries(%4 -> %arg0, %3 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

