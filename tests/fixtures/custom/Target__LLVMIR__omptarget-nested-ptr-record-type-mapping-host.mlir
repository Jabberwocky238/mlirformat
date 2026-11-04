module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @omp_nested_derived_type_alloca_map(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.constant(6 : index) : i64
    %5 = omp.map.bounds lower_bound(%3 : i64) upper_bound(%0 : i64) extent(%0 : i64) stride(%1 : i64) start_idx(%3 : i64) {stride_in_bytes = true}
    %6 = llvm.getelementptr %arg0[0, 6] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(f32, struct<(ptr, i64, i32, i8, i8, i8, i8)>, array<10 x i32>, f32, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32, struct<(f32, array<10 x i32>, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32)>)>
    %7 = llvm.getelementptr %6[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(f32, array<10 x i32>, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32)>
    %8 = llvm.getelementptr %7[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %9 = omp.map.info var_ptr(%7 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%8 : !llvm.ptr) bounds(%5) -> !llvm.ptr {name = ""}
    %10 = omp.map.info var_ptr(%7 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "one_l%nest%array_k"}
    %11 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(f32, struct<(ptr, i64, i32, i8, i8, i8, i8)>, array<10 x i32>, f32, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32, struct<(f32, array<10 x i32>, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32)>)>) map_clauses(tofrom) capture(ByRef) members(%10, %9 : [6, 2], [6, 2, 0] : !llvm.ptr, !llvm.ptr) -> !llvm.ptr {name = "one_l", partial_map = true}
    omp.target map_entries(%10 -> %arg1, %9 -> %arg2, %11 -> %arg3 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

