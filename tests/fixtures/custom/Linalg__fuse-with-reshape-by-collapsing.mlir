#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d0, d7, d3, d4, d5, d6)>
module {
  func.func @fuse_by_collapsing(%arg0: tensor<2x12x5x336x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>) -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] output_shape [2, 3, 4, 5, 6, 7, 8, 9] : tensor<2x12x5x336x9xi32> into tensor<2x3x4x5x6x7x8x9xi32>
    %0 = tensor.empty() : tensor<2x3x4x5x6x7x8x9xi32>
    %1 = tensor.empty() : tensor<3x4x2x9x5x6x7x8xi32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %arg1, %arg2 : tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) outs(%0, %1 : tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) {
    ^bb0(%in: i32, %in_0: i32, %in_1: i32, %out: i32, %out_2: i32):
      %3 = arith.addi %in, %in_0 : i32
      %4 = arith.addi %3, %in_1 : i32
      linalg.yield %4, %4 : i32, i32
    } -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>)
    return %2#0, %2#1 : tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
module {
  func.func @fuse_by_collapsing_indexing_op(%arg0: tensor<2x12x5x336x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>) -> tensor<2x3x4x5x6x7x8x9xi32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] output_shape [2, 3, 4, 5, 6, 7, 8, 9] : tensor<2x12x5x336x9xi32> into tensor<2x3x4x5x6x7x8x9xi32>
    %0 = tensor.empty() : tensor<2x3x4x5x6x7x8x9xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %arg1, %arg2 : tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) outs(%0 : tensor<2x3x4x5x6x7x8x9xi32>) {
    ^bb0(%in: i32, %in_0: i32, %in_1: i32, %out: i32):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = arith.addi %2, %3 : index
      %5 = linalg.index 2 : index
      %6 = arith.addi %4, %5 : index
      %7 = linalg.index 3 : index
      %8 = arith.addi %6, %7 : index
      %9 = linalg.index 4 : index
      %10 = arith.addi %8, %9 : index
      %11 = linalg.index 5 : index
      %12 = arith.addi %10, %11 : index
      %13 = linalg.index 6 : index
      %14 = arith.addi %12, %13 : index
      %15 = linalg.index 7 : index
      %16 = arith.addi %14, %15 : index
      %17 = arith.index_cast %16 : index to i32
      linalg.yield %17 : i32
    } -> tensor<2x3x4x5x6x7x8x9xi32>
    return %1 : tensor<2x3x4x5x6x7x8x9xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d5, d6, d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
module {
  func.func @fuse_by_collapsing_change_reshape_order(%arg0: tensor<9x56x2x60x6xi32>, %arg1: tensor<7x8x2xi32>, %arg2: tensor<6x3x4x5xi32>) -> tensor<2x3x4x5x6x7x8x9xi32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] output_shape [9, 7, 8, 2, 3, 4, 5, 6] : tensor<9x56x2x60x6xi32> into tensor<9x7x8x2x3x4x5x6xi32>
    %0 = tensor.empty() : tensor<2x3x4x5x6x7x8x9xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %arg1, %arg2 : tensor<9x7x8x2x3x4x5x6xi32>, tensor<7x8x2xi32>, tensor<6x3x4x5xi32>) outs(%0 : tensor<2x3x4x5x6x7x8x9xi32>) {
    ^bb0(%in: i32, %in_0: i32, %in_1: i32, %out: i32):
      %2 = arith.addi %in, %in_0 : i32
      %3 = arith.addi %2, %in_1 : i32
      linalg.yield %3 : i32
    } -> tensor<2x3x4x5x6x7x8x9xi32>
    return %1 : tensor<2x3x4x5x6x7x8x9xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d5, d6, d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
