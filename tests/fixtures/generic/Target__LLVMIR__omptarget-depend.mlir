"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 39 : index}> : () -> i64
    %7 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 40 : index}> : () -> i64
    %10 = "llvm.mlir.addressof"() <{global_name = @_QFEa}> : () -> !llvm.ptr
    %11 = "llvm.mlir.addressof"() <{global_name = @_QFEb}> : () -> !llvm.ptr
    %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %13 = "llvm.alloca"(%12) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %14 = "llvm.mlir.addressof"() <{global_name = @_QFEn}> : () -> !llvm.ptr
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %53 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %54 = "llvm.alloca"(%53) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
      %55 = "llvm.load"(%14) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %56 = "llvm.sext"(%55) : (i32) -> i64
      %57 = "llvm.trunc"(%8) <{overflowFlags = 0 : i32}> : (i64) -> i32
      "llvm.br"(%57, %56)[^bb1] : (i32, i64) -> ()
    ^bb1(%58: i32, %59: i64):  // 2 preds: ^bb0, ^bb2
      %60 = "llvm.icmp"(%59, %7) <{predicate = 4 : i64}> : (i64, i64) -> i1
      "llvm.cond_br"(%60)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "llvm.store"(%58, %54) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %61 = "llvm.load"(%54) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %62 = "llvm.sext"(%61) : (i32) -> i64
      %63 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %64 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
      %65 = "llvm.sub"(%62, %63) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %66 = "llvm.mul"(%65, %63) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %67 = "llvm.mul"(%66, %63) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %68 = "llvm.add"(%67, %64) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %69 = "llvm.mul"(%63, %9) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %70 = "llvm.getelementptr"(%10, %68) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.store"(%61, %70) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %71 = "llvm.load"(%54) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %72 = "llvm.add"(%71, %57) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      %73 = "llvm.sub"(%59, %8) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "llvm.br"(%72, %73)[^bb1] : (i32, i64) -> ()
    ^bb3:  // pred: ^bb1
      "llvm.store"(%58, %54) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    %15 = "omp.map.bounds"(%7, %6, %9, %8, %8) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %16 = "omp.map.info"(%10, %15) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<40 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %17 = "omp.map.info"(%11, %15) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "b", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<40 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %18 = "omp.map.info"(%13) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %19 = "omp.map.info"(%14) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "n", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%10, %16, %17, %18, %19) <{depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0>}> ({
    ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr, %arg6: !llvm.ptr):
      %20 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
      %21 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %22 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %23 = "llvm.mlir.constant"() <{value = 40 : index}> : () -> i64
      %24 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %25 = "llvm.sext"(%24) : (i32) -> i64
      %26 = "llvm.trunc"(%22) <{overflowFlags = 0 : i32}> : (i64) -> i32
      "llvm.br"(%26, %25)[^bb1] : (i32, i64) -> ()
    ^bb1(%27: i32, %28: i64):  // 2 preds: ^bb0, ^bb2
      %29 = "llvm.icmp"(%28, %20) <{predicate = 4 : i64}> : (i64, i64) -> i1
      "llvm.cond_br"(%29)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "llvm.store"(%27, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %30 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %31 = "llvm.sext"(%30) : (i32) -> i64
      %32 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %33 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
      %34 = "llvm.sub"(%31, %32) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %35 = "llvm.mul"(%34, %32) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %36 = "llvm.mul"(%35, %32) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %37 = "llvm.add"(%36, %33) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %38 = "llvm.mul"(%32, %23) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %39 = "llvm.getelementptr"(%arg3, %37) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      %40 = "llvm.load"(%39) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %41 = "llvm.add"(%40, %21) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      %42 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %43 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
      %44 = "llvm.sub"(%31, %42) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %45 = "llvm.mul"(%44, %42) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %46 = "llvm.mul"(%45, %42) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %47 = "llvm.add"(%46, %43) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %48 = "llvm.mul"(%42, %23) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
      %49 = "llvm.getelementptr"(%arg4, %47) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.store"(%41, %49) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %50 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %51 = "llvm.add"(%50, %26) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      %52 = "llvm.sub"(%28, %22) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "llvm.br"(%51, %52)[^bb1] : (i32, i64) -> ()
    ^bb3:  // pred: ^bb1
      "llvm.store"(%27, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.bindc_name = "main"} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<40 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %5 = "llvm.mlir.zero"() : () -> !llvm.array<40 x i32>
    "llvm.return"(%5) : (!llvm.array<40 x i32>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<40 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEb", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %4 = "llvm.mlir.zero"() : () -> !llvm.array<40 x i32>
    "llvm.return"(%4) : (!llvm.array<40 x i32>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<40 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.zero"() : () -> !llvm.array<40 x i32>
    "llvm.return"(%3) : (!llvm.array<40 x i32>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFEn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 40 : i32}> : () -> i32
    "llvm.return"(%2) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_FortranAProgramStart", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_FortranAProgramEndStatement", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "llvm.mlir.zero"() : () -> !llvm.ptr
    "llvm.call"(%arg0, %arg1, %arg2, %1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_FortranAProgramStart, fastmathFlags = #llvm.fastmath<contract>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 4, 0>}> : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QQmain, fastmathFlags = #llvm.fastmath<contract>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_FortranAProgramEndStatement, fastmathFlags = #llvm.fastmath<contract>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

