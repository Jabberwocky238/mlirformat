module {
  func.func @vector_bitcast_0d(%arg0: vector<i32>) -> vector<f32> {
    %0 = vector.bitcast %arg0 : vector<i32> to vector<f32>
    return %0 : vector<f32>
  }
  func.func @vector_bitcast_1d(%arg0: vector<10xi64>) -> vector<20xi32> {
    %0 = vector.bitcast %arg0 : vector<10xi64> to vector<20xi32>
    return %0 : vector<20xi32>
  }
  func.func @vector_bitcast_2d(%arg0: vector<2x4xi32>) -> vector<2x2xi64> {
    %0 = vector.bitcast %arg0 : vector<2x4xi32> to vector<2x2xi64>
    return %0 : vector<2x2xi64>
  }
  func.func @vector_bitcast_4d_with_scalable_dim(%arg0: vector<1x2x[3]x4xi64>) -> vector<1x2x[3]x8xi32> {
    %0 = vector.bitcast %arg0 : vector<1x2x[3]x4xi64> to vector<1x2x[3]x8xi32>
    return %0 : vector<1x2x[3]x8xi32>
  }
  func.func @vector_bitcast_2d_trailing_scalable_dim(%arg0: vector<2x[2]xi64>) -> vector<2x[4]xi32> {
    %0 = vector.bitcast %arg0 : vector<2x[2]xi64> to vector<2x[4]xi32>
    return %0 : vector<2x[4]xi32>
  }
  func.func @negative_vector_bitcast_2d_leading_scalable_dim(%arg0: vector<[2]x2xi64>) -> vector<[2]x4xi32> {
    %0 = vector.bitcast %arg0 : vector<[2]x2xi64> to vector<[2]x4xi32>
    return %0 : vector<[2]x4xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_bitcast
      } : !transform.any_op
      transform.yield 
    }
  }
}

