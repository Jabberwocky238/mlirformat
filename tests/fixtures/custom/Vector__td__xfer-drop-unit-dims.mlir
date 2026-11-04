module @transforms attributes {transform.with_named_sequence} {
  transform.named_sequence @drop_unit_dims(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %0 {
      transform.apply_patterns.vector.drop_inner_most_unit_dims_from_xfer_ops
    } : !transform.op<"func.func">
    transform.yield 
  }
}

