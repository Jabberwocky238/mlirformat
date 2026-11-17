"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Esp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    "llvm.return"(%7) : (i32) -> () loc("<stdin>":4:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr<5> loc("<stdin>":8:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":9:10)
    %3 = "llvm.mlir.addressof"() <{global_name = @_QMtest_0Esp}> : () -> !llvm.ptr loc("<stdin>":10:10)
    %4 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":11:10)
    %5 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":12:10)
    "omp.target"(%4, %5) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":14:10), %arg1: !llvm.ptr loc("<stdin>":14:28)):
      %6 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":15:12)
      "llvm.store"(%6, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":16:7)
      "omp.terminator"() : () -> () loc("<stdin>":17:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":6:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
