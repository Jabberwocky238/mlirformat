"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg3: i32):
    %21 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%21) : (i32) -> ()
  }, {
  ^bb0(%arg1: i32, %arg2: i32):
    %20 = "llvm.add"(%arg1, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%20) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_teams_only_reduction_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %5 = "llvm.mlir.constant"() <{value = 10000 : index}> : () -> i64
    %6 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %7 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.store"(%7, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.teams"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      %10 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
      "llvm.br"(%10, %5)[^bb1] : (i32, i64) -> ()
    ^bb1(%11: i32, %12: i64):  // 2 preds: ^bb0, ^bb2
      %13 = "llvm.icmp"(%12, %4) <{predicate = 4 : i64}> : (i64, i64) -> i1
      "llvm.cond_br"(%13)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "llvm.store"(%11, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %14 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %15 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %16 = "llvm.add"(%14, %15) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%16, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %17 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %18 = "llvm.add"(%17, %10) <{overflowFlags = 1 : i32}> : (i32, i32) -> i32
      %19 = "llvm.sub"(%12, %6) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "llvm.br"(%18, %19)[^bb1] : (i32, i64) -> ()
    ^bb3:  // pred: ^bb1
      "llvm.store"(%11, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPsimple_teams_only_reduction"} : () -> ()
}) : () -> ()

