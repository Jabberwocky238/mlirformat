"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimple_teams_reductionEindex__private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg5: i32):
    %13 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%13) : (i32) -> ()
  }, {
  ^bb0(%arg3: i32, %arg4: i32):
    %12 = "llvm.add"(%arg3, %arg4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%12) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_teams_reduction_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.store"(%6, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.teams"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.distribute"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFsimple_teams_reductionEindex__private_i32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.loop_nest"(%5, %4, %5) <{loop_inclusive}> ({
        ^bb0(%arg2: i32):
          "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          %9 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %10 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %11 = "llvm.add"(%9, %10) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%11, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPsimple_teams_reduction"} : () -> ()
}) : () -> ()

