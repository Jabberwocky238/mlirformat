module {
  func.func private @callee(index, index)
  func.func @two_iters(%arg0: index, %arg1: index) {
    scf.forall (%arg2, %arg3) in (%arg0, %arg1) {
      func.call @callee(%arg2, %arg3) : (index, index) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.loop.forall_to_parallel %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @callee(index, index)
  func.func @repeated(%arg0: index, %arg1: index) {
    scf.forall (%arg2, %arg3) in (%arg0, %arg1) {
      func.call @callee(%arg2, %arg3) : (index, index) -> ()
    }
    scf.forall (%arg2, %arg3) in (%arg0, %arg1) {
      func.call @callee(%arg2, %arg3) : (index, index) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.loop.forall_to_parallel %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @callee(index, index)
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.loop.forall_to_for %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

