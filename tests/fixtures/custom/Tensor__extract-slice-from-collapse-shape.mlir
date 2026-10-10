module {
  func.func @extract_slice_static(%arg0: tensor<3x5x7x11xf32>) -> tensor<20x11xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3]] : tensor<3x5x7x11xf32> into tensor<105x11xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0, 0] [20, 11] [1, 1] : tensor<105x11xf32> to tensor<20x11xf32>
    return %extracted_slice : tensor<20x11xf32>
  }
}

// -----
module {
  func.func @extract_slice_static_strided(%arg0: tensor<3x5x7x11xf32>) -> tensor<10x5xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3]] : tensor<3x5x7x11xf32> into tensor<105x11xf32>
    %extracted_slice = tensor.extract_slice %collapsed[13, 0] [10, 5] [2, 2] : tensor<105x11xf32> to tensor<10x5xf32>
    return %extracted_slice : tensor<10x5xf32>
  }
}

// -----
module {
  func.func @extract_slice_dynamic(%arg0: tensor<3x?x?x11xf32>, %arg1: index, %arg2: index) -> tensor<?x5xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3]] : tensor<3x?x?x11xf32> into tensor<?x11xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1, 0] [%arg2, 5] [2, 2] : tensor<?x11xf32> to tensor<?x5xf32>
    return %extracted_slice : tensor<?x5xf32>
  }
}

// -----
module {
  func.func @extract_slice_dynamic_multidim(%arg0: tensor<3x?x?x11x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3, 4]] : tensor<3x?x?x11x?xf32> into tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1, %arg3] [%arg2, %arg4] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @extract_slice_non_sliced_linearized_dim(%arg0: tensor<3x?x?x11x2xf32>, %arg1: index, %arg2: index) -> tensor<?x22xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3, 4]] : tensor<3x?x?x11x2xf32> into tensor<?x22xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1, 0] [%arg2, 22] [1, 1] : tensor<?x22xf32> to tensor<?x22xf32>
    return %extracted_slice : tensor<?x22xf32>
  }
}

// -----
module {
  func.func @no_sliced_linearized_dims(%arg0: tensor<30x11x100xf32>, %arg1: index, %arg2: index) -> tensor<330x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<30x11x100xf32> into tensor<330x100xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0, %arg1] [330, %arg2] [1, 1] : tensor<330x100xf32> to tensor<330x?xf32>
    return %extracted_slice : tensor<330x?xf32>
  }
}

// -----
module {
  func.func @collapse_and_slice_unit_dim(%arg0: tensor<1x11x100xf32>, %arg1: index, %arg2: index) -> tensor<?x100xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<1x11x100xf32> into tensor<11x100xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1, 0] [%arg2, 100] [1, 1] : tensor<11x100xf32> to tensor<?x100xf32>
    return %extracted_slice : tensor<?x100xf32>
  }
  func.func @collapse_and_slice_multiple_unit_dim_dynamic(%arg0: tensor<1x?x1x100xf32>, %arg1: index, %arg2: index) -> tensor<?x100xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3]] : tensor<1x?x1x100xf32> into tensor<?x100xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1, 0] [%arg2, 100] [1, 1] : tensor<?x100xf32> to tensor<?x100xf32>
    return %extracted_slice : tensor<?x100xf32>
  }
  func.func @collapse_and_slice_multiple_unit_dim_mixed(%arg0: tensor<1x?x1x100x10xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3, 4]] : tensor<1x?x1x100x10xf32> into tensor<?x1000xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1, %arg1] [%arg2, %arg2] [1, 1] : tensor<?x1000xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
  func.func @collapse_and_slice_multiple_all_unit_dim(%arg0: tensor<1x1x1x100xf32>) -> tensor<1x100xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3]] : tensor<1x1x1x100xf32> into tensor<1x100xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0, 0] [1, 100] [1, 1] : tensor<1x100xf32> to tensor<1x100xf32>
    return %extracted_slice : tensor<1x100xf32>
  }
}

