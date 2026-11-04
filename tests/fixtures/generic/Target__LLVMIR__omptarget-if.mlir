"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "target_if_variable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1):
    "omp.target"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_if_true", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    "omp.target"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_if_false", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    "omp.target"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

