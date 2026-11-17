"builtin.module"() ({
  "omp.declare_mapper"() <{sym_name = "mapper", type = !llvm.struct<"S", (i32, i32)>}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":3:8)):
    %5 = "llvm.getelementptr"(%arg2) <{elem_type = !llvm.struct<"S", (i32, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":4:10)
    %6 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":5:10)
    %7 = "omp.map.info"(%arg2, %6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], name = "", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = true, var_ptr_type = !llvm.struct<"S", (i32, i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    "omp.declare_mapper.info"(%7, %6) <{operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_mapper_combined_entries", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":10:10)
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<"S", (i32, i32)>}> : (i64) -> !llvm.ptr loc("<stdin>":11:10)
    %2 = "llvm.getelementptr"(%1) <{elem_type = !llvm.struct<"S", (i32, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":12:10)
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "s.f0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":13:10)
    %4 = "omp.map.info"(%1, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, mapper_id = @mapper, members_index = [[0]], name = "s", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<"S", (i32, i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":14:10)
    "omp.target"(%4, %3) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":16:10), %arg1: !llvm.ptr loc("<stdin>":16:28)):
      "omp.terminator"() : () -> () loc("<stdin>":17:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":15:5)
    "llvm.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":9:3)
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
