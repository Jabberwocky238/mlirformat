"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<"_QFTdtype", (f32, i32)>}> {bindc_name = "dtypev"} : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    %2 = "llvm.getelementptr"(%1) <{elem_type = !llvm.struct<"_QFTdtype", (f32, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 1>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":5:10)
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "dtypev%value2", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    %4 = "omp.map.info"(%1, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[1]], name = "dtypev", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<"_QFTdtype", (f32, i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":7:10)
    "omp.target"(%4, %3) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":9:10), %arg1: !llvm.ptr loc("<stdin>":9:28)):
      "omp.terminator"() : () -> () loc("<stdin>":10:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":8:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) {fir.bindc_name = "main"} : () -> () loc("<stdin>":2:3)
}) {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
