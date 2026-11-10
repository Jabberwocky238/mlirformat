module attributes {transform.with_named_sequence} {
  transform.named_sequence @do_nothing(%arg0: !transform.any_op {transform.readonly}) {
    transform.yield 
  }
  transform.named_sequence @print_in_matcher(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    transform.print %arg0 : !transform.any_op
    transform.yield %arg0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %updated_root = transform.foreach_match in %arg0 
        @print_in_matcher -> @do_nothing : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
  func.func @payload() attributes {transform.target_tag = "start_here"} {
    %0 = "test.print_me"() : () -> i1
    return
  }
}

