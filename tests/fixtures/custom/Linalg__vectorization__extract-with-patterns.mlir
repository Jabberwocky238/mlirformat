#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @vectorize_nd_tensor_extract_transfer_read_basic(%arg0: tensor<3x3x3xf32>, %arg1: tensor<1x1x3xf32>) -> tensor<1x1x3xf32> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg1 : tensor<1x1x3xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = linalg.index 2 : index
      %extracted = tensor.extract %arg0[%1, %2, %3] : tensor<3x3x3xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x1x3xf32>
    return %0 : tensor<1x1x3xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_nd_tensor_extract_transfer_read_complex(%arg0: tensor<45x80x16xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: tensor<1x4xf32>) -> tensor<1x4xf32> {
    %c79 = arith.constant 79 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg5 : tensor<1x4xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 0 : index
      %2 = arith.addi %arg1, %1 : index
      %3 = arith.addi %2, %arg2 : index
      %4 = linalg.index 1 : index
      %5 = arith.addi %arg3, %4 : index
      %6 = arith.addi %5, %arg4 : index
      %extracted = tensor.extract %arg0[%3, %c79, %6] : tensor<45x80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x4xf32>
    return %0 : tensor<1x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @vectorize_nd_tensor_extract_with_affine_apply_contiguous(%arg0: tensor<80x16xf32>, %arg1: index, %arg2: tensor<1x4xf32>) -> tensor<1x4xf32> {
    %c79 = arith.constant 79 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg2 : tensor<1x4xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map1(%1, %arg1)
      %extracted = tensor.extract %arg0[%c79, %2] : tensor<80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x4xf32>
    return %0 : tensor<1x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0 + d1 * 24 + d2 + d3)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_nd_tensor_extract_with_tensor_extract(%arg0: tensor<1x20xi32>, %arg1: tensor<257x24xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> tensor<1x1x4xf32> {
    %c0 = arith.constant 0 : index
    %c256 = arith.constant 256 : index
    %0 = tensor.empty() : tensor<1x1x4xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%0 : tensor<1x1x4xf32>) {
    ^bb0(%out: f32):
      %2 = linalg.index 0 : index
      %3 = affine.apply #map1(%arg2, %2, %arg4)
      %4 = linalg.index 2 : index
      %5 = linalg.index 1 : index
      %6 = affine.apply #map2(%arg3, %5, %4, %arg5)
      %extracted = tensor.extract %arg0[%c0, %3] : tensor<1x20xi32>
      %7 = arith.index_cast %extracted : i32 to index
      %8 = arith.maxsi %7, %c0 : index
      %9 = arith.minsi %8, %c256 : index
      %extracted_0 = tensor.extract %arg1[%9, %6] : tensor<257x24xf32>
      linalg.yield %extracted_0 : f32
    } -> tensor<1x1x4xf32>
    return %1 : tensor<1x1x4xf32>
  }
  func.func @vectorize_nd_tensor_extract_with_maxsi_contiguous(%arg0: tensor<80x16xf32>, %arg1: tensor<1x4xf32>) -> tensor<1x4xf32> {
    %c16 = arith.constant 16 : index
    %0 = linalg.generic {indexing_maps = [#map3], iterator_types = ["parallel", "parallel"]} outs(%arg1 : tensor<1x4xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = arith.maxsi %1, %c16 : index
      %extracted = tensor.extract %arg0[%3, %2] : tensor<80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x4xf32>
    return %0 : tensor<1x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @vectorize_1d_tensor_extract(%arg0: tensor<3xf32>, %arg1: tensor<4x3xi32>, %arg2: tensor<4x7x3x2xf32>) -> tensor<4x7x3x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg1 : tensor<4x3xi32>) outs(%arg2 : tensor<4x7x3x2xf32>) {
    ^bb0(%in: i32, %out: f32):
      %1 = arith.index_cast %in : i32 to index
      %extracted = tensor.extract %arg0[%1] : tensor<3xf32>
      linalg.yield %extracted : f32
    } -> tensor<4x7x3x2xf32>
    return %0 : tensor<4x7x3x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @vectorize_nd_tensor_extract_index_from_tensor(%arg0: tensor<3x3xf32>, %arg1: tensor<4x3xi32>, %arg2: tensor<4x3xi32>, %arg3: tensor<4x7x2xf32>, %arg4: tensor<4x7x3x2xf32>) -> tensor<4x7x3x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg1, %arg2, %arg3 : tensor<4x3xi32>, tensor<4x3xi32>, tensor<4x7x2xf32>) outs(%arg4 : tensor<4x7x3x2xf32>) {
    ^bb0(%in: i32, %in_0: i32, %in_1: f32, %out: f32):
      %1 = arith.index_cast %in : i32 to index
      %2 = arith.index_cast %in_0 : i32 to index
      %extracted = tensor.extract %arg0[%1, %2] : tensor<3x3xf32>
      linalg.yield %extracted : f32
    } -> tensor<4x7x3x2xf32>
    return %0 : tensor<4x7x3x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
module {
  func.func @vectorize_nd_tensor_extract_load_1d_column_vector_using_gather_load(%arg0: tensor<8x128x768xf32>, %arg1: index) -> tensor<8x1xf32> {
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<8x1xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%0 : tensor<8x1xf32>) {
    ^bb0(%out: f32):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = affine.apply #map1(%arg1, %3, %arg1)
      %extracted = tensor.extract %arg0[%2, %c0, %4] : tensor<8x128x768xf32>
      linalg.yield %extracted : f32
    } -> tensor<8x1xf32>
    return %1 : tensor<8x1xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @index_from_output_column_vector_gather_load(%arg0: tensor<8x128xf32>) -> tensor<8x1xf32> {
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<8x1xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%0 : tensor<8x1xf32>) {
    ^bb0(%out: f32):
      %2 = linalg.index 0 : index
      %extracted = tensor.extract %arg0[%2, %c0] : tensor<8x128xf32>
      linalg.yield %extracted : f32
    } -> tensor<8x1xf32>
    return %1 : tensor<8x1xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @index_from_output_column_vector_contiguous_load(%arg0: tensor<8x128xf32>) -> tensor<8x1xf32> {
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<8x1xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%0 : tensor<8x1xf32>) {
    ^bb0(%out: f32):
      %2 = linalg.index 0 : index
      %extracted = tensor.extract %arg0[%c0, %2] : tensor<8x128xf32>
      linalg.yield %extracted : f32
    } -> tensor<8x1xf32>
    return %1 : tensor<8x1xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @vectorize_nd_tensor_extract_contiguous_and_gather(%arg0: tensor<6xf32>, %arg1: tensor<5xi32>) -> tensor<5xf32> {
    %c5 = arith.constant 5 : index
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<5xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%0 : tensor<5xf32>) {
    ^bb0(%out: f32):
      %2 = linalg.index 0 : index
      %extracted = tensor.extract %arg1[%2] : tensor<5xi32>
      %3 = arith.index_cast %extracted : i32 to index
      %4 = arith.maxsi %3, %c0 : index
      %5 = arith.minsi %4, %c5 : index
      %extracted_0 = tensor.extract %arg0[%5] : tensor<6xf32>
      linalg.yield %extracted_0 : f32
    } -> tensor<5xf32>
    return %1 : tensor<5xf32>
  }
  func.func @vectorize_nd_tensor_extract_with_affine_apply_gather(%arg0: tensor<80x16xf32>, %arg1: index, %arg2: tensor<1x4xf32>) -> tensor<1x4xf32> {
    %c16 = arith.constant 16 : index
    %0 = linalg.generic {indexing_maps = [#map1], iterator_types = ["parallel", "parallel"]} outs(%arg2 : tensor<1x4xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map2(%1, %arg1)
      %extracted = tensor.extract %arg0[%2, %c16] : tensor<80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x4xf32>
    return %0 : tensor<1x4xf32>
  }
  func.func @vectorize_nd_tensor_extract_with_maxsi_gather(%arg0: tensor<80x16xf32>, %arg1: tensor<1x4xf32>) -> tensor<1x4xf32> {
    %c79 = arith.constant 79 : index
    %0 = linalg.generic {indexing_maps = [#map1], iterator_types = ["parallel", "parallel"]} outs(%arg1 : tensor<1x4xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = arith.maxsi %1, %c79 : index
      %extracted = tensor.extract %arg0[%2, %1] : tensor<80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x4xf32>
    return %0 : tensor<1x4xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_nd_tensor_extract_block_arg(%arg0: tensor<5x6xf32>, %arg1: tensor<5xindex>) -> tensor<5xf32> {
    %0 = tensor.empty() : tensor<5xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg1 : tensor<5xindex>) outs(%0 : tensor<5xf32>) {
    ^bb0(%in: index, %out: f32):
      %2 = linalg.index 0 : index
      %extracted = tensor.extract %arg0[%in, %2] : tensor<5x6xf32>
      linalg.yield %extracted : f32
    } -> tensor<5xf32>
    return %1 : tensor<5xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
module {
  func.func @vectorize_reverse_like_tensor_extract(%arg0: tensor<1x2x3xf32>, %arg1: tensor<1x1x3xf32>, %arg2: index) -> tensor<1x1x3xf32> {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg1 : tensor<1x1x3xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = linalg.index 0 : index
      %3 = affine.apply #map1(%1, %2, %arg2)
      %4 = linalg.index 2 : index
      %5 = arith.subi %c2, %4 : index
      %extracted = tensor.extract %arg0[%c0, %3, %5] : tensor<1x2x3xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x1x3xf32>
    return %0 : tensor<1x1x3xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @vectorize_nd_tensor_extract_scalar_broadcast(%arg0: tensor<3x3xf32>, %arg1: tensor<1x1x3xf32>) -> tensor<1x1x3xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg1 : tensor<1x1x3xf32>) {
    ^bb0(%out: f32):
      %extracted = tensor.extract %arg0[%c1, %c2] : tensor<3x3xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x1x3xf32>
    return %0 : tensor<1x1x3xf32>
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @extract_scalar_from_0d_into_0d(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = []} outs(%arg1 : tensor<f32>) {
    ^bb0(%out: f32):
      %extracted = tensor.extract %arg0[] : tensor<f32>
      linalg.yield %extracted : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @extract_scalar_from_0d_into_1d(%arg0: tensor<f32>, %arg1: tensor<1xf32>) -> tensor<1xf32> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg1 : tensor<1xf32>) {
    ^bb0(%out: f32):
      %extracted = tensor.extract %arg0[] : tensor<f32>
      linalg.yield %extracted : f32
    } -> tensor<1xf32>
    return %0 : tensor<1xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @vectorize_0d_tensor_extract(%arg0: tensor<f32>, %arg1: tensor<1x1x3xf32>) -> tensor<1x1x3xf32> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg1 : tensor<1x1x3xf32>) {
    ^bb0(%out: f32):
      %extracted = tensor.extract %arg0[] : tensor<f32>
      linalg.yield %extracted : f32
    } -> tensor<1x1x3xf32>
    return %0 : tensor<1x1x3xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @scalar_read_with_broadcast_from_column_tensor(%arg0: tensor<1x1x4xi32>) -> tensor<1x1x4xi32> {
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[[0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14]]> : tensor<15x1xi32>
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg0 : tensor<1x1x4xi32>) {
    ^bb0(%out: i32):
      %1 = linalg.index 0 : index
      %extracted = tensor.extract %cst[%1, %c0] : tensor<15x1xi32>
      linalg.yield %extracted : i32
    } -> tensor<1x1x4xi32>
    return %0 : tensor<1x1x4xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @vectorize_nd_tensor_extract_transfer_read_basic_column(%arg0: tensor<3x3x3xf32>, %arg1: tensor<3x1x1xf32>) -> tensor<3x1x1xf32> {
    %c0 = arith.constant 0 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg1 : tensor<3x1x1xf32>) {
    ^bb0(%out: f32):
      %extracted = tensor.extract %arg0[%c0, %c0, %c0] : tensor<3x3x3xf32>
      linalg.yield %extracted : f32
    } -> tensor<3x1x1xf32>
    return %0 : tensor<3x1x1xf32>
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @rank0_tensor_extract_data_dependent_index(%arg0: tensor<2xi64>, %arg1: tensor<i64>) -> tensor<i64> {
    %0 = tensor.empty() : tensor<i64>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = []} ins(%arg1 : tensor<i64>) outs(%0 : tensor<i64>) {
    ^bb0(%in: i64, %out: i64):
      %2 = arith.index_cast %in : i64 to index
      %extracted = tensor.extract %arg0[%2] : tensor<2xi64>
      linalg.yield %extracted : i64
    } -> tensor<i64>
    return %1 : tensor<i64>
  }
}

