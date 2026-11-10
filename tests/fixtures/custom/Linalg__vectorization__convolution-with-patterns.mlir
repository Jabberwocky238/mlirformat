module {
  func.func @conv1d_nwc_4x2x8_memref(%arg0: memref<4x6x3xf32>, %arg1: memref<1x3x8xf32>, %arg2: memref<4x2x8xf32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x6x3xf32>, memref<1x3x8xf32>) outs(%arg2 : memref<4x2x8xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_nwc_wcf", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_nwc_4x2x8_memref_i1(%arg0: memref<4x6x3xi1>, %arg1: memref<1x3x8xi1>, %arg2: memref<4x2x8xi1>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x6x3xi1>, memref<1x3x8xi1>) outs(%arg2 : memref<4x2x8xi1>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_nwc_wcf", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_nwc_4x2x8_i8i8i32_memref(%arg0: memref<4x6x3xi8>, %arg1: memref<1x3x8xi8>, %arg2: memref<4x2x8xi32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x6x3xi8>, memref<1x3x8xi8>) outs(%arg2 : memref<4x2x8xi32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_nwc_wcf", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_nwc_4x2x8_memref(%arg0: memref<4x6x3xf32>, %arg1: memref<2x3x8xf32>, %arg2: memref<4x2x8xf32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<2> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x6x3xf32>, memref<2x3x8xf32>) outs(%arg2 : memref<4x2x8xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_nwc_wcf", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_nwc_4x2x8_memref(%arg0: memref<4x6x3xf32>, %arg1: memref<2x3x8xf32>, %arg2: memref<4x2x8xf32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x6x3xf32>, memref<2x3x8xf32>) outs(%arg2 : memref<4x2x8xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_nwc_wcf", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_ncw_4x8x2_memref(%arg0: memref<4x3x6xf32>, %arg1: memref<8x3x1xf32>, %arg2: memref<4x8x2xf32>) {
    linalg.conv_1d_ncw_fcw {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x3x6xf32>, memref<8x3x1xf32>) outs(%arg2 : memref<4x8x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_ncw_fcw", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_ncw_4x8x2_memref_i1(%arg0: memref<4x3x6xi1>, %arg1: memref<8x3x1xi1>, %arg2: memref<4x8x2xi1>) {
    linalg.conv_1d_ncw_fcw {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x3x6xi1>, memref<8x3x1xi1>) outs(%arg2 : memref<4x8x2xi1>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_ncw_fcw", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_ncw_4x8x2_memref(%arg0: memref<4x3x6xf32>, %arg1: memref<8x3x2xf32>, %arg2: memref<4x8x2xf32>) {
    linalg.conv_1d_ncw_fcw {dilations = dense<2> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x3x6xf32>, memref<8x3x2xf32>) outs(%arg2 : memref<4x8x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_ncw_fcw", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_ncw_4x8x2_memref(%arg0: memref<4x3x6xf32>, %arg1: memref<8x3x2xf32>, %arg2: memref<4x8x2xf32>) {
    linalg.conv_1d_ncw_fcw {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x3x6xf32>, memref<8x3x2xf32>) outs(%arg2 : memref<4x8x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_ncw_fcw", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_8_tensor(%arg0: tensor<11xf32>, %arg1: tensor<4xf32>, %arg2: tensor<8xf32>) -> tensor<8xf32> {
    %0 = linalg.conv_1d ins(%arg0, %arg1 : tensor<11xf32>, tensor<4xf32>) outs(%arg2 : tensor<8xf32>) -> tensor<8xf32>
    return %0 : tensor<8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv1d_mixed_precision_bf16_f32(%arg0: tensor<5xbf16>, %arg1: tensor<2xbf16>, %arg2: tensor<4xf32>) -> tensor<4xf32> {
    %0 = linalg.conv_1d ins(%arg0, %arg1 : tensor<5xbf16>, tensor<2xbf16>) outs(%arg2 : tensor<4xf32>) -> tensor<4xf32>
    return %0 : tensor<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @depthwise_conv1d_nwc_wc_3x5x4xf32_memref(%arg0: memref<3x5x4xf32>, %arg1: memref<2x4xf32>, %arg2: memref<3x2x4xf32>) {
    linalg.depthwise_conv_1d_nwc_wc {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<3x5x4xf32>, memref<2x4xf32>) outs(%arg2 : memref<3x2x4xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @depthwise_conv1d_nwc_wc_3x5x4xi8_memref(%arg0: memref<3x5x4xi8>, %arg1: memref<2x4xi8>, %arg2: memref<3x2x4xi32>) {
    linalg.depthwise_conv_1d_nwc_wc {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<3x5x4xi8>, memref<2x4xi8>) outs(%arg2 : memref<3x2x4xi32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_1d_nwc_wcf_mixed_type_memref(%arg0: memref<1x2x3xf16>, %arg1: memref<1x3x2xf16>, %arg2: memref<1x2x2xf32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<1> : vector<1xi64>, strides = dense<1> : vector<1xi64>} ins(%arg0, %arg1 : memref<1x2x3xf16>, memref<1x3x2xf16>) outs(%arg2 : memref<1x2x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_nwc_wcf", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_1d_nwc_wcf_mixed_int_fp_memref(%arg0: memref<1x2x3xi8>, %arg1: memref<1x3x2xi8>, %arg2: memref<1x2x2xf32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<1> : vector<1xi64>, strides = dense<1> : vector<1xi64>} ins(%arg0, %arg1 : memref<1x2x3xi8>, memref<1x3x2xi8>) outs(%arg2 : memref<1x2x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d_nwc_wcf", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_nwc_sum_memref_1_2_1_3(%arg0: memref<4x4x3xf32>, %arg1: memref<1xf32>, %arg2: memref<4x2x3xf32>) {
    linalg.pooling_nwc_sum {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x4x3xf32>, memref<1xf32>) outs(%arg2 : memref<4x2x3xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nwc_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_nwc_max_memref_1_2_1_3(%arg0: memref<4x4x3xf32>, %arg1: memref<1xf32>, %arg2: memref<4x2x3xf32>) {
    linalg.pooling_nwc_max {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x4x3xf32>, memref<1xf32>) outs(%arg2 : memref<4x2x3xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nwc_max", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_nwc_sum_i8i8i32_memref_1_2_1_3(%arg0: memref<4x4x3xi8>, %arg1: memref<1xi8>, %arg2: memref<4x2x3xi32>) {
    linalg.pooling_nwc_sum {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x4x3xi8>, memref<1xi8>) outs(%arg2 : memref<4x2x3xi32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nwc_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_nwc_max_i8i8i32_memref_1_2_1_3(%arg0: memref<4x4x3xi8>, %arg1: memref<1xi8>, %arg2: memref<4x2x3xi32>) {
    linalg.pooling_nwc_max {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x4x3xi8>, memref<1xi8>) outs(%arg2 : memref<4x2x3xi32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nwc_max", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_nwc_sum_memref_2_2_2_3(%arg0: memref<4x6x3xf32>, %arg1: memref<2xf32>, %arg2: memref<4x2x3xf32>) {
    linalg.pooling_nwc_sum {dilations = dense<2> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x6x3xf32>, memref<2xf32>) outs(%arg2 : memref<4x2x3xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nwc_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_ncw_sum_memref_1_2_1_3(%arg0: memref<4x3x4xf32>, %arg1: memref<1xf32>, %arg2: memref<4x3x2xf32>) {
    linalg.pooling_ncw_sum {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x3x4xf32>, memref<1xf32>) outs(%arg2 : memref<4x3x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_ncw_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_nwc_sum_mixed_type_memref_1_2_1_1(%arg0: memref<1x2x3xf16>, %arg1: memref<1xf16>, %arg2: memref<1x2x3xf32>) {
    linalg.pooling_nwc_sum {dilations = dense<1> : vector<1xi64>, strides = dense<1> : vector<1xi64>} ins(%arg0, %arg1 : memref<1x2x3xf16>, memref<1xf16>) outs(%arg2 : memref<1x2x3xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nwc_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_nwc_sum_memref_2_2_2_1(%arg0: memref<4x4x3xf32>, %arg1: memref<2xf32>, %arg2: memref<4x2x3xf32>) {
    linalg.pooling_nwc_sum {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x4x3xf32>, memref<2xf32>) outs(%arg2 : memref<4x2x3xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_nwc_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_ncw_sum_memref_2_2_2_3(%arg0: memref<4x3x6xf32>, %arg1: memref<2xf32>, %arg2: memref<4x3x2xf32>) {
    linalg.pooling_ncw_sum {dilations = dense<2> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x3x6xf32>, memref<2xf32>) outs(%arg2 : memref<4x3x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_ncw_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pooling_ncw_sum_memref_2_3_2_1(%arg0: memref<4x2x5xf32>, %arg1: memref<2xf32>, %arg2: memref<4x2x3xf32>) {
    linalg.pooling_ncw_sum {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x2x5xf32>, memref<2xf32>) outs(%arg2 : memref<4x2x3xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pooling_ncw_sum", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

