module {
  func.func @ceildivi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.ceildivsi %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @ceildivi_index(%arg0: index, %arg1: index) -> index {
    %0 = arith.ceildivsi %arg0, %arg1 : index
    return %0 : index
  }
}

// -----
module {
  func.func @floordivi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.floordivsi %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @floordivi_index(%arg0: index, %arg1: index) -> index {
    %0 = arith.floordivsi %arg0, %arg1 : index
    return %0 : index
  }
}

// -----
module {
  func.func @floordivi_vec(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi32> {
    %0 = arith.floordivsi %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @ceildivui(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.ceildivui %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @ceildivui_index(%arg0: index, %arg1: index) -> index {
    %0 = arith.ceildivui %arg0, %arg1 : index
    return %0 : index
  }
}

// -----
module {
  func.func @maximumf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.maximumf %arg0, %arg1 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @maximumf_vector(%arg0: vector<4xf16>, %arg1: vector<4xf16>) -> vector<4xf16> {
    %0 = arith.maximumf %arg0, %arg1 : vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @maxnumf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.maxnumf %arg0, %arg1 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @minimumf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minimumf %arg0, %arg1 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @minnumf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minnumf %arg0, %arg1 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @truncf_f32(%arg0: f32) -> bf16 {
    %0 = arith.truncf %arg0 : f32 to bf16
    return %0 : bf16
  }
}

// -----
module {
  func.func @truncf_vector_f32(%arg0: vector<4xf32>) -> vector<4xbf16> {
    %0 = arith.truncf %arg0 : vector<4xf32> to vector<4xbf16>
    return %0 : vector<4xbf16>
  }
}

// -----
module {
  func.func @truncf_f32_to_f8E8M0FNU(%arg0: f32) -> f8E8M0FNU {
    %0 = arith.truncf %arg0 : f32 to f8E8M0FNU
    return %0 : f8E8M0FNU
  }
}

// -----
module {
  func.func @truncf_f16_to_f8E8M0FNU(%arg0: f16) -> f8E8M0FNU {
    %0 = arith.truncf %arg0 : f16 to f8E8M0FNU
    return %0 : f8E8M0FNU
  }
}

// -----
module {
  func.func @truncf_vector_f32_to_f8E8M0FNU(%arg0: vector<4xf32>) -> vector<4xf8E8M0FNU> {
    %0 = arith.truncf %arg0 : vector<4xf32> to vector<4xf8E8M0FNU>
    return %0 : vector<4xf8E8M0FNU>
  }
}

// -----
module {
  func.func @truncf_vector_f16_to_f8E8M0FNU(%arg0: vector<4xf16>) -> vector<4xf8E8M0FNU> {
    %0 = arith.truncf %arg0 : vector<4xf16> to vector<4xf8E8M0FNU>
    return %0 : vector<4xf8E8M0FNU>
  }
}

// -----
module {
  func.func @truncf_vector_bf16_to_f8E8M0FNU(%arg0: vector<4xbf16>) -> vector<4xf8E8M0FNU> {
    %0 = arith.truncf %arg0 : vector<4xbf16> to vector<4xf8E8M0FNU>
    return %0 : vector<4xf8E8M0FNU>
  }
}

// -----
module {
  func.func @scaling_truncf_f32_to_f4E2M1FN(%arg0: f32, %arg1: f8E8M0FNU) -> f4E2M1FN {
    %0 = arith.scaling_truncf %arg0, %arg1 : f32, f8E8M0FNU to f4E2M1FN
    return %0 : f4E2M1FN
  }
}

// -----
module {
  func.func @scaling_truncf_vector_f16_to_f6E3M2FN(%arg0: vector<4xf16>, %arg1: vector<4xf8E8M0FNU>) -> vector<4xf6E3M2FN> {
    %0 = arith.scaling_truncf %arg0, %arg1 : vector<4xf16>, vector<4xf8E8M0FNU> to vector<4xf6E3M2FN>
    return %0 : vector<4xf6E3M2FN>
  }
}

// -----
module {
  func.func @scaling_truncf_propagate_rounding_mode_fast_math(%arg0: vector<4xf16>, %arg1: vector<4xf16>) -> vector<4xf6E3M2FN> {
    %0 = arith.scaling_truncf %arg0, %arg1 to_nearest_even fastmath<fast> : vector<4xf16>, vector<4xf16> to vector<4xf6E3M2FN>
    return %0 : vector<4xf6E3M2FN>
  }
}

// -----
module {
  func.func @scaling_truncf_f16_to_f4E2M1FN_using_f16_scales(%arg0: f16, %arg1: f16) -> f4E2M1FN {
    %0 = arith.scaling_truncf %arg0, %arg1 : f16, f16 to f4E2M1FN
    return %0 : f4E2M1FN
  }
}

// -----
module {
  func.func @scaling_truncf_vector_f16_to_f4E2M1FN_using_f16_scales(%arg0: vector<4xf16>, %arg1: vector<4xf16>) -> vector<4xf4E2M1FN> {
    %0 = arith.scaling_truncf %arg0, %arg1 : vector<4xf16>, vector<4xf16> to vector<4xf4E2M1FN>
    return %0 : vector<4xf4E2M1FN>
  }
}

// -----
module {
  func.func @invalid_scaling_truncf_to_f4E2M1FN(%arg0: f16, %arg1: f8E5M2FNUZ) -> f4E2M1FN {
    %0 = arith.scaling_truncf %arg0, %arg1 : f16, f8E5M2FNUZ to f4E2M1FN
    return %0 : f4E2M1FN
  }
}

// -----
module {
  func.func @extf_f8E8M0FNU_to_f32(%arg0: f8E8M0FNU) -> f32 {
    %0 = arith.extf %arg0 : f8E8M0FNU to f32
    return %0 : f32
  }
}

// -----
module {
  func.func @extf_f8E8M0FNU_to_f16(%arg0: f8E8M0FNU) -> f16 {
    %0 = arith.extf %arg0 : f8E8M0FNU to f16
    return %0 : f16
  }
}

// -----
module {
  func.func @extf_vector_f8E8M0FNU_to_f32(%arg0: vector<4xf8E8M0FNU>) -> vector<4xf32> {
    %0 = arith.extf %arg0 : vector<4xf8E8M0FNU> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @extf_vector_f8E8M0FNU_to_f16(%arg0: vector<4xf8E8M0FNU>) -> vector<4xf16> {
    %0 = arith.extf %arg0 : vector<4xf8E8M0FNU> to vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @extf_vector_f8E8M0FNU_to_bf16(%arg0: vector<4xf8E8M0FNU>) -> vector<4xbf16> {
    %0 = arith.extf %arg0 : vector<4xf8E8M0FNU> to vector<4xbf16>
    return %0 : vector<4xbf16>
  }
}

// -----
module {
  func.func @scaling_extf_to_f32(%arg0: f4E2M1FN, %arg1: f8E8M0FNU) -> f32 {
    %0 = arith.scaling_extf %arg0, %arg1 : f4E2M1FN, f8E8M0FNU to f32
    return %0 : f32
  }
}

// -----
module {
  func.func @scaling_extf_to_f32_using_f16_scales(%arg0: f4E2M1FN, %arg1: f16) -> f32 {
    %0 = arith.scaling_extf %arg0, %arg1 : f4E2M1FN, f16 to f32
    return %0 : f32
  }
}

// -----
module {
  func.func @invalid_scaling_extf_to_f32(%arg0: f4E2M1FN, %arg1: f8E5M2FNUZ) -> f32 {
    %0 = arith.scaling_extf %arg0, %arg1 : f4E2M1FN, f8E5M2FNUZ to f32
    return %0 : f32
  }
}

// -----
module {
  func.func @scaling_extf_vector_to_f32(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>) -> vector<4xf32> {
    %0 = arith.scaling_extf %arg0, %arg1 : vector<4xf4E2M1FN>, vector<4xf8E8M0FNU> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @scaling_extf_vector_to_f16(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>) -> vector<4xf16> {
    %0 = arith.scaling_extf %arg0, %arg1 : vector<4xf4E2M1FN>, vector<4xf8E8M0FNU> to vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @scaling_extf_vector_to_bf16(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>) -> vector<4xbf16> {
    %0 = arith.scaling_extf %arg0, %arg1 : vector<4xf4E2M1FN>, vector<4xf8E8M0FNU> to vector<4xbf16>
    return %0 : vector<4xbf16>
  }
}

// -----
module {
  func.func @scaling_extf_vector_to_f32_using_f16_scales(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf16>) -> vector<4xf32> {
    %0 = arith.scaling_extf %arg0, %arg1 : vector<4xf4E2M1FN>, vector<4xf16> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @scaling_extf_vector_to_f32_using_f16_scales_fastmath(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf16>) -> vector<4xf32> {
    %0 = arith.scaling_extf %arg0, %arg1 fastmath<fast> : vector<4xf4E2M1FN>, vector<4xf16> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @maxsi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.maxsi %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @minsi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.minsi %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @maxui(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.maxui %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @minui(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.minui %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @truncf_f32_to_f4E2M1FN(%arg0: f32) -> f4E2M1FN {
    %0 = arith.truncf %arg0 : f32 to f4E2M1FN
    return %0 : f4E2M1FN
  }
}

// -----
module {
  func.func @truncf_vector_f32_to_f4E2M1FN(%arg0: vector<4xf32>) -> vector<4xf4E2M1FN> {
    %0 = arith.truncf %arg0 : vector<4xf32> to vector<4xf4E2M1FN>
    return %0 : vector<4xf4E2M1FN>
  }
}

// -----
module {
  func.func @extf_f4E2M1FN_to_f32(%arg0: f4E2M1FN) -> f32 {
    %0 = arith.extf %arg0 : f4E2M1FN to f32
    return %0 : f32
  }
}

// -----
module {
  func.func @extf_vector_f4E2M1FN_to_f32(%arg0: vector<4xf4E2M1FN>) -> vector<4xf32> {
    %0 = arith.extf %arg0 : vector<4xf4E2M1FN> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

