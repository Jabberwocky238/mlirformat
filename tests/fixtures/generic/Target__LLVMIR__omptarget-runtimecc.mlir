"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "target_if_variable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1):
    "omp.target"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {llvm.target_triple = "spirv64-intel", omp.is_gpu = true, omp.is_target_device = true, omp.target_triples = ["spirv64-intel"]} : () -> ()

