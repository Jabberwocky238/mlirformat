"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "a", llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "launch_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = f64}> {bindc_name = "n"} : (i64) -> !llvm.ptr
    %2 = "llvm.getelementptr"(%arg0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%arg0, %2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_type = f64}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %4 = "omp.map.info"(%arg0, %3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], name = "a", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %5 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = f64}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%4, %5, %3) <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr):
      %6 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
      %7 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %8 = "llvm.getelementptr"(%arg1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      %9 = "llvm.load"(%8) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
      %10 = "llvm.getelementptr"(%9, %7) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      %11 = "llvm.load"(%10) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64
      %12 = "llvm.fmul"(%11, %6) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64
      "llvm.store"(%12, %10) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

