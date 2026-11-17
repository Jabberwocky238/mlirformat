"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}, {llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr loc("<stdin>":3:8), %arg14: !llvm.ptr loc("<stdin>":3:27)):
    "llvm.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}, {llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "combine", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr loc("<stdin>":7:8), %arg12: !llvm.ptr loc("<stdin>":7:27)):
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "cleanup", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: !llvm.ptr loc("<stdin>":11:8)):
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimd_reductionEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":14:3)
  "omp.declare_reduction"() <{sym_name = "add_reduction_byref_box_2xf32", type = !llvm.ptr}> ({
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":19:10)
    %6 = "llvm.alloca"(%5) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr loc("<stdin>":20:10)
    "omp.yield"(%6) : (!llvm.ptr) -> () loc("<stdin>":21:5)
  }, {
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":23:8), %arg9: !llvm.ptr loc("<stdin>":23:26)):
    "llvm.call"(%arg8, %arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @init, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":24:5)
    "omp.yield"(%arg9) : (!llvm.ptr) -> () loc("<stdin>":25:5)
  }, {
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":27:8), %arg7: !llvm.ptr loc("<stdin>":27:26)):
    "llvm.call"(%arg6, %arg7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @combine, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":28:5)
    "omp.yield"(%arg6) : (!llvm.ptr) -> () loc("<stdin>":29:5)
  }, {
  }, {
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":32:8)):
    "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cleanup, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":33:5)
    "omp.yield"() : () -> () loc("<stdin>":34:5)
  }, {
  }) : () -> () loc("<stdin>":18:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "a", llvm.nocapture}, {fir.bindc_name = "sum", llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":38:8), %arg1: !llvm.ptr loc("<stdin>":38:26)):
    %0 = "llvm.mlir.constant"() <{value = 1024 : i32}> : () -> i32 loc("<stdin>":39:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":40:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":41:10)
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr loc("<stdin>":42:10)
    %4 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":43:10)
    "omp.simd"(%4, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 1>, private_syms = [@_QFsimd_reductionEi_private_i32], reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_2xf32]}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":45:10), %arg3: !llvm.ptr loc("<stdin>":45:28)):
      "omp.loop_nest"(%1, %0, %1) <{loop_inclusive}> ({
      ^bb0(%arg4: i32 loc("<stdin>":47:12)):
        "llvm.store"(%arg4, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":48:9)
        "omp.yield"() : () -> () loc("<stdin>":49:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":46:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":44:5)
    "llvm.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
