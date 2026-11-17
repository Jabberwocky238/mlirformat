"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "llvm.mlir.constant"() <{value = 20 : i64}> : () -> i32 loc("<stdin>":4:10)
    %1 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i32 loc("<stdin>":5:10)
    "omp.target"(%arg0, %1, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1>}> ({
    ^bb0(%arg1: i32 loc("<stdin>":7:10), %arg2: i32 loc("<stdin>":7:22)):
      "omp.teams"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
        "omp.terminator"() : () -> () loc("<stdin>":9:9)
      }) : (i32, i32) -> () loc("<stdin>":8:7)
      "omp.terminator"() : () -> () loc("<stdin>":11:7)
    }) : (i32, i32, i32) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