module {
  func.func @fuse_by_collapsing_dynamic(%arg0: tensor<?x?x?x?x?xi32>, %arg1: tensor<?x?x?xi32>, %arg2: tensor<?x?x?x?xi32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) -> tensor<?x3x?x5x?x7x?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] output_shape [%arg3, 7, %arg4, %arg5, 3, %arg6, 5, %arg7] : tensor<?x?x?x?x?xi32> into tensor<?x7x?x?x3x?x5x?xi32>
    %dim = tensor.dim %arg1, %c2 : tensor<?x?x?xi32>
    %dim_0 = tensor.dim %arg2, %c2 : tensor<?x?x?x?xi32>
    %dim_1 = tensor.dim %arg2, %c0 : tensor<?x?x?x?xi32>
    %dim_2 = tensor.dim %arg1, %c1 : tensor<?x?x?xi32>
    %dim_3 = tensor.dim %arg0, %c0 : tensor<?x?x?x?x?xi32>
    %0 = tensor.empty(%dim, %dim_0, %dim_1, %dim_2, %dim_3) : tensor<?x3x?x5x?x7x?x?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %arg1, %arg2 : tensor<?x7x?x?x3x?x5x?xi32>, tensor<?x?x?xi32>, tensor<?x?x?x?xi32>) outs(%0 : tensor<?x3x?x5x?x7x?x?xi32>) {
    ^bb0(%in: i32, %in_4: i32, %in_5: i32, %out: i32):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = arith.addi %2, %3 : index
      %5 = linalg.index 2 : index
      %6 = arith.addi %4, %5 : index
      %7 = linalg.index 3 : index
      %8 = arith.addi %6, %7 : index
      %9 = linalg.index 4 : index
      %10 = arith.addi %8, %9 : index
      %11 = linalg.index 5 : index
      %12 = arith.addi %10, %11 : index
      %13 = linalg.index 6 : index
      %14 = arith.addi %12, %13 : index
      %15 = linalg.index 7 : index
      %16 = arith.addi %14, %15 : index
      %17 = arith.index_cast %16 : index to i32
      linalg.yield %17 : i32
    } -> tensor<?x3x?x5x?x7x?x?xi32>
    return %1 : tensor<?x3x?x5x?x7x?x?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_by_collapsing_dynamic_2(%arg0: tensor<?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [%arg1, %arg2] : tensor<?xf32> into tensor<?x?xf32>
    %0 = tensor.empty(%arg2, %arg1) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%expanded : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.negf %in : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
module {
  func.func @fuse_reductions(%arg0: tensor<2x?x5xf32>, %arg1: tensor<2x5xf32>, %arg2: index) -> tensor<2x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3]] output_shape [2, 6, %arg2, 5] : tensor<2x?x5xf32> into tensor<2x6x?x5xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "reduction", "parallel"]} ins(%expanded : tensor<2x6x?x5xf32>) outs(%arg1 : tensor<2x5xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<2x5xf32>
    return %0 : tensor<2x5xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @no_fuse_unpreserved_folding(%arg0: tensor<2x12x5xf32>, %arg1: tensor<2x3xf32>) -> tensor<2x3x4x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3]] output_shape [2, 3, 4, 5] : tensor<2x12x5xf32> into tensor<2x3x4x5xf32>
    %0 = tensor.empty() : tensor<2x3x4x5xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %arg1 : tensor<2x3x4x5xf32>, tensor<2x3xf32>) outs(%0 : tensor<2x3x4x5xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<2x3x4x5xf32>
    return %1 : tensor<2x3x4x5xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
module {
  func.func @no_fuse_unpreserved_folding_transpose(%arg0: tensor<2x12x5xf32>, %arg1: tensor<2xf32>) -> tensor<2x4x3x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3]] output_shape [2, 3, 4, 5] : tensor<2x12x5xf32> into tensor<2x3x4x5xf32>
    %0 = tensor.empty() : tensor<2x4x3x5xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %arg1 : tensor<2x3x4x5xf32>, tensor<2xf32>) outs(%0 : tensor<2x4x3x5xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<2x4x3x5xf32>
    return %1 : tensor<2x4x3x5xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
module {
  func.func @no_fuse_mismatched_iterator_types(%arg0: tensor<2x12x5xf32>, %arg1: tensor<2x3xf32>) -> tensor<2x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3]] output_shape [2, 3, 4, 5] : tensor<2x12x5xf32> into tensor<2x3x4x5xf32>
    %0 = tensor.empty() : tensor<2x5xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel"]} ins(%expanded, %arg1 : tensor<2x3x4x5xf32>, tensor<2x3xf32>) outs(%0 : tensor<2x5xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<2x5xf32>
    return %1 : tensor<2x5xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @control_fusion(%arg0: tensor<6xf32>, %arg1: tensor<20xf32>) -> tensor<2x3x4x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [2, 3] : tensor<6xf32> into tensor<2x3xf32>
    %expanded_0 = tensor.expand_shape %arg1 [[0, 1]] output_shape [4, 5] : tensor<20xf32> into tensor<4x5xf32>
    %0 = tensor.empty() : tensor<2x3x4x5xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %expanded_0 : tensor<2x3xf32>, tensor<4x5xf32>) outs(%0 : tensor<2x3x4x5xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %2 = arith.addf %in, %in_1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x3x4x5xf32>
    return %1 : tensor<2x3x4x5xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @zero_D_test(%arg0: tensor<f32>) -> tensor<1xf32> {
    %expanded = tensor.expand_shape %arg0 [] output_shape [1] : tensor<f32> into tensor<1xf32>
    %0 = tensor.empty() : tensor<1xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%expanded : tensor<1xf32>) outs(%0 : tensor<1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1xf32>
    return %1 : tensor<1xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @fuse_only_one_reassociation(%arg0: tensor<?x?xf32>, %arg1: tensor<4x?x?x8xf32>, %arg2: index, %arg3: index) -> tensor<4x?x?x8xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [%arg2, 4, %arg3, 8] : tensor<?x?xf32> into tensor<?x4x?x8xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded, %arg1 : tensor<?x4x?x8xf32>, tensor<4x?x?x8xf32>) outs(%arg1 : tensor<4x?x?x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<4x?x?x8xf32>
    return %0 : tensor<4x?x?x8xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d1, d0, d2)>
module {
  func.func @fold_non_consecutive_dims(%arg0: tensor<?x?xi32>, %arg1: index, %arg2: index) -> tensor<?x8x?x4xi32> {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [%arg1, 4, %arg2, 8] : tensor<?x?xi32> into tensor<?x4x?x8xi32>
    %dim = tensor.dim %expanded, %c0 : tensor<?x4x?x8xi32>
    %dim_0 = tensor.dim %expanded, %c2 : tensor<?x4x?x8xi32>
    %0 = tensor.empty(%dim_0, %dim) : tensor<?x8x?x4xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded : tensor<?x4x?x8xi32>) outs(%0 : tensor<?x8x?x4xi32>) {
    ^bb0(%in: i32, %out: i32):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = linalg.index 2 : index
      %5 = linalg.index 3 : index
      %6 = arith.addi %2, %3 : index
      %7 = arith.addi %6, %4 : index
      %8 = arith.addi %7, %5 : index
      %9 = arith.index_cast %8 : index to i32
      linalg.yield %9 : i32
    } -> tensor<?x8x?x4xi32>
    return %1 : tensor<?x8x?x4xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> ()>
module {
  func.func @no_fold_non_consecutive_reduction_dims(%arg0: tensor<?x?xi32>, %arg1: index, %arg2: index) -> tensor<i32> {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [%arg1, 4, %arg2, 8] : tensor<?x?xi32> into tensor<?x4x?x8xi32>
    %0 = tensor.empty() : tensor<i32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction", "reduction", "reduction"]} ins(%expanded : tensor<?x4x?x8xi32>) outs(%0 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = linalg.index 2 : index
      %5 = linalg.index 3 : index
      %6 = arith.addi %2, %3 : index
      %7 = arith.addi %6, %4 : index
      %8 = arith.addi %7, %5 : index
      %9 = arith.index_cast %8 : index to i32
      linalg.yield %9 : i32
    } -> tensor<i32>
    return %1 : tensor<i32>
  }
}

// -----
module {
  func.func @fuse_by_collapsing_pad(%arg0: tensor<2x12x5x336x9xi32>) -> tensor<8x3x4x17x6x7x8x14xi32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] output_shape [2, 3, 4, 5, 6, 7, 8, 9] : tensor<2x12x5x336x9xi32> into tensor<2x3x4x5x6x7x8x9xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %expanded low[1, 0, 0, 8, 0, 0, 0, 3] high[5, 0, 0, 4, 0, 0, 0, 2] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x3x4x5x6x7x8x9xi32> to tensor<8x3x4x17x6x7x8x14xi32>
    return %padded : tensor<8x3x4x17x6x7x8x14xi32>
  }
}

