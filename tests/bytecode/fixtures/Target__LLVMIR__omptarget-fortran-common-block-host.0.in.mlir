"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_map_common_block_using_common_block_members", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64 loc("<stdin>":3:10)
    %3 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":4:10)
    %4 = "llvm.mlir.addressof"() <{global_name = @var_common_}> : () -> !llvm.ptr loc("<stdin>":5:10)
    %5 = "llvm.getelementptr"(%4, %3) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":6:10)
    %6 = "llvm.getelementptr"(%4, %2) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":7:10)
    %7 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":8:10)
    %8 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var2", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":9:10)
    "omp.target"(%7, %8) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":11:10), %arg2: !llvm.ptr loc("<stdin>":11:28)):
      "omp.terminator"() : () -> () loc("<stdin>":12:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":10:5)
    "llvm.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_map_common_block_using_common_block_symbol", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @var_common_}> : () -> !llvm.ptr loc("<stdin>":17:10)
    %1 = "omp.map.info"(%0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var_common", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<8 x i8>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":18:10)
    "omp.target"(%1) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":20:10)):
      "omp.terminator"() : () -> () loc("<stdin>":21:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":19:5)
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":16:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 4 : i64, global_type = !llvm.array<8 x i8>, linkage = #llvm.linkage<common>, sym_name = "var_common_", unnamed_addr = 0 : i64, value = dense<0> : vector<8xi8>, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":25:3)
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
