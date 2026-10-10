module {
  func.func @generalize_unary(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @map_no_inputs(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>) -> tensor<16x64xf32> {
    %reduced = linalg.reduce { arith.addf } ins(%arg0 : tensor<16x32x64xf32>) outs(%arg1 : tensor<16x64xf32>) dimensions = [1] 
    return %reduced : tensor<16x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.generalize %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

