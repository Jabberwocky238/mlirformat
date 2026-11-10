module {
  func.func @cvt_float_f32_to_f16(%arg0: vector<4xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<4xf32> to vector<4xf16>
    return
  }
  func.func @cvt_float_f32_to_f16_v8(%arg0: vector<8xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<8xf32> to vector<8xf16>
    return
  }
  func.func @cvt_float_f32_to_bf16(%arg0: vector<4xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<4xf32> to vector<4xbf16>
    return
  }
  func.func @cvt_float_f32_to_e4m3(%arg0: vector<8xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<8xf32> to vector<8xf8E4M3FN>
    return
  }
  func.func @cvt_float_f16_to_e2m3(%arg0: vector<8xf16>) {
    %0 = nvgpu.truncf %arg0 : vector<8xf16> to vector<8xf6E2M3FN>
    return
  }
  func.func @cvt_float_bf16_to_e3m2(%arg0: vector<8xbf16>) {
    %0 = nvgpu.truncf %arg0 : vector<8xbf16> to vector<8xf6E3M2FN>
    return
  }
  func.func @cvt_float_f32_to_e2m3(%arg0: vector<8xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<8xf32> to vector<8xf6E2M3FN>
    return
  }
  func.func @cvt_float_f32_to_e8m0_rz(%arg0: vector<8xf32>) {
    %0 = nvgpu.truncf %arg0 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<8xf32> to vector<8xf8E8M0FNU>
    return
  }
  func.func @cvt_float_f32_to_e8m0_rp(%arg0: vector<8xf32>) {
    %0 = nvgpu.truncf %arg0 {rnd = #nvvm.fp_rnd_mode<rp>} : vector<8xf32> to vector<8xf8E8M0FNU>
    return
  }
  func.func @fptrunc_scalar_f32_to_f16(%arg0: f32) -> f16 {
    %0 = nvgpu.truncf %arg0 : f32 to f16
    return %0 : f16
  }
  func.func @fptrunc_scalar_f32_to_bf16(%arg0: f32) -> bf16 {
    %0 = nvgpu.truncf %arg0 : f32 to bf16
    return %0 : bf16
  }
  func.func @fptrunc_scalar_f64_to_f32(%arg0: f64) -> f32 {
    %0 = nvgpu.truncf %arg0 : f64 to f32
    return %0 : f32
  }
  func.func @fptrunc_v2x4_f32_to_f16(%arg0: vector<2x4xf32>) -> vector<2x4xf16> {
    %0 = nvgpu.truncf %arg0 : vector<2x4xf32> to vector<2x4xf16>
    return %0 : vector<2x4xf16>
  }
  func.func @fptrunc_v4x2_f32_to_f8(%arg0: vector<4x2xf32>) -> vector<4x2xf8E4M3FN> {
    %0 = nvgpu.truncf %arg0 : vector<4x2xf32> to vector<4x2xf8E4M3FN>
    return %0 : vector<4x2xf8E4M3FN>
  }
  func.func @fptrunc_v1f32_to_v1f16(%arg0: vector<1xf32>) -> vector<1xf16> {
    %0 = nvgpu.truncf %arg0 : vector<1xf32> to vector<1xf16>
    return %0 : vector<1xf16>
  }
  func.func @fptrunc_v3f16_to_v3f8(%arg0: vector<3xf16>) -> vector<3xf8E4M3FN> {
    %0 = nvgpu.truncf %arg0 : vector<3xf16> to vector<3xf8E4M3FN>
    return %0 : vector<3xf8E4M3FN>
  }
  func.func @fptrunc_v3x1_f32_to_f16(%arg0: vector<3x1xf32>) -> vector<3x1xf16> {
    %0 = nvgpu.truncf %arg0 : vector<3x1xf32> to vector<3x1xf16>
    return %0 : vector<3x1xf16>
  }
  func.func @fptrunc_f64_to_f32(%arg0: vector<4xf64>) -> vector<4xf32> {
    %0 = nvgpu.truncf %arg0 : vector<4xf64> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @fptrunc_f64_to_f16(%arg0: vector<2xf64>) -> vector<2xf16> {
    %0 = nvgpu.truncf %arg0 : vector<2xf64> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @fptrunc_f64_to_bf16(%arg0: vector<2xf64>) -> vector<2xbf16> {
    %0 = nvgpu.truncf %arg0 : vector<2xf64> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @fptrunc_f64_to_f8(%arg0: vector<4xf64>) -> vector<4xf8E4M3FN> {
    %0 = nvgpu.truncf %arg0 : vector<4xf64> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @fptrunc_f32_to_f8_satfinite(%arg0: vector<8xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<8xf32> to vector<8xf8E4M3FN>
    return
  }
  func.func @fptrunc_f32_to_f16_relu(%arg0: vector<4xf32>) {
    %0 = nvgpu.truncf %arg0 {relu = true} : vector<4xf32> to vector<4xf16>
    return
  }
  func.func @fptrunc_f32_to_f8_default_sat(%arg0: vector<8xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<8xf32> to vector<8xf8E4M3FN>
    return
  }
  func.func @fptrunc_f32_to_f16_default_sat(%arg0: vector<4xf32>) {
    %0 = nvgpu.truncf %arg0 : vector<4xf32> to vector<4xf16>
    return
  }
  func.func @fptrunc_f32_to_f16_explicit_none(%arg0: vector<4xf32>) {
    %0 = nvgpu.truncf %arg0 {sat = #nvvm.sat_mode<none>} : vector<4xf32> to vector<4xf16>
    return
  }
  func.func @fptrunc_f32_to_f16_rs(%arg0: vector<4xf32>, %arg1: i32) {
    %0 = nvgpu.truncf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rs>} : vector<4xf32> to vector<4xf16>
    return
  }
  func.func @fptrunc_f32_to_bf16_rs(%arg0: vector<4xf32>, %arg1: i32) {
    %0 = nvgpu.truncf %arg0, %arg1 {rnd = #nvvm.fp_rnd_mode<rs>} : vector<4xf32> to vector<4xbf16>
    return
  }
  func.func @fptrunc_f32_to_f16_rz(%arg0: vector<4xf32>) {
    %0 = nvgpu.truncf %arg0 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<4xf32> to vector<4xf16>
    return
  }
  func.func @fptrunc_f32_to_bf16_rz(%arg0: vector<4xf32>) {
    %0 = nvgpu.truncf %arg0 {rnd = #nvvm.fp_rnd_mode<rz>} : vector<4xf32> to vector<4xbf16>
    return
  }
  func.func @e2e_scalar_f32_to_f16(%arg0: f32) -> f16 {
    %0 = nvgpu.truncf %arg0 : f32 to f16
    return %0 : f16
  }
  func.func @e2e_v2x4_f32_to_f16(%arg0: vector<2x4xf32>) -> vector<2x4xf16> {
    %0 = nvgpu.truncf %arg0 : vector<2x4xf32> to vector<2x4xf16>
    return %0 : vector<2x4xf16>
  }
  func.func @e2e_v3f16_to_v3f8(%arg0: vector<3xf16>) -> vector<3xf8E4M3FN> {
    %0 = nvgpu.truncf %arg0 : vector<3xf16> to vector<3xf8E4M3FN>
    return %0 : vector<3xf8E4M3FN>
  }
}

