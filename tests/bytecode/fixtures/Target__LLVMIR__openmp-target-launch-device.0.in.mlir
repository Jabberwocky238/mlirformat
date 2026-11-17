"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8)):
    %0 = "llvm.mlir.constant"() <{value = 20 : i64}> : () -> i32 loc("<stdin>":4:10)
    %1 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":5:10)
    "omp.target"(%1, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":7:10)):
      %4 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i32 loc("<stdin>":8:12)
      %5 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:12)
      "omp.teams"(%5, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
        "omp.terminator"() : () -> () loc("<stdin>":11:9)
      }) : (i32, i32) -> () loc("<stdin>":10:7)
      "omp.terminator"() : () -> () loc("<stdin>":13:7)
    }) {omp.combined} : (!llvm.ptr, i32) -> () loc("<stdin>":6:5)
    %2 = "llvm.mlir.constant"() <{value = 30 : i64}> : () -> i32 loc("<stdin>":15:10)
    "omp.target"(%2) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %3 = "llvm.mlir.constant"() <{value = 40 : i64}> : () -> i32 loc("<stdin>":17:12)
      "omp.teams"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
        "omp.terminator"() : () -> () loc("<stdin>":19:9)
      }) : (i32) -> () loc("<stdin>":18:7)
      "omp.terminator"() : () -> () loc("<stdin>":21:7)
    }) {omp.combined} : (i32) -> () loc("<stdin>":16:5)
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
