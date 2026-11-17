"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPfoo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":5:10)
    "omp.target"(%2) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":7:10)):
      %3 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":8:12)
      "llvm.store"(%3, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":9:7)
      "omp.terminator"() : () -> () loc("<stdin>":10:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) {omp.target_triples = ["dummy-target-triple"]} : () -> () loc("<stdin>":1:1)
