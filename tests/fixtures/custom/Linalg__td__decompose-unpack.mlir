module @transforms attributes {transform.with_named_sequence} {
  transform.named_sequence @decompose_unpack(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
    transform.apply_patterns to %1 {
      transform.apply_patterns.linalg.decompose_pack_unpack
    } : !transform.any_op
    transform.yield 
  }
}

