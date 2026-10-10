#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map2 = affine_map<(d0, d1, d2) -> ()>
module {
  func.func @generic_op_reshape_producer_fusion(%arg0: tensor<?x?x4x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: f32) -> tensor<?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3]] : tensor<?x?x4x?xf32> into tensor<?x?x?xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed, %arg1, %arg2 : tensor<?x?x?xf32>, tensor<?x?x?xf32>, f32) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %in_1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
module {
  func.func @generic_op_reshape_consumer_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: f32, %arg3: index, %arg4: index) -> tensor<?x4x?x5xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>, f32) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %in_1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2, 3]] output_shape [%arg3, 4, %arg4, 5] : tensor<?x?xf32> into tensor<?x4x?x5xf32>
    return %expanded : tensor<?x4x?x5xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
module {
  func.func @reshape_as_consumer_permutation(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x2x?x3x4x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?x?xf32>
    %expanded = tensor.expand_shape %0 [[0, 1], [2], [3, 4, 5]] output_shape [%arg2, 2, %arg3, 3, 4, %arg4] : tensor<?x?x?xf32> into tensor<?x2x?x3x4x?xf32>
    return %expanded : tensor<?x2x?x3x4x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @generic_op_reshape_consumer_static(%arg0: tensor<264x4xf32>) -> tensor<8x33x4xf32> {
    %cst = arith.constant dense<2.000000e+00> : tensor<264x4xf32>
    %0 = tensor.empty() : tensor<264x4xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %cst : tensor<264x4xf32>, tensor<264x4xf32>) outs(%0 : tensor<264x4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.mulf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<264x4xf32>
    %expanded = tensor.expand_shape %1 [[0, 1], [2]] output_shape [8, 33, 4] : tensor<264x4xf32> into tensor<8x33x4xf32>
    return %expanded : tensor<8x33x4xf32>
  }
}

// -----
module {
  func.func @reshape_as_consumer_transpose(%arg0: tensor<4x210x6xf32>) -> tensor<2x3x4x5x6x7xf32> {
    %0 = tensor.empty() : tensor<6x4x210xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<4x210x6xf32>) outs(%0 : tensor<6x4x210xf32>) permutation = [2, 0, 1] 
    %expanded = tensor.expand_shape %transposed [[0, 1], [2], [3, 4, 5]] output_shape [2, 3, 4, 5, 6, 7] : tensor<6x4x210xf32> into tensor<2x3x4x5x6x7xf32>
    return %expanded : tensor<2x3x4x5x6x7xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
module {
  func.func @indexed_consumer_reshape_producer_fusion(%arg0: tensor<?x?x4x?xi32>, %arg1: tensor<?x?x?xi32>) -> tensor<?x?x?xi32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3]] : tensor<?x?x4x?xi32> into tensor<?x?x?xi32>
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed, %arg1 : tensor<?x?x?xi32>, tensor<?x?x?xi32>) outs(%collapsed : tensor<?x?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = linalg.index 2 : index
      %4 = arith.muli %in, %in_0 : i32
      %5 = arith.index_cast %1 : index to i32
      %6 = arith.addi %4, %5 : i32
      %7 = arith.index_cast %2 : index to i32
      %8 = arith.addi %6, %7 : i32
      %9 = arith.index_cast %3 : index to i32
      %10 = arith.addi %8, %9 : i32
      linalg.yield %10 : i32
    } -> tensor<?x?x?xi32>
    return %0 : tensor<?x?x?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @indexed_producer_reshape_consumer_fusion(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: index, %arg3: index) -> tensor<?x?x4x5xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg0 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = arith.muli %in, %in_0 : i32
      %4 = arith.index_cast %1 : index to i32
      %5 = arith.addi %3, %4 : i32
      %6 = arith.index_cast %2 : index to i32
      %7 = arith.addi %5, %6 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2, 3]] output_shape [%arg2, %arg3, 4, 5] : tensor<?x?xi32> into tensor<?x?x4x5xi32>
    return %expanded : tensor<?x?x4x5xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
