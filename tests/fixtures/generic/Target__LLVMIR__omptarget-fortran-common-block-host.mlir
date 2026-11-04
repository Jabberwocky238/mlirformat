"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_map_common_block_using_common_block_members", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %4 = "llvm.mlir.addressof"() <{global_name = @var_common_}> : () -> !llvm.ptr
    %5 = "llvm.getelementptr"(%4, %3) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %6 = "llvm.getelementptr"(%4, %2) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %7 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %8 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var2", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%7, %8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_map_common_block_using_common_block_symbol", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @var_common_}> : () -> !llvm.ptr
    %1 = "omp.map.info"(%0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var_common", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = !llvm.array<8 x i8>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 4 : i64, global_type = !llvm.array<8 x i8>, linkage = #llvm.linkage<common>, sym_name = "var_common_", unnamed_addr = 0 : i64, value = dense<0> : vector<8xi8>, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

