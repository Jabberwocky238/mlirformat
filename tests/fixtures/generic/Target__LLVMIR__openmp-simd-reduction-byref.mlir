"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}, {llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr, %arg14: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}, {llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "combine", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr, %arg12: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "cleanup", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimd_reductionEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_reduction_byref_box_2xf32", type = !llvm.ptr}> ({
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %6 = "llvm.alloca"(%5) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    "omp.yield"(%6) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg8: !llvm.ptr, %arg9: !llvm.ptr):
    "llvm.call"(%arg8, %arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @init, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg9) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
    "llvm.call"(%arg6, %arg7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @combine, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg6) : (!llvm.ptr) -> ()
  }, {
  }, {
  ^bb0(%arg5: !llvm.ptr):
    "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cleanup, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "a", llvm.nocapture}, {fir.bindc_name = "sum", llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1024 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    %4 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.simd"(%4, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 1>, private_syms = [@_QFsimd_reductionEi_private_i32], reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_2xf32]}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      "omp.loop_nest"(%1, %0, %1) <{loop_inclusive}> ({
      ^bb0(%arg4: i32):
        "llvm.store"(%arg4, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

