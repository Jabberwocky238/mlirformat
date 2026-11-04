"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_i_32", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg6: !llvm.ptr):
    %11 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %12 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    %13 = "llvm.call"(%12) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    "llvm.store"(%11, %13) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%13) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr):
    %8 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %9 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %10 = "llvm.add"(%8, %9) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%10, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  }, {
  ^bb0(%arg3: !llvm.ptr):
    "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %3 = "llvm.mlir.addressof"() <{global_name = @i}> : () -> !llvm.ptr
    %4 = "llvm.mlir.addressof"() <{global_name = @j}> : () -> !llvm.ptr
    %5 = "llvm.mlir.constant"() <{value = 9 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.wsloop"(%3, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0>, reduction_byref = array<i1: true, true>, reduction_syms = [@add_reduction_i_32, @add_reduction_i_32]}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      "omp.loop_nest"(%6, %5, %7) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "llvm.store"(%2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "i", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.return"(%1) : (i32) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "j", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

