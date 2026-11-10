"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "mix_use_device_ptr_and_addr_and_map_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: !llvm.ptr, %arg18: !llvm.ptr, %arg19: !llvm.ptr, %arg20: !llvm.ptr):
    %19 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %20 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %21 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %22 = "omp.map.bounds"(%19, %20, %20, %21, %19) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %23 = "omp.map.info"(%arg13) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(i64)>}> : (!llvm.ptr) -> !llvm.ptr
    %24 = "omp.map.info"(%arg14) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %25 = "omp.map.info"(%arg15, %arg16, %22) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %26 = "omp.map.info"(%arg15, %25) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %27 = "omp.map.info"(%arg17, %arg18) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = f32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %28 = "omp.map.info"(%arg17, %27) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %29 = "omp.map.info"(%arg13) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(i64)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%23, %24, %26, %28, %25, %27, %29) <{operandSegmentSizes = array<i32: 0, 0, 2, 0, 4, 1>}> ({
    ^bb0(%arg21: !llvm.ptr, %arg22: !llvm.ptr, %arg23: !llvm.ptr, %arg24: !llvm.ptr, %arg25: !llvm.ptr):
      %30 = "llvm.getelementptr"(%arg17) <{elem_type = !llvm.struct<(i64)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      %31 = "llvm.getelementptr"(%arg20) <{elem_type = !llvm.struct<(i64)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      %32 = "llvm.load"(%30) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
      "llvm.store"(%32, %31) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> ()
      %33 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
      "llvm.intr.memcpy"(%arg19, %arg21, %33) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
      %34 = "llvm.getelementptr"(%arg19) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      %35 = "llvm.load"(%34) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      %36 = "llvm.getelementptr"(%35, %20) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      %37 = "llvm.load"(%36) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "llvm.store"(%37, %arg14) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "mix_use_device_ptr_and_addr_and_map_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %3 = "omp.map.bounds"(%0, %1, %1, %2, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %4 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(i64)>}> : (!llvm.ptr) -> !llvm.ptr
    %5 = "omp.map.info"(%arg1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %6 = "omp.map.info"(%arg2, %arg3, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %7 = "omp.map.info"(%arg2, %6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %8 = "omp.map.info"(%arg4, %arg5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = f32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %9 = "omp.map.info"(%arg4, %8) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %10 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(i64)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%5, %4, %8, %6, %7, %9, %10) <{operandSegmentSizes = array<i32: 0, 0, 2, 0, 4, 1>}> ({
    ^bb0(%arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: !llvm.ptr):
      %11 = "llvm.getelementptr"(%arg4) <{elem_type = !llvm.struct<(i64)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      %12 = "llvm.getelementptr"(%arg7) <{elem_type = !llvm.struct<(i64)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      %13 = "llvm.load"(%11) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
      "llvm.store"(%13, %12) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> ()
      %14 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
      "llvm.intr.memcpy"(%arg6, %arg10, %14) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
      %15 = "llvm.getelementptr"(%arg6) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      %16 = "llvm.load"(%15) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      %17 = "llvm.getelementptr"(%16, %1) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      %18 = "llvm.load"(%17) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "llvm.store"(%18, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"], omp.version = #omp.version<version = 50>} : () -> ()

