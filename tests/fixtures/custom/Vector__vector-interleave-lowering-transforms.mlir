module {
  func.func @vector_interleave_2d(%arg0: vector<2x3xi8>, %arg1: vector<2x3xi8>) -> vector<2x6xi8> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x3xi8> -> vector<2x6xi8>
    return %0 : vector<2x6xi8>
  }
  func.func @vector_interleave_2d_scalable(%arg0: vector<2x[8]xi16>, %arg1: vector<2x[8]xi16>) -> vector<2x[16]xi16> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x[8]xi16> -> vector<2x[16]xi16>
    return %0 : vector<2x[16]xi16>
  }
  func.func @vector_interleave_4d(%arg0: vector<1x2x3x4xi64>, %arg1: vector<1x2x3x4xi64>) -> vector<1x2x3x8xi64> {
    %0 = vector.interleave %arg0, %arg1 : vector<1x2x3x4xi64> -> vector<1x2x3x8xi64>
    return %0 : vector<1x2x3x8xi64>
  }
  func.func @vector_interleave_nd_with_scalable_dim(%arg0: vector<1x3x[2]x2x3x4xf16>, %arg1: vector<1x3x[2]x2x3x4xf16>) -> vector<1x3x[2]x2x3x8xf16> {
    %0 = vector.interleave %arg0, %arg1 : vector<1x3x[2]x2x3x4xf16> -> vector<1x3x[2]x2x3x8xf16>
    return %0 : vector<1x3x[2]x2x3x8xf16>
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

