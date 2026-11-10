"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_3d_target_array_section", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.addressof"() <{global_name = @_QFEinarray}> : () -> !llvm.ptr
    %3 = "llvm.mlir.addressof"() <{global_name = @_QFEoutarray}> : () -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %5 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %6 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %7 = "omp.map.bounds"(%5, %6, %4, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
    %8 = "omp.map.bounds"(%4, %4, %4, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
    %9 = "omp.map.info"(%2, %7, %7, %8) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "inarray(1:3,1:3,2:2)", operandSegmentSizes = array<i32: 1, 0, 0, 3>, partial_map = false, var_ptr_type = !llvm.array<3 x array<3 x array<3 x i32>>>}> : (!llvm.ptr, !omp.map_bounds_ty, !omp.map_bounds_ty, !omp.map_bounds_ty) -> !llvm.ptr
    %10 = "omp.map.info"(%3, %7, %7, %7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "outarray(1:3,1:3,1:3)", operandSegmentSizes = array<i32: 1, 0, 0, 3>, partial_map = false, var_ptr_type = !llvm.array<3 x array<3 x array<3 x i32>>>}> : (!llvm.ptr, !omp.map_bounds_ty, !omp.map_bounds_ty, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target"(%9, %10) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %11 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
      %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %13 = "llvm.getelementptr"(%arg0, %12, %11, %11) <{elem_type = !llvm.array<3 x array<3 x array<3 x i32>>>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648, -2147483648, -2147483648>}> : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr
      %14 = "llvm.load"(%13) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %15 = "llvm.getelementptr"(%arg1, %12, %11, %11) <{elem_type = !llvm.array<3 x array<3 x array<3 x i32>>>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648, -2147483648, -2147483648>}> : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr
      "llvm.store"(%14, %15) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x array<3 x array<3 x i32>>>, linkage = #llvm.linkage<internal>, sym_name = "_QFEinarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.zero"() : () -> !llvm.array<3 x array<3 x array<3 x i32>>>
    "llvm.return"(%1) : (!llvm.array<3 x array<3 x array<3 x i32>>>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x array<3 x array<3 x i32>>>, linkage = #llvm.linkage<internal>, sym_name = "_QFEoutarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.array<3 x array<3 x array<3 x i32>>>
    "llvm.return"(%0) : (!llvm.array<3 x array<3 x array<3 x i32>>>) -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

