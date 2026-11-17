"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEpriv_val_dist_private_f32", type = f32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":11:10)
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "priv_val_dist"} : (i64) -> !llvm.ptr loc("<stdin>":12:10)
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":13:10)
    %3 = "llvm.mlir.constant"() <{value = 3.140000e+00 : f32}> : () -> f32 loc("<stdin>":14:10)
    %4 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":15:10)
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":16:10)
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.distribute"(%1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>, private_syms = [@_QFEpriv_val_dist_private_f32, @_QFEi_private_i32]}> ({
      ^bb0(%arg0: !llvm.ptr loc("<stdin>":19:12), %arg1: !llvm.ptr loc("<stdin>":19:30)):
        "omp.loop_nest"(%5, %4, %5) <{loop_inclusive}> ({
        ^bb0(%arg2: i32 loc("<stdin>":21:14)):
          "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":22:11)
          "llvm.store"(%3, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":23:11)
          "omp.yield"() : () -> () loc("<stdin>":24:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":20:9)
      }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":18:7)
      "omp.terminator"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