module {
  func.func @reshape_as_consumer_permutation(%arg0: tensor<210x6x4xi32>, %arg1: tensor<210x4xi32>) -> tensor<2x3x4x5x6x7xi32> {
    %0 = tensor.empty() : tensor<6x4x210xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<210x6x4xi32>, tensor<210x4xi32>) outs(%0 : tensor<6x4x210xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = linalg.index 2 : index
      %5 = arith.addi %in, %in_0 : i32
      %6 = arith.index_cast %2 : index to i32
      %7 = arith.addi %5, %6 : i32
      %8 = arith.index_cast %3 : index to i32
      %9 = arith.addi %7, %8 : i32
      %10 = arith.index_cast %4 : index to i32
      %11 = arith.addi %9, %10 : i32
      linalg.yield %11 : i32
    } -> tensor<6x4x210xi32>
    %expanded = tensor.expand_shape %1 [[0, 1], [2], [3, 4, 5]] output_shape [2, 3, 4, 5, 6, 7] : tensor<6x4x210xi32> into tensor<2x3x4x5x6x7xi32>
    return %expanded : tensor<2x3x4x5x6x7xi32>
  }
}

// -----
module {
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @reshape_as_producer_projected_permutation(%arg0: tensor<33x8x?xi32>, %arg1: tensor<264x?x4xi32>) -> tensor<264x?x4xi32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<33x8x?xi32> into tensor<264x?xi32>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed : tensor<264x?xi32>) outs(%arg1 : tensor<264x?x4xi32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = linalg.index 2 : index
      %4 = arith.index_cast %1 : index to i32
      %5 = arith.addi %in, %4 : i32
      %6 = arith.index_cast %2 : index to i32
      %7 = arith.addi %5, %6 : i32
      %8 = arith.index_cast %3 : index to i32
      %9 = arith.addi %7, %8 : i32
      linalg.yield %9 : i32
    } -> tensor<264x?x4xi32>
    return %0 : tensor<264x?x4xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @generic_op_reshape_consumer_fusion_projected(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?x4x5xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2, 3]] output_shape [%arg2, %arg3, 4, 5] : tensor<?x?xf32> into tensor<?x?x4x5xf32>
    return %expanded : tensor<?x?x4x5xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @fuse_collapse_reduction(%arg0: tensor<10x10x20xf32>) -> tensor<100xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<10x10x20xf32> into tensor<100x20xf32>
    %0 = tensor.empty() : tensor<100xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<100xf32>) -> tensor<100xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%collapsed : tensor<100x20xf32>) outs(%1 : tensor<100xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.addf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<100xf32>
    return %2 : tensor<100xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @fuse_dynamic_dims(%arg0: tensor<?x?xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<?x?xf32> into tensor<?xf32>
    %dim = tensor.dim %collapsed, %c0 : tensor<?xf32>
    %0 = tensor.empty(%dim) : tensor<?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%collapsed : tensor<?xf32>) outs(%0 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %in : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %1 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
module {
  func.func @reshape_as_consumer_permutation_with_multiple_results(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> (tensor<?x2x?x3x4x?xf32>, tensor<?x?x2x3x4x?xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?xf32>) outs(%arg0, %arg0 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32, %out_2: f32):
      %1 = arith.addf %in, %in_1 : f32
      linalg.yield %1, %1 : f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    %expanded = tensor.expand_shape %0#0 [[0, 1], [2], [3, 4, 5]] output_shape [%arg2, 2, %arg3, 3, 4, %arg4] : tensor<?x?x?xf32> into tensor<?x2x?x3x4x?xf32>
    %expanded_0 = tensor.expand_shape %0#1 [[0], [1, 2], [3, 4, 5]] output_shape [%arg5, %arg6, 2, 3, 4, %arg4] : tensor<?x?x?xf32> into tensor<?x?x2x3x4x?xf32>
    return %expanded, %expanded_0 : tensor<?x2x?x3x4x?xf32>, tensor<?x?x2x3x4x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @multi_result_op_expansion(%arg0: tensor<512xf32>, %arg1: tensor<512xf32>, %arg2: tensor<512xf32>, %arg3: tensor<200x512xf32>) -> tensor<25x8x1x512xf32> {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<512xf32>, tensor<512xf32>) outs(%arg2, %arg3 : tensor<512xf32>, tensor<200x512xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1, %1 : f32, f32
    } -> (tensor<512xf32>, tensor<200x512xf32>)
    %expanded = tensor.expand_shape %0#1 [[0, 1, 2], [3]] output_shape [25, 8, 1, 512] : tensor<200x512xf32> into tensor<25x8x1x512xf32>
    return %expanded : tensor<25x8x1x512xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @generic_op_reshape_consumer_fusion_reduction(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index) -> tensor<?x?x4x5xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2, 3]] output_shape [%arg3, %arg4, 4, 5] : tensor<?x?xf32> into tensor<?x?x4x5xf32>
    return %expanded : tensor<?x?x4x5xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  func.func @generic_op_reshape_producer_fusion_with_reduction(%arg0: tensor<?x7x?x8xf32>, %arg1: tensor<?x4x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x7x?x8xf32> into tensor<?x?xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"]} ins(%collapsed, %arg1 : tensor<?x?xf32>, tensor<?x4x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @linalg_add_reshape_consumer_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index) -> tensor<?x?x4x5xf32> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2, 3]] output_shape [%arg3, %arg4, 4, 5] : tensor<?x?xf32> into tensor<?x?x4x5xf32>
    return %expanded : tensor<?x?x4x5xf32>
  }
}

// -----
module {
  func.func @linalg_add_reshape_producer_fusion(%arg0: tensor<?x7x?x8xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x7x?x8xf32> into tensor<?x?xf32>
    %0 = linalg.add ins(%collapsed, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @linalg_copy_reshape_producer_fusion(%arg0: tensor<?x7x?x8xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x7x?x8xf32> into tensor<?x?xf32>
    %0 = linalg.copy ins(%collapsed : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @reshape_as_producer_transpose(%arg0: tensor<4x5x6x7x2x3xf32>) -> tensor<6x4x210xf32> {
    %0 = tensor.empty() : tensor<6x4x210xf32>
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2, 3], [4, 5]] : tensor<4x5x6x7x2x3xf32> into tensor<4x210x6xf32>
    %transposed = linalg.transpose ins(%collapsed : tensor<4x210x6xf32>) outs(%0 : tensor<6x4x210xf32>) permutation = [2, 0, 1] 
    return %transposed : tensor<6x4x210xf32>
  }
}

// -----
module {
  func.func @fuse_by_expanding_pad(%arg0: tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x12x17x336x14xi32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] : tensor<2x3x4x5x6x7x8x9xi32> into tensor<2x12x5x336x9xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %collapsed low[1, 0, 8, 0, 3] high[5, 0, 4, 0, 2] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x12x5x336x9xi32> to tensor<8x12x17x336x14xi32>
    return %padded : tensor<8x12x17x336x14xi32>
  }
}

// -----
module {
  func.func @no_fuse_by_expanding_pad_non_constant_padding(%arg0: tensor<2x3x4xi32>) -> tensor<8x12xi32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2]] : tensor<2x3x4xi32> into tensor<2x12xi32>
    %padded = tensor.pad %collapsed low[1, 0] high[5, 0] {
    ^bb0(%arg1: index, %arg2: index):
      %0 = arith.index_cast %arg1 : index to i32
      tensor.yield %0 : i32
    } : tensor<2x12xi32> to tensor<8x12xi32>
    return %padded : tensor<8x12xi32>
  }
}

