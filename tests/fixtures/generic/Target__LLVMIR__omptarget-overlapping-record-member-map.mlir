"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<"_QFTdtype", (f32, i32)>}> {bindc_name = "dtypev"} : (i64) -> !llvm.ptr
    %2 = "llvm.getelementptr"(%1) <{elem_type = !llvm.struct<"_QFTdtype", (f32, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 1>}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "dtypev%value2", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "omp.map.info"(%1, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[1]], name = "dtypev", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_type = !llvm.struct<"_QFTdtype", (f32, i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%4, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.bindc_name = "main"} : () -> ()
}) {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

