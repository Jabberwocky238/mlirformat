module attributes {transform.with_named_sequence} {
  transform.named_sequence @emit_warning_only(%arg0: !transform.any_op {transform.consumed}) {
    transform.debug.emit_remark_at %arg0, "message" : !transform.any_op
    transform.yield 
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    include @emit_warning_only failures(propagate) (%arg0) : (!transform.any_op) -> ()
  }
}

