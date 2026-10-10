module {
  func.func private @callee(index, index)
  func.func @two_iters(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      func.call @callee(%arg6, %arg7) : (index, index) -> ()
      scf.reduce 
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.parallel"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.loop.parallel_for_to_nested_fors %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @callee(index, index)
  func.func @repeated(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      func.call @callee(%arg6, %arg7) : (index, index) -> ()
      scf.reduce 
    }
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      func.call @callee(%arg6, %arg7) : (index, index) -> ()
      scf.reduce 
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.parallel"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.loop.parallel_for_to_nested_fors %0 : (!transform.any_op) -> !transform.any_op
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
      %1 = transform.loop.parallel_for_to_nested_fors %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

