module {
  func.func @simple_KCRS_to_KCRSsr(%arg0: tensor<?x?xi32>, %arg1: tensor<1x1x?x1xi32>) -> tensor<1x1x?x1xi32> {
    %c8 = arith.constant 8 : index
    %c5_i32 = arith.constant 5 : i32
    %pack = linalg.pack %arg0 padding_value(%c5_i32 : i32) inner_dims_pos = [0, 1] inner_tiles = [%c8, 1] into %arg1 : tensor<?x?xi32> -> tensor<1x1x?x1xi32>
    return %pack : tensor<1x1x?x1xi32>
  }
}

// -----
module {
  func.func @NCHW_to_NCHWc(%arg0: tensor<2x32x16x8xf32>, %arg1: tensor<2x1x16x8x32xf32>) -> tensor<2x1x16x8x32xf32> {
    %pack = linalg.pack %arg0 inner_dims_pos = [1] inner_tiles = [32] into %arg1 : tensor<2x32x16x8xf32> -> tensor<2x1x16x8x32xf32>
    return %pack : tensor<2x1x16x8x32xf32>
  }
}

// -----
module {
  func.func @simple_pad_and_pack_static_tiles(%arg0: tensor<5x1xf32>, %arg1: tensor<1x1x8x2xf32>, %arg2: f32) -> tensor<1x1x8x2xf32> {
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 2] into %arg1 : tensor<5x1xf32> -> tensor<1x1x8x2xf32>
    return %pack : tensor<1x1x8x2xf32>
  }
  func.func @simple_pad_and_pack_dynamic_tile(%arg0: tensor<5x1xf32>, %arg1: tensor<1x1x?x2xf32>, %arg2: f32, %arg3: index) -> tensor<1x1x?x2xf32> {
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) inner_dims_pos = [0, 1] inner_tiles = [%arg3, 2] into %arg1 : tensor<5x1xf32> -> tensor<1x1x?x2xf32>
    return %pack : tensor<1x1x?x2xf32>
  }
  func.func @simple_pad_and_pack_dynamic_tile_cst(%arg0: tensor<5x1xf32>, %arg1: tensor<1x1x?x2xf32>, %arg2: f32) -> tensor<1x1x?x2xf32> {
    %c8 = arith.constant 8 : index
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) inner_dims_pos = [0, 1] inner_tiles = [%c8, 2] into %arg1 : tensor<5x1xf32> -> tensor<1x1x?x2xf32>
    return %pack : tensor<1x1x?x2xf32>
  }
  func.func @simple_pad_and_pack_dynamic_tile_transpose(%arg0: tensor<5x1xf32>, %arg1: tensor<1x1x2x?xf32>, %arg2: f32, %arg3: index) -> tensor<1x1x2x?xf32> {
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) inner_dims_pos = [1, 0] inner_tiles = [2, %arg3] into %arg1 : tensor<5x1xf32> -> tensor<1x1x2x?xf32>
    return %pack : tensor<1x1x2x?xf32>
  }
  func.func @simple_pad_and_pack_scalable_tile(%arg0: tensor<5x1xf32>, %arg1: tensor<1x1x?x2xf32>, %arg2: f32) -> tensor<1x1x?x2xf32> {
    %c8 = arith.constant 8 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %vscale, %c8 : index
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, 2] into %arg1 : tensor<5x1xf32> -> tensor<1x1x?x2xf32>
    return %pack : tensor<1x1x?x2xf32>
  }
  func.func @simple_pad_and_pack_dynamic_tiles(%arg0: tensor<5x1xf32>, %arg1: tensor<1x1x?x?xf32>, %arg2: f32, %arg3: index, %arg4: index) -> tensor<1x1x?x?xf32> {
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) inner_dims_pos = [0, 1] inner_tiles = [%arg3, %arg4] into %arg1 : tensor<5x1xf32> -> tensor<1x1x?x?xf32>
    return %pack : tensor<1x1x?x?xf32>
  }
}

// -----
module {
  func.func @simple_pad_and_pack_dynamic_tile_not_all_dims_tiled(%arg0: tensor<1x1x5x1xf32>, %arg1: tensor<1x1x1x1x2x?xf32>, %arg2: f32, %arg3: index) -> tensor<1x1x1x1x2x?xf32> {
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) outer_dims_perm = [1, 0, 2, 3] inner_dims_pos = [3, 2] inner_tiles = [2, %arg3] into %arg1 : tensor<1x1x5x1xf32> -> tensor<1x1x1x1x2x?xf32>
    return %pack : tensor<1x1x1x1x2x?xf32>
  }
}

