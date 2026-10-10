module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.fold_tensor_empty
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func @empty_reshape_expansion(%arg0: index, %arg1: index) -> tensor<2x3x5x4x?x7xf32> {
    %0 = tensor.empty(%arg0) : tensor<6x5x?xf32>
    %expanded = tensor.expand_shape %0 [[0, 1], [2], [3, 4, 5]] output_shape [2, 3, 5, 4, %arg1, 7] : tensor<6x5x?xf32> into tensor<2x3x5x4x?x7xf32>
    return %expanded : tensor<2x3x5x4x?x7xf32>
  }
  func.func @empty_reshape_collapse(%arg0: index) -> tensor<6x5x?xf32> {
    %0 = tensor.empty(%arg0) : tensor<2x3x5x4x?x7xf32>
    %collapsed = tensor.collapse_shape %0 [[0, 1], [2], [3, 4, 5]] : tensor<2x3x5x4x?x7xf32> into tensor<6x5x?xf32>
    return %collapsed : tensor<6x5x?xf32>
  }
  func.func @fold_empty_tensor_with_slice(%arg0: index, %arg1: index) -> tensor<5x?x20xf32> {
    %0 = tensor.empty(%arg0) : tensor<?x10x40xf32>
    %extracted_slice = tensor.extract_slice %0[0, 0, 0] [5, %arg1, 20] [1, 1, 1] : tensor<?x10x40xf32> to tensor<5x?x20xf32>
    return %extracted_slice : tensor<5x?x20xf32>
  }
  func.func @rank_reducing_empty_tensor_extract(%arg0: index, %arg1: index) -> tensor<2xf32> {
    %0 = tensor.empty(%arg0) : tensor<?x2xf32>
    %extracted_slice = tensor.extract_slice %0[%arg1, 0] [1, 2] [1, 1] : tensor<?x2xf32> to tensor<2xf32>
    return %extracted_slice : tensor<2xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.fold_tensor_empty {fold_single_use_only = true}
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func @double_use_of_tensor_empty(%arg0: index, %arg1: index) -> (tensor<5x?x20xf32>, tensor<5x?x20xf32>) {
    %0 = tensor.empty(%arg0) : tensor<?x10x40xf32>
    %extracted_slice = tensor.extract_slice %0[0, 0, 0] [5, %arg1, 20] [1, 1, 1] : tensor<?x10x40xf32> to tensor<5x?x20xf32>
    %extracted_slice_0 = tensor.extract_slice %0[1, 1, 1] [5, %arg1, 20] [1, 1, 1] : tensor<?x10x40xf32> to tensor<5x?x20xf32>
    return %extracted_slice, %extracted_slice_0 : tensor<5x?x20xf32>, tensor<5x?x20xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.fold_tensor_empty
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func @concats_of_empty(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> tensor<5x?x?xf32> {
    %0 = tensor.empty(%arg0, %arg1) : tensor<5x?x?xf32>
    %1 = tensor.empty(%arg2, %arg3) : tensor<5x?x?xf32>
    %concat = tensor.concat dim(1) %0, %1 : (tensor<5x?x?xf32>, tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
    return %concat : tensor<5x?x?xf32>
  }
}

