"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_nowait_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%2) <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %3 = "llvm.mlir.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
      "llvm.store"(%3, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false} : () -> ()

