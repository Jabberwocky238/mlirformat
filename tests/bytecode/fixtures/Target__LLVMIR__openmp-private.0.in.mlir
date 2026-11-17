"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_1_private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":3:8)):
    "omp.parallel"(%arg8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg9: !llvm.ptr loc("<stdin>":5:10)):
      %6 = "llvm.load"(%arg9) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":6:12)
      "omp.terminator"() : () -> () loc("<stdin>":7:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_2_privates", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":12:8), %arg5: !llvm.ptr loc("<stdin>":12:26)):
    "omp.parallel"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0>, private_syms = [@x.privatizer, @y.privatizer]}> ({
    ^bb0(%arg6: !llvm.ptr loc("<stdin>":14:10), %arg7: !llvm.ptr loc("<stdin>":14:28)):
      %4 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":15:12)
      %5 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":16:12)
      "omp.terminator"() : () -> () loc("<stdin>":17:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":11:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "x.privatizer", type = f32}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":22:8), %arg3: !llvm.ptr loc("<stdin>":22:26)):
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":23:10)
    %3 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":24:10)
    "llvm.store"(%3, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":25:5)
    "omp.yield"(%arg3) : (!llvm.ptr) -> () loc("<stdin>":26:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":21:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "y.privatizer", type = i32}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":31:8), %arg1: !llvm.ptr loc("<stdin>":31:26)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":32:10)
    %1 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":33:10)
    "llvm.store"(%1, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":34:5)
    "omp.yield"(%arg1) : (!llvm.ptr) -> () loc("<stdin>":35:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
