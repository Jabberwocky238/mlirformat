module @test_ocl_intrinsics attributes {gpu.container_module} {
  gpu.module @kernel [#xevm.target] {
    llvm.func spir_kernelcc @native_fcns() attributes {gpu.kernel} {
      %0 = llvm.mlir.constant(0.000000e+00 : f16) : f16
      %1 = llvm.mlir.constant(0.000000e+00 : f32) : f32
      %2 = llvm.mlir.constant(0.000000e+00 : f64) : f64
      %3 = llvm.mlir.constant(dense<0.000000e+00> : vector<2xf64>) : vector<2xf64>
      %4 = llvm.mlir.constant(dense<0.000000e+00> : vector<3xf32>) : vector<3xf32>
      %5 = llvm.mlir.constant(dense<0.000000e+00> : vector<4xf64>) : vector<4xf64>
      %6 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf64>) : vector<8xf64>
      %7 = llvm.mlir.constant(dense<0.000000e+00> : vector<16xf16>) : vector<16xf16>
      %8 = llvm.call @_Z22__spirv_ocl_native_expDh(%0) : (f16) -> f16
      %9 = llvm.call @_Z22__spirv_ocl_native_expf(%1) : (f32) -> f32
      %10 = llvm.call @_Z22__spirv_ocl_native_expd(%2) : (f64) -> f64
      %11 = llvm.call @_Z22__spirv_ocl_native_expDv2_f64(%3) : (vector<2xf64>) -> vector<2xf64>
      %12 = llvm.call @_Z22__spirv_ocl_native_expDv3_f32(%4) : (vector<3xf32>) -> vector<3xf32>
      %13 = llvm.call @_Z22__spirv_ocl_native_expDv4_f64(%5) : (vector<4xf64>) -> vector<4xf64>
      %14 = llvm.call @_Z22__spirv_ocl_native_expDv8_f64(%6) : (vector<8xf64>) -> vector<8xf64>
      %15 = llvm.call @_Z22__spirv_ocl_native_expDv16_f16(%7) : (vector<16xf16>) -> vector<16xf16>
      %16 = llvm.call @_Z22__spirv_ocl_native_cosDh(%0) {fastmathFlags = #llvm.fastmath<afn>} : (f16) -> f16
      %17 = llvm.call @_Z23__spirv_ocl_native_exp2f(%1) {fastmathFlags = #llvm.fastmath<afn>} : (f32) -> f32
      %18 = llvm.call @_Z22__spirv_ocl_native_logDh(%0) {fastmathFlags = #llvm.fastmath<afn>} : (f16) -> f16
      %19 = llvm.call @_Z23__spirv_ocl_native_log2f(%1) {fastmathFlags = #llvm.fastmath<afn>} : (f32) -> f32
      %20 = llvm.call @_Z24__spirv_ocl_native_log10Dv8_d(%6) {fastmathFlags = #llvm.fastmath<afn>} : (vector<8xf64>) -> vector<8xf64>
      %21 = llvm.call @_Z23__spirv_ocl_native_powrDv16_DhS_(%7, %7) {fastmathFlags = #llvm.fastmath<afn>} : (vector<16xf16>, vector<16xf16>) -> vector<16xf16>
      %22 = llvm.call @_Z24__spirv_ocl_native_rsqrtd(%2) {fastmathFlags = #llvm.fastmath<afn>} : (f64) -> f64
      %23 = llvm.call @_Z22__spirv_ocl_native_sinDh(%0) {fastmathFlags = #llvm.fastmath<afn>} : (f16) -> f16
      %24 = llvm.call @_Z23__spirv_ocl_native_sqrtf(%1) {fastmathFlags = #llvm.fastmath<afn>} : (f32) -> f32
      %25 = llvm.call @_Z22__spirv_ocl_native_tand(%2) {fastmathFlags = #llvm.fastmath<afn>} : (f64) -> f64
      %26 = llvm.call @_Z25__spirv_ocl_native_divideff(%1, %1) {fastmathFlags = #llvm.fastmath<afn>} : (f32, f32) -> f32
      llvm.return
    }
    llvm.func @_Z22__spirv_ocl_native_expDh(f16) -> f16
    llvm.func @_Z22__spirv_ocl_native_expf(f32) -> f32
    llvm.func @_Z22__spirv_ocl_native_expd(f64) -> f64
    llvm.func @_Z22__spirv_ocl_native_expDv2_f64(vector<2xf64>) -> vector<2xf64>
    llvm.func @_Z22__spirv_ocl_native_expDv3_f32(vector<3xf32>) -> vector<3xf32>
    llvm.func @_Z22__spirv_ocl_native_expDv4_f64(vector<4xf64>) -> vector<4xf64>
    llvm.func @_Z22__spirv_ocl_native_expDv8_f64(vector<8xf64>) -> vector<8xf64>
    llvm.func @_Z22__spirv_ocl_native_expDv16_f16(vector<16xf16>) -> vector<16xf16>
    llvm.func @_Z22__spirv_ocl_native_cosDh(f16) -> f16
    llvm.func @_Z23__spirv_ocl_native_exp2f(f32) -> f32
    llvm.func @_Z22__spirv_ocl_native_logDh(f16) -> f16
    llvm.func @_Z23__spirv_ocl_native_log2f(f32) -> f32
    llvm.func @_Z24__spirv_ocl_native_log10Dv8_d(vector<8xf64>) -> vector<8xf64>
    llvm.func @_Z23__spirv_ocl_native_powrDv16_DhS_(vector<16xf16>, vector<16xf16>) -> vector<16xf16>
    llvm.func @_Z24__spirv_ocl_native_rsqrtd(f64) -> f64
    llvm.func @_Z22__spirv_ocl_native_sinDh(f16) -> f16
    llvm.func @_Z23__spirv_ocl_native_sqrtf(f32) -> f32
    llvm.func @_Z22__spirv_ocl_native_tand(f64) -> f64
    llvm.func @_Z25__spirv_ocl_native_divideff(f32, f32) -> f32
  }
}

