module {
  func.func @tanh(%arg0: f32) -> f32 {
    %0 = math.tanh %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_tanh(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = math.tanh %arg0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @tan(%arg0: f32) -> f32 {
    %0 = math.tan %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_tan(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = math.tan %arg0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @ctlz(%arg0: i32) -> i32 {
    %0 = math.ctlz %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @ctlz_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = math.ctlz %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @fmaf_func(%arg0: f64, %arg1: f64, %arg2: f64) -> f64 {
    %0 = math.fma %arg0, %arg1, %arg2 : f64
    return %0 : f64
  }
}

// -----
module {
  func.func @ceilf_func(%arg0: f64) -> f64 {
    %0 = math.ceil %arg0 : f64
    return %0 : f64
  }
}

// -----
module {
  func.func @exp2f_func(%arg0: f64) -> f64 {
    %0 = math.exp2 %arg0 : f64
    return %0 : f64
  }
  func.func @exp2f_func_tensor(%arg0: tensor<1xf32>) -> tensor<1xf32> {
    %0 = math.exp2 %arg0 : tensor<1xf32>
    return %0 : tensor<1xf32>
  }
}

// -----
module {
  func.func @roundf_func(%arg0: f32) -> f32 {
    %0 = math.round %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @powf_func(%arg0: f64, %arg1: f64) -> f64 {
    %0 = math.powf %arg0, %arg1 : f64
    return %0 : f64
  }
  func.func @powf_func_zero(%arg0: f64) -> f64 {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
  func.func @powf_func_one(%arg0: f64) -> f64 {
    %cst = arith.constant 1.000000e+00 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
  func.func @powf_func_negone(%arg0: f64) -> f64 {
    %cst = arith.constant -1.000000e+00 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
  func.func @powf_func_half(%arg0: f64) -> f64 {
    %cst = arith.constant 5.000000e-01 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
  func.func @powf_func_neghalf(%arg0: f64) -> f64 {
    %cst = arith.constant -5.000000e-01 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
  func.func @powf_func_two(%arg0: f64) -> f64 {
    %cst = arith.constant 2.000000e+00 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
  func.func @powf_func_negtwo(%arg0: f64) -> f64 {
    %cst = arith.constant -2.000000e+00 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
  func.func @powf_func_three(%arg0: f64) -> f64 {
    %cst = arith.constant 3.000000e+00 : f64
    %0 = math.powf %arg0, %cst : f64
    return %0 : f64
  }
}

// -----
module {
  func.func @roundeven64(%arg0: f64) -> f64 {
    %0 = math.roundeven %arg0 : f64
    return %0 : f64
  }
}

// -----
module {
  func.func @roundeven32(%arg0: f32) -> f32 {
    %0 = math.roundeven %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @roundeven16(%arg0: f16) -> f16 {
    %0 = math.roundeven %arg0 : f16
    return %0 : f16
  }
}

// -----
module {
  func.func @math_fpowi_neg_odd_power(%arg0: tensor<8xf32>) -> tensor<8xf32> {
    %cst = arith.constant dense<-3> : tensor<8xi64>
    %0 = math.fpowi %arg0, %cst : tensor<8xf32>, tensor<8xi64>
    return %0 : tensor<8xf32>
  }
}

// -----
module {
  func.func @math_fpowi_neg_even_power(%arg0: tensor<8xf32>) -> tensor<8xf32> {
    %cst = arith.constant dense<-4> : tensor<8xi64>
    %0 = math.fpowi %arg0, %cst : tensor<8xf32>, tensor<8xi64>
    return %0 : tensor<8xf32>
  }
}

// -----
module {
  func.func @math_fpowi_pos_odd_power(%arg0: tensor<8xf32>) -> tensor<8xf32> {
    %cst = arith.constant dense<5> : tensor<8xi64>
    %0 = math.fpowi %arg0, %cst : tensor<8xf32>, tensor<8xi64>
    return %0 : tensor<8xf32>
  }
}

// -----
module {
  func.func @math_fpowi_pos_even_power(%arg0: tensor<8xf32>) -> tensor<8xf32> {
    %cst = arith.constant dense<4> : tensor<8xi64>
    %0 = math.fpowi %arg0, %cst : tensor<8xf32>, tensor<8xi64>
    return %0 : tensor<8xf32>
  }
}

// -----
module {
  func.func @math_fpowi_even_scalar(%arg0: f32) -> f32 {
    %c2_i64 = arith.constant 2 : i64
    %0 = math.fpowi %arg0, %c2_i64 : f32, i64
    return %0 : f32
  }
}

// -----
module {
  func.func @math_fpowi_scalar_zero(%arg0: f32) -> f32 {
    %c0_i64 = arith.constant 0 : i64
    %0 = math.fpowi %arg0, %c0_i64 : f32, i64
    return %0 : f32
  }
}

// -----
module {
  func.func @math_fpowi_to_powf_tensor(%arg0: tensor<8xf32>, %arg1: tensor<8xi32>) -> tensor<8xf32> {
    %0 = math.fpowi %arg0, %arg1 : tensor<8xf32>, tensor<8xi32>
    return %0 : tensor<8xf32>
  }
}

// -----
module {
  func.func @math_fpowi_to_powf_scalar(%arg0: f32, %arg1: i64) -> f32 {
    %0 = math.fpowi %arg0, %arg1 : f32, i64
    return %0 : f32
  }
}

// -----
module {
  func.func @rsqrt16(%arg0: f16) -> f16 {
    %0 = math.rsqrt %arg0 : f16
    return %0 : f16
  }
}

// -----
module {
  func.func @rsqrt32(%arg0: f32) -> f32 {
    %0 = math.rsqrt %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @rsqrt64(%arg0: f64) -> f64 {
    %0 = math.rsqrt %arg0 : f64
    return %0 : f64
  }
}

// -----
module {
  func.func @rsqrt_vec(%arg0: vector<5xf32>) -> vector<5xf32> {
    %0 = math.rsqrt %arg0 : vector<5xf32>
    return %0 : vector<5xf32>
  }
}

// -----
module {
  func.func @rsqrt_tns(%arg0: tensor<5x8xf32>) -> tensor<5x8xf32> {
    %0 = math.rsqrt %arg0 : tensor<5x8xf32>
    return %0 : tensor<5x8xf32>
  }
}

// -----
module {
  func.func @non_static_shape_ceil_op(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %0 = math.ceil %arg0 : tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @unranked_ceil_op(%arg0: tensor<*xf32>) -> tensor<*xf32> {
    %0 = math.ceil %arg0 : tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @non_static_shape_rsqrt_op(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %0 = math.rsqrt %arg0 : tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @unranked_rsqrt_op(%arg0: tensor<*xf32>) -> tensor<*xf32> {
    %0 = math.rsqrt %arg0 : tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @clampf_scalar_op(%arg0: f16, %arg1: f16, %arg2: f16) -> f16 {
    %0 = math.clampf %arg0 to [%arg1, %arg2] : f16
    return %0 : f16
  }
  func.func @clampf_vector_op(%arg0: vector<3x4xf32>, %arg1: vector<3x4xf32>, %arg2: vector<3x4xf32>) -> vector<3x4xf32> {
    %0 = math.clampf %arg0 to [%arg1, %arg2] fastmath<fast> : vector<3x4xf32>
    return %0 : vector<3x4xf32>
  }
}

