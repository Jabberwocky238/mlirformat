module {
  func.func @vector_interleave_to_shuffle(%arg0: vector<7xi16>, %arg1: vector<7xi16>) -> vector<14xi16> {
    %0 = vector.interleave %arg0, %arg1 : vector<7xi16> -> vector<14xi16>
    return %0 : vector<14xi16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.interleave_to_shuffle
      } : !transform.any_op
      transform.yield 
    }
  }
}

