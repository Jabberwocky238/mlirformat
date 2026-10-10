module {
  func.func @simple_KCRSsr_to_KCRS(%arg0: tensor<1x1x1x1x8x32xf32>, %arg1: tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [3, 2] inner_tiles = [8, 32] into %arg1 : tensor<1x1x1x1x8x32xf32> -> tensor<1x1x32x8xf32>
    return %unpack : tensor<1x1x32x8xf32>
  }
}

// -----
module {
  func.func @simple_unpack_static_tiles(%arg0: tensor<1x1x8x2xf32>, %arg1: tensor<5x1xf32>) -> tensor<5x1xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 2] into %arg1 : tensor<1x1x8x2xf32> -> tensor<5x1xf32>
    return %unpack : tensor<5x1xf32>
  }
  func.func @simple_unpack_dynamic_tile(%arg0: tensor<1x1x?x2xf32>, %arg1: tensor<5x1xf32>, %arg2: index) -> tensor<5x1xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%arg2, 2] into %arg1 : tensor<1x1x?x2xf32> -> tensor<5x1xf32>
    return %unpack : tensor<5x1xf32>
  }
  func.func @simple_unpack_dynamic_tile_transpose(%arg0: tensor<1x1x2x?xf32>, %arg1: tensor<5x1xf32>, %arg2: index) -> tensor<5x1xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 0] inner_tiles = [2, %arg2] into %arg1 : tensor<1x1x2x?xf32> -> tensor<5x1xf32>
    return %unpack : tensor<5x1xf32>
  }
  func.func @simple_unpack_scalable_tile(%arg0: tensor<1x1x?x2xf32>, %arg1: tensor<5x1xf32>) -> tensor<5x1xf32> {
    %c8 = arith.constant 8 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %vscale, %c8 : index
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, 2] into %arg1 : tensor<1x1x?x2xf32> -> tensor<5x1xf32>
    return %unpack : tensor<5x1xf32>
  }
}

// -----
module {
  func.func @simple_CNnc_to_NC(%arg0: tensor<1x1x32x8xf32>, %arg1: tensor<32x8xf32>) -> tensor<32x8xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [32, 8] into %arg1 : tensor<1x1x32x8xf32> -> tensor<32x8xf32>
    return %unpack : tensor<32x8xf32>
  }
}

// -----
module {
  func.func @simple_NCHWc_to_NCHW(%arg0: tensor<2x1x16x8x32xf32>, %arg1: tensor<2x32x16x8xf32>) -> tensor<2x32x16x8xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1] inner_tiles = [32] into %arg1 : tensor<2x1x16x8x32xf32> -> tensor<2x32x16x8xf32>
    return %unpack : tensor<2x32x16x8xf32>
  }
}

// -----
module {
  func.func @simple_NHWC_to_NCHW(%arg0: tensor<1x16x8x32xf32>, %arg1: tensor<1x32x16x8xf32>) -> tensor<1x32x16x8xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 2, 3, 1] inner_dims_pos = [] inner_tiles = [] into %arg1 : tensor<1x16x8x32xf32> -> tensor<1x32x16x8xf32>
    return %unpack : tensor<1x32x16x8xf32>
  }
}

// -----
module {
  func.func @unpack_with_dynamic_dims(%arg0: tensor<?x1x1x1x8x32xf32>, %arg1: tensor<?x1x32x8xf32>) -> tensor<?x1x32x8xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [3, 2] inner_tiles = [8, 32] into %arg1 : tensor<?x1x1x1x8x32xf32> -> tensor<?x1x32x8xf32>
    return %unpack : tensor<?x1x32x8xf32>
  }
}

// -----
module {
  func.func @unpack_with_non_adjacent_inner_dims_pos_and_unit_outer(%arg0: tensor<1x1x1x4x1xf32>, %arg1: tensor<1x1x4xf32>) -> tensor<1x1x4xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 0] inner_tiles = [4, 1] into %arg1 : tensor<1x1x1x4x1xf32> -> tensor<1x1x4xf32>
    return %unpack : tensor<1x1x4xf32>
  }
}

// -----
module {
  func.func @unpack_with_non_trailing_dimensions_in_inner_dims(%arg0: tensor<1x1x1x4x1xf32>, %arg1: tensor<1x1x4xf32>) -> tensor<1x1x4xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 1] inner_tiles = [4, 1] into %arg1 : tensor<1x1x1x4x1xf32> -> tensor<1x1x4xf32>
    return %unpack : tensor<1x1x4xf32>
  }
}

// -----
module {
  func.func @negative_non_unit_tiled_outer_dim(%arg0: tensor<1x126x1x1x8xf32>, %arg1: tensor<1x1x1x1001xf32>) -> tensor<1x1x1x1001xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 3, 2, 1] inner_dims_pos = [3] inner_tiles = [8] into %arg1 : tensor<1x126x1x1x8xf32> -> tensor<1x1x1x1001xf32>
    return %unpack : tensor<1x1x1x1001xf32>
  }
}

