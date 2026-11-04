"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_region_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "a", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEa"} : (i64) -> !llvm.ptr<5>
    %4 = "llvm.addrspacecast"(%3) : (!llvm.ptr<5>) -> !llvm.ptr
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %6 = "llvm.alloca"(%5) <{elem_type = i32}> {bindc_name = "b", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEb"} : (i64) -> !llvm.ptr<5>
    %7 = "llvm.addrspacecast"(%6) : (!llvm.ptr<5>) -> !llvm.ptr
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {bindc_name = "c", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEc"} : (i64) -> !llvm.ptr<5>
    %10 = "llvm.addrspacecast"(%9) : (!llvm.ptr<5>) -> !llvm.ptr
    "llvm.store"(%1, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.store"(%0, %7) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %11 = "omp.map.info"(%4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      %12 = "omp.map.info"(%7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      %13 = "omp.map.info"(%10) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target"(%11, %12, %13) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0>}> ({
      ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr):
        %14 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %15 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %16 = "llvm.add"(%14, %15) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "llvm.store"(%16, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_no_map", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

