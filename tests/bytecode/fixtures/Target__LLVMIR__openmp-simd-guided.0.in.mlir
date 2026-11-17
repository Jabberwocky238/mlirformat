"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_simd_guided", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":8:10)
    %2 = "llvm.mlir.constant"() <{value = 64 : i32}> : () -> i32 loc("<stdin>":9:10)
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":10:10)
    %4 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":11:10)
    %5 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":12:10)
    "omp.wsloop"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind guided>, schedule_mod = #omp<sched_mod none>, schedule_simd}> ({
      "omp.simd"(%5, %1, %5) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 1, 0>, private_syms = [@_QFEi_private_i32]}> ({
      ^bb0(%arg0: !llvm.ptr loc("<stdin>":15:12)):
        "omp.loop_nest"(%3, %2, %1) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":17:14)):
          "omp.yield"() : () -> () loc("<stdin>":18:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":16:9)
      }) {omp.composite} : (!llvm.ptr, i32, !llvm.ptr) -> () loc("<stdin>":14:7)
    }) {omp.composite} : (i32) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
