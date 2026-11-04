module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @launch_(%arg0: !llvm.ptr {fir.bindc_name = "a", llvm.nocapture}) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f64 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %2 = llvm.getelementptr %arg0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %3 = omp.map.info var_ptr(%arg0 : !llvm.ptr, f64) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%2 : !llvm.ptr) -> !llvm.ptr {name = ""}
    %4 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(to) capture(ByRef) members(%3 : [0] : !llvm.ptr) -> !llvm.ptr {name = "a"}
    %5 = omp.map.info var_ptr(%1 : !llvm.ptr, f64) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "n"}
    omp.target nowait map_entries(%4 -> %arg1, %5 -> %arg2, %3 -> %arg3 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %6 = llvm.mlir.constant(2.000000e+00 : f64) : f64
      %7 = llvm.mlir.constant(1 : index) : i64
      %8 = llvm.getelementptr %arg1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
      %9 = llvm.load %8 : !llvm.ptr -> !llvm.ptr
      %10 = llvm.getelementptr %9[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i8
      %11 = llvm.load %10 : !llvm.ptr -> f64
      %12 = llvm.fmul %11, %6 {fastmathFlags = #llvm.fastmath<contract>} : f64
      llvm.store %12, %10 : f64, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