// -----
module {
  func.func @no_fuse_by_expanding_pad(%arg0: tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x12x17x339x14xi32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] : tensor<2x3x4x5x6x7x8x9xi32> into tensor<2x12x5x336x9xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %collapsed low[1, 0, 8, 0, 3] high[5, 0, 4, 3, 2] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x12x5x336x9xi32> to tensor<8x12x17x339x14xi32>
    return %padded : tensor<8x12x17x339x14xi32>
  }
}

// -----
module {
  func.func @fuse_by_expanding_dynamic_pad(%arg0: tensor<?x?x?x?x?x?xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?x?xi32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3], [4, 5]] : tensor<?x?x?x?x?x?xi32> into tensor<?x?x?x?xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %collapsed low[%arg1, 0, %arg2, 0] high[%arg3, 0, %arg4, 0] {
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index):
      tensor.yield %c0_i32 : i32
    } : tensor<?x?x?x?xi32> to tensor<?x?x?x?xi32>
    return %padded : tensor<?x?x?x?xi32>
  }
}

// -----
module {
  func.func @expand_shape_with_producer_pad(%arg0: tensor<2x12x5x336x9xi32>) -> tensor<8x3x4x17x6x7x8x14xi32> {
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %arg0 low[1, 0, 8, 0, 3] high[5, 0, 4, 0, 2] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x12x5x336x9xi32> to tensor<8x12x17x336x14xi32>
    %expanded = tensor.expand_shape %padded [[0], [1, 2], [3], [4, 5, 6], [7]] output_shape [8, 3, 4, 17, 6, 7, 8, 14] : tensor<8x12x17x336x14xi32> into tensor<8x3x4x17x6x7x8x14xi32>
    return %expanded : tensor<8x3x4x17x6x7x8x14xi32>
  }
}

