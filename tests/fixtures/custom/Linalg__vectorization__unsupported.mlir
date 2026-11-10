module {
  func.func @insert_dynamic_slice_unknown_pad(%arg0: tensor<1x?x3xf32>, %arg1: tensor<9x8x7x1x2x3xf32>, %arg2: index) -> tensor<9x8x7x1x2x3xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0, 0, 0, 0, 0, 0] [1, 1, 1, 1, %arg2, 3] [1, 1, 1, 1, 1, 1] : tensor<1x?x3xf32> into tensor<9x8x7x1x2x3xf32>
    return %inserted_slice : tensor<9x8x7x1x2x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

