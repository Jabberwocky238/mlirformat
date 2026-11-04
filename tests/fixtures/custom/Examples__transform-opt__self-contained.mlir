module attributes {transform.with_named_sequence} {
  transform.named_sequence private @__transform_main(%arg0: !transform.any_op) {
    transform.print %arg0 {name = "in self-contained"} : !transform.any_op
    transform.yield 
  }
}

