"builtin.module"() <{sym_name = "test_ocl_intrinsics"}> ({
  "gpu.module"() <{sym_name = "kernel", targets = [#xevm.target]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<spir_kernelcc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "native_fcns", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
      %0 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
      %1 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %2 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
      %3 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<2xf64>}> : () -> vector<2xf64>
      %4 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<3xf32>}> : () -> vector<3xf32>
      %5 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<4xf64>}> : () -> vector<4xf64>
      %6 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<8xf64>}> : () -> vector<8xf64>
      %7 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %8 = "llvm.call"(%0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expDh, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f16) -> f16
      %9 = "llvm.call"(%1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expf, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
      %10 = "llvm.call"(%2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expd, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f64) -> f64
      %11 = "llvm.call"(%3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expDv2_f64, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (vector<2xf64>) -> vector<2xf64>
      %12 = "llvm.call"(%4) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expDv3_f32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (vector<3xf32>) -> vector<3xf32>
      %13 = "llvm.call"(%5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expDv4_f64, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (vector<4xf64>) -> vector<4xf64>
      %14 = "llvm.call"(%6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expDv8_f64, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (vector<8xf64>) -> vector<8xf64>
      %15 = "llvm.call"(%7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_expDv16_f16, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (vector<16xf16>) -> vector<16xf16>
      %16 = "llvm.call"(%0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_cosDh, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f16) -> f16
      %17 = "llvm.call"(%1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z23__spirv_ocl_native_exp2f, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
      %18 = "llvm.call"(%0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_logDh, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f16) -> f16
      %19 = "llvm.call"(%1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z23__spirv_ocl_native_log2f, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
      %20 = "llvm.call"(%6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z24__spirv_ocl_native_log10Dv8_d, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (vector<8xf64>) -> vector<8xf64>
      %21 = "llvm.call"(%7, %7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z23__spirv_ocl_native_powrDv16_DhS_, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (vector<16xf16>, vector<16xf16>) -> vector<16xf16>
      %22 = "llvm.call"(%2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z24__spirv_ocl_native_rsqrtd, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f64) -> f64
      %23 = "llvm.call"(%0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_sinDh, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f16) -> f16
      %24 = "llvm.call"(%1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z23__spirv_ocl_native_sqrtf, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
      %25 = "llvm.call"(%2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z22__spirv_ocl_native_tand, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f64) -> f64
      %26 = "llvm.call"(%1, %1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z25__spirv_ocl_native_divideff, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (f32, f32) -> f32
      "llvm.return"() : () -> ()
    }) {gpu.kernel} : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expDh", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expDv2_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<3xf32> (vector<3xf32>)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expDv3_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf64> (vector<4xf64>)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expDv4_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf64> (vector<8xf64>)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expDv8_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<16xf16> (vector<16xf16>)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_expDv16_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_cosDh", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "_Z23__spirv_ocl_native_exp2f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_logDh", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "_Z23__spirv_ocl_native_log2f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf64> (vector<8xf64>)>, linkage = #llvm.linkage<external>, sym_name = "_Z24__spirv_ocl_native_log10Dv8_d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<16xf16> (vector<16xf16>, vector<16xf16>)>, linkage = #llvm.linkage<external>, sym_name = "_Z23__spirv_ocl_native_powrDv16_DhS_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64)>, linkage = #llvm.linkage<external>, sym_name = "_Z24__spirv_ocl_native_rsqrtd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_sinDh", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "_Z23__spirv_ocl_native_sqrtf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64)>, linkage = #llvm.linkage<external>, sym_name = "_Z22__spirv_ocl_native_tand", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "_Z25__spirv_ocl_native_divideff", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    }) : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

