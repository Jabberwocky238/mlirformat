"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<11 x f32>, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Ezii", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %5 = "llvm.mlir.zero"() : () -> !llvm.array<11 x f32> loc("<stdin>":3:10)
    "llvm.return"(%5) : (!llvm.array<11 x f32>) -> () loc("<stdin>":4:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @_QMtest_0Ezii}> : () -> !llvm.ptr loc("<stdin>":7:10)
    %1 = "omp.map.info"(%0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<11 x f32>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":8:10)
    "omp.target"(%1) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":10:10)):
      %2 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":11:12)
      %3 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":12:12)
      %4 = "llvm.getelementptr"(%arg0, %3) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":13:12)
      "llvm.store"(%2, %4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":14:7)
      "omp.terminator"() : () -> () loc("<stdin>":15:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":6:3)
}) {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
