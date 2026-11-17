"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QPtest_taskloop_boundsEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest_taskloop_bounds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":8:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":9:10)
    %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":10:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":11:10)
    "omp.taskloop.context"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QPtest_taskloop_boundsEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":13:10)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%2, %3, %4) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":16:14)):
          "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":17:11)
          "omp.yield"() : () -> () loc("<stdin>":18:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":15:9)
      }) : () -> () loc("<stdin>":14:7)
      "omp.terminator"() : () -> () loc("<stdin>":21:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