// -----
module {
  func.func @no_fuse_by_collapsing_pad_non_constant_padding(%arg0: tensor<2x12xi32>) -> tensor<8x3x4xi32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [2, 3, 4] : tensor<2x12xi32> into tensor<2x3x4xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %expanded low[1, 0, 0] high[5, 0, 0] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      %0 = arith.index_cast %arg1 : index to i32
      tensor.yield %0 : i32
    } : tensor<2x3x4xi32> to tensor<8x3x4xi32>
    return %padded : tensor<8x3x4xi32>
  }
}

// -----
module {
  func.func @no_fuse_by_collapsing_pad(%arg0: tensor<2x12x5x336x9xi32>) -> tensor<8x5x4x17x6x7x8x14xi32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3], [4, 5, 6], [7]] output_shape [2, 3, 4, 5, 6, 7, 8, 9] : tensor<2x12x5x336x9xi32> into tensor<2x3x4x5x6x7x8x9xi32>
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %expanded low[1, 2, 0, 8, 0, 0, 0, 3] high[5, 0, 0, 4, 0, 0, 0, 2] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x3x4x5x6x7x8x9xi32> to tensor<8x5x4x17x6x7x8x14xi32>
    return %padded : tensor<8x5x4x17x6x7x8x14xi32>
  }
}

