module attributes {transform.with_named_sequence} {
  transform.named_sequence @external_def(%arg0: !transform.any_op {transform.readonly}) {
    transform.print %arg0 {name = "external_def"} : !transform.any_op
    transform.yield 
  }
}

