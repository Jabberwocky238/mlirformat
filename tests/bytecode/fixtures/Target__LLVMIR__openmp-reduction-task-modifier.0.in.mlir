"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg4: i32 loc("<stdin>":4:8)):
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:10)
    "omp.yield"(%1) : (i32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg2: i32 loc("<stdin>":8:8), %arg3: i32 loc("<stdin>":8:20)):
    %0 = "llvm.add"(%arg2, %arg3) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":9:10)
    "omp.yield"(%0) : (i32) -> () loc("<stdin>":10:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_task_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":16:8)):
    "omp.parallel"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_mod = #omp<reduction_modifier(task)>, reduction_syms = [@add_i32]}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":18:10)):
      "omp.terminator"() : () -> () loc("<stdin>":19:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":1:1)
