"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "i32_privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_nested_target_in_parallel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %24 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
      %25 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %26 = "omp.map.bounds"(%25, %24, %25, %25) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
      %27 = "omp.map.info"(%arg13, %26) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
      "omp.target"(%27) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg14: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_nested_target_in_wsloop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: !llvm.ptr):
    %15 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %16 = "llvm.alloca"(%15) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %17 = "llvm.addrspacecast"(%16) : (!llvm.ptr<5>) -> !llvm.ptr
    %18 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %19 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.wsloop"(%17) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@i32_privatizer]}> ({
    ^bb0(%arg10: !llvm.ptr):
      "omp.loop_nest"(%19, %18, %19) <{loop_inclusive}> ({
      ^bb0(%arg11: i32):
        "llvm.store"(%arg11, %arg10) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %20 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
        %21 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
        %22 = "omp.map.bounds"(%21, %20, %21, %21) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
        %23 = "omp.map.info"(%arg9, %22) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
        "omp.target"(%23) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
        ^bb0(%arg12: !llvm.ptr):
          "omp.terminator"() : () -> ()
        }) : (!llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_nested_target_in_parallel_with_private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr):
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %10 = "llvm.addrspacecast"(%9) : (!llvm.ptr<5>) -> !llvm.ptr
    "omp.parallel"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@i32_privatizer]}> ({
    ^bb0(%arg7: !llvm.ptr):
      %11 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %12 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
      %13 = "omp.map.bounds"(%11, %12, %11, %11) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
      %14 = "omp.map.info"(%arg6, %13) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
      "omp.target"(%14) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg8: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_nested_target_in_task_with_private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr):
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %3 = "llvm.addrspacecast"(%2) : (!llvm.ptr<5>) -> !llvm.ptr
    "omp.task"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@i32_privatizer]}> ({
    ^bb0(%arg4: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %5 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
      %6 = "omp.map.bounds"(%4, %5, %4, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
      %7 = "omp.map.info"(%arg3, %6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
      "omp.target"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg5: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_target_and_atomic_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "omp.target"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg2: i32):
      %0 = "llvm.add"(%arg2, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%0) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

