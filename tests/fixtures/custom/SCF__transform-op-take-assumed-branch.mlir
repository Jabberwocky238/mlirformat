module {
  func.func @if_no_else(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8) {
    scf.if %arg0 {
      "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.if"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.scf.take_assumed_branch %0 take_else_branch : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
module {
  func.func @if_no_else(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8) {
    scf.if %arg0 {
      "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.if"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["some_op"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.scf.take_assumed_branch %0 : (!transform.any_op) -> ()
      transform.print %1 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_tensor_pad(%arg0: tensor<?x?xf32>, %arg1: f32, %arg2: index, %arg3: index) -> tensor<20x40xf32> {
    %padded = tensor.pad %arg0 nofold low[%arg2, %arg2] high[%arg3, %arg3] {
    ^bb0(%arg4: index, %arg5: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?xf32> to tensor<20x40xf32>
    return %padded : tensor<20x40xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0 tile_sizes [1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %1 = transform.structured.match ops{["scf.if"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.scf.take_assumed_branch %1 take_else_branch : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

