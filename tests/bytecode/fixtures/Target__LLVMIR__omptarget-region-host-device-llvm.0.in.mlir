"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_region_host_device", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> () loc("<stdin>":4:7)
    }) : () -> () loc("<stdin>":3:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
