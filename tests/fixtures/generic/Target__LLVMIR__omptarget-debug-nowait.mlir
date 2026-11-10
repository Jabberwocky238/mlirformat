"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> : (i64) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%3, %4) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %5 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
      %6 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
      "llvm.br"(%6, %5)[^bb1] : (i32, i64) -> ()
    ^bb1(%7: i32, %8: i64):  // 2 preds: ^bb0, ^bb2
      %9 = "llvm.icmp"(%8, %5) <{predicate = 4 : i64}> : (i64, i64) -> i1
      "llvm.cond_br"(%9)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "llvm.store"(%7, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "llvm.br"(%7, %8)[^bb1] : (i32, i64) -> ()
    ^bb3:  // pred: ^bb1
      "llvm.store"(%7, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false} : () -> ()

