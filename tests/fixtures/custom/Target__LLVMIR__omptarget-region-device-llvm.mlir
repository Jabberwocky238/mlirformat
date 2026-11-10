module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @omp_target_region_() {
    %0 = llvm.mlir.constant(20 : i32) : i32
    %1 = llvm.mlir.constant(10 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "a", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEa"} : (i64) -> !llvm.ptr<5>
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.alloca %4 x i32 {bindc_name = "b", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEb"} : (i64) -> !llvm.ptr<5>
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.alloca %6 x i32 {bindc_name = "c", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEc"} : (i64) -> !llvm.ptr<5>
    %8 = llvm.addrspacecast %3 : !llvm.ptr<5> to !llvm.ptr
    %9 = llvm.addrspacecast %5 : !llvm.ptr<5> to !llvm.ptr
    %10 = llvm.addrspacecast %7 : !llvm.ptr<5> to !llvm.ptr
    llvm.store %1, %8 : i32, !llvm.ptr
    llvm.store %0, %9 : i32, !llvm.ptr
    %11 = omp.map.info var_ptr(%8 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %12 = omp.map.info var_ptr(%9 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %13 = omp.map.info var_ptr(%10 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%11 -> %arg0, %12 -> %arg1, %13 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %14 = llvm.load %arg0 : !llvm.ptr -> i32
      %15 = llvm.load %arg1 : !llvm.ptr -> i32
      %16 = llvm.add %14, %15 : i32
      llvm.store %16, %arg2 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

