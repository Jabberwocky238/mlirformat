"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "scope_basic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.scope"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.terminator"() : () -> () loc("<stdin>":5:9)
      }) : () -> () loc("<stdin>":4:7)
      "omp.terminator"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "llvm.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
