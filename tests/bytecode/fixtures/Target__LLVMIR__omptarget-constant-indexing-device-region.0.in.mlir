"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @_QFEsp}> : () -> !llvm.ptr loc("<stdin>":3:10)
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "sp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":4:10)
    "omp.target"(%2) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":6:10)):
      %3 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":7:12)
      %4 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":8:12)
      %5 = "llvm.getelementptr"(%arg0, %4) <{elem_type = !llvm.array<10 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":9:12)
      "llvm.store"(%3, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":10:7)
      %6 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":11:12)
      %7 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64 loc("<stdin>":12:12)
      %8 = "llvm.getelementptr"(%arg0, %7) <{elem_type = !llvm.array<10 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":13:12)
      "llvm.store"(%6, %8) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":14:7)
      "omp.terminator"() : () -> () loc("<stdin>":15:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":17:5)
  }) {bindc_name = "main"} : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<10 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEsp", unnamed_addr = 0 : i64, value = dense<0> : tensor<10xi32>, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":19:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "_QQEnvironmentDefaults", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.ptr loc("<stdin>":22:10)
    "llvm.return"(%0) : (!llvm.ptr) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":21:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
