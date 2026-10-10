module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.rewrite_as_constant
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func @tensor_generate_constant() -> tensor<2x3x5xf32> {
    %cst = arith.constant 5.000000e+00 : f32
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<2x3x5xf32>
    return %generated : tensor<2x3x5xf32>
  }
  func.func @pad_of_ints() -> tensor<?x?xi32> {
    %cst = arith.constant dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %padded = tensor.pad %cst low[%c1, %c1] high[%c1, %c1] {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x2xi32> to tensor<?x?xi32>
    return %padded : tensor<?x?xi32>
  }
  func.func @pad_of_floats() -> tensor<4x4xf32> {
    %cst = arith.constant dense<[[6.000000e+00, 7.000000e+00], [8.000000e+00, 9.000000e+00]]> : tensor<2x2xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %cst low[1, 1] high[1, 1] {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %cst_0 : f32
    } : tensor<2x2xf32> to tensor<4x4xf32>
    return %padded : tensor<4x4xf32>
  }
  func.func @pad_of_ints_no_low_dims() -> tensor<3x3xi32> {
    %cst = arith.constant dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %cst low[0, 0] high[1, 1] {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x2xi32> to tensor<3x3xi32>
    return %padded : tensor<3x3xi32>
  }
  func.func @pad_of_ints_no_high_dims() -> tensor<3x3xi32> {
    %cst = arith.constant dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %cst low[1, 1] high[0, 0] {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x2xi32> to tensor<3x3xi32>
    return %padded : tensor<3x3xi32>
  }
  func.func @pad_multi_use_do_not_fold() -> (tensor<?x?xi32>, tensor<2x2xi32>) {
    %cst = arith.constant dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %padded = tensor.pad %cst low[%c1, %c1] high[%c1, %c1] {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x2xi32> to tensor<?x?xi32>
    return %padded, %cst : tensor<?x?xi32>, tensor<2x2xi32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.rewrite_as_constant aggressive
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func @pad_aggressive_fold() -> (tensor<?x?xi32>, tensor<2x2xi32>) {
    %cst = arith.constant dense<7> : tensor<2x2xi32>
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %padded = tensor.pad %cst low[%c1, %c1] high[%c1, %c1] {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x2xi32> to tensor<?x?xi32>
    return %padded, %cst : tensor<?x?xi32>, tensor<2x2xi32>
  }
}