// -----
module {
  func.func @expand_shape_with_producer_pad_dynamic(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index) -> tensor<?x?x?x?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[%arg7, 0, %arg8, 0] high[%arg9, 0, %arg10, 0] {
    ^bb0(%arg11: index, %arg12: index, %arg13: index, %arg14: index):
      tensor.yield %cst : f32
    } : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
    %expanded = tensor.expand_shape %padded [[0], [1, 2], [3], [4, 5]] output_shape [%arg1, %arg2, %arg3, %arg4, %arg5, %arg6] : tensor<?x?x?x?xf32> into tensor<?x?x?x?x?x?xf32>
    return %expanded : tensor<?x?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @expand_shape_with_producer_pad_non_constant_padding(%arg0: tensor<2x12xi32>) -> tensor<8x3x4xi32> {
    %padded = tensor.pad %arg0 low[1, 0] high[5, 0] {
    ^bb0(%arg1: index, %arg2: index):
      %0 = arith.index_cast %arg1 : index to i32
      tensor.yield %0 : i32
    } : tensor<2x12xi32> to tensor<8x12xi32>
    %expanded = tensor.expand_shape %padded [[0], [1, 2]] output_shape [8, 3, 4] : tensor<8x12xi32> into tensor<8x3x4xi32>
    return %expanded : tensor<8x3x4xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @move_operand_deps(%arg0: tensor<?x128xf16>, %arg1: tensor<4x?x32x128xf16>, %arg2: tensor<4x?x32x128xf16>) -> tensor<4x?x32x8x16xf16> {
    %c0 = arith.constant 0 : index
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x128xf16>) outs(%arg2 : tensor<4x?x32x128xf16>) {
    ^bb0(%in: f16, %out: f16):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = linalg.index 2 : index
      %4 = linalg.index 3 : index
      %extracted = tensor.extract %arg1[%1, %2, %3, %4] : tensor<4x?x32x128xf16>
      %5 = arith.addf %extracted, %in : f16
      linalg.yield %5 : f16
    } -> tensor<4x?x32x128xf16>
    %dim = tensor.dim %arg0, %c0 : tensor<?x128xf16>
    %expanded = tensor.expand_shape %0 [[0], [1], [2], [3, 4]] output_shape [4, %dim, 32, 8, 16] : tensor<4x?x32x128xf16> into tensor<4x?x32x8x16xf16>
    return %expanded : tensor<4x?x32x8x16xf16>
  }
}

