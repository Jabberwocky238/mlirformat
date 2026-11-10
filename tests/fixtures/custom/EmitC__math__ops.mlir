module {
  func.func @rsqrt32(%arg0: f32) -> f32 {
    %0 = math.rsqrt %arg0 : f32
    return %0 : f32
  }
  func.func @rsqrt64(%arg0: f64) -> f64 {
    %0 = math.rsqrt %arg0 : f64
    return %0 : f64
  }
  func.func @negative_rsqrt16(%arg0: f16) -> f16 {
    %0 = math.rsqrt %arg0 : f16
    return %0 : f16
  }
}

