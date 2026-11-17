"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_3d_target_array_section", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.addressof"() <{global_name = @_QFEinarray}> : () -> !llvm.ptr loc("<stdin>":3:10)
    %3 = "llvm.mlir.addressof"() <{global_name = @_QFEoutarray}> : () -> !llvm.ptr loc("<stdin>":4:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":5:10)
    %5 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":6:10)
    %6 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64 loc("<stdin>":7:10)
    %7 = "omp.map.bounds"(%5, %6, %4, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty loc("<stdin>":8:10)
    %8 = "omp.map.bounds"(%4, %4, %4, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty loc("<stdin>":9:10)
    %9 = "omp.map.info"(%2, %7, %7, %8) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "inarray(1:3,1:3,2:2)", operandSegmentSizes = array<i32: 1, 0, 0, 3>, partial_map = false, var_ptr_type = !llvm.array<3 x array<3 x array<3 x i32>>>}> : (!llvm.ptr, !omp.map_bounds_ty, !omp.map_bounds_ty, !omp.map_bounds_ty) -> !llvm.ptr loc("<stdin>":10:10)
    %10 = "omp.map.info"(%3, %7, %7, %7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "outarray(1:3,1:3,1:3)", operandSegmentSizes = array<i32: 1, 0, 0, 3>, partial_map = false, var_ptr_type = !llvm.array<3 x array<3 x array<3 x i32>>>}> : (!llvm.ptr, !omp.map_bounds_ty, !omp.map_bounds_ty, !omp.map_bounds_ty) -> !llvm.ptr loc("<stdin>":11:11)
    "omp.target"(%9, %10) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":13:10), %arg1: !llvm.ptr loc("<stdin>":13:28)):
      %11 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":14:13)
      %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":15:13)
      %13 = "llvm.getelementptr"(%arg0, %12, %11, %11) <{elem_type = !llvm.array<3 x array<3 x array<3 x i32>>>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648, -2147483648, -2147483648>}> : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr loc("<stdin>":16:13)
      %14 = "llvm.load"(%13) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":17:13)
      %15 = "llvm.getelementptr"(%arg1, %12, %11, %11) <{elem_type = !llvm.array<3 x array<3 x array<3 x i32>>>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648, -2147483648, -2147483648>}> : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr loc("<stdin>":18:13)
      "llvm.store"(%14, %15) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":19:7)
      "omp.terminator"() : () -> () loc("<stdin>":20:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x array<3 x array<3 x i32>>>, linkage = #llvm.linkage<internal>, sym_name = "_QFEinarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.zero"() : () -> !llvm.array<3 x array<3 x array<3 x i32>>> loc("<stdin>":25:10)
    "llvm.return"(%1) : (!llvm.array<3 x array<3 x array<3 x i32>>>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":24:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x array<3 x array<3 x i32>>>, linkage = #llvm.linkage<internal>, sym_name = "_QFEoutarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.array<3 x array<3 x array<3 x i32>>> loc("<stdin>":29:10)
    "llvm.return"(%0) : (!llvm.array<3 x array<3 x array<3 x i32>>>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":28:3)
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
