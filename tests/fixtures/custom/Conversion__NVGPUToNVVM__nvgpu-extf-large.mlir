module {
  func.func @cvt_large_f8_to_f16(%arg0: vector<400xf8E4M3FN>) -> vector<400xf16> {
    %0 = nvgpu.extf %arg0 : vector<400xf8E4M3FN> to vector<400xf16>
    return %0 : vector<400xf16>
  }
  func.func @cvt_large_e8m0_to_bf16(%arg0: vector<400xf8E8M0FNU>) -> vector<400xbf16> {
    %0 = nvgpu.extf %arg0 : vector<400xf8E8M0FNU> to vector<400xbf16>
    return %0 : vector<400xbf16>
  }
  func.func @cvt_large_f6_to_f16(%arg0: vector<400xf6E2M3FN>) -> vector<400xf16> {
    %0 = nvgpu.extf %arg0 : vector<400xf6E2M3FN> to vector<400xf16>
    return %0 : vector<400xf16>
  }
  func.func @cvt_large_f4_to_f16(%arg0: vector<400xf4E2M1FN>) -> vector<400xf16> {
    %0 = nvgpu.extf %arg0 : vector<400xf4E2M1FN> to vector<400xf16>
    return %0 : vector<400xf16>
  }
  func.func @cvt_large_f8_to_f32(%arg0: vector<400xf8E5M2>) -> vector<400xf32> {
    %0 = nvgpu.extf %arg0 : vector<400xf8E5M2> to vector<400xf32>
    return %0 : vector<400xf32>
  }
  func.func @cvt_large_f6_to_f32(%arg0: vector<400xf6E2M3FN>) -> vector<400xf32> {
    %0 = nvgpu.extf %arg0 : vector<400xf6E2M3FN> to vector<400xf32>
    return %0 : vector<400xf32>
  }
  func.func @cvt_large_f16_to_f32(%arg0: vector<400xf16>) -> vector<400xf32> {
    %0 = nvgpu.extf %arg0 : vector<400xf16> to vector<400xf32>
    return %0 : vector<400xf32>
  }
}

