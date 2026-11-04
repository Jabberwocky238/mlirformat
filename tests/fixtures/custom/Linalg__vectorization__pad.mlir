module {
  func.func @test_masked_vectorize_pad(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> tensor<2x4xf32> {
    %cst = arith.constant 4.243000e+01 : f32
    %c0 = arith.constant 0 : index
    %padded = tensor.pad %arg0 low[0, %c0] high[%arg1, %arg2] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32> to tensor<2x4xf32>
    return %padded : tensor<2x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_masked_vectorize_dynamic_pad(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %cst = arith.constant 4.243000e+01 : f32
    %c0 = arith.constant 0 : index
    %padded = tensor.pad %arg0 low[0, %c0] high[%arg1, %arg2] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    return %padded : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_masked_vectorize_non_zero_low_pad_unit_res_dim(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<1x4xf32> {
    %cst = arith.constant 4.243000e+01 : f32
    %c0 = arith.constant 0 : index
    %padded = tensor.pad %arg0 low[%arg3, %c0] high[%arg1, %arg2] {
    ^bb0(%arg4: index, %arg5: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32> to tensor<1x4xf32>
    return %padded : tensor<1x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 4] : !transform.any_op
      transform.yield 
    }
  }
}

