module {
  func.func @nop_shape_cast(%arg0: vector<16xf32>) -> vector<16xf32> {
    %0 = vector.shape_cast %arg0 : vector<16xf32> to vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @cancel_shape_cast(%arg0: vector<16xf32>) -> vector<16xf32> {
    %0 = vector.shape_cast %arg0 : vector<16xf32> to vector<4x4xf32>
    %1 = vector.shape_cast %0 : vector<4x4xf32> to vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @shape_cast_2d1d(%arg0: vector<2x2xf32>) -> vector<4xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x2xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @shape_cast_3d1d(%arg0: vector<1x3x2xf32>) -> vector<6xf32> {
    %0 = vector.shape_cast %arg0 : vector<1x3x2xf32> to vector<6xf32>
    return %0 : vector<6xf32>
  }
  func.func @shape_cast_1d2d(%arg0: vector<4xf32>) -> vector<2x2xf32> {
    %0 = vector.shape_cast %arg0 : vector<4xf32> to vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @shape_cast_1d3d(%arg0: vector<6xf32>) -> vector<2x1x3xf32> {
    %0 = vector.shape_cast %arg0 : vector<6xf32> to vector<2x1x3xf32>
    return %0 : vector<2x1x3xf32>
  }
  func.func @shape_cast_2d2d(%arg0: vector<3x2xf32>) -> vector<2x3xf32> {
    %0 = vector.shape_cast %arg0 : vector<3x2xf32> to vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @shape_cast_0d1d(%arg0: vector<f32>) -> vector<1xf32> {
    %0 = vector.shape_cast %arg0 : vector<f32> to vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @shape_cast_1d0d(%arg0: vector<1xf32>) -> vector<f32> {
    %0 = vector.shape_cast %arg0 : vector<1xf32> to vector<f32>
    return %0 : vector<f32>
  }
  func.func @squeeze_out_prefix_unit_dim(%arg0: vector<1x2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.shape_cast %arg0 : vector<1x2x3xf32> to vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @squeeze_out_middle_unit_dim(%arg0: vector<2x1x3xf32>) -> vector<2x3xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x1x3xf32> to vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @prepend_unit_dim(%arg0: vector<2x3xf32>) -> vector<1x2x3xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x3xf32> to vector<1x2x3xf32>
    return %0 : vector<1x2x3xf32>
  }
  func.func @insert_middle_unit_dim(%arg0: vector<2x3xf32>) -> vector<2x1x3xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x3xf32> to vector<2x1x3xf32>
    return %0 : vector<2x1x3xf32>
  }
  func.func @postpend_unit_dims(%arg0: vector<4xf32>) -> vector<4x1x1xf32> {
    %0 = vector.shape_cast %arg0 : vector<4xf32> to vector<4x1x1xf32>
    return %0 : vector<4x1x1xf32>
  }
  func.func @expand_inner_dims(%arg0: vector<2x10xf32>) -> vector<2x2x5xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x10xf32> to vector<2x2x5xf32>
    return %0 : vector<2x2x5xf32>
  }
  func.func @collapse_inner_dims(%arg0: vector<2x2x5xi8>) -> vector<1x2x1x10xi8> {
    %0 = vector.shape_cast %arg0 : vector<2x2x5xi8> to vector<1x2x1x10xi8>
    return %0 : vector<1x2x1x10xi8>
  }
  func.func @non_dividing_gcd_decreasing(%arg0: vector<2x15xi8>) -> vector<3x10xi8> {
    %0 = vector.shape_cast %arg0 : vector<2x15xi8> to vector<3x10xi8>
    return %0 : vector<3x10xi8>
  }
  func.func @non_dividing_gcd_increasing(%arg0: vector<3x10xi8>) -> vector<2x15xi8> {
    %0 = vector.shape_cast %arg0 : vector<3x10xi8> to vector<2x15xi8>
    return %0 : vector<2x15xi8>
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

