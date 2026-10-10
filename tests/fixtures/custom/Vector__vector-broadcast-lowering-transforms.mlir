module {
  func.func @broadcast_vec1d_from_scalar(%arg0: f32) -> vector<2xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @broadcast_vec2d_from_scalar(%arg0: f32) -> vector<2x3xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @broadcast_vec3d_from_scalar(%arg0: f32) -> vector<2x3x4xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2x3x4xf32>
    return %0 : vector<2x3x4xf32>
  }
  func.func @broadcast_vec1d_from_vec1d(%arg0: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @broadcast_vec2d_from_vec1d(%arg0: vector<2xf32>) -> vector<3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<3x2xf32>
    return %0 : vector<3x2xf32>
  }
  func.func @broadcast_vec3d_from_vec1d(%arg0: vector<2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
  func.func @broadcast_vec3d_from_vec2d(%arg0: vector<3x2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<3x2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
  func.func @broadcast_stretch(%arg0: vector<1xf32>) -> vector<4xf32> {
    %0 = vector.broadcast %arg0 : vector<1xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @broadcast_stretch_at_start(%arg0: vector<1x4xf32>) -> vector<3x4xf32> {
    %0 = vector.broadcast %arg0 : vector<1x4xf32> to vector<3x4xf32>
    return %0 : vector<3x4xf32>
  }
  func.func @broadcast_stretch_at_end(%arg0: vector<4x1xf32>) -> vector<4x3xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1xf32> to vector<4x3xf32>
    return %0 : vector<4x3xf32>
  }
  func.func @broadcast_stretch_in_middle(%arg0: vector<4x1x2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1x2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
  func.func @broadcast_scalable_duplication(%arg0: vector<[32]xf32>) -> vector<1x[32]xf32> {
    %0 = vector.broadcast %arg0 : vector<[32]xf32> to vector<1x[32]xf32>
    return %0 : vector<1x[32]xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_broadcast
      } : !transform.any_op
      transform.yield 
    }
  }
}

