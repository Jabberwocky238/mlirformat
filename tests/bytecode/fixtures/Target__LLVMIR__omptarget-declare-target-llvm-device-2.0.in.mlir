"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Evar_to_usm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:11)
    "llvm.return"(%11) : (i32) -> () loc("<stdin>":4:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Evar_enter_usm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %10 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":7:11)
    "llvm.return"(%10) : (i32) -> () loc("<stdin>":8:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> () loc("<stdin>":6:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Evar_link_usm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %9 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":11:10)
    "llvm.return"(%9) : (i32) -> () loc("<stdin>":12:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_usm_declare_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @_QMtest_0Evar_to_usm}> : () -> !llvm.ptr loc("<stdin>":15:10)
    %1 = "llvm.mlir.addressof"() <{global_name = @_QMtest_0Evar_enter_usm}> : () -> !llvm.ptr loc("<stdin>":16:10)
    %2 = "llvm.mlir.addressof"() <{global_name = @_QMtest_0Evar_link_usm}> : () -> !llvm.ptr loc("<stdin>":17:10)
    %3 = "omp.map.info"(%0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":18:10)
    %4 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":19:10)
    %5 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":20:10)
    "omp.target"(%3, %4, %5) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":22:10), %arg1: !llvm.ptr loc("<stdin>":22:28), %arg2: !llvm.ptr loc("<stdin>":22:46)):
      %6 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":23:12)
      %7 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":24:12)
      %8 = "llvm.mlir.constant"() <{value = 30 : i32}> : () -> i32 loc("<stdin>":25:12)
      "llvm.store"(%6, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":26:7)
      "llvm.store"(%7, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":27:7)
      "llvm.store"(%8, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":28:7)
      "omp.terminator"() : () -> () loc("<stdin>":29:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":14:3)
}) {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true, omp.requires = #omp<clause_requires unified_shared_memory>} : () -> () loc("<stdin>":1:1)
