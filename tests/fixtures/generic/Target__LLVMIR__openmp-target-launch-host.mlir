"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = 20 : i64}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i32
    "omp.target"(%arg0, %1, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "omp.teams"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
        "omp.terminator"() : () -> ()
      }) : (i32, i32) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

