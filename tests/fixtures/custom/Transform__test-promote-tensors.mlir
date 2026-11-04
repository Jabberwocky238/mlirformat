module {
  func.func @promote_in0(%arg0: tensor<?x42xf32>, %arg1: tensor<42x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x42xf32>, tensor<42x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_operand %0[0] : (!transform.any_op) -> !transform.any_value
      %2 = transform.structured.promote_tensor to 1 : i64 %1 : !transform.any_value
      transform.yield 
    }
  }
}

// -----
module {
  func.func @promote_out(%arg0: tensor<?x42xf32>, %arg1: tensor<?x42xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<?x42xf32>, tensor<?x42xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_operand %0[2] : (!transform.any_op) -> !transform.any_value
      %2 = transform.structured.promote_tensor to 1 : i64 %1 : !transform.any_value
      transform.yield 
    }
  }
}

// -----
module {
  func.func @promote_in0_out_bufferize(%arg0: tensor<?x42xf32>, %arg1: tensor<42x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<?x42xf32>, tensor<42x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_operand %0[0] : (!transform.any_op) -> !transform.any_value
      %2 = transform.structured.promote_tensor to 1 : i64 %1 : !transform.any_value
      %3 = transform.get_operand %0[2] : (!transform.any_op) -> !transform.any_value
      %4 = transform.structured.promote_tensor to 1 : i64 %3 : !transform.any_value
      %5 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %6 = transform.bufferization.one_shot_bufferize %5 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

