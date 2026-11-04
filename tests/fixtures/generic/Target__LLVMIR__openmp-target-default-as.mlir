"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_region_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "a", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEa"} : (i64) -> !llvm.ptr<5>
    %4 = "llvm.addrspacecast"(%3) : (!llvm.ptr<5>) -> !llvm.ptr
    "llvm.store"(%1, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %5 = "omp.map.info"(%4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.program_memory_space" = 4 : ui32>, llvm.target_triple = "spirv64-intel", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

