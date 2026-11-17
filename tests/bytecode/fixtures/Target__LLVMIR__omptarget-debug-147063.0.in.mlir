"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFFfnEv_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<internal>, sym_name = "_QFPfn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "v"} : (i64) -> !llvm.ptr loc("<stdin>":8:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":9:10)
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@_QFFfnEv_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":11:10)):
      "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":12:7)
      %3 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "v", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":13:12)
      "omp.target"(%3) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":15:12)):
        %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":16:14)
        %5 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":17:14)
        %6 = "llvm.add"(%5, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":18:14)
        "llvm.store"(%6, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":19:9)
        "omp.terminator"() : () -> () loc("<stdin>":20:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":14:7)
      "omp.terminator"() : () -> () loc("<stdin>":22:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":10:5)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":6:3)
}) {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
