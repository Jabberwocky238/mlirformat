module {
  func.func @vector_deinterleave_2d(%arg0: vector<2x8xi32>) -> (vector<2x4xi32>, vector<2x4xi32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x8xi32> -> vector<2x4xi32>
    return %res1, %res2 : vector<2x4xi32>, vector<2x4xi32>
  }
  func.func @vector_deinterleave_2d_scalable(%arg0: vector<2x[8]xi32>) -> (vector<2x[4]xi32>, vector<2x[4]xi32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x[8]xi32> -> vector<2x[4]xi32>
    return %res1, %res2 : vector<2x[4]xi32>, vector<2x[4]xi32>
  }
  func.func @vector_deinterleave_4d(%arg0: vector<1x2x3x8xi64>) -> (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<1x2x3x8xi64> -> vector<1x2x3x4xi64>
    return %res1, %res2 : vector<1x2x3x4xi64>, vector<1x2x3x4xi64>
  }
  func.func @vector_deinterleave_nd_with_scalable_dim(%arg0: vector<1x3x[2]x2x3x8xf16>) -> (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<1x3x[2]x2x3x8xf16> -> vector<1x3x[2]x2x3x4xf16>
    return %res1, %res2 : vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_interleave
      } : !transform.any_op
      transform.yield 
    }
  }
}

