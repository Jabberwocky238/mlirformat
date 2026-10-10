module {
  func.func @sin_f8E5M2(%arg0: f8E5M2) -> f8E5M2 {
    %0 = math.sin %arg0 : f8E5M2
    return %0 : f8E5M2
  }
  func.func @sin(%arg0: f16) -> f16 {
    %0 = math.sin %arg0 : f16
    return %0 : f16
  }
  func.func @fpowi_f8E5M2(%arg0: f8E5M2, %arg1: i32) -> f8E5M2 {
    %0 = math.fpowi %arg0, %arg1 : f8E5M2, i32
    return %0 : f8E5M2
  }
  func.func @fpowi(%arg0: f16, %arg1: i32) -> f16 {
    %0 = math.fpowi %arg0, %arg1 : f16, i32
    return %0 : f16
  }
  func.func @fma(%arg0: f16, %arg1: f16, %arg2: f16) -> f16 {
    %0 = math.fma %arg0, %arg1, %arg2 : f16
    return %0 : f16
  }
  func.func @absf_f16(%arg0: f16) -> f16 {
    %0 = math.absf %arg0 : f16
    return %0 : f16
  }
  func.func @absf_f32(%arg0: f32) -> f32 {
    %0 = math.absf %arg0 : f32
    return %0 : f32
  }
  func.func @absf_f64(%arg0: f64) -> f64 {
    %0 = math.absf %arg0 : f64
    return %0 : f64
  }
  func.func @sin_vector(%arg0: vector<2xbf16>) -> vector<2xbf16> {
    %0 = math.sin %arg0 : vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @sin_vector_f16(%arg0: vector<2xf16>) -> vector<2xf16> {
    %0 = math.sin %arg0 : vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @fastmath(%arg0: f16) -> f16 {
    %0 = math.sin %arg0 fastmath<nsz> : f16
    return %0 : f16
  }
  func.func @sequences_f8E5M2(%arg0: f8E5M2) -> f8E5M2 {
    %0 = math.absf %arg0 : f8E5M2
    %1 = math.sin %0 : f8E5M2
    return %1 : f8E5M2
  }
  func.func @sequences(%arg0: f16) -> f16 {
    %0 = math.absf %arg0 : f16
    %1 = math.sin %0 : f16
    return %1 : f16
  }
  func.func @promote_in_if_block(%arg0: bf16, %arg1: bf16, %arg2: i1) -> bf16 {
    %0 = scf.if %arg2 -> (bf16) {
      %1 = math.absf %arg0 : bf16
      scf.yield %1 : bf16
    } else {
      scf.yield %arg1 : bf16
    }
    return %0 : bf16
  }
}

