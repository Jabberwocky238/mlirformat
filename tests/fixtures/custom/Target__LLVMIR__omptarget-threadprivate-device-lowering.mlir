module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @func() attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} {
    %0 = llvm.mlir.addressof @_QFEpointer2 : !llvm.ptr
    %1 = omp.threadprivate %0 : !llvm.ptr -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(implicit, to) capture(ByRef) -> !llvm.ptr
    omp.target map_entries(%2 -> %arg0 : !llvm.ptr) {
      %3 = llvm.mlir.constant(1 : i32) : i32
      %4 = llvm.getelementptr %arg0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
      llvm.store %3, %4 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @_QFEpointer2() {addr_space = 0 : i32} : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    llvm.return %0 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
  }
}

