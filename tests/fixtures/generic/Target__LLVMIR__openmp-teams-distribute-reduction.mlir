"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimple_teams_reductionEindex__private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg8: i32):
    %19 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%19) : (i32) -> ()
  }, {
  ^bb0(%arg6: i32, %arg7: i32):
    %18 = "llvm.add"(%arg6, %arg7) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%18) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_teams_reduction_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr
    %10 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32
    %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %12 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %13 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %14 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.store"(%12, %7) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.teams"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
    ^bb0(%arg3: !llvm.ptr):
      "omp.distribute"(%9) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFsimple_teams_reductionEindex__private_i32]}> ({
      ^bb0(%arg4: !llvm.ptr):
        "omp.loop_nest"(%11, %10, %11) <{loop_inclusive}> ({
        ^bb0(%arg5: i32):
          "llvm.store"(%arg5, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          %15 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %16 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %17 = "llvm.add"(%15, %16) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%17, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPsimple_teams_reduction"} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "teams_reduction_multiple_distribute_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.store"(%3, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.teams"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%2, %2, %2) <{loop_inclusive}> ({
        ^bb0(%arg2: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%2, %2, %2) <{loop_inclusive}> ({
        ^bb0(%arg1: i32):
          %4 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %5 = "llvm.add"(%4, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%5, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPteams_reduction_multiple_distribute"} : () -> ()
}) : () -> ()

