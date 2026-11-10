"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_simd_guided", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 64 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %5 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.wsloop"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind guided>, schedule_mod = #omp<sched_mod none>, schedule_simd}> ({
      "omp.simd"(%5, %1, %5) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 1, 0>, private_syms = [@_QFEi_private_i32]}> ({
      ^bb0(%arg0: !llvm.ptr):
        "omp.loop_nest"(%3, %2, %1) <{loop_inclusive}> ({
        ^bb0(%arg1: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) {omp.composite} : (!llvm.ptr, i32, !llvm.ptr) -> ()
    }) {omp.composite} : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

