"builtin.module"() ({
  "omp.declare_mapper"() <{sym_name = "mapper", type = !llvm.struct<"S", (i32, i32)>}> ({
  ^bb0(%arg2: !llvm.ptr):
    %5 = "llvm.getelementptr"(%arg2) <{elem_type = !llvm.struct<"S", (i32, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %6 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %7 = "omp.map.info"(%arg2, %6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], name = "", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = true, var_ptr_type = !llvm.struct<"S", (i32, i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.declare_mapper.info"(%7, %6) <{operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_mapper_combined_entries", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<"S", (i32, i32)>}> : (i64) -> !llvm.ptr
    %2 = "llvm.getelementptr"(%1) <{elem_type = !llvm.struct<"S", (i32, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "s.f0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "omp.map.info"(%1, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, mapper_id = @mapper, members_index = [[0]], name = "s", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<"S", (i32, i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%4, %3) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

