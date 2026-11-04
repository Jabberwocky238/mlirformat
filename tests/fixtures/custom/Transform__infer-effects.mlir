module attributes {transform.with_named_sequence} {
  transform.named_sequence @infer(%arg0: !transform.any_op, %arg1: !transform.any_op, %arg2: !transform.param<i32>) {
    transform.test_consume_operand %arg0 : !transform.any_op
    transform.debug.emit_remark_at %arg1, "" : !transform.any_op
    transform.yield 
  }
}

