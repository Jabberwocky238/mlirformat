module attributes {transform.with_named_sequence} {
  transform.named_sequence private @external_def(!transform.any_op {transform.readonly})
  transform.named_sequence private @__transform_main(%arg0: !transform.any_op) {
    transform.include @external_def failures(propagate) (%arg0) : (!transform.any_op) -> ()
    transform.yield 
  }
}

