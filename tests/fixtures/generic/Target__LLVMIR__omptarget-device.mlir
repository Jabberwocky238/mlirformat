"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i16, %arg1: i32, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i16}> : () -> i16
    "omp.target"(%1, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg18: i32, %arg19: i32, %arg20: i32):
      "omp.terminator"() : () -> ()
    }) : (i16, i32, i32, i32) -> ()
    %2 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "omp.target"(%2, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg15: i32, %arg16: i32, %arg17: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, i32, i32, i32) -> ()
    %3 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i64
    "omp.target"(%3, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      "omp.terminator"() : () -> ()
    }) : (i64, i32, i32, i32) -> ()
    "omp.target"(%arg0, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: i32):
      "omp.terminator"() : () -> ()
    }) : (i16, i32, i32, i32) -> ()
    "omp.target"(%arg1, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, i32, i32, i32) -> ()
    "omp.target"(%arg2, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      "omp.terminator"() : () -> ()
    }) : (i64, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target_data", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i16, %arg1: i32, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i16}> : () -> i16
    "omp.target_data"(%3, %2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i16, !llvm.ptr) -> ()
    %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "omp.target_data"(%4, %2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, !llvm.ptr) -> ()
    %5 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i64
    "omp.target_data"(%5, %2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i64, !llvm.ptr) -> ()
    "omp.target_data"(%arg0, %2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i16, !llvm.ptr) -> ()
    "omp.target_data"(%arg1, %2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, !llvm.ptr) -> ()
    "omp.target_data"(%arg2, %2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i64, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_target_enter_exit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i16, %arg1: i32, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "var", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "var", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : i16}> : () -> i16
    "omp.target_enter_data"(%4, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i16, !llvm.ptr) -> ()
    %5 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "omp.target_enter_data"(%5, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, !llvm.ptr) -> ()
    %6 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i64
    "omp.target_enter_data"(%6, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "omp.target_enter_data"(%arg0, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i16, !llvm.ptr) -> ()
    "omp.target_enter_data"(%arg1, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, !llvm.ptr) -> ()
    "omp.target_enter_data"(%arg2, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "omp.target_exit_data"(%4, %3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i16, !llvm.ptr) -> ()
    "omp.target_exit_data"(%5, %3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, !llvm.ptr) -> ()
    "omp.target_exit_data"(%6, %3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "omp.target_exit_data"(%arg0, %3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i16, !llvm.ptr) -> ()
    "omp.target_exit_data"(%arg1, %3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, !llvm.ptr) -> ()
    "omp.target_exit_data"(%arg2, %3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "target_update_dev_clause", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i16, %arg1: i32, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "var", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i16}> : () -> i16
    "omp.target_update"(%3, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i16, !llvm.ptr) -> ()
    %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "omp.target_update"(%4, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, !llvm.ptr) -> ()
    %5 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i64
    "omp.target_update"(%5, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "omp.target_update"(%arg0, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i16, !llvm.ptr) -> ()
    "omp.target_update"(%arg1, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, !llvm.ptr) -> ()
    "omp.target_update"(%arg2, %2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} : () -> ()

