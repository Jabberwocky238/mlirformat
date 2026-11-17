"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_teams_distribute_parallel_do_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":8:10)
    %2 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":9:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":10:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":11:10)
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
            "omp.simd"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEi_private_i32]}> ({
            ^bb0(%arg0: !llvm.ptr loc("<stdin>":17:18)):
              "omp.loop_nest"(%3, %2, %3) <{loop_inclusive}> ({
              ^bb0(%arg1: i32 loc("<stdin>":19:20)):
                "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":20:17)
                "omp.yield"() : () -> () loc("<stdin>":21:17)
              }) : (i32, i32, i32) -> () loc("<stdin>":18:15)
            }) {omp.composite} : (!llvm.ptr) -> () loc("<stdin>":16:13)
          }) {omp.composite} : () -> () loc("<stdin>":15:11)
        }) {omp.composite} : () -> () loc("<stdin>":14:9)
        "omp.terminator"() : () -> () loc("<stdin>":26:9)
      }) {omp.composite} : () -> () loc("<stdin>":13:7)
      "omp.terminator"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
