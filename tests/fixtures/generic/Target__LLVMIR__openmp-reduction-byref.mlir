"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_i_32", type = !llvm.ptr}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.alloca"(%7) <{elem_type = i32}> : (i64) -> !llvm.ptr
    "omp.yield"(%8) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.store"(%6, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %3 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %4 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %5 = "llvm.add"(%3, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%5, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg1) : (!llvm.ptr) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %2 = "llvm.mlir.addressof"() <{global_name = @i}> : () -> !llvm.ptr
    "omp.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_i_32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      "llvm.store"(%1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "i", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

