"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "simple_var.privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_map_single_private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %72 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %73 = "llvm.alloca"(%72) <{elem_type = i32}> {bindc_name = "simple_var"} : (i64) -> !llvm.ptr
    %74 = "llvm.alloca"(%72) <{elem_type = i32}> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %75 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "llvm.store"(%75, %74) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %76 = "omp.map.info"(%74) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%76, %73) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0>, private_maps = array<i64: -1>, private_syms = [@simple_var.privatizer]}> ({
    ^bb0(%arg21: !llvm.ptr, %arg22: !llvm.ptr):
      %77 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %78 = "llvm.load"(%arg21) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %79 = "llvm.add"(%78, %77) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%79, %arg22) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPtarget_map_single_private"} : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "n.privatizer", type = f32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_map_2_privates", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %59 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %60 = "llvm.alloca"(%59) <{elem_type = i32}> {bindc_name = "simple_var"} : (i64) -> !llvm.ptr
    %61 = "llvm.alloca"(%59) <{elem_type = f32}> {bindc_name = "n"} : (i64) -> !llvm.ptr
    %62 = "llvm.alloca"(%59) <{elem_type = i32}> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %63 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "llvm.store"(%63, %62) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %64 = "omp.map.info"(%62) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%64, %60, %61) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0>, private_maps = array<i64: -1, -1>, private_syms = [@simple_var.privatizer, @n.privatizer]}> ({
    ^bb0(%arg18: !llvm.ptr, %arg19: !llvm.ptr, %arg20: !llvm.ptr):
      %65 = "llvm.mlir.constant"() <{value = 1.100000e+01 : f32}> : () -> f32
      %66 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %67 = "llvm.load"(%arg18) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %68 = "llvm.add"(%67, %66) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%68, %arg19) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %69 = "llvm.load"(%arg19) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %70 = "llvm.sitofp"(%69) : (i32) -> f32
      %71 = "llvm.fadd"(%70, %65) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
      "llvm.store"(%71, %arg20) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPtarget_map_2_privates"} : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "multi_block.privatizer", type = f32}> ({
  ^bb0(%arg16: !llvm.ptr, %arg17: !llvm.ptr):
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "omp.yield"(%arg17) : (!llvm.ptr) -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_op_private_multi_block", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: !llvm.ptr):
    "omp.target"(%arg14) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_maps = array<i64: -1>, private_syms = [@multi_block.privatizer]}> ({
    ^bb0(%arg15: !llvm.ptr):
      %58 = "llvm.load"(%arg15) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtarget_boxcharEchar_var_private_boxchar_c8xU", type = !llvm.struct<(ptr, i64)>}> ({
  ^bb0(%arg12: !llvm.struct<(ptr, i64)>, %arg13: !llvm.struct<(ptr, i64)>):
    %51 = "llvm.extractvalue"(%arg12) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %52 = "llvm.extractvalue"(%arg12) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %53 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %54 = "llvm.alloca"(%52) <{elem_type = i8}> {bindc_name = "char_var", pinned} : (i64) -> !llvm.ptr
    %55 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %56 = "llvm.insertvalue"(%55, %54) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %57 = "llvm.insertvalue"(%56, %52) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    "omp.yield"(%57) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "l"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_boxchar_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr):
    %16 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %17 = "llvm.alloca"(%16) <{elem_type = i32}> {bindc_name = "mapped_var"} : (i64) -> !llvm.ptr
    %18 = "llvm.alloca"(%16) <{elem_type = !llvm.struct<(ptr, i64)>}> : (i64) -> !llvm.ptr
    %19 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %20 = "llvm.load"(%arg8) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %21 = "llvm.icmp"(%20, %19) <{predicate = 4 : i64}> : (i64, i64) -> i1
    %22 = "llvm.select"(%21, %20, %19) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %23 = "llvm.alloca"(%22) <{elem_type = i8}> {bindc_name = "char_var"} : (i64) -> !llvm.ptr
    %24 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %25 = "llvm.insertvalue"(%24, %23) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %26 = "llvm.insertvalue"(%25, %22) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    %27 = "omp.map.info"(%17) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "mapped_var", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "llvm.store"(%26, %18) <{ordering = 0 : i64}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> ()
    %28 = "omp.map.info"(%18) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = !llvm.struct<(ptr, i64)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%27, %28, %26) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0>, private_maps = array<i64: 1>, private_syms = [@_QFtarget_boxcharEchar_var_private_boxchar_c8xU]}> ({
    ^bb0(%arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: !llvm.struct<(ptr, i64)>):
      %29 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
      %30 = "llvm.mlir.constant"() <{value = 32 : i8}> : () -> i8
      %31 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %32 = "llvm.mlir.constant"() <{value = false}> : () -> i1
      %33 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
      %34 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
      %35 = "llvm.extractvalue"(%arg11) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
      %36 = "llvm.extractvalue"(%arg11) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
      "llvm.store"(%34, %arg9) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %37 = "llvm.mlir.addressof"() <{global_name = @_QQclX68656C6C6F}> : () -> !llvm.ptr
      %38 = "llvm.icmp"(%36, %33) <{predicate = 2 : i64}> : (i64, i64) -> i1
      %39 = "llvm.select"(%38, %36, %33) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
      "llvm.call"(%35, %37, %39, %32) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @llvm.memmove.p0.p0.i64, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 4, 0>}> : (!llvm.ptr, !llvm.ptr, i64, i1) -> ()
      %40 = "llvm.sub"(%36, %31) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      %41 = "llvm.mlir.undef"() : () -> !llvm.array<1 x i8>
      %42 = "llvm.insertvalue"(%41, %30) <{position = array<i64: 0>}> : (!llvm.array<1 x i8>, i8) -> !llvm.array<1 x i8>
      %43 = "llvm.sub"(%40, %39) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      %44 = "llvm.add"(%43, %31) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "llvm.br"(%39, %44)[^bb1] : (i64, i64) -> ()
    ^bb1(%45: i64, %46: i64):  // 2 preds: ^bb0, ^bb2
      %47 = "llvm.icmp"(%46, %29) <{predicate = 4 : i64}> : (i64, i64) -> i1
      "llvm.cond_br"(%47)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      %48 = "llvm.getelementptr"(%35, %45) <{elem_type = !llvm.array<1 x i8>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
      "llvm.store"(%42, %48) <{ordering = 0 : i64}> : (!llvm.array<1 x i8>, !llvm.ptr) -> ()
      %49 = "llvm.add"(%45, %31) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      %50 = "llvm.sub"(%46, %31) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "llvm.br"(%49, %50)[^bb1] : (i64, i64) -> ()
    ^bb3:  // pred: ^bb1
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.struct<(ptr, i64)>) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPtarget_boxchar"} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@_QQclX68656C6C6F, constant, global_type = !llvm.array<5 x i8>, linkage = #llvm.linkage<linkonce>, sym_name = "_QQclX68656C6C6F", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %15 = "llvm.mlir.constant"() <{value = "hello"}> : () -> !llvm.array<5 x i8>
    "llvm.return"(%15) : (!llvm.array<5 x i8>) -> ()
  }) : () -> ()
  "llvm.comdat"() <{sym_name = "__llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "_QQclX68656C6C6F"}> : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "llvm.memmove.p0.p0.i64", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "sf.firstprivate", type = f32}> ({
  }, {
  ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
    %14 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.store"(%14, %arg7) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg7) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "sv.firstprivate", type = i32}> ({
  }, {
  ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr):
    %13 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%13, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg5) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_firstprivate_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sv"} : (i64) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "sf"} : (i64) -> !llvm.ptr
    %3 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%3, %4, %1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0>, private_maps = array<i64: 0, 1>, private_syms = [@sv.firstprivate, @sf.firstprivate]}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr):
      %5 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
      %6 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %7 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %8 = "llvm.add"(%7, %6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%8, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %9 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %10 = "llvm.fpext"(%9) : (f32) -> f64
      %11 = "llvm.fadd"(%10, %5) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64
      %12 = "llvm.fptrunc"(%11) : (f64) -> f32
      "llvm.store"(%12, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPtarget_firstprivate"} : () -> ()
}) : () -> ()

