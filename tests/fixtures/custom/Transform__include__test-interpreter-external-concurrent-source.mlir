module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.with_pdl_patterns %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      pdl.pattern @func_return : benefit(1) {
        %0 = operation "func.return" 
        rewrite %0 with "transform.dialect"
      }
      sequence %arg1 : !transform.any_op failures(propagate) {
      ^bb0(%arg2: !transform.any_op):
        %0 = pdl_match @func_return in %arg2 : (!transform.any_op) -> !transform.op<"func.return">
        transform.debug.emit_remark_at %0, "matched" : !transform.op<"func.return">
      }
    }
    transform.yield 
  }
}

