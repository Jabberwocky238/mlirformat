"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_teams_distribute_parallel_do_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
            "omp.simd"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEi_private_i32]}> ({
            ^bb0(%arg0: !llvm.ptr):
              "omp.loop_nest"(%3, %2, %3) <{loop_inclusive}> ({
              ^bb0(%arg1: i32):
                "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : (!llvm.ptr) -> ()
          }) {omp.composite} : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

