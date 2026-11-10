module attributes {transform.with_named_sequence} {
  func.func @test_loop_peeling_not_beneficial() {
    %c0 = arith.constant 0 : index
    %c40 = arith.constant 40 : index
    %c5 = arith.constant 5 : index
    scf.for %arg0 = %c0 to %c40 step %c5 {
      %0 = arith.addi %arg0, %arg0 : index
    }
    return
  }
  transform.named_sequence @peel(%arg0: !transform.op<"scf.for"> {transform.consumed}) {
    %peeled_loop, %remainder_loop = transform.loop.peel %arg0 : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op)
    transform.yield 
  }
  transform.named_sequence @match_for(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
    transform.match.operation_name %arg0 ["scf.for"] : !transform.any_op
    transform.yield %arg0 : !transform.any_op
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.sequence %arg0 : !transform.any_op failures(suppress) {
    ^bb0(%arg1: !transform.any_op):
      %updated_root = foreach_match in %arg1 
          @match_for -> @peel : (!transform.any_op) -> !transform.any_op
    }
    transform.yield 
  }
}

