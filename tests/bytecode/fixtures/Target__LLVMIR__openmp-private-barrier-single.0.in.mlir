"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFwsloop_privateEi_private_ref_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo_free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFwsloop_privateEc_firstprivate_ref_c8", type = !llvm.array<1 x i8>}> ({
  }, {
  ^bb0(%arg10: !llvm.ptr loc("<stdin>":10:8), %arg11: !llvm.ptr loc("<stdin>":10:27)):
    %16 = "llvm.load"(%arg10) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.array<1 x i8> loc("<stdin>":11:11)
    "llvm.store"(%16, %arg11) <{ordering = 0 : i64}> : (!llvm.array<1 x i8>, !llvm.ptr) -> () loc("<stdin>":12:5)
    "omp.yield"(%arg11) : (!llvm.ptr) -> () loc("<stdin>":13:5)
  }, {
  ^bb0(%arg9: !llvm.ptr loc("<stdin>":15:8)):
    "llvm.call"(%arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":16:5)
    "omp.yield"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "y"}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_private_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":20:8)):
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":21:10)
    %10 = "llvm.alloca"(%9) <{elem_type = f32}> {bindc_name = "x"} : (i64) -> !llvm.ptr loc("<stdin>":22:11)
    %11 = "llvm.alloca"(%9) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":23:11)
    %12 = "llvm.alloca"(%9) <{elem_type = !llvm.array<1 x i8>}> {bindc_name = "c"} : (i64) -> !llvm.ptr loc("<stdin>":24:11)
    %13 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":25:11)
    %14 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":26:11)
    %15 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":27:11)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.wsloop"(%12, %11) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>, private_needs_barrier, private_syms = [@_QFwsloop_privateEc_firstprivate_ref_c8, @_QFwsloop_privateEi_private_ref_i32]}> ({
        ^bb0(%arg6: !llvm.ptr loc("<stdin>":31:14), %arg7: !llvm.ptr loc("<stdin>":31:32)):
          "omp.loop_nest"(%15, %14, %13) <{loop_inclusive}> ({
          ^bb0(%arg8: i32 loc("<stdin>":33:16)):
            "omp.yield"() : () -> () loc("<stdin>":34:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":32:11)
        }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":30:9)
        "omp.terminator"() : () -> () loc("<stdin>":37:9)
      }) : () -> () loc("<stdin>":29:7)
      "omp.terminator"() : () -> () loc("<stdin>":39:7)
    }) : () -> () loc("<stdin>":28:5)
    "llvm.return"() : () -> () loc("<stdin>":41:5)
  }) {fir.internal_name = "_QPwsloop_private"} : () -> () loc("<stdin>":19:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsubEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":43:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFsubEp_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":49:8), %arg4: !llvm.ptr loc("<stdin>":49:26)):
    %8 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":50:10)
    "llvm.store"(%8, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":51:5)
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":52:5)
  }, {
  }) : () -> () loc("<stdin>":47:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsub", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":56:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":57:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":58:10)
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "p"} : (i64) -> !llvm.ptr loc("<stdin>":59:10)
    %4 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":60:10)
    "llvm.store"(%0, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":61:5)
    "omp.wsloop"(%3, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>, private_needs_barrier, private_syms = [@_QFsubEp_firstprivate_i32, @_QFsubEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":63:10), %arg1: !llvm.ptr loc("<stdin>":63:28)):
      "omp.loop_nest"(%1, %1, %1) <{loop_inclusive}> ({
      ^bb0(%arg2: i32 loc("<stdin>":65:12)):
        "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":66:9)
        %5 = "llvm.add"(%arg2, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":67:14)
        %6 = "llvm.icmp"(%5, %1) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":68:14)
        "llvm.cond_br"(%6)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":69:9)
      ^bb1:  // pred: ^bb0
        "llvm.store"(%5, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":71:9)
        %7 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":72:14)
        "llvm.store"(%7, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":73:9)
        "llvm.br"()[^bb2] : () -> () loc("<stdin>":74:9)
      ^bb2:  // 2 preds: ^bb0, ^bb1
        "omp.yield"() : () -> () loc("<stdin>":76:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":64:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":62:5)
    "llvm.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":55:3)
}) : () -> () loc("<stdin>":1:1)
