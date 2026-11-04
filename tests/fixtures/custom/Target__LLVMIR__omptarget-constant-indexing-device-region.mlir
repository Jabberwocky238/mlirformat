module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @_QQmain() attributes {bindc_name = "main"} {
    %0 = llvm.mlir.addressof @_QFEsp : !llvm.ptr
    %1 = llvm.mlir.constant(10 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.constant(9 : index) : i64
    %5 = omp.map.bounds lower_bound(%3 : i64) upper_bound(%4 : i64) extent(%1 : i64) stride(%2 : i64) start_idx(%2 : i64)
    %6 = omp.map.info var_ptr(%0 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%5) -> !llvm.ptr {name = "sp"}
    omp.target map_entries(%6 -> %arg0 : !llvm.ptr) {
      %7 = llvm.mlir.constant(20 : i32) : i32
      %8 = llvm.mlir.constant(0 : i64) : i64
      %9 = llvm.getelementptr %arg0[0, %8] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<10 x i32>
      llvm.store %7, %9 : i32, !llvm.ptr
      %10 = llvm.mlir.constant(10 : i32) : i32
      %11 = llvm.mlir.constant(4 : i64) : i64
      %12 = llvm.getelementptr %arg0[0, %11] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<10 x i32>
      llvm.store %10, %12 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @_QFEsp(dense<0> : tensor<10xi32>) {addr_space = 0 : i32} : !llvm.array<10 x i32>
  llvm.mlir.global external constant @_QQEnvironmentDefaults() {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.zero : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

