module {
  func.func @cast_to_dynamic(%arg0: tensor<10x13xf32>, %arg1: tensor<3x13xf32>) -> tensor<13x13xf32> {
    %concat = tensor.concat dim(0) %arg0, %arg1 : (tensor<10x13xf32>, tensor<3x13xf32>) -> tensor<13x13xf32>
    return %concat : tensor<13x13xf32>
  }
  func.func private @concat_replacement(tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["tensor.concat"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %3 = transform.get_operand %2[all] : (!transform.any_op) -> !transform.any_value
      %4 = transform.get_result %2[all] : (!transform.any_op) -> !transform.any_value
      %5 = transform.func.cast_and_call %1#1(%3) -> %4 before %2 {
        transform.type_conversion.tensor.cast_shape_dynamic_dims
      } : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      transform.apply_dce to %1#0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @cast_to_static(%arg0: tensor<?x?xf32>) -> tensor<?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<?x?xf32> into tensor<?xf32>
    return %collapsed : tensor<?xf32>
  }
  func.func private @collapse_replacement(tensor<4x5xf32>) -> tensor<20xf32>
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["tensor.collapse_shape"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %3 = transform.get_operand %2[all] : (!transform.any_op) -> !transform.any_value
      %4 = transform.get_result %2[all] : (!transform.any_op) -> !transform.any_value
      %5 = transform.func.cast_and_call %1#1(%3) -> %4 before %2 {
        transform.type_conversion.tensor.cast_shape_dynamic_dims ignore_dynamic_info
      } : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      transform.apply_dce to %1#0 : !transform.any_op
      transform.yield 
    }
  }
}

