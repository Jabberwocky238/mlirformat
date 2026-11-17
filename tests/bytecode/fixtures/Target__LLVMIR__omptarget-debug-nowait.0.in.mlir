"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":5:10)
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    %4 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":7:10)
    "omp.target"(%3, %4) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":9:10), %arg1: !llvm.ptr loc("<stdin>":9:28)):
      %5 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":10:12)
      %6 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":11:12)
      "llvm.br"(%6, %5)[^bb1] : (i32, i64) -> () loc("<stdin>":12:7)
    ^bb1(%7: i32 loc("<stdin>":13:10), %8: i64 loc("<stdin>":13:19)):  // 2 preds: ^bb0, ^bb2
      %9 = "llvm.icmp"(%8, %5) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":14:12)
      "llvm.cond_br"(%9)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":15:7)
    ^bb2:  // pred: ^bb1
      "llvm.store"(%7, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":17:7)
      "llvm.br"(%7, %8)[^bb1] : (i32, i64) -> () loc("<stdin>":18:7)
    ^bb3:  // pred: ^bb1
      "llvm.store"(%7, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":20:7)
      "omp.terminator"() : () -> () loc("<stdin>":21:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":8:5)
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) {omp.is_target_device = false} : () -> () loc("<stdin>":1:1)
