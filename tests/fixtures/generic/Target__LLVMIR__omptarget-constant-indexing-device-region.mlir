"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @_QFEsp}> : () -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %4 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %5 = "llvm.mlir.constant"() <{value = 9 : index}> : () -> i64
    %6 = "omp.map.bounds"(%4, %5, %2, %3, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %7 = "omp.map.info"(%1, %6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "sp", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %8 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32
      %9 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
      %10 = "llvm.getelementptr"(%arg0, %9) <{elem_type = !llvm.array<10 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.store"(%8, %10) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %11 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %12 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
      %13 = "llvm.getelementptr"(%arg0, %12) <{elem_type = !llvm.array<10 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.store"(%11, %13) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {bindc_name = "main"} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<10 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEsp", unnamed_addr = 0 : i64, value = dense<0> : tensor<10xi32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "_QQEnvironmentDefaults", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.ptr
    "llvm.return"(%0) : (!llvm.ptr) -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> ()