// -----
module {
  func.func @negative_not_all_dims_tiled_outer_dim_0_permuted(%arg0: tensor<7x1x5x1xf32>, %arg1: tensor<1x7x1x1x2x?xf32>, %arg2: f32, %arg3: index) -> tensor<1x7x1x1x2x?xf32> {
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) outer_dims_perm = [1, 0, 2, 3] inner_dims_pos = [3, 2] inner_tiles = [2, %arg3] into %arg1 : tensor<7x1x5x1xf32> -> tensor<1x7x1x1x2x?xf32>
    return %pack : tensor<1x7x1x1x2x?xf32>
  }
}

// -----
module {
  func.func @negative_not_all_dims_tiled_outer_dim_1_permuted(%arg0: tensor<1x7x5x1xf32>, %arg1: tensor<7x1x1x1x2x?xf32>, %arg2: f32, %arg3: index) -> tensor<7x1x1x1x2x?xf32> {
    %pack = linalg.pack %arg0 padding_value(%arg2 : f32) outer_dims_perm = [1, 0, 2, 3] inner_dims_pos = [3, 2] inner_tiles = [2, %arg3] into %arg1 : tensor<1x7x5x1xf32> -> tensor<7x1x1x1x2x?xf32>
    return %pack : tensor<7x1x1x1x2x?xf32>
  }
}

// -----
module {
  func.func @simple_NC_to_CNnc(%arg0: tensor<32x8xf32>, %arg1: tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [32, 8] into %arg1 : tensor<32x8xf32> -> tensor<1x1x32x8xf32>
    return %pack : tensor<1x1x32x8xf32>
  }
}

// -----
module {
  func.func @simple_CHW_to_CHWhwc(%arg0: tensor<3x5x7xf32>, %arg1: tensor<1x1x1x5x7x3xf32>) -> tensor<1x1x1x5x7x3xf32> {
    %pack = linalg.pack %arg0 inner_dims_pos = [1, 2, 0] inner_tiles = [5, 7, 3] into %arg1 : tensor<3x5x7xf32> -> tensor<1x1x1x5x7x3xf32>
    return %pack : tensor<1x1x1x5x7x3xf32>
  }
}

// -----
module {
  func.func @simple_KCRS_to_KRSCsr(%arg0: tensor<1x1x32x8xf32>, %arg1: tensor<1x1x1x1x8x32xf32>) -> tensor<1x1x1x1x8x32xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [0, 2, 3, 1] inner_dims_pos = [3, 2] inner_tiles = [8, 32] into %arg1 : tensor<1x1x32x8xf32> -> tensor<1x1x1x1x8x32xf32>
    return %pack : tensor<1x1x1x1x8x32xf32>
  }
}

// -----
module {
  func.func @pack_with_non_adjacent_inner_dims_pos_and_unit_outer(%arg0: tensor<1x1x4xf32>, %arg1: tensor<1x1x1x4x1xf32>) -> tensor<1x1x1x4x1xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 0] inner_tiles = [4, 1] into %arg1 : tensor<1x1x4xf32> -> tensor<1x1x1x4x1xf32>
    return %pack : tensor<1x1x1x4x1xf32>
  }
}

// -----
module {
  func.func @pack_with_adjacent_trailing_dimensions_inner_dims_pos_and_unit_outer(%arg0: tensor<1x1x4xf32>, %arg1: tensor<1x1x1x4x1xf32>) -> tensor<1x1x1x4x1xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 1] inner_tiles = [4, 1] into %arg1 : tensor<1x1x4xf32> -> tensor<1x1x1x4x1xf32>
    return %pack : tensor<1x1x1x4x1xf32>
  }
}

// -----
module {
  func.func @pack_with_non_adjacent_and_non_permuted_inner_dims(%arg0: tensor<8x1x1x1xf32>, %arg1: tensor<1x1x1x1x8x1xf32>) -> tensor<1x1x1x1x8x1xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [0, 1, 2, 3] inner_dims_pos = [0, 3] inner_tiles = [8, 1] into %arg1 : tensor<8x1x1x1xf32> -> tensor<1x1x1x1x8x1xf32>
    return %pack : tensor<1x1x1x1x8x1xf32>
  }
}

// -----
module {
  func.func @negative_non_unit_tiled_outer_dim(%arg0: tensor<1x126x1x1x8xf32>, %arg1: tensor<1x1x1x1001xf32>, %arg2: f32) -> tensor<1x126x1x1x8xf32> {
    %pack = linalg.pack %arg1 padding_value(%arg2 : f32) outer_dims_perm = [0, 3, 2, 1] inner_dims_pos = [3] inner_tiles = [8] into %arg0 : tensor<1x1x1x1001xf32> -> tensor<1x126x1x1x8xf32>
    return %pack : tensor<1x126x1x1x8xf32>
  }
}

