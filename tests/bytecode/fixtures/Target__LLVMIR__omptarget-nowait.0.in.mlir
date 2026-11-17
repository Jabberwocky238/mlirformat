"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "a", llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "launch_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":4:10)
    %1 = "llvm.alloca"(%0) <{elem_type = f64}> {bindc_name = "n"} : (i64) -> !llvm.ptr loc("<stdin>":5:10)
    %2 = "llvm.getelementptr"(%arg0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    %3 = "omp.map.info"(%arg0, %2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = f64, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":7:10)
    %4 = "omp.map.info"(%arg0, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], name = "a", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":8:10)
    %5 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":9:10)
    "omp.target"(%4, %5, %3) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":11:10), %arg2: !llvm.ptr loc("<stdin>":11:28), %arg3: !llvm.ptr loc("<stdin>":11:46)):
      %6 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f64}> : () -> f64 loc("<stdin>":12:12)
      %7 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":13:12)
      %8 = "llvm.getelementptr"(%arg1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":14:12)
      %9 = "llvm.load"(%8) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":15:12)
      %10 = "llvm.getelementptr"(%9, %7) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":16:13)
      %11 = "llvm.load"(%10) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64 loc("<stdin>":17:13)
      %12 = "llvm.fmul"(%11, %6) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":18:13)
      "llvm.store"(%12, %10) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> () loc("<stdin>":19:7)
      "omp.terminator"() : () -> () loc("<stdin>":20:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":10:5)
    "llvm.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":2:3)
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":1:1)
