module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.yield 
  }
  func.func @f() {
    return
  }
  func.func @main() {
    "test.conversion_call_op"() <{callee = @f}> {noinline} : () -> ()
    return
  }
}