// -----
module {
  func.func @fuse_by_collapsing_dynamic_pad(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index) -> tensor<?x?x?x?x?x?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3], [4, 5]] output_shape [%arg1, %arg2, %arg3, %arg4, %arg5, %arg6] : tensor<?x?x?x?xf32> into tensor<?x?x?x?x?x?xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %expanded low[%arg7, 0, 0, %arg8, 0, 0] high[%arg9, 0, 0, %arg10, 0, 0] {
    ^bb0(%arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index):
      tensor.yield %cst : f32
    } : tensor<?x?x?x?x?x?xf32> to tensor<?x?x?x?x?x?xf32>
    return %padded : tensor<?x?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @collapse_shape_with_producer_pad(%arg0: tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x12x17x336x14xi32> {
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %arg0 low[1, 0, 0, 8, 0, 0, 0, 3] high[5, 0, 0, 4, 0, 0, 0, 2] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
      tensor.yield %c0_i32 : i32
    } : tensor<2x3x4x5x6x7x8x9xi32> to tensor<8x3x4x17x6x7x8x14xi32>
    %collapsed = tensor.collapse_shape %padded [[0], [1, 2], [3], [4, 5, 6], [7]] : tensor<8x3x4x17x6x7x8x14xi32> into tensor<8x12x17x336x14xi32>
    return %collapsed : tensor<8x12x17x336x14xi32>
  }
}

// -----
module {
  func.func @collapse_shape_with_producer_pad_dynamic(%arg0: tensor<?x?x?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[%arg1, 0, 0, %arg2, 0, 0] high[%arg3, 0, 0, %arg4, 0, 0] {
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index):
      tensor.yield %cst : f32
    } : tensor<?x?x?x?x?x?xf32> to tensor<?x?x?x?x?x?xf32>
    %collapsed = tensor.collapse_shape %padded [[0], [1, 2], [3], [4, 5]] : tensor<?x?x?x?x?x?xf32> into tensor<?x?x?x?xf32>
    return %collapsed : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @collapse_shape_with_producer_pad_non_constant_padding(%arg0: tensor<2x3x4xi32>) -> tensor<8x12xi32> {
    %c0_i32 = arith.constant 0 : i32
    %padded = tensor.pad %arg0 low[1, 0, 0] high[5, 0, 0] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      %0 = arith.index_cast %arg1 : index to i32
      tensor.yield %0 : i32
    } : tensor<2x3x4xi32> to tensor<8x3x4xi32>
    %collapsed = tensor.collapse_shape %padded [[0], [1, 2]] : tensor<8x3x4xi32> into tensor<8x12xi32>
    return %collapsed : tensor<8x12xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d0, d7, d3, d4, d5, d6)>
module {
  func.func @fuse_by_collapsing_bubblecollapse(%arg0: tensor<2x3x4x5x6x7x8x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>) -> (tensor<2x12x5x336x9xi32>, tensor<12x2x9x5x336xi32>) {
    %0 = tensor.empty() : tensor<2x3x4x5x6x7x8x9xi32>
    %1 = tensor.empty() : tensor<3x4x2x9x5x6x7x8xi32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) outs(%0, %1 : tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) {
    ^bb0(%in: i32, %in_1: i32, %in_2: i32, %out: i32, %out_3: i32):
      %3 = arith.addi %in, %in_1 : i32
      %4 = arith.addi %3, %in_2 : i32
      linalg.yield %4, %4 : i32, i32
    } -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>)
    %collapsed = tensor.collapse_shape %2#0 [[0], [1, 2], [3], [4, 5, 6], [7]] : tensor<2x3x4x5x6x7x8x9xi32> into tensor<2x12x5x336x9xi32>
    %collapsed_0 = tensor.collapse_shape %2#1 [[0, 1], [2], [3], [4], [5, 6, 7]] : tensor<3x4x2x9x5x6x7x8xi32> into tensor<12x2x9x5x336xi32>
    return %collapsed, %collapsed_0 : tensor<2x12x5x336x9xi32>, tensor<12x2x9x5x336xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
