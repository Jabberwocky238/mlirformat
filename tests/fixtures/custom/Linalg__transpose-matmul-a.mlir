module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.structured.match ops{["linalg.matmul", "linalg.batch_matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.structured.transpose_matmul %0 : (!transform.any_op) -> !transform.any_op
    %2 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    transform.apply_cse to %2 : !transform.any_op
    transform.apply_patterns to %2 {
      transform.apply_patterns.canonicalization
    } : !transform.any_op
    transform.yield 
  }
}

