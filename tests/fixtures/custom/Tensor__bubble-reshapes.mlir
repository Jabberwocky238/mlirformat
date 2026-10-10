module {
  func.func @bubble_parallel_reshapes(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3]] : tensor<?x?x?x?xf32> into tensor<?x?x?xf32>
    %expanded = tensor.expand_shape %collapsed [[0], [1], [2, 3]] output_shape [%arg1, %arg2, %arg3, %arg4] : tensor<?x?x?xf32> into tensor<?x?x?x?xf32>
    return %expanded : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @no_bubble_full_intersecting_reshapes(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3]] : tensor<?x?x?x?xf32> into tensor<?x?x?xf32>
    %expanded = tensor.expand_shape %collapsed [[0], [1, 2], [3]] output_shape [%arg1, %arg2, %arg3, %arg4] : tensor<?x?x?xf32> into tensor<?x?x?x?xf32>
    return %expanded : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @no_bubble_partial_intersecting_reshapes(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3]] : tensor<?x?x?x?xf32> into tensor<?x?xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1], [2, 3]] output_shape [%arg1, %arg2, %arg3, %arg4] : tensor<?x?xf32> into tensor<?x?x?x?xf32>
    return %expanded : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @no_bubble_0d_tensor_reshapes(%arg0: tensor<1x1xf32>) -> tensor<1x1x1xf32> {
    %collapsed = tensor.collapse_shape %arg0 [] : tensor<1x1xf32> into tensor<f32>
    %expanded = tensor.expand_shape %collapsed [] output_shape [1, 1, 1] : tensor<f32> into tensor<1x1x1xf32>
    return %expanded : tensor<1x1x1xf32>
  }
}

// -----
module {
  func.func @bubble_expand_match_non_unit_size_reassocation(%arg0: tensor<4x?x4x32x4x?xf16>, %arg1: index, %arg2: index) -> tensor<4x?x4x128x?x32xf16> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3, 4], [5]] : tensor<4x?x4x32x4x?xf16> into tensor<?x128x?xf16>
    %expanded = tensor.expand_shape %collapsed [[0, 1, 2], [3], [4, 5]] output_shape [4, %arg1, 4, 128, %arg2, 32] : tensor<?x128x?xf16> into tensor<4x?x4x128x?x32xf16>
    return %expanded : tensor<4x?x4x128x?x32xf16>
  }
}

// -----
module {
  func.func @no_collapse_generated(%arg0: tensor<4x?x4x128x?xf16>, %arg1: index, %arg2: index) -> tensor<4x?x4x128x?x32xf16> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3], [4]] : tensor<4x?x4x128x?xf16> into tensor<?x128x?xf16>
    %expanded = tensor.expand_shape %collapsed [[0, 1, 2], [3], [4, 5]] output_shape [4, %arg1, 4, 128, %arg2, 32] : tensor<?x128x?xf16> into tensor<4x?x4x128x?x32xf16>
    return %expanded : tensor<4x?x4x128x?x32xf16>
  }
}

// -----
module {
  func.func @no_expand_generated(%arg0: tensor<4x?x4x128x?x?x?xf16>, %arg1: index, %arg2: index, %arg3: index) -> tensor<4x?x4x128x?x?xf16> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3], [4], [5, 6]] : tensor<4x?x4x128x?x?x?xf16> into tensor<?x128x?x?xf16>
    %expanded = tensor.expand_shape %collapsed [[0, 1, 2], [3], [4], [5]] output_shape [4, %arg1, 4, 128, %arg2, %arg3] : tensor<?x128x?x?xf16> into tensor<4x?x4x128x?x?xf16>
    return %expanded : tensor<4x?x4x128x?x?xf16>
  }
}

