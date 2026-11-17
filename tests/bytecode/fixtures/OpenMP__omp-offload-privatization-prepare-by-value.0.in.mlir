"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "private_eye", type = i32}> ({
  }, {
  ^bb0(%arg11: !llvm.ptr loc("<stdin>":8:8), %arg12: !llvm.ptr loc("<stdin>":8:27)):
    %42 = "llvm.load"(%arg11) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:11)
    "llvm.store"(%42, %arg12) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":10:5)
    "omp.yield"(%arg12) : (!llvm.ptr) -> () loc("<stdin>":11:5)
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "boxchar_firstprivate", type = !llvm.struct<(ptr, i64)>}> ({
  ^bb0(%arg9: !llvm.struct<(ptr, i64)> loc("<stdin>":15:8), %arg10: !llvm.struct<(ptr, i64)> loc("<stdin>":15:41)):
    %36 = "llvm.extractvalue"(%arg9) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":16:11)
    %37 = "llvm.extractvalue"(%arg9) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":17:11)
    %38 = "llvm.call"(%37) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> {bindc_name = "", uniq_name = ""} : (i64) -> !llvm.ptr loc("<stdin>":18:11)
    %39 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)> loc("<stdin>":19:11)
    %40 = "llvm.insertvalue"(%39, %38) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)> loc("<stdin>":20:11)
    %41 = "llvm.insertvalue"(%40, %37) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)> loc("<stdin>":21:11)
    "omp.yield"(%41) : (!llvm.struct<(ptr, i64)>) -> () loc("<stdin>":22:5)
  }, {
  ^bb0(%arg7: !llvm.struct<(ptr, i64)> loc("<stdin>":24:8), %arg8: !llvm.struct<(ptr, i64)> loc("<stdin>":24:41)):
    %30 = "llvm.extractvalue"(%arg7) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":25:11)
    %31 = "llvm.extractvalue"(%arg7) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":26:11)
    %32 = "llvm.extractvalue"(%arg8) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":27:11)
    %33 = "llvm.extractvalue"(%arg8) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":28:11)
    %34 = "llvm.icmp"(%33, %31) <{predicate = 2 : i64}> : (i64, i64) -> i1 loc("<stdin>":29:11)
    %35 = "llvm.select"(%34, %33, %31) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64 loc("<stdin>":30:11)
    "llvm.intr.memmove"(%32, %30, %35) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> () loc("<stdin>":31:5)
    "omp.yield"(%arg8) : (!llvm.struct<(ptr, i64)>) -> () loc("<stdin>":32:5)
  }, {
  ^bb0(%arg6: !llvm.struct<(ptr, i64)> loc("<stdin>":34:8)):
    %28 = "llvm.extractvalue"(%arg6) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":35:11)
    %29 = "llvm.extractvalue"(%arg6) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":36:11)
    "llvm.call"(%28) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":37:5)
    "omp.yield"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "l"}], frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_boxchar_", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":41:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":42:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":43:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":44:10)
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(ptr, i64)>}> : (i64) -> !llvm.ptr loc("<stdin>":45:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":46:10)
    %5 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":47:10)
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":48:10)
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":49:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":50:10)
    %9 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":51:10)
    %10 = "llvm.icmp"(%9, %6) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":52:11)
    %11 = "llvm.select"(%10, %9, %6) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i32, i32) -> i32 loc("<stdin>":53:11)
    %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":54:11)
    %13 = "llvm.sext"(%11) : (i32) -> i64 loc("<stdin>":55:11)
    %14 = "llvm.alloca"(%13) <{elem_type = i8}> {bindc_name = "char_var"} : (i64) -> !llvm.ptr loc("<stdin>":56:11)
    %15 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)> loc("<stdin>":57:11)
    %16 = "llvm.sext"(%11) : (i32) -> i64 loc("<stdin>":58:11)
    %17 = "llvm.insertvalue"(%15, %14) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)> loc("<stdin>":59:11)
    %18 = "llvm.insertvalue"(%17, %16) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)> loc("<stdin>":60:11)
    "llvm.store"(%18, %3) <{ordering = 0 : i64}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> () loc("<stdin>":61:5)
    %19 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.struct<(ptr, i64)> loc("<stdin>":62:11)
    %20 = "llvm.extractvalue"(%19) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":63:11)
    %21 = "llvm.extractvalue"(%19) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":64:11)
    %22 = "llvm.sub"(%21, %4) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":65:11)
    %23 = "omp.map.bounds"(%5, %22, %21, %4, %5) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty loc("<stdin>":66:11)
    %24 = "llvm.getelementptr"(%3) <{elem_type = !llvm.struct<(ptr, i64)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":67:11)
    %25 = "omp.map.info"(%3, %24, %23) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|implicit>, operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_ptr_ptr_type = i8, var_ptr_type = !llvm.struct<(ptr, i64)>}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr loc("<stdin>":68:11)
    %26 = "omp.map.info"(%3, %25) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":69:11)
    %27 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":70:11)
    "omp.target"(%26, %27, %25, %18, %1) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 2, 0>, private_maps = array<i64: 0, 1>, private_syms = [@boxchar_firstprivate, @private_eye]}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":72:10), %arg2: !llvm.ptr loc("<stdin>":72:28), %arg3: !llvm.ptr loc("<stdin>":72:46), %arg4: !llvm.struct<(ptr, i64)> loc("<stdin>":72:64), %arg5: !llvm.ptr loc("<stdin>":72:97)):
      "omp.terminator"() : () -> () loc("<stdin>":73:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.struct<(ptr, i64)>, !llvm.ptr) -> () loc("<stdin>":71:5)
    "llvm.return"() : () -> () loc("<stdin>":75:5)
  }) {fir.internal_name = "_QPtarget_boxchar"} : () -> () loc("<stdin>":40:3)
}) {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>} : () -> () loc("<stdin>":1:1)
