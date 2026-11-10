module {
  func.func private @bar()
  func.func @foo() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c0 to %c1 step %c10 {
      scf.for %arg1 = %c0 to %c1 step %c10 {
        func.call @bar() : () -> ()
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.op<"scf.for">
      transform.test_consume_operand_each %0 : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