module {
  func.func @fuse_by_collapsing_indexing_op_bubblecollapse(%arg0: tensor<2x3x4x5x6x7x8x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>) -> tensor<2x12x5x336x9xi32> {
    %0 = tensor.empty() : tensor<2x3x4x5x6x7x8x9xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) outs(%0 : tensor<2x3x4x5x6x7x8x9xi32>) {
    ^bb0(%in: i32, %in_0: i32, %in_1: i32, %out: i32):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = arith.addi %2, %3 : index
      %5 = linalg.index 2 : index
      %6 = arith.addi %4, %5 : index
      %7 = linalg.index 3 : index
      %8 = arith.addi %6, %7 : index
      %9 = linalg.index 4 : index
      %10 = arith.addi %8, %9 : index
      %11 = linalg.index 5 : index
      %12 = arith.addi %10, %11 : index
      %13 = linalg.index 6 : index
      %14 = arith.addi %12, %13 : index
      %15 = linalg.index 7 : index
      %16 = arith.addi %14, %15 : index
      %17 = arith.index_cast %16 : index to i32
      linalg.yield %17 : i32
    } -> tensor<2x3x4x5x6x7x8x9xi32>
    %collapsed = tensor.collapse_shape %1 [[0], [1, 2], [3], [4, 5, 6], [7]] : tensor<2x3x4x5x6x7x8x9xi32> into tensor<2x12x5x336x9xi32>
    return %collapsed : tensor<2x12x5x336x9xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d5, d6, d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
module {
  func.func @fuse_by_collapsing_change_reshape_order_bubblecollapse(%arg0: tensor<9x7x8x2x3x4x5x6xi32>, %arg1: tensor<7x8x2xi32>, %arg2: tensor<6x3x4x5xi32>) -> tensor<2x60x6x56x9xi32> {
    %0 = tensor.empty() : tensor<2x3x4x5x6x7x8x9xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<9x7x8x2x3x4x5x6xi32>, tensor<7x8x2xi32>, tensor<6x3x4x5xi32>) outs(%0 : tensor<2x3x4x5x6x7x8x9xi32>) {
    ^bb0(%in: i32, %in_0: i32, %in_1: i32, %out: i32):
      %2 = arith.addi %in, %in_0 : i32
      %3 = arith.addi %2, %in_1 : i32
      linalg.yield %3 : i32
    } -> tensor<2x3x4x5x6x7x8x9xi32>
    %collapsed = tensor.collapse_shape %1 [[0], [1, 2, 3], [4], [5, 6], [7]] : tensor<2x3x4x5x6x7x8x9xi32> into tensor<2x60x6x56x9xi32>
    return %collapsed : tensor<2x60x6x56x9xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_by_collapsing_correct_insertion(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> (tensor<?xf32>, index) {
    %c0 = arith.constant 0 : index
    %0 = tensor.empty(%arg2, %arg1) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.negf %in : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    %dim = tensor.dim %1, %c0 : tensor<?x?xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1]] : tensor<?x?xf32> into tensor<?xf32>
    return %collapsed, %dim : tensor<?xf32>, index
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d4, d1, d2)>
module {
  func.func @partial_fuse_by_collapsing(%arg0: tensor<4x?x32x128x192xf16>, %arg1: tensor<4x128x192x?x32xf32>) -> tensor<512x192x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<4x?x32x128x192xf16>) outs(%arg1 : tensor<4x128x192x?x32xf32>) {
    ^bb0(%in: f16, %out: f32):
      linalg.yield %out : f32
    } -> tensor<4x128x192x?x32xf32>
    %collapsed = tensor.collapse_shape %0 [[0, 1], [2], [3, 4]] : tensor<4x128x192x?x32xf32> into tensor<512x192x?xf32>
    return %collapsed : tensor<512x192x?xf32>
  }
}

