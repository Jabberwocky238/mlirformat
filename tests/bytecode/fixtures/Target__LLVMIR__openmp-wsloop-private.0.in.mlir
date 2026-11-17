"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFwsloop_privateEi_private_ref_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo_free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFwsloop_privateEc_firstprivate_ref_c8", type = !llvm.array<1 x i8>}> ({
  }, {
  ^bb0(%arg9: !llvm.ptr loc("<stdin>":10:8), %arg10: !llvm.ptr loc("<stdin>":10:26)):
    %9 = "llvm.load"(%arg9) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.array<1 x i8> loc("<stdin>":11:10)
    "llvm.store"(%9, %arg10) <{ordering = 0 : i64}> : (!llvm.array<1 x i8>, !llvm.ptr) -> () loc("<stdin>":12:5)
    "omp.yield"(%arg10) : (!llvm.ptr) -> () loc("<stdin>":13:5)
  }, {
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":15:8)):
    "llvm.call"(%arg8) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":16:5)
    "omp.yield"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":8:3)
  "omp.declare_reduction"() <{sym_name = "max_f32", type = f32}> ({
  }, {
  ^bb0(%arg7: f32 loc("<stdin>":21:8)):
    %8 = "llvm.mlir.constant"() <{value = -3.40282347E+38 : f32}> : () -> f32 loc("<stdin>":22:10)
    "omp.yield"(%8) : (f32) -> () loc("<stdin>":23:5)
  }, {
  ^bb0(%arg5: f32 loc("<stdin>":25:8), %arg6: f32 loc("<stdin>":25:20)):
    %7 = "llvm.intr.maxnum"(%arg5, %arg6) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":26:10)
    "omp.yield"(%7) : (f32) -> () loc("<stdin>":27:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":19:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "y"}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_private_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":33:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":34:10)
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "x"} : (i64) -> !llvm.ptr loc("<stdin>":35:10)
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":36:10)
    %3 = "llvm.alloca"(%0) <{elem_type = !llvm.array<1 x i8>}> {bindc_name = "c"} : (i64) -> !llvm.ptr loc("<stdin>":37:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":38:10)
    %5 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":39:10)
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":40:10)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%3, %2, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 1, 0>, private_needs_barrier, private_syms = [@_QFwsloop_privateEc_firstprivate_ref_c8, @_QFwsloop_privateEi_private_ref_i32], reduction_byref = array<i1: false>, reduction_syms = [@max_f32]}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":43:12), %arg2: !llvm.ptr loc("<stdin>":43:30), %arg3: !llvm.ptr loc("<stdin>":43:48)):
        "omp.loop_nest"(%6, %5, %4) <{loop_inclusive}> ({
        ^bb0(%arg4: i32 loc("<stdin>":45:14)):
          "omp.yield"() : () -> () loc("<stdin>":46:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":44:9)
      }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":42:7)
      "omp.terminator"() : () -> () loc("<stdin>":49:7)
    }) : () -> () loc("<stdin>":41:5)
    "llvm.return"() : () -> () loc("<stdin>":51:5)
  }) {fir.internal_name = "_QPwsloop_private"} : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
