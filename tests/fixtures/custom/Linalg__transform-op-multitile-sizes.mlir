module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %low_size, %high_size, %split_point = transform.structured.multitile_sizes %0 {dimension = 0 : i64, target_size = 3 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @multitile_sizes_static(%arg0: tensor<13x34xf32>, %arg1: tensor<34x42xf32>, %arg2: tensor<13x42xf32>) -> tensor<13x42xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<13x34xf32>, tensor<34x42xf32>) outs(%arg2 : tensor<13x42xf32>) -> tensor<13x42xf32>
    return %0 : tensor<13x42xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %low_size, %high_size, %split_point = transform.structured.multitile_sizes %0 {dimension = 0 : i64, target_size = 3 : i64} : (!transform.any_op) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %low_size : !transform.param<i64>
      transform.debug.emit_param_as_remark %high_size : !transform.param<i64>
      transform.debug.emit_param_as_remark %split_point : !transform.param<i64>
      transform.yield 
    }
  }
  func.func @multitile_sizes_static_gen(%arg0: tensor<13x34xf32>, %arg1: tensor<34x42xf32>, %arg2: tensor<13x42xf32>) -> tensor<13x42xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<13x34xf32>, tensor<34x42xf32>) outs(%arg2 : tensor<13x42xf32>) -> tensor<13x42xf32>
    return %0 : tensor<13x42xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %low_size, %high_size, %split_point = transform.structured.multitile_sizes %0 {dimension = 0 : i64, divisor = 2 : i64, target_size = 3 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @multitile_sizes_dynamic(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %low_size, %high_size, %split_point = transform.structured.multitile_sizes %0 {dimension = 0 : i64, divisor = 2 : i64, target_size = 3 : i64} : (!transform.any_op) -> !transform.param<i64>
      transform.yield 
    }
  }
  func.func @multitile_sizes_dynamic_gen(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

