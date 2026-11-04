module attributes {transform.with_named_sequence} {
  transform.named_sequence @unroll_to_elements(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    transform.apply_patterns to %0 {
      transform.apply_patterns.vector.unroll_to_elements
      transform.apply_patterns.vector.unroll_from_elements
    } : !transform.any_op
    transform.yield 
  }
}

