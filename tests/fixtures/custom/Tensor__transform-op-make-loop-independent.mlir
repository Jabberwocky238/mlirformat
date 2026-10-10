#map = affine_map<(d0)[s0] -> (-d0 + s0)>
module {
  func.func @make_pad_loop_independent_1(%arg0: index, %arg1: index, %arg2: index, %arg3: tensor<?xf32>, %arg4: f32) {
    scf.for %arg5 = %arg0 to %arg1 step %arg2 {
      %0 = affine.apply #map(%arg5)[%arg1]
      %padded = tensor.pad %arg3 low[5] high[%0] {
      ^bb0(%arg6: index):
        tensor.yield %arg4 : f32
      } : tensor<?xf32> to tensor<?xf32>
      "dummy.some_use"(%padded) : (tensor<?xf32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.tensor.make_loop_independent %0 {num_loops = 1 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0)>
module {
  func.func @make_pad_loop_independent_1(%arg0: index, %arg1: index, %arg2: index, %arg3: tensor<?xf32>, %arg4: f32) {
    scf.for %arg5 = %arg0 to %arg1 step %arg2 {
      %0 = affine.apply #map(%arg5)[%arg1]
      %padded = tensor.pad %arg3 low[%0] high[5] {
      ^bb0(%arg6: index):
        tensor.yield %arg4 : f32
      } : tensor<?xf32> to tensor<?xf32>
      "dummy.some_use"(%padded) : (tensor<?xf32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.tensor.make_loop_independent %0 {num_loops = 1 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @two_loops(%arg0: index, %arg1: index, %arg2: index, %arg3: tensor<?xf32>, %arg4: f32) {
    scf.for %arg5 = %arg0 to %arg1 step %arg2 {
      scf.for %arg6 = %arg0 to %arg1 step %arg2 {
        %0 = affine.apply #map(%arg5, %arg6)
        %padded = tensor.pad %arg3 low[%0] high[5] {
        ^bb0(%arg7: index):
          tensor.yield %arg4 : f32
        } : tensor<?xf32> to tensor<?xf32>
        "dummy.some_use"(%padded) : (tensor<?xf32>) -> ()
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.tensor.make_loop_independent %0 {num_loops = 2 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @not_enough_loops(%arg0: index, %arg1: index, %arg2: index, %arg3: tensor<?xf32>, %arg4: f32) {
    scf.for %arg5 = %arg0 to %arg1 step %arg2 {
      scf.for %arg6 = %arg0 to %arg1 step %arg2 {
        %0 = affine.apply #map(%arg5, %arg6)
        %padded = tensor.pad %arg3 low[%0] high[5] {
        ^bb0(%arg7: index):
          tensor.yield %arg4 : f32
        } : tensor<?xf32> to tensor<?xf32>
        "dummy.some_use"(%padded) : (tensor<?xf32>) -> ()
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.tensor.make_loop_independent %0 {num_loops = 3 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0)>
module {
  func.func @make_empty_loop_independent(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %0 = affine.apply #map(%arg3)[%arg1]
      %1 = tensor.empty(%0) : tensor<?xf32>
      "dummy.some_use"(%1) : (tensor<?xf32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.empty"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.tensor.make_loop_independent %0 {num_loops = 1 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

