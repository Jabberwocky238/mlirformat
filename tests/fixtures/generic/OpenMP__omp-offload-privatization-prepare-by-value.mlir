"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "private_eye", type = i32}> ({
  }, {
  ^bb0(%arg11: !llvm.ptr, %arg12: !llvm.ptr):
    %42 = "llvm.load"(%arg11) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%42, %arg12) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg12) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "boxchar_firstprivate", type = !llvm.struct<(ptr, i64)>}> ({
  ^bb0(%arg9: !llvm.struct<(ptr, i64)>, %arg10: !llvm.struct<(ptr, i64)>):
    %36 = "llvm.extractvalue"(%arg9) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %37 = "llvm.extractvalue"(%arg9) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %38 = "llvm.call"(%37) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> {bindc_name = "", uniq_name = ""} : (i64) -> !llvm.ptr
    %39 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %40 = "llvm.insertvalue"(%39, %38) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %41 = "llvm.insertvalue"(%40, %37) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    "omp.yield"(%41) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  ^bb0(%arg7: !llvm.struct<(ptr, i64)>, %arg8: !llvm.struct<(ptr, i64)>):
    %30 = "llvm.extractvalue"(%arg7) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %31 = "llvm.extractvalue"(%arg7) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %32 = "llvm.extractvalue"(%arg8) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %33 = "llvm.extractvalue"(%arg8) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %34 = "llvm.icmp"(%33, %31) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %35 = "llvm.select"(%34, %33, %31) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "llvm.intr.memmove"(%32, %30, %35) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    "omp.yield"(%arg8) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  ^bb0(%arg6: !llvm.struct<(ptr, i64)>):
    %28 = "llvm.extractvalue"(%arg6) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %29 = "llvm.extractvalue"(%arg6) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    "llvm.call"(%28) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "l"}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_boxchar_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(ptr, i64)>}> : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %5 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %10 = "llvm.icmp"(%9, %6) <{predicate = 4 : i64}> : (i32, i32) -> i1
    %11 = "llvm.select"(%10, %9, %6) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i32, i32) -> i32
    %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %13 = "llvm.sext"(%11) : (i32) -> i64
    %14 = "llvm.alloca"(%13) <{elem_type = i8}> {bindc_name = "char_var"} : (i64) -> !llvm.ptr
    %15 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %16 = "llvm.sext"(%11) : (i32) -> i64
    %17 = "llvm.insertvalue"(%15, %14) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %18 = "llvm.insertvalue"(%17, %16) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    "llvm.store"(%18, %3) <{ordering = 0 : i64}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> ()
    %19 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %20 = "llvm.extractvalue"(%19) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %21 = "llvm.extractvalue"(%19) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %22 = "llvm.sub"(%21, %4) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %23 = "omp.map.bounds"(%5, %22, %21, %4, %5) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %24 = "llvm.getelementptr"(%3) <{elem_type = !llvm.struct<(ptr, i64)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %25 = "omp.map.info"(%3, %24, %23) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|implicit>, operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_ptr_ptr_type = i8, var_ptr_type = !llvm.struct<(ptr, i64)>}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %26 = "omp.map.info"(%3, %25) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %27 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%26, %27, %25, %18, %1) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 2, 0>, private_maps = array<i64: 0, 1>, private_syms = [@boxchar_firstprivate, @private_eye]}> ({
    ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.struct<(ptr, i64)>, %arg5: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.struct<(ptr, i64)>, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPtarget_boxchar"} : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>} : () -> ()

