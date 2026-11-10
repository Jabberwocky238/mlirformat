module {
  func.func @cvt_float_e4m3fn_to_f16(%arg0: vector<8xf8E4M3FN>) {
    %0 = nvgpu.extf %arg0 : vector<8xf8E4M3FN> to vector<8xf16>
    return
  }
}

// -----
module {
  func.func @cvt_float_e5m2_to_f16(%arg0: vector<8xf8E5M2>) {
    %0 = nvgpu.extf %arg0 : vector<8xf8E5M2> to vector<8xf16>
    return
  }
}

// -----
module {
  func.func @cvt_float_e8m0_to_bf16(%arg0: vector<8xf8E8M0FNU>) {
    %0 = nvgpu.extf %arg0 : vector<8xf8E8M0FNU> to vector<8xbf16>
    return
  }
}

// -----
module {
  func.func @cvt_float_e2m3_to_f16(%arg0: vector<8xf6E2M3FN>) {
    %0 = nvgpu.extf %arg0 : vector<8xf6E2M3FN> to vector<8xf16>
    return
  }
}

// -----
module {
  func.func @cvt_float_e3m2_to_f16(%arg0: vector<8xf6E3M2FN>) {
    %0 = nvgpu.extf %arg0 : vector<8xf6E3M2FN> to vector<8xf16>
    return
  }
}

// -----
module {
  func.func @cvt_float_e2m1_to_f16(%arg0: vector<16xf4E2M1FN>) {
    %0 = nvgpu.extf %arg0 : vector<16xf4E2M1FN> to vector<16xf16>
    return
  }
}

// -----
module {
  func.func @cvt_float_e2m3_to_bf16(%arg0: vector<8xf6E2M3FN>) {
    %0 = nvgpu.extf %arg0 : vector<8xf6E2M3FN> to vector<8xbf16>
    return
  }
}

// -----
module {
  func.func @cvt_float_e2m1_to_bf16(%arg0: vector<16xf4E2M1FN>) {
    %0 = nvgpu.extf %arg0 : vector<16xf4E2M1FN> to vector<16xbf16>
    return
  }
}

