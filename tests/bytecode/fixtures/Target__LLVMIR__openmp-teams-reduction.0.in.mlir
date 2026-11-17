"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg3: i32 loc("<stdin>":4:8)):
    %21 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:11)
    "omp.yield"(%21) : (i32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg1: i32 loc("<stdin>":8:8), %arg2: i32 loc("<stdin>":8:20)):
    %20 = "llvm.add"(%arg1, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":9:11)
    "omp.yield"(%20) : (i32) -> () loc("<stdin>":10:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_teams_only_reduction_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":16:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr loc("<stdin>":17:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":18:10)
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr loc("<stdin>":19:10)
    %4 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":20:10)
    %5 = "llvm.mlir.constant"() <{value = 10000 : index}> : () -> i64 loc("<stdin>":21:10)
    %6 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":22:10)
    %7 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":23:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":24:10)
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":25:10)
    "llvm.store"(%7, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":26:5)
    "omp.teams"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":28:10)):
      %10 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32 loc("<stdin>":29:13)
      "llvm.br"(%10, %5)[^bb1] : (i32, i64) -> () loc("<stdin>":30:7)
    ^bb1(%11: i32 loc("<stdin>":31:10), %12: i64 loc("<stdin>":31:20)):  // 2 preds: ^bb0, ^bb2
      %13 = "llvm.icmp"(%12, %4) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":32:13)
      "llvm.cond_br"(%13)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":33:7)
    ^bb2:  // pred: ^bb1
      "llvm.store"(%11, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":35:7)
      %14 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":36:13)
      %15 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":37:13)
      %16 = "llvm.add"(%14, %15) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":38:13)
      "llvm.store"(%16, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":39:7)
      %17 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":40:13)
      %18 = "llvm.add"(%17, %10) <{overflowFlags = 1 : i32}> : (i32, i32) -> i32 loc("<stdin>":41:13)
      %19 = "llvm.sub"(%12, %6) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":42:13)
      "llvm.br"(%18, %19)[^bb1] : (i32, i64) -> () loc("<stdin>":43:7)
    ^bb3:  // pred: ^bb1
      "llvm.store"(%11, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":45:7)
      "omp.terminator"() : () -> () loc("<stdin>":46:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":27:5)
    "llvm.return"() : () -> () loc("<stdin>":48:5)
  }) {fir.internal_name = "_QPsimple_teams_only_reduction"} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":1:1)
