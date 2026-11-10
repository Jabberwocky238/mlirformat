module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_3d_target_array_section() {
    %0 = llvm.mlir.addressof @_QFEinarray : !llvm.ptr
    %1 = llvm.mlir.addressof @_QFEoutarray : !llvm.ptr
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.constant(2 : index) : i64
    %5 = omp.map.bounds lower_bound(%3 : i64) upper_bound(%4 : i64) stride(%2 : i64) start_idx(%2 : i64)
    %6 = omp.map.bounds lower_bound(%2 : i64) upper_bound(%2 : i64) stride(%2 : i64) start_idx(%2 : i64)
    %7 = omp.map.info var_ptr(%0 : !llvm.ptr, !llvm.array<3 x array<3 x array<3 x i32>>>) map_clauses(tofrom) capture(ByRef) bounds(%5, %5, %6) -> !llvm.ptr {name = "inarray(1:3,1:3,2:2)"}
    %8 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.array<3 x array<3 x array<3 x i32>>>) map_clauses(tofrom) capture(ByRef) bounds(%5, %5, %5) -> !llvm.ptr {name = "outarray(1:3,1:3,1:3)"}
    omp.target kernel_type(generic) map_entries(%7 -> %arg0, %8 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      %9 = llvm.mlir.constant(0 : i64) : i64
      %10 = llvm.mlir.constant(1 : i64) : i64
      %11 = llvm.getelementptr %arg0[0, %10, %9, %9] : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr, !llvm.array<3 x array<3 x array<3 x i32>>>
      %12 = llvm.load %11 : !llvm.ptr -> i32
      %13 = llvm.getelementptr %arg1[0, %10, %9, %9] : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr, !llvm.array<3 x array<3 x array<3 x i32>>>
      llvm.store %12, %13 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @_QFEinarray() {addr_space = 0 : i32} : !llvm.array<3 x array<3 x array<3 x i32>>> {
    %0 = llvm.mlir.zero : !llvm.array<3 x array<3 x array<3 x i32>>>
    llvm.return %0 : !llvm.array<3 x array<3 x array<3 x i32>>>
  }
  llvm.mlir.global internal @_QFEoutarray() {addr_space = 0 : i32} : !llvm.array<3 x array<3 x array<3 x i32>>> {
    %0 = llvm.mlir.zero : !llvm.array<3 x array<3 x array<3 x i32>>>
    llvm.return %0 : !llvm.array<3 x array<3 x array<3 x i32>>>
  }
}

