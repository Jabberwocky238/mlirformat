"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8)):
    %0 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, name = "nthreads", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":4:10)
    "omp.target"(%0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":6:10)):
      %1 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64 loc("<stdin>":7:12)
      "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
        "omp.terminator"() : () -> () loc("<stdin>":9:9)
      }) : (i64) -> () loc("<stdin>":8:7)
      "omp.terminator"() : () -> () loc("<stdin>":11:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
