module {
  func.func @copy_sign_scalar(%arg0: f32, %arg1: f32) -> f32 {
    %0 = math.copysign %arg0, %arg1 : f32
    return %0 : f32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float16, Int16], []>, #spirv.resource_limits<>>} {
  func.func @copy_sign_vector(%arg0: vector<3xf16>, %arg1: vector<3xf16>) -> vector<3xf16> {
    %0 = math.copysign %arg0, %arg1 : vector<3xf16>
    return %0 : vector<3xf16>
  }
}

// -----
module {
  func.func @copy_sign_2d_vector(%arg0: vector<3x3xf32>, %arg1: vector<3x3xf32>) -> vector<3x3xf32> {
    %0 = math.copysign %arg0, %arg1 : vector<3x3xf32>
    return %0 : vector<3x3xf32>
  }
}

// -----
module {
  func.func @copy_sign_tensor(%arg0: tensor<3x3xf32>, %arg1: tensor<3x3xf32>) -> tensor<3x3xf32> {
    %0 = math.copysign %arg0, %arg1 : tensor<3x3xf32>
    return %0 : tensor<3x3xf32>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float16, Int16], []>, #spirv.resource_limits<>>} {
  func.func @copy_sign_vector_0D(%arg0: vector<1xf16>, %arg1: vector<1xf16>) -> vector<1xf16> {
    %0 = math.copysign %arg0, %arg1 : vector<1xf16>
    return %0 : vector<1xf16>
  }
}

