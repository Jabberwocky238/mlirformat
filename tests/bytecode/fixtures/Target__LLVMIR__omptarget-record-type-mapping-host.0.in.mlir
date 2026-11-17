"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64 loc("<stdin>":3:10)
    %1 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64 loc("<stdin>":4:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":5:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":6:10)
    %4 = "llvm.alloca"(%3) <{elem_type = !llvm.struct<(f32, array<10 x i32>, i32)>}> : (i64) -> !llvm.ptr loc("<stdin>":7:10)
    %5 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":8:10)
    %6 = "llvm.getelementptr"(%4) <{elem_type = !llvm.struct<(f32, array<10 x i32>, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 2>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":9:10)
    %7 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":10:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":11:10)
    %9 = "llvm.getelementptr"(%4) <{elem_type = !llvm.struct<(f32, array<10 x i32>, i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 1>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":12:10)
    %10 = "omp.map.bounds"(%2, %1, %0, %2, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty loc("<stdin>":13:11)
    %11 = "omp.map.info"(%9, %10) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr loc("<stdin>":14:11)
    %12 = "omp.map.info"(%4, %7, %11) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[2], [1]], operandSegmentSizes = array<i32: 1, 0, 2, 0>, partial_map = true, var_ptr_type = !llvm.struct<(f32, array<10 x i32>, i32)>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":15:11)
    "omp.target"(%7, %11, %12) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":17:10), %arg1: !llvm.ptr loc("<stdin>":17:28), %arg2: !llvm.ptr loc("<stdin>":17:46)):
      "omp.terminator"() : () -> () loc("<stdin>":18:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":16:5)
    "llvm.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":2:3)
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
