module {
  func.func @i32_3d_to_1d_last_dim_scalable(%arg0: vector<2x1x[4]xi32>) -> vector<[8]xi32> {
    %0 = vector.shape_cast %arg0 : vector<2x1x[4]xi32> to vector<[8]xi32>
    return %0 : vector<[8]xi32>
  }
}

// -----
module {
  func.func @i32_1d_to_3d_last_dim_scalable(%arg0: vector<[8]xi32>) -> vector<2x1x[4]xi32> {
    %0 = vector.shape_cast %arg0 : vector<[8]xi32> to vector<2x1x[4]xi32>
    return %0 : vector<2x1x[4]xi32>
  }
}

// -----
module {
  func.func @i8_2d_to_1d_last_dim_scalable(%arg0: vector<4x[8]xi8>) -> vector<[32]xi8> {
    %0 = vector.shape_cast %arg0 : vector<4x[8]xi8> to vector<[32]xi8>
    return %0 : vector<[32]xi8>
  }
}

// -----
module {
  func.func @i8_1d_to_2d_last_dim_scalable(%arg0: vector<[32]xi8>) -> vector<4x[8]xi8> {
    %0 = vector.shape_cast %arg0 : vector<[32]xi8> to vector<4x[8]xi8>
    return %0 : vector<4x[8]xi8>
  }
}

// -----
module {
  func.func @f32_permute_leading_non_scalable_dims(%arg0: vector<2x3x[4]xf32>) -> vector<3x2x[4]xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x3x[4]xf32> to vector<3x2x[4]xf32>
    return %0 : vector<3x2x[4]xf32>
  }
}

// -----
module {
  func.func @f64_flatten_leading_non_scalable_dims(%arg0: vector<2x2x[2]xf64>) -> vector<4x[2]xf64> {
    %0 = vector.shape_cast %arg0 : vector<2x2x[2]xf64> to vector<4x[2]xf64>
    return %0 : vector<4x[2]xf64>
  }
}

// -----
module {
  func.func @f32_reduce_trailing_scalable_dim(%arg0: vector<3x[4]xf32>) -> vector<6x[2]xf32> {
    %0 = vector.shape_cast %arg0 : vector<3x[4]xf32> to vector<6x[2]xf32>
    return %0 : vector<6x[2]xf32>
  }
}

// -----
module {
  func.func @f32_increase_trailing_scalable_dim(%arg0: vector<4x[2]xf32>) -> vector<2x[4]xf32> {
    %0 = vector.shape_cast %arg0 : vector<4x[2]xf32> to vector<2x[4]xf32>
    return %0 : vector<2x[4]xf32>
  }
}

// -----
module {
}

// -----
module {
  func.func @cannot_cast_to_non_trailing_scalable_dim(%arg0: vector<[4]xf32>) -> vector<[2]x2xf32> {
    %0 = vector.shape_cast %arg0 : vector<[4]xf32> to vector<[2]x2xf32>
    return %0 : vector<[2]x2xf32>
  }
}

// -----
module {
  func.func @cannot_shape_cast_from_non_trailing_scalable_dim(%arg0: vector<[2]x2xf32>) -> vector<[4]xf32> {
    %0 = vector.shape_cast %arg0 : vector<[2]x2xf32> to vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @cannot_shape_cast_more_than_one_scalable_dim(%arg0: vector<[4]x[4]xf32>) -> vector<2x[2]x[4]xf32> {
    %0 = vector.shape_cast %arg0 : vector<[4]x[4]xf32> to vector<2x[2]x[4]xf32>
    return %0 : vector<2x[2]x[4]xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_shape_cast
      } : !transform.any_op
      transform.yield 
    }
  }
}

