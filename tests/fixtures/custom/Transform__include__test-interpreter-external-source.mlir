module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.debug.emit_remark_at %arg0, "outer" : !transform.any_op
    transform.sequence %arg0 : !transform.any_op failures(propagate) attributes {transform.target_tag = "transform"} {
    ^bb0(%arg1: !transform.any_op):
      transform.debug.emit_remark_at %arg1, "inner" : !transform.any_op
    }
    transform.yield 
  }
}

