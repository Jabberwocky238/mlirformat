"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_byref_box_Uxf64", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg6: !llvm.ptr):
    %7 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    "omp.yield"(%arg6) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr):
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "r"}, {fir.bindc_name = "r2"}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<internal>, sym_name = "_QFPreduce", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %6 = "llvm.alloca"(%5) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    "omp.parallel"(%4, %6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2>, reduction_byref = array<i1: true, true>, reduction_syms = [@add_reduction_byref_box_Uxf64, @add_reduction_byref_box_Uxf64]}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

