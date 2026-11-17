"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_firstprivate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":3:8)):
    "omp.parallel"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg3: !llvm.ptr loc("<stdin>":5:10)):
      %1 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":6:12)
      "omp.terminator"() : () -> () loc("<stdin>":7:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "x.privatizer", type = f32}> ({
  }, {
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":13:8), %arg1: !llvm.ptr loc("<stdin>":13:26)):
    %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":14:10)
    "llvm.store"(%0, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":15:5)
    "omp.yield"(%arg1) : (!llvm.ptr) -> () loc("<stdin>":16:5)
  }, {
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
