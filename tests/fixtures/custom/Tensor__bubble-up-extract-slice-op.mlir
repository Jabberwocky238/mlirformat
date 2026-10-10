module {
  func.func @bubble_up_extract_slice_through_expand_shape(%arg0: tensor<60xf32>) -> tensor<1x1x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 3, 10] : tensor<60xf32> into tensor<2x3x10xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 5] [1, 1, 5] [1, 1, 1] : tensor<2x3x10xf32> to tensor<1x1x5xf32>
    return %extracted_slice : tensor<1x1x5xf32>
  }
  func.func @no_bubble_up_extract_slice_on_non_contiguous(%arg0: tensor<60xf32>) -> tensor<1x2x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 3, 10] : tensor<60xf32> into tensor<2x3x10xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 5] [1, 2, 5] [1, 1, 1] : tensor<2x3x10xf32> to tensor<1x2x5xf32>
    return %extracted_slice : tensor<1x2x5xf32>
  }
  func.func @no_bubble_up_extract_slice_on_stride(%arg0: tensor<60xf32>) -> tensor<1x1x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 3, 10] : tensor<60xf32> into tensor<2x3x10xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 0] [1, 1, 5] [1, 1, 2] : tensor<2x3x10xf32> to tensor<1x1x5xf32>
    return %extracted_slice : tensor<1x1x5xf32>
  }
  func.func @no_bubble_up_extract_slice_on_rank_reducing(%arg0: tensor<60xf32>) -> tensor<1x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 3, 10] : tensor<60xf32> into tensor<2x3x10xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 5] [1, 1, 5] [1, 1, 1] : tensor<2x3x10xf32> to tensor<1x5xf32>
    return %extracted_slice : tensor<1x5xf32>
  }
  func.func @bubble_up_extract_slice_through_expand_shape_multiple_expanded_dims(%arg0: tensor<120x56xf32>) -> tensor<1x2x10x1x4xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2], [3, 4]] output_shape [3, 4, 10, 7, 8] : tensor<120x56xf32> into tensor<3x4x10x7x8xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 0, 0, 0] [1, 2, 10, 1, 4] [1, 1, 1, 1, 1] : tensor<3x4x10x7x8xf32> to tensor<1x2x10x1x4xf32>
    return %extracted_slice : tensor<1x2x10x1x4xf32>
  }
  func.func @bubble_up_extract_slice_with_trailing_full_dims(%arg0: tensor<60xf32>) -> tensor<2x5x2xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [6, 5, 2] : tensor<60xf32> into tensor<6x5x2xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 0] [2, 5, 2] [1, 1, 1] : tensor<6x5x2xf32> to tensor<2x5x2xf32>
    return %extracted_slice : tensor<2x5x2xf32>
  }
  func.func @bubble_up_extract_slice_dont_fold_linearize_index(%arg0: tensor<60xf32>, %arg1: index, %arg2: index) -> tensor<1x1x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 3, 10] : tensor<60xf32> into tensor<2x3x10xf32>
    %extracted_slice = tensor.extract_slice %expanded[%arg1, %arg2, 5] [1, 1, 5] [1, 1, 1] : tensor<2x3x10xf32> to tensor<1x1x5xf32>
    return %extracted_slice : tensor<1x1x5xf32>
  }
  func.func @bubble_up_extract_slice_not_all_dims_expanded(%arg0: tensor<60x12xf32>) -> tensor<1x1x5x12xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2], [3]] output_shape [2, 3, 10, 12] : tensor<60x12xf32> into tensor<2x3x10x12xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 5, 0] [1, 1, 5, 12] [1, 1, 1, 1] : tensor<2x3x10x12xf32> to tensor<1x1x5x12xf32>
    return %extracted_slice : tensor<1x1x5x12xf32>
  }
  func.func @bubble_up_extract_slice_affine_apply_not_folded(%arg0: tensor<60xf32>, %arg1: index) -> tensor<?x5x2xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [6, 5, 2] : tensor<60xf32> into tensor<6x5x2xf32>
    %extracted_slice = tensor.extract_slice %expanded[0, 0, 0] [%arg1, 5, 2] [1, 1, 1] : tensor<6x5x2xf32> to tensor<?x5x2xf32>
    return %extracted_slice : tensor<?x5x2xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_single_reassoc_group(%arg0: tensor<6x5x2xf32>) -> tensor<1xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<6x5x2xf32> into tensor<60xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0] [1] [1] : tensor<60xf32> to tensor<1xf32>
    return %extracted_slice : tensor<1xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_multiple_reassoc_group(%arg0: tensor<6x5x3x10xf32>) -> tensor<15x10xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<6x5x3x10xf32> into tensor<30x30xf32>
    %extracted_slice = tensor.extract_slice %collapsed[5, 10] [15, 10] [1, 1] : tensor<30x30xf32> to tensor<15x10xf32>
    return %extracted_slice : tensor<15x10xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_offset_on_leading_dim(%arg0: tensor<6x5x2xf32>) -> tensor<4xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<6x5x2xf32> into tensor<60xf32>
    %extracted_slice = tensor.extract_slice %collapsed[20] [4] [1] : tensor<60xf32> to tensor<4xf32>
    return %extracted_slice : tensor<4xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_dynamic_size(%arg0: tensor<1x5x1xf32>, %arg1: index) -> tensor<?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<1x5x1xf32> into tensor<5xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0] [%arg1] [1] : tensor<5xf32> to tensor<?xf32>
    return %extracted_slice : tensor<?xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_dynamic_size_and_src(%arg0: tensor<1x?x1xf32>, %arg1: index) -> tensor<?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<1x?x1xf32> into tensor<?xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
    return %extracted_slice : tensor<?xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_dynamic_offset(%arg0: tensor<1x5x1xf32>, %arg1: index) -> tensor<3xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<1x5x1xf32> into tensor<5xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1] [3] [1] : tensor<5xf32> to tensor<3xf32>
    return %extracted_slice : tensor<3xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_dynamic_offset_and_size(%arg0: tensor<14x1xf32>, %arg1: index, %arg2: index) -> tensor<?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<14x1xf32> into tensor<14xf32>
    %extracted_slice = tensor.extract_slice %collapsed[%arg1] [%arg2] [1] : tensor<14xf32> to tensor<?xf32>
    return %extracted_slice : tensor<?xf32>
  }
  func.func @bubble_up_extract_slice_through_collapse_shape_dynamic_and_static_groups(%arg0: tensor<5x10x1x1x40xf32>, %arg1: index, %arg2: index) -> tensor<20x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3, 4]] : tensor<5x10x1x1x40xf32> into tensor<50x40xf32>
    %extracted_slice = tensor.extract_slice %collapsed[10, %arg1] [20, %arg2] [1, 1] : tensor<50x40xf32> to tensor<20x?xf32>
    return %extracted_slice : tensor<20x?xf32>
  }
  func.func @no_bubble_up_extract_slice_through_collapse_shape_on_non_contiguous_1(%arg0: tensor<2x3x10xf32>) -> tensor<15xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<2x3x10xf32> into tensor<60xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0] [15] [1] : tensor<60xf32> to tensor<15xf32>
    return %extracted_slice : tensor<15xf32>
  }
  func.func @no_bubble_up_extract_slice_through_collapse_shape_on_non_contiguous_2(%arg0: tensor<2x3x10xf32>) -> tensor<20xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<2x3x10xf32> into tensor<60xf32>
    %extracted_slice = tensor.extract_slice %collapsed[20] [20] [1] : tensor<60xf32> to tensor<20xf32>
    return %extracted_slice : tensor<20xf32>
  }
  func.func @no_bubble_up_extract_slice_through_collapse_shape_on_stride(%arg0: tensor<2x3x10xf32>) -> tensor<5xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<2x3x10xf32> into tensor<60xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0] [5] [2] : tensor<60xf32> to tensor<5xf32>
    return %extracted_slice : tensor<5xf32>
  }
  func.func @no_bubble_up_extract_slice_through_collapse_shape_on_rank_reducing(%arg0: tensor<6x5x2x1xf32>) -> tensor<1xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3]] : tensor<6x5x2x1xf32> into tensor<60x1xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0, 0] [1, 1] [1, 1] : tensor<60x1xf32> to tensor<1xf32>
    return %extracted_slice : tensor<1xf32>
  }
  func.func @no_bubble_up_extract_slice_through_collapse_shape_on_unsupported_dynamic(%arg0: tensor<1x5x2xf32>, %arg1: index) -> tensor<?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<1x5x2xf32> into tensor<10xf32>
    %extracted_slice = tensor.extract_slice %collapsed[0] [%arg1] [1] : tensor<10xf32> to tensor<?xf32>
    return %extracted_slice : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.bubble_up_extract_slice
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

