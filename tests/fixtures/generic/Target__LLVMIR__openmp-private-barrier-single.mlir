"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFwsloop_privateEi_private_ref_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo_free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFwsloop_privateEc_firstprivate_ref_c8", type = !llvm.array<1 x i8>}> ({
  }, {
  ^bb0(%arg10: !llvm.ptr, %arg11: !llvm.ptr):
    %16 = "llvm.load"(%arg10) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.array<1 x i8>
    "llvm.store"(%16, %arg11) <{ordering = 0 : i64}> : (!llvm.array<1 x i8>, !llvm.ptr) -> ()
    "omp.yield"(%arg11) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg9: !llvm.ptr):
    "llvm.call"(%arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "y"}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_private_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr):
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %10 = "llvm.alloca"(%9) <{elem_type = f32}> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %11 = "llvm.alloca"(%9) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %12 = "llvm.alloca"(%9) <{elem_type = !llvm.array<1 x i8>}> {bindc_name = "c"} : (i64) -> !llvm.ptr
    %13 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %14 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %15 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.wsloop"(%12, %11) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>, private_needs_barrier, private_syms = [@_QFwsloop_privateEc_firstprivate_ref_c8, @_QFwsloop_privateEi_private_ref_i32]}> ({
        ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
          "omp.loop_nest"(%15, %14, %13) <{loop_inclusive}> ({
          ^bb0(%arg8: i32):
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPwsloop_private"} : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsubEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFsubEp_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    %8 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%8, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsub", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "p"} : (i64) -> !llvm.ptr
    %4 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "llvm.store"(%0, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.wsloop"(%3, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>, private_needs_barrier, private_syms = [@_QFsubEp_firstprivate_i32, @_QFsubEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      "omp.loop_nest"(%1, %1, %1) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %5 = "llvm.add"(%arg2, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        %6 = "llvm.icmp"(%5, %1) <{predicate = 4 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%6)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb1:  // pred: ^bb0
        "llvm.store"(%5, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %7 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        "llvm.store"(%7, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "llvm.br"()[^bb2] : () -> ()
      ^bb2:  // 2 preds: ^bb0, ^bb1
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

