module {
  func.func @decompose_dynamic_concat(%arg0: tensor<8x4xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %concat = tensor.concat dim(1) %arg0, %arg1 : (tensor<8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    return %concat : tensor<?x?xf32>
  }
  func.func @decompose_1d_concat(%arg0: tensor<1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<3xf32>, %arg3: tensor<4xf32>) -> tensor<10xf32> {
    %concat = tensor.concat dim(0) %arg0, %arg1, %arg2, %arg3 : (tensor<1xf32>, tensor<2xf32>, tensor<3xf32>, tensor<4xf32>) -> tensor<10xf32>
    return %concat : tensor<10xf32>
  }
  func.func @decompose_static_concat_dim(%arg0: tensor<1x?x64xf32>, %arg1: tensor<1x?x64xf32>) -> tensor<1x?x128xf32> {
    %concat = tensor.concat dim(2) %arg0, %arg1 : (tensor<1x?x64xf32>, tensor<1x?x64xf32>) -> tensor<1x?x128xf32>
    return %concat : tensor<1x?x128xf32>
  }
  func.func @decompose_dynamic_into_static_concat_dim(%arg0: tensor<1x?x?xf32>, %arg1: tensor<1x?x?xf32>) -> tensor<1x?x128xf32> {
    %concat = tensor.concat dim(2) %arg0, %arg1 : (tensor<1x?x?xf32>, tensor<1x?x?xf32>) -> tensor<1x?x128xf32>
    return %concat : tensor<1x?x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.decompose_concat
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

