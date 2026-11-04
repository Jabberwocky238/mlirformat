module {
  func.func @ins_1_index_outs_none_results_1_index(%arg0: index) -> index {
    %0 = test.destination_style_op ins(%arg0 : index) -> index
    return %0 : index
  }
}

// -----
// -----
module {
  func.func @ins_1_tensor_outs_none_results_1_index(%arg0: tensor<2x2xf32>) -> index {
    %0 = test.destination_style_op ins(%arg0 : tensor<2x2xf32>) -> index
    return %0 : index
  }
}

// -----
// -----
// -----
module {
  func.func @ins_1_index_outs_1_tensor_results_1_tensor(%arg0: index, %arg1: tensor<2x2xf32>) -> tensor<2x2xf32> {
    %0 = test.destination_style_op ins(%arg0 : index) outs(%arg1 : tensor<2x2xf32>) -> tensor<2x2xf32>
    return %0 : tensor<2x2xf32>
  }
}

// -----
// -----
module {
  func.func @ins_1_tensor_outs_1_tensor_results_1_tensor(%arg0: tensor<2x2xf32>, %arg1: tensor<2x2xf32>) -> tensor<2x2xf32> {
    %0 = test.destination_style_op ins(%arg0 : tensor<2x2xf32>) outs(%arg1 : tensor<2x2xf32>) -> tensor<2x2xf32>
    return %0 : tensor<2x2xf32>
  }
}

