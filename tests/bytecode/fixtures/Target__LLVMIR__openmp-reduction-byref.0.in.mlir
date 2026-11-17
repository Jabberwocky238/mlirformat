"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_i_32", type = !llvm.ptr}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %8 = "llvm.alloca"(%7) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    "omp.yield"(%8) : (!llvm.ptr) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":7:8), %arg4: !llvm.ptr loc("<stdin>":7:26)):
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":8:10)
    "llvm.store"(%6, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":9:5)
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg1: !llvm.ptr loc("<stdin>":12:8), %arg2: !llvm.ptr loc("<stdin>":12:26)):
    %3 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":13:10)
    %4 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":14:10)
    %5 = "llvm.add"(%3, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":15:10)
    "llvm.store"(%5, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":16:5)
    "omp.yield"(%arg1) : (!llvm.ptr) -> () loc("<stdin>":17:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":23:10)
    %2 = "llvm.mlir.addressof"() <{global_name = @i}> : () -> !llvm.ptr loc("<stdin>":24:10)
    "omp.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_i_32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":26:10)):
      "llvm.store"(%1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":27:7)
      "omp.terminator"() : () -> () loc("<stdin>":28:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":25:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "i", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":33:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