// -----
module {
  func.func @fpext_e4m3fn_to_f32(%arg0: vector<4xf8E4M3FN>) -> vector<4xf32> {
    %0 = nvgpu.extf %arg0 : vector<4xf8E4M3FN> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fpext_e5m2_to_f32(%arg0: vector<4xf8E5M2>) -> vector<4xf32> {
    %0 = nvgpu.extf %arg0 : vector<4xf8E5M2> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fpext_e8m0_to_f32(%arg0: vector<4xf8E8M0FNU>) -> vector<4xf32> {
    %0 = nvgpu.extf %arg0 : vector<4xf8E8M0FNU> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fpext_e2m3_to_f32(%arg0: vector<4xf6E2M3FN>) -> vector<4xf32> {
    %0 = nvgpu.extf %arg0 : vector<4xf6E2M3FN> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fpext_e2m1_to_f32(%arg0: vector<8xf4E2M1FN>) -> vector<8xf32> {
    %0 = nvgpu.extf %arg0 : vector<8xf4E2M1FN> to vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @fpext_f16_to_f32(%arg0: vector<4xf16>) -> vector<4xf32> {
    %0 = nvgpu.extf %arg0 : vector<4xf16> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fpext_bf16_to_f32(%arg0: vector<4xbf16>) -> vector<4xf32> {
    %0 = nvgpu.extf %arg0 : vector<4xbf16> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @fpext_f16_to_f64(%arg0: vector<4xf16>) -> vector<4xf64> {
    %0 = nvgpu.extf %arg0 : vector<4xf16> to vector<4xf64>
    return %0 : vector<4xf64>
  }
  func.func @fpext_bf16_to_f64(%arg0: vector<4xbf16>) -> vector<4xf64> {
    %0 = nvgpu.extf %arg0 : vector<4xbf16> to vector<4xf64>
    return %0 : vector<4xf64>
  }
  func.func @fpext_f32_to_f64(%arg0: vector<4xf32>) -> vector<4xf64> {
    %0 = nvgpu.extf %arg0 : vector<4xf32> to vector<4xf64>
    return %0 : vector<4xf64>
  }
  func.func @fpext_f8_to_f64(%arg0: vector<4xf8E4M3FN>) -> vector<4xf64> {
    %0 = nvgpu.extf %arg0 : vector<4xf8E4M3FN> to vector<4xf64>
    return %0 : vector<4xf64>
  }
  func.func @fpext_f4_to_f64(%arg0: vector<8xf4E2M1FN>) -> vector<8xf64> {
    %0 = nvgpu.extf %arg0 : vector<8xf4E2M1FN> to vector<8xf64>
    return %0 : vector<8xf64>
  }
  func.func @fpext_e2m3_to_f64(%arg0: vector<4xf6E2M3FN>) -> vector<4xf64> {
    %0 = nvgpu.extf %arg0 : vector<4xf6E2M3FN> to vector<4xf64>
    return %0 : vector<4xf64>
  }
  func.func @fpext_scalar_f8_to_f16(%arg0: f8E4M3FN) -> f16 {
    %0 = nvgpu.extf %arg0 : f8E4M3FN to f16
    return %0 : f16
  }
}

// -----
module {
  func.func @fpext_scalar_f8_to_f32(%arg0: f8E4M3FN) -> f32 {
    %0 = nvgpu.extf %arg0 : f8E4M3FN to f32
    return %0 : f32
  }
  func.func @fpext_v2x4_f8_to_f16(%arg0: vector<2x4xf8E4M3FN>) -> vector<2x4xf16> {
    %0 = nvgpu.extf %arg0 : vector<2x4xf8E4M3FN> to vector<2x4xf16>
    return %0 : vector<2x4xf16>
  }
}

// -----
module {
  func.func @fpext_v2x4_f8_to_f32(%arg0: vector<2x4xf8E4M3FN>) -> vector<2x4xf32> {
    %0 = nvgpu.extf %arg0 : vector<2x4xf8E4M3FN> to vector<2x4xf32>
    return %0 : vector<2x4xf32>
  }
  func.func @fpext_v3f8_to_v3f16(%arg0: vector<3xf8E5M2>) -> vector<3xf16> {
    %0 = nvgpu.extf %arg0 : vector<3xf8E5M2> to vector<3xf16>
    return %0 : vector<3xf16>
  }
}

// -----
module {
  func.func @fpext_v3_f8_to_f32(%arg0: vector<3xf8E5M2>) -> vector<3xf32> {
    %0 = nvgpu.extf %arg0 : vector<3xf8E5M2> to vector<3xf32>
    return %0 : vector<3xf32>
  }
  func.func @fpext_v3x1_f8_to_f16(%arg0: vector<3x1xf8E4M3FN>) -> vector<3x1xf16> {
    %0 = nvgpu.extf %arg0 : vector<3x1xf8E4M3FN> to vector<3x1xf16>
    return %0 : vector<3x1xf16>
  }
  func.func @fpext_f8_to_f16_relu(%arg0: vector<8xf8E4M3FN>) {
    %0 = nvgpu.extf %arg0 {relu = true} : vector<8xf8E4M3FN> to vector<8xf16>
    return
  }
  func.func @e2e_scalar_f8_to_f16(%arg0: f8E4M3FN) -> f16 {
    %0 = nvgpu.extf %arg0 : f8E4M3FN to f16
    return %0 : f16
  }
  func.func @e2e_v2x4_f8_to_f16(%arg0: vector<2x4xf8E4M3FN>) -> vector<2x4xf16> {
    %0 = nvgpu.extf %arg0 : vector<2x4xf8E4M3FN> to vector<2x4xf16>
    return %0 : vector<2x4xf16>
  }
  func.func @e2e_v3f8_to_v3f16(%arg0: vector<3xf8E5M2>) -> vector<3xf16> {
    %0 = nvgpu.extf %arg0 : vector<3xf8E5M2> to vector<3xf16>
    return %0 : vector<3xf16>
  }
  func.func @e2e_scalar_f8_to_f32(%arg0: f8E4M3FN) -> f32 {
    %0 = nvgpu.extf %arg0 : f8E4M3FN to f32
    return %0 : f32
  }
  func.func @e2e_v2x4_f8_to_f32(%arg0: vector<2x4xf8E4M3FN>) -> vector<2x4xf32> {
    %0 = nvgpu.extf %arg0 : vector<2x4xf8E4M3FN> to vector<2x4xf32>
    return %0 : vector<2x4xf32>
  }
  func.func @e2e_v3f8_to_v3f32(%arg0: vector<3xf8E5M2>) -> vector<3xf32> {
    %0 = nvgpu.extf %arg0 : vector<3xf8E5M2> to vector<3xf32>
    return %0 : vector<3xf32>
  }
}

