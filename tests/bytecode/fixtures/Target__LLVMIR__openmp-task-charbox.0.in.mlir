"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEc2_private_box_heap_c8xU", type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> ({
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":7:8), %arg6: !llvm.ptr loc("<stdin>":7:26)):
    %6 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32 loc("<stdin>":8:10)
    %7 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":9:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":10:10)
    %9 = "llvm.alloca"(%8) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr loc("<stdin>":11:10)
    "llvm.intr.memcpy"(%9, %arg5, %6) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":12:5)
    %10 = "llvm.ptrtoint"(%arg5) : (!llvm.ptr) -> i64 loc("<stdin>":13:11)
    %11 = "llvm.icmp"(%10, %7) <{predicate = 0 : i64}> : (i64, i64) -> i1 loc("<stdin>":14:11)
    "llvm.cond_br"(%11)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":15:5)
  ^bb1:  // pred: ^bb0
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":17:5)
  ^bb2:  // pred: ^bb0
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":19:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "omp.yield"(%arg6) : (!llvm.ptr) -> () loc("<stdin>":21:5)
  }, {
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":24:8)):
    "omp.yield"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":6:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEc1_private_box_ptr_c8xU", type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":28:8), %arg3: !llvm.ptr loc("<stdin>":28:26)):
    %3 = "llvm.mlir.constant"() <{value = 24 : i32}> : () -> i32 loc("<stdin>":29:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":30:10)
    %5 = "llvm.alloca"(%4) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (i32) -> !llvm.ptr loc("<stdin>":31:10)
    "llvm.intr.memcpy"(%5, %arg2, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":32:5)
    "omp.yield"(%arg3) : (!llvm.ptr) -> () loc("<stdin>":33:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":27:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":38:10)
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> {bindc_name = "c2"} : (i64) -> !llvm.ptr loc("<stdin>":39:10)
    %2 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> {bindc_name = "c1"} : (i64) -> !llvm.ptr loc("<stdin>":40:10)
    "omp.task"(%2, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFEc1_private_box_ptr_c8xU, @_QFEc2_private_box_heap_c8xU]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":42:10), %arg1: !llvm.ptr loc("<stdin>":42:28)):
      "omp.terminator"() : () -> () loc("<stdin>":43:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":41:5)
    "llvm.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
