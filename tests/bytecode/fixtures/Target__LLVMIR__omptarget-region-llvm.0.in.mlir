"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_region_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":4:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":5:10)
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "a", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEa"} : (i64) -> !llvm.ptr loc("<stdin>":6:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %5 = "llvm.alloca"(%4) <{elem_type = i32}> {bindc_name = "b", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEb"} : (i64) -> !llvm.ptr loc("<stdin>":8:10)
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":9:10)
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "c", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_regionEc"} : (i64) -> !llvm.ptr loc("<stdin>":10:10)
    "llvm.store"(%1, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":11:5)
    "llvm.store"(%0, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":12:5)
    %8 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":13:10)
    %9 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":14:10)
    %10 = "omp.map.info"(%7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":15:11)
    "omp.target"(%8, %9, %10) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":17:10), %arg1: !llvm.ptr loc("<stdin>":17:28), %arg2: !llvm.ptr loc("<stdin>":17:46)):
      %11 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":18:13)
      %12 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":19:13)
      %13 = "llvm.add"(%11, %12) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":20:13)
      "llvm.store"(%13, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":21:7)
      "omp.terminator"() : () -> () loc("<stdin>":22:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":16:5)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_no_map", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":27:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":26:3)
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
