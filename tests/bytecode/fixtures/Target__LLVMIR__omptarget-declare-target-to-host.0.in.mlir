"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<11 x f32>, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Ezii", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %9 = "llvm.mlir.zero"() : () -> !llvm.array<11 x f32> loc("<stdin>":3:10)
    "llvm.return"(%9) : (!llvm.array<11 x f32>) -> () loc("<stdin>":4:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":8:10)
    %2 = "llvm.mlir.constant"() <{value = 11 : index}> : () -> i64 loc("<stdin>":9:10)
    %3 = "llvm.mlir.addressof"() <{global_name = @_QMtest_0Ezii}> : () -> !llvm.ptr loc("<stdin>":10:10)
    %4 = "omp.map.bounds"(%1, %2, %2, %0, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty loc("<stdin>":11:10)
    %5 = "omp.map.info"(%3, %4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<11 x f32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr loc("<stdin>":12:10)
    "omp.target"(%5) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":14:10)):
      %6 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":15:12)
      %7 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":16:12)
      %8 = "llvm.getelementptr"(%arg0, %7) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":17:12)
      "llvm.store"(%6, %8) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":18:7)
      "omp.terminator"() : () -> () loc("<stdin>":19:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":6:3)
}) {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
