"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "firstprivatizer", type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> ({
  ^bb0(%arg17: !llvm.ptr, %arg18: !llvm.ptr):
    %38 = "llvm.mlir.constant"() <{value = 48 : i64}> : () -> i64
    %39 = "llvm.call"(%38) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    %40 = "llvm.getelementptr"(%arg18) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    "llvm.store"(%39, %40) <{ordering = 0 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg18) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg15: !llvm.ptr, %arg16: !llvm.ptr):
    %37 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
    "llvm.intr.memcpy"(%arg16, %arg15, %37) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "omp.yield"(%arg16) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg14: !llvm.ptr):
    "llvm.call"(%arg14) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "firstprivatizer_1", type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> ({
  ^bb0(%arg12: !llvm.ptr, %arg13: !llvm.ptr):
    %34 = "llvm.mlir.constant"() <{value = 48 : i64}> : () -> i64
    %35 = "llvm.call"(%34) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    %36 = "llvm.getelementptr"(%arg13) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    "llvm.store"(%35, %36) <{ordering = 0 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg13) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg10: !llvm.ptr, %arg11: !llvm.ptr):
    %33 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
    "llvm.intr.memcpy"(%arg11, %arg10, %33) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "omp.yield"(%arg11) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg9: !llvm.ptr):
    "llvm.call"(%arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "ptr0"}, {fir.bindc_name = "ptr1"}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<internal>, sym_name = "firstprivate_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %2 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr
    %3 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "local"} : (i32) -> !llvm.ptr
    %4 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "glocal"} : (i32) -> !llvm.ptr
    %5 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i32) -> !llvm.ptr
    %6 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    "llvm.store"(%6, %3) <{ordering = 0 : i64}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, !llvm.ptr) -> ()
    "llvm.store"(%6, %4) <{ordering = 0 : i64}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, !llvm.ptr) -> ()
    "llvm.store"(%0, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %7 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %8 = "llvm.getelementptr"(%3, %1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %9 = "llvm.load"(%8) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %10 = "llvm.getelementptr"(%3, %1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 1>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %11 = "llvm.load"(%10) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %12 = "llvm.getelementptr"(%3, %1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 2>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %13 = "llvm.load"(%12) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %14 = "llvm.sub"(%11, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %15 = "omp.map.bounds"(%1, %14, %11, %13, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %16 = "llvm.getelementptr"(%3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %17 = "omp.map.info"(%3, %16, %15) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_type = i32}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %18 = "omp.map.info"(%3, %17) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %19 = "llvm.getelementptr"(%4, %1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %20 = "llvm.load"(%19) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %21 = "llvm.getelementptr"(%4, %1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 1>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %22 = "llvm.load"(%21) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %23 = "llvm.getelementptr"(%4, %1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 2>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %24 = "llvm.load"(%23) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %25 = "llvm.sub"(%22, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %26 = "omp.map.bounds"(%1, %25, %22, %24, %20) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %27 = "llvm.getelementptr"(%4) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %28 = "omp.map.info"(%4, %27, %26) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_type = i32}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %29 = "omp.map.info"(%4, %28) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%7, %18, %17, %29, %28, %3, %4) <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2, 0>, private_maps = array<i64: 1, 3>, private_syms = [@firstprivatizer, @firstprivatizer_1]}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %30 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
    %31 = "llvm.getelementptr"(%3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %32 = "llvm.load"(%31) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
    "llvm.call"(%32) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>} : () -> ()

