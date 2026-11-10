module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @_QQmain() attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr)> : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.struct<(ptr)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%2 -> %arg0 : !llvm.ptr) {
      %3 = llvm.mlir.constant(1 : i32) : i32
      %4 = llvm.alloca %3 x !llvm.struct<(ptr)> {alignment = 8 : i64} : (i32) -> !llvm.ptr<5>
      %5 = llvm.addrspacecast %4 : !llvm.ptr<5> to !llvm.ptr
      %6 = llvm.mlir.constant(50 : i32) : i32
      %7 = llvm.mlir.constant(1 : i64) : i64
      %8 = llvm.alloca %7 x i32 : (i64) -> !llvm.ptr<5>
      %9 = llvm.addrspacecast %8 : !llvm.ptr<5> to !llvm.ptr
      llvm.store %6, %9 : i32, !llvm.ptr
      %10 = llvm.mlir.undef : !llvm.struct<(ptr)>
      %11 = llvm.insertvalue %9, %10[0] : !llvm.struct<(ptr)> 
      llvm.store %11, %5 : !llvm.struct<(ptr)>, !llvm.ptr
      %12 = llvm.call @_ExternalCall(%arg0, %5) : (!llvm.ptr, !llvm.ptr) -> !llvm.struct<()>
      omp.terminator
    }
    llvm.return
  }
  llvm.func @_ExternalCall(!llvm.ptr, !llvm.ptr) -> !llvm.struct<()>
}

