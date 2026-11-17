"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_if_nowait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: !llvm.ptr loc("<stdin>":3:26)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":4:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "cond"} : (i64) -> !llvm.ptr loc("<stdin>":5:10)
    %2 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":6:10)
    %3 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i32 loc("<stdin>":7:10)
    %4 = "llvm.icmp"(%2, %3) <{predicate = 1 : i64}> : (i32, i32) -> i1 loc("<stdin>":8:10)
    %5 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "cond", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":9:10)
    %6 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "var", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":10:10)
    %7 = "omp.map.info"(%arg1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "val", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":11:10)
    "omp.target"(%4, %6, %7) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":13:10), %arg3: !llvm.ptr loc("<stdin>":13:28)):
      %8 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":14:12)
      "llvm.store"(%8, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":15:7)
      "omp.terminator"() : () -> () loc("<stdin>":16:7)
    }) : (i1, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
