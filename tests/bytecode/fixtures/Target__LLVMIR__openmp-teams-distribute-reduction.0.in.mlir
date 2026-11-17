"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimple_teams_reductionEindex__private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg8: i32 loc("<stdin>":8:8)):
    %19 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:11)
    "omp.yield"(%19) : (i32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg6: i32 loc("<stdin>":12:8), %arg7: i32 loc("<stdin>":12:20)):
    %18 = "llvm.add"(%arg6, %arg7) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":13:11)
    "omp.yield"(%18) : (i32) -> () loc("<stdin>":14:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_teams_reduction_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":20:10)
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr loc("<stdin>":21:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":22:10)
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr loc("<stdin>":23:10)
    %10 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32 loc("<stdin>":24:11)
    %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":25:11)
    %12 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":26:11)
    %13 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":27:11)
    %14 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":28:11)
    "llvm.store"(%12, %7) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":29:5)
    "omp.teams"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
    ^bb0(%arg3: !llvm.ptr loc("<stdin>":31:10)):
      "omp.distribute"(%9) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFsimple_teams_reductionEindex__private_i32]}> ({
      ^bb0(%arg4: !llvm.ptr loc("<stdin>":33:12)):
        "omp.loop_nest"(%11, %10, %11) <{loop_inclusive}> ({
        ^bb0(%arg5: i32 loc("<stdin>":35:14)):
          "llvm.store"(%arg5, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":36:11)
          %15 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":37:17)
          %16 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":38:17)
          %17 = "llvm.add"(%15, %16) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":39:17)
          "llvm.store"(%17, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":40:11)
          "omp.yield"() : () -> () loc("<stdin>":41:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":34:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":32:7)
      "omp.terminator"() : () -> () loc("<stdin>":44:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":30:5)
    "llvm.return"() : () -> () loc("<stdin>":46:5)
  }) {fir.internal_name = "_QPsimple_teams_reduction"} : () -> () loc("<stdin>":19:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "teams_reduction_multiple_distribute_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":49:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr loc("<stdin>":50:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":51:10)
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":52:10)
    "llvm.store"(%3, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":53:5)
    "omp.teams"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":55:10)):
      "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%2, %2, %2) <{loop_inclusive}> ({
        ^bb0(%arg2: i32 loc("<stdin>":58:14)):
          "omp.yield"() : () -> () loc("<stdin>":59:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":57:9)
      }) : () -> () loc("<stdin>":56:7)
      "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%2, %2, %2) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":64:14)):
          %4 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":65:16)
          %5 = "llvm.add"(%4, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":66:16)
          "llvm.store"(%5, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":67:11)
          "omp.yield"() : () -> () loc("<stdin>":68:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":63:9)
      }) : () -> () loc("<stdin>":62:7)
      "omp.terminator"() : () -> () loc("<stdin>":71:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":54:5)
    "llvm.return"() : () -> () loc("<stdin>":73:5)
  }) {fir.internal_name = "_QPteams_reduction_multiple_distribute"} : () -> () loc("<stdin>":48:3)
}) : () -> () loc("<stdin>":1:1)
