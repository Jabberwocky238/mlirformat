module attributes {transform.with_named_sequence} {
  transform.named_sequence @flatten(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    transform.apply_patterns to %0 {
      transform.apply_patterns.vector.flatten_vector_transfer_ops
    } : !transform.any_op
    transform.yield 
  }
}

