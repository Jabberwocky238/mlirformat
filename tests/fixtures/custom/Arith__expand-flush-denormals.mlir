module {
  func.func @flush_denormals_f32(%arg0: f32) -> f32 {
    %0 = arith.flush_denormals %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @flush_denormals_bf16(%arg0: bf16) -> bf16 {
    %0 = arith.flush_denormals %arg0 : bf16
    return %0 : bf16
  }
}

// -----
module {
  func.func @flush_denormals_f16(%arg0: f16) -> f16 {
    %0 = arith.flush_denormals %arg0 : f16
    return %0 : f16
  }
}

// -----
module {
  func.func @flush_denormals_f64(%arg0: f64) -> f64 {
    %0 = arith.flush_denormals %arg0 : f64
    return %0 : f64
  }
}

// -----
module {
  func.func @flush_denormals_vector(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = arith.flush_denormals %arg0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @flush_denormals_tensor(%arg0: tensor<8xf32>) -> tensor<8xf32> {
    %0 = arith.flush_denormals %arg0 : tensor<8xf32>
    return %0 : tensor<8xf32>
  }
}

