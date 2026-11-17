"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_byref_box_Uxf64", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":4:8)):
    %7 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> loc("<stdin>":5:10)
    "omp.yield"(%arg6) : (!llvm.ptr) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":8:8), %arg5: !llvm.ptr loc("<stdin>":8:26)):
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":9:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "r"}, {fir.bindc_name = "r2"}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<internal>, sym_name = "_QFPreduce", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":15:8), %arg1: !llvm.ptr loc("<stdin>":15:26)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":16:10)
    %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":17:10)
    %2 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":18:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":19:10)
    %4 = "llvm.alloca"(%3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr loc("<stdin>":20:10)
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":21:10)
    %6 = "llvm.alloca"(%5) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr loc("<stdin>":22:10)
    "omp.parallel"(%4, %6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2>, reduction_byref = array<i1: true, true>, reduction_syms = [@add_reduction_byref_box_Uxf64, @add_reduction_byref_box_Uxf64]}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":24:10), %arg3: !llvm.ptr loc("<stdin>":24:28)):
      "omp.terminator"() : () -> () loc("<stdin>":25:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":23:5)
    "llvm.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
