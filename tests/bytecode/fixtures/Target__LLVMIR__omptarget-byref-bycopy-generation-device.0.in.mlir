"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.addressof"() <{global_name = @_QFEi}> : () -> !llvm.ptr loc("<stdin>":3:10)
    %3 = "llvm.mlir.addressof"() <{global_name = @_QFEsp}> : () -> !llvm.ptr loc("<stdin>":4:10)
    %4 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "sp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":5:10)
    %5 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    "omp.target"(%4, %5) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":8:10), %arg1: !llvm.ptr loc("<stdin>":8:28)):
      %6 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:12)
      "llvm.store"(%6, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":10:7)
      "omp.terminator"() : () -> () loc("<stdin>":11:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":13:5)
  }) {fir.bindc_name = "main"} : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFEi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":16:10)
    "llvm.return"(%1) : (i32) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":15:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFEsp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":20:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":19:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
