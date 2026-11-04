"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_nested_derived_type_alloca_map", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %4 = "llvm.mlir.constant"() <{value = 6 : index}> : () -> i64
    %5 = "omp.map.bounds"(%3, %0, %0, %1, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %6 = "llvm.getelementptr"(%arg0) <{elem_type = !llvm.struct<(f32, struct<(ptr, i64, i32, i8, i8, i8, i8)>, array<10 x i32>, f32, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32, struct<(f32, array<10 x i32>, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32)>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 6>}> : (!llvm.ptr) -> !llvm.ptr
    %7 = "llvm.getelementptr"(%6) <{elem_type = !llvm.struct<(f32, array<10 x i32>, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 2>}> : (!llvm.ptr) -> !llvm.ptr
    %8 = "llvm.getelementptr"(%7) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %9 = "omp.map.info"(%7, %8, %5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_type = i32}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %10 = "omp.map.info"(%7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "one_l%nest%array_k", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr) -> !llvm.ptr
    %11 = "omp.map.info"(%arg0, %10, %9) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[6, 2], [6, 2, 0]], name = "one_l", operandSegmentSizes = array<i32: 1, 0, 2, 0>, partial_map = true, var_type = !llvm.struct<(f32, struct<(ptr, i64, i32, i8, i8, i8, i8)>, array<10 x i32>, f32, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32, struct<(f32, array<10 x i32>, struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, i32)>)>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%10, %9, %11) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

