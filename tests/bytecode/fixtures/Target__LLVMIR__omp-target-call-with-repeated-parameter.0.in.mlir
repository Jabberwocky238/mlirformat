"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "caller_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "x"} : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":5:10)
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    %4 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":7:10)
    "omp.target"(%3, %4) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":9:10), %arg3: !llvm.ptr loc("<stdin>":9:28)):
      %5 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":10:12)
      %6 = "llvm.sitofp"(%5) : (i32) -> f32 loc("<stdin>":11:12)
      "llvm.store"(%6, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":12:7)
      "llvm.call"(%arg2, %arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @callee_, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":13:7)
      "omp.terminator"() : () -> () loc("<stdin>":14:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":8:5)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "callee_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":19:8), %arg1: !llvm.ptr loc("<stdin>":19:26)):
    "llvm.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":1:1)
