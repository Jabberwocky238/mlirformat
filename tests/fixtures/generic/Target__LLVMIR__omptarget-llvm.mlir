"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_data", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i", in_type = i32, operand_segment_sizes = array<i32: 0, 0>, uniq_name = "_QFopenmp_target_dataEi"} : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%2) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %3 = "llvm.mlir.constant"() <{value = 99 : i32}> : () -> i32
      "llvm.store"(%3, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_data_region", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1023 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1024 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %4 = "omp.map.bounds"(%1, %0, %2, %3, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %5 = "omp.map.info"(%arg0, %4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<1024 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target_data"(%5) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %6 = "llvm.mlir.constant"() <{value = 99 : i32}> : () -> i32
      %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %9 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
      %10 = "llvm.getelementptr"(%arg0, %9) <{elem_type = !llvm.array<1024 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.store"(%6, %10) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_target_enter_exit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "dvc", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_enter_exitEdvc"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_enter_exitEi"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    "llvm.store"(%4, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %5 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "llvm.store"(%5, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %6 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %7 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %8 = "llvm.icmp"(%6, %7) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %9 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %10 = "llvm.mlir.constant"() <{value = 1023 : index}> : () -> i64
    %11 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %12 = "llvm.mlir.constant"() <{value = 1024 : index}> : () -> i64
    %13 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %14 = "omp.map.bounds"(%11, %10, %12, %13, %13) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %15 = "omp.map.info"(%arg0, %14) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<1024 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %16 = "llvm.mlir.constant"() <{value = 511 : index}> : () -> i64
    %17 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %18 = "llvm.mlir.constant"() <{value = 512 : index}> : () -> i64
    %19 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %20 = "omp.map.bounds"(%17, %16, %18, %19, %19) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %21 = "omp.map.info"(%arg1, %20) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<512 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target_enter_data"(%9, %8, %15, %21) <{operandSegmentSizes = array<i32: 0, 0, 1, 1, 2, 0>}> : (i32, i1, !llvm.ptr, !llvm.ptr) -> ()
    %22 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %23 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %24 = "llvm.icmp"(%22, %23) <{predicate = 4 : i64}> : (i32, i32) -> i1
    %25 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %26 = "llvm.mlir.constant"() <{value = 1023 : index}> : () -> i64
    %27 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %28 = "llvm.mlir.constant"() <{value = 1024 : index}> : () -> i64
    %29 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %30 = "omp.map.bounds"(%27, %26, %28, %29, %29) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %31 = "omp.map.info"(%arg0, %30) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<1024 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %32 = "llvm.mlir.constant"() <{value = 511 : index}> : () -> i64
    %33 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %34 = "llvm.mlir.constant"() <{value = 512 : index}> : () -> i64
    %35 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %36 = "omp.map.bounds"(%33, %32, %34, %35, %35) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %37 = "omp.map.info"(%arg1, %36) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<512 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target_exit_data"(%25, %24, %31, %37) <{operandSegmentSizes = array<i32: 0, 0, 1, 1, 2, 0>}> : (i32, i1, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_use_dev_ptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.ptr}> : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%2, %3) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 1>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %5 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%4, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_use_dev_addr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.ptr}> : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%2, %3) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 1, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %5 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%4, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_use_dev_addr_no_ptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%2, %3) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 1, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      "llvm.store"(%4, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_use_dev_addr_nomap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.ptr}> : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%0) <{elem_type = !llvm.ptr}> : (i64) -> !llvm.ptr
    %4 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    %5 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%4, %5) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 1, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %6 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %7 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%6, %7) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %8 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32
      %9 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%8, %9) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_use_dev_both", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.ptr}> : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%0) <{elem_type = !llvm.ptr}> : (i64) -> !llvm.ptr
    %4 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    %5 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    %6 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    %7 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%4, %5, %7, %6) <{operandSegmentSizes = array<i32: 0, 0, 2, 0, 1, 1>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %8 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %9 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%8, %9) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %10 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32
      %11 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%10, %11) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_data_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i", in_type = i32, operand_segment_sizes = array<i32: 0, 0>, uniq_name = "_QFopenmp_target_dataEi"} : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%2) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %3 = "llvm.mlir.constant"() <{value = 99 : i32}> : () -> i32
      "llvm.store"(%3, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.target_update"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_mapper"() <{sym_name = "_QQFmy_testmy_mapper", type = !llvm.struct<"_QFmy_testTmy_type", (i32)>}> ({
  ^bb0(%arg0: !llvm.ptr):
    %5 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %6 = "llvm.getelementptr"(%arg0) <{elem_type = !llvm.struct<"_QFmy_testTmy_type", (i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %7 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var%data", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %8 = "omp.map.info"(%arg0, %7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], name = "var", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = true, var_ptr_type = !llvm.struct<"_QFmy_testTmy_type", (i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.declare_mapper.info"(%8, %7) <{operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_data_mapper", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<"_QFmy_testTmy_type", (i32)>}> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, mapper_id = @_QQFmy_testmy_mapper, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<"_QFmy_testTmy_type", (i32)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%2) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %4 = "llvm.getelementptr"(%1) <{elem_type = !llvm.struct<"_QFmy_testTmy_type", (i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%3, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_target_is_device_ptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags is_device_ptr>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

