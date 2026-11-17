"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_i_32", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":4:8)):
    %11 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:11)
    %12 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64 loc("<stdin>":6:11)
    %13 = "llvm.call"(%12) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr loc("<stdin>":7:11)
    "llvm.store"(%11, %13) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":8:5)
    "omp.yield"(%13) : (!llvm.ptr) -> () loc("<stdin>":9:5)
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":11:8), %arg5: !llvm.ptr loc("<stdin>":11:26)):
    %8 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":12:10)
    %9 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":13:10)
    %10 = "llvm.add"(%8, %9) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":14:11)
    "llvm.store"(%10, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":15:5)
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":16:5)
  }, {
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":19:8)):
    "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":20:5)
    "omp.yield"() : () -> () loc("<stdin>":21:5)
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":25:10)
    %3 = "llvm.mlir.addressof"() <{global_name = @i}> : () -> !llvm.ptr loc("<stdin>":26:10)
    %4 = "llvm.mlir.addressof"() <{global_name = @j}> : () -> !llvm.ptr loc("<stdin>":27:10)
    %5 = "llvm.mlir.constant"() <{value = 9 : i32}> : () -> i32 loc("<stdin>":28:10)
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":29:10)
    %7 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":30:10)
    "omp.wsloop"(%3, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0>, reduction_byref = array<i1: true, true>, reduction_syms = [@add_reduction_i_32, @add_reduction_i_32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":32:10), %arg1: !llvm.ptr loc("<stdin>":32:28)):
      "omp.loop_nest"(%6, %5, %7) <{loop_inclusive}> ({
      ^bb0(%arg2: i32 loc("<stdin>":34:12)):
        "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":35:9)
        "llvm.store"(%2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":36:9)
        "omp.yield"() : () -> () loc("<stdin>":37:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":33:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":31:5)
    "llvm.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":24:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "i", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":43:10)
    "llvm.return"(%1) : (i32) -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":42:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "j", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":47:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":46:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":50:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":52:3)
}) : () -> () loc("<stdin>":1:1)
