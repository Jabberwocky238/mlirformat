module {
  func.func @bar() {
    "another_op"() : () -> ()
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.replace %0 {
        builtin.module {
          func.func @foo() {
            "dummy_op"() : () -> ()
          }
        }
      } : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

