module {
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    transform.match.structured %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.dim %arg1[all] : !transform.any_op
      transform.match.structured.dim %arg1[0] : !transform.any_op
      transform.match.structured.dim %arg1[0, 1, -2] : !transform.any_op
      transform.match.structured.dim %arg1[except(0)] : !transform.any_op
      transform.match.structured.dim %arg1[except(0, -1, 2)] : !transform.any_op
    }
    transform.match.structured %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
    }
    %0 = transform.match.structured %arg0 : (!transform.any_op) -> !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.yield %arg1 : !transform.any_op
    }
    %1:2 = transform.match.structured %arg0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op) {
    ^bb0(%arg1: !transform.any_op):
      transform.match.structured.yield %arg1, %arg1 : !transform.any_op, !transform.any_op
    }
  }
}

