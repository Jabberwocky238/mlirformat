"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFwsloop_privateEi_private_ref_i32", type = i64}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "y"}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_private_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    "llvm.cond_br"(%5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "omp.wsloop"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@_QFwsloop_privateEi_private_ref_i32]}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.loop_nest"(%4, %3, %2) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPwsloop_private"} : () -> ()
}) : () -> ()

