module {
  func.func @cvt_large_f32_to_f16(%arg0: vector<400xf32>) -> vector<400xf16> {
    %0 = nvgpu.truncf %arg0 : vector<400xf32> to vector<400xf16>
    return %0 : vector<400xf16>
  }
  func.func @cvt_large_f32_to_bf16(%arg0: vector<400xf32>) -> vector<400xbf16> {
    %0 = nvgpu.truncf %arg0 : vector<400xf32> to vector<400xbf16>
    return %0 : vector<400xbf16>
  }
  func.func @cvt_large_f32_to_f8(%arg0: vector<400xf32>) -> vector<400xf8E4M3FN> {
    %0 = nvgpu.truncf %arg0 : vector<400xf32> to vector<400xf8E4M3FN>
    return %0 : vector<400xf8E4M3FN>
  }
  func.func @cvt_large_f32_to_f6(%arg0: vector<400xf32>) -> vector<400xf6E2M3FN> {
    %0 = nvgpu.truncf %arg0 : vector<400xf32> to vector<400xf6E2M3FN>
    return %0 : vector<400xf6E2M3FN>
  }
  func.func @cvt_large_f32_to_f4(%arg0: vector<400xf32>) -> vector<400xf4E2M1FN> {
    %0 = nvgpu.truncf %arg0 : vector<400xf32> to vector<400xf4E2M1FN>
    return %0 : vector<400xf4E2M1FN>
  }
  func.func @cvt_large_f16_to_f8(%arg0: vector<400xf16>) -> vector<400xf8E4M3FN> {
    %0 = nvgpu.truncf %arg0 : vector<400xf16> to vector<400xf8E4M3FN>
    return %0 : vector<400xf8E4M3FN>
  }
  func.func @cvt_large_bf16_to_f6(%arg0: vector<400xbf16>) -> vector<400xf6E3M2FN> {
    %0 = nvgpu.truncf %arg0 : vector<400xbf16> to vector<400xf6E3M2FN>
    return %0 : vector<400xf6E3M2FN>
  }
}

