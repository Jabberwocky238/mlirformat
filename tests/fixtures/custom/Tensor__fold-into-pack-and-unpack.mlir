module {
  func.func @fold_extract_slice_into_unpack_slicing_trailing_dim(%arg0: tensor<28x2x1x16x16xf32>) -> tensor<28x28x10xf32> {
    %0 = tensor.empty() : tensor<28x28x15xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 2] inner_tiles = [16, 16] into %0 : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, 0, 0] [28, 28, 10] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x28x10xf32>
    return %extracted_slice : tensor<28x28x10xf32>
  }
}

// -----
module {
  func.func @fold_extract_slice_into_unpack_slicing_dim_1(%arg0: tensor<28x2x1x16x16xf32>) -> tensor<28x17x15xf32> {
    %0 = tensor.empty() : tensor<28x28x15xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 2] inner_tiles = [16, 16] into %0 : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, 0, 0] [28, 17, 15] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x17x15xf32>
    return %extracted_slice : tensor<28x17x15xf32>
  }
}

// -----
module {
  func.func @no_fold_extract_slice_into_unpack_artificial_padding(%arg0: tensor<28x2x1x16x16xf32>) -> tensor<28x16x15xf32> {
    %0 = tensor.empty() : tensor<28x28x15xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 2] inner_tiles = [16, 16] into %0 : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, 0, 0] [28, 16, 15] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x16x15xf32>
    return %extracted_slice : tensor<28x16x15xf32>
  }
}

// -----
module {
  func.func @no_fold_extract_slice_into_unpack_dynamic(%arg0: tensor<28x2x?x16x16xf32>, %arg1: tensor<28x32x?xf32>, %arg2: index) -> tensor<28x28x?xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 1, 2] inner_dims_pos = [1, 2] inner_tiles = [16, 16] into %arg1 : tensor<28x2x?x16x16xf32> -> tensor<28x32x?xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, 0, 0] [28, 28, %arg2] [1, 1, 1] : tensor<28x32x?xf32> to tensor<28x28x?xf32>
    return %extracted_slice : tensor<28x28x?xf32>
  }
}

// -----
module {
  func.func @nofold_dynamic_unpack_slice(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 4] into %arg1 : tensor<?x?x8x4xf32> -> tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, 0] [%arg2, %arg3] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @nofold_unpack_slice_non_zero_offset(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 4] into %arg1 : tensor<?x?x8x4xf32> -> tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, %arg4] [%arg2, %arg3] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @nofold_unpack_slice_non_unit_stride(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 4] into %arg1 : tensor<?x?x8x4xf32> -> tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, 0] [%arg2, %arg3] [%arg4, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @nofold_unpack_slice_rank_reduced(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<f32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 4] into %arg1 : tensor<?x?x8x4xf32> -> tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %unpack[0, 0] [1, 1] [1, 1] : tensor<?x?xf32> to tensor<f32>
    return %extracted_slice : tensor<f32>
  }
}

// -----
module {
  func.func @fold_pad_pack(%arg0: tensor<9x16xf32>) -> tensor<2x1x8x32xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0] high[7, 0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<9x16xf32> to tensor<16x16xf32>
    %0 = tensor.empty() : tensor<2x1x8x32xf32>
    %pack = linalg.pack %padded padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %0 : tensor<16x16xf32> -> tensor<2x1x8x32xf32>
    return %pack : tensor<2x1x8x32xf32>
  }
}

// -----
module {
  func.func @nofold_pad_pack_artificial_padding(%arg0: tensor<9x16xf32>) -> tensor<3x1x8x32xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0] high[8, 0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<9x16xf32> to tensor<17x16xf32>
    %0 = tensor.empty() : tensor<3x1x8x32xf32>
    %pack = linalg.pack %padded padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %0 : tensor<17x16xf32> -> tensor<3x1x8x32xf32>
    return %pack : tensor<3x1x8x32xf32>
  }
}

// -----
module {
  func.func @nofold_pad_pack_with_nofold_attribute(%arg0: tensor<16649x16xf32>) -> tensor<2082x1x8x32xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 nofold low[0, 0] high[7, 0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<16649x16xf32> to tensor<16656x16xf32>
    %0 = tensor.empty() : tensor<2082x1x8x32xf32>
    %pack = linalg.pack %padded padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %0 : tensor<16656x16xf32> -> tensor<2082x1x8x32xf32>
    return %pack : tensor<2082x1x8x32xf32>
  }
}

// -----
module {
  func.func @pad_pack_different_padding_value(%arg0: tensor<16641x16xf32>) -> tensor<2082x1x8x32xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 0] high[15, 0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<16641x16xf32> to tensor<16656x16xf32>
    %0 = tensor.empty() : tensor<2082x1x8x32xf32>
    %pack = linalg.pack %padded padding_value(%cst_0 : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %0 : tensor<16656x16xf32> -> tensor<2082x1x8x32xf32>
    return %pack : tensor<2082x1x8x32xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold(%arg0: tensor<56x57x1x64xf32>) -> tensor<1x57x56x2x32xf32> {
    %0 = tensor.empty() : tensor<56x2x1x57x32xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [0, 3, 2, 1] inner_dims_pos = [3] inner_tiles = [32] into %0 : tensor<56x57x1x64xf32> -> tensor<56x2x1x57x32xf32>
    %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
    %transposed = linalg.transpose ins(%pack : tensor<56x2x1x57x32xf32>) outs(%1 : tensor<1x57x56x2x32xf32>) permutation = [2, 3, 0, 1, 4] 
    return %transposed : tensor<1x57x56x2x32xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold_with_padding(%arg0: tensor<56x57x1x55xf32>, %arg1: f32) -> tensor<1x57x56x2x32xf32> {
    %0 = tensor.empty() : tensor<56x2x1x57x32xf32>
    %pack = linalg.pack %arg0 padding_value(%arg1 : f32) outer_dims_perm = [0, 3, 2, 1] inner_dims_pos = [3] inner_tiles = [32] into %0 : tensor<56x57x1x55xf32> -> tensor<56x2x1x57x32xf32>
    %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
    %transposed = linalg.transpose ins(%pack : tensor<56x2x1x57x32xf32>) outs(%1 : tensor<1x57x56x2x32xf32>) permutation = [2, 3, 0, 1, 4] 
    return %transposed : tensor<1x57x56x2x32xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold_no_outer_dims_perm(%arg0: tensor<56x57x1x64xf32>) -> tensor<1x2x56x57x32xf32> {
    %0 = tensor.empty() : tensor<56x57x1x2x32xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [3] inner_tiles = [32] into %0 : tensor<56x57x1x64xf32> -> tensor<56x57x1x2x32xf32>
    %1 = tensor.empty() : tensor<1x2x56x57x32xf32>
    %transposed = linalg.transpose ins(%pack : tensor<56x57x1x2x32xf32>) outs(%1 : tensor<1x2x56x57x32xf32>) permutation = [2, 3, 0, 1, 4] 
    return %transposed : tensor<1x2x56x57x32xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold_tile_dims_transpose(%arg0: tensor<56x72x24x128xf32>) -> tensor<12x56x4x9x32x8x2xf32> {
    %0 = tensor.empty() : tensor<4x9x12x56x8x2x32xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [3, 1, 2, 0] inner_dims_pos = [1, 2, 3] inner_tiles = [8, 2, 32] into %0 : tensor<56x72x24x128xf32> -> tensor<4x9x12x56x8x2x32xf32>
    %1 = tensor.empty() : tensor<12x56x4x9x32x8x2xf32>
    %transposed = linalg.transpose ins(%pack : tensor<4x9x12x56x8x2x32xf32>) outs(%1 : tensor<12x56x4x9x32x8x2xf32>) permutation = [2, 3, 0, 1, 6, 4, 5] 
    return %transposed : tensor<12x56x4x9x32x8x2xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold_tile_dims_outer_dims_transpose(%arg0: tensor<56x72x24x128xf32>) -> tensor<9x56x2x12x32x8x4xf32> {
    %0 = tensor.empty() : tensor<4x12x9x56x8x2x32xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [3, 2, 1, 0] inner_dims_pos = [1, 2, 3] inner_tiles = [8, 2, 32] into %0 : tensor<56x72x24x128xf32> -> tensor<4x12x9x56x8x2x32xf32>
    %1 = tensor.empty() : tensor<9x56x2x12x32x8x4xf32>
    %transposed = linalg.transpose ins(%pack : tensor<4x12x9x56x8x2x32xf32>) outs(%1 : tensor<9x56x2x12x32x8x4xf32>) permutation = [2, 3, 5, 1, 6, 4, 0] 
    return %transposed : tensor<9x56x2x12x32x8x4xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold_dynamic_outer_dims(%arg0: tensor<56x?x?x64xf32>) -> tensor<?x?x56x2x32xf32> {
    %0 = tensor.empty() : tensor<56x2x1x57x32xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [0, 3, 2, 1] inner_dims_pos = [3] inner_tiles = [32] into %0 : tensor<56x?x?x64xf32> -> tensor<56x2x1x57x32xf32>
    %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
    %transposed = linalg.transpose ins(%pack : tensor<56x2x1x57x32xf32>) outs(%1 : tensor<1x57x56x2x32xf32>) permutation = [2, 3, 0, 1, 4] 
    %cast = tensor.cast %transposed : tensor<1x57x56x2x32xf32> to tensor<?x?x56x2x32xf32>
    return %cast : tensor<?x?x56x2x32xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold_dynamic_outer_and_tile_dims(%arg0: tensor<56x?x?x128xf32>) -> tensor<?x?x56x9x32x8x2xf32> {
    %0 = tensor.empty() : tensor<56x9x12x4x8x2x32xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [1, 2, 3] inner_tiles = [8, 2, 32] into %0 : tensor<56x?x?x128xf32> -> tensor<56x9x12x4x8x2x32xf32>
    %1 = tensor.empty() : tensor<12x4x56x9x32x8x2xf32>
    %transposed = linalg.transpose ins(%pack : tensor<56x9x12x4x8x2x32xf32>) outs(%1 : tensor<12x4x56x9x32x8x2xf32>) permutation = [2, 3, 0, 1, 6, 4, 5] 
    %cast = tensor.cast %transposed : tensor<12x4x56x9x32x8x2xf32> to tensor<?x?x56x9x32x8x2xf32>
    return %cast : tensor<?x?x56x9x32x8x2xf32>
  }
}

// -----
module {
  func.func @linalg.pack_linalg_transpose_fold_dynamic_outer_dims_tile_dims_tile_sizes(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?x?x?xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<?x?x?x?x?x?x?xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [3, 0, 2, 1] inner_dims_pos = [1, 2, 3] inner_tiles = [%arg3, %arg4, %arg5] into %arg1 : tensor<?x?x?x?xf32> -> tensor<?x?x?x?x?x?x?xf32>
    %transposed = linalg.transpose ins(%pack : tensor<?x?x?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?x?x?xf32>) permutation = [2, 3, 0, 1, 6, 4, 5] 
    return %transposed : tensor<?x?x?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.pack_fold(%arg0: tensor<56x57x1x64xf32>) -> tensor<1x57x56x2x32xf32> {
    %0 = tensor.empty() : tensor<1x56x57x64xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<56x57x1x64xf32>) outs(%0 : tensor<1x56x57x64xf32>) permutation = [2, 0, 1, 3] 
    %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
    %pack = linalg.pack %transposed outer_dims_perm = [0, 2, 1, 3] inner_dims_pos = [3] inner_tiles = [32] into %1 : tensor<1x56x57x64xf32> -> tensor<1x57x56x2x32xf32>
    return %pack : tensor<1x57x56x2x32xf32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.pack_fold_multi_result(%arg0: tensor<56x57x1x64xf32>) -> (tensor<1x56x57x64xf32>, tensor<1x57x56x2x32xf32>) {
    %0 = tensor.empty() : tensor<1x56x57x64xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<56x57x1x64xf32>) outs(%0 : tensor<1x56x57x64xf32>) permutation = [2, 0, 1, 3] 
    %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
    %pack = linalg.pack %transposed outer_dims_perm = [0, 2, 1, 3] inner_dims_pos = [3] inner_tiles = [32] into %1 : tensor<1x56x57x64xf32> -> tensor<1x57x56x2x32xf32>
    return %transposed, %pack : tensor<1x56x57x64xf32>, tensor<1x57x56x2x32xf32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.pack_fold_with_padding(%arg0: tensor<56x57x1x55xf32>, %arg1: f32) -> tensor<1x57x56x2x32xf32> {
    %0 = tensor.empty() : tensor<1x56x57x55xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<56x57x1x55xf32>) outs(%0 : tensor<1x56x57x55xf32>) permutation = [2, 0, 1, 3] 
    %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
    %pack = linalg.pack %transposed padding_value(%arg1 : f32) outer_dims_perm = [0, 2, 1, 3] inner_dims_pos = [3] inner_tiles = [32] into %1 : tensor<1x56x57x55xf32> -> tensor<1x57x56x2x32xf32>
    return %pack : tensor<1x57x56x2x32xf32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.pack_fold_no_outer_dims_perm(%arg0: tensor<56x57x1x64xf32>) -> tensor<1x56x57x2x32xf32> {
    %0 = tensor.empty() : tensor<1x56x57x64xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<56x57x1x64xf32>) outs(%0 : tensor<1x56x57x64xf32>) permutation = [2, 0, 1, 3] 
    %1 = tensor.empty() : tensor<1x56x57x2x32xf32>
    %pack = linalg.pack %transposed inner_dims_pos = [3] inner_tiles = [32] into %1 : tensor<1x56x57x64xf32> -> tensor<1x56x57x2x32xf32>
    return %pack : tensor<1x56x57x2x32xf32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.pack_fold_complex_inner_dims_change(%arg0: tensor<25x30x35x40xf32>, %arg1: tensor<35x40x25x30xf32>, %arg2: tensor<3x35x5x8x5x10x5xf32>) -> tensor<3x35x5x8x5x10x5xf32> {
    %transposed = linalg.transpose ins(%arg0 : tensor<25x30x35x40xf32>) outs(%arg1 : tensor<35x40x25x30xf32>) permutation = [2, 3, 0, 1] 
    %pack = linalg.pack %transposed outer_dims_perm = [3, 0, 2, 1] inner_dims_pos = [1, 3, 2] inner_tiles = [5, 10, 5] into %arg2 : tensor<35x40x25x30xf32> -> tensor<3x35x5x8x5x10x5xf32>
    return %pack : tensor<3x35x5x8x5x10x5xf32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.pack_fold_dynamic_outer_dims_tile_dims_tile_sizes(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?x?x?xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<?x?x?x?x?x?x?xf32> {
    %transposed = linalg.transpose ins(%arg0 : tensor<?x?x?x?xf32>) outs(%arg1 : tensor<?x?x?x?xf32>) permutation = [2, 3, 0, 1] 
    %pack = linalg.pack %transposed outer_dims_perm = [3, 0, 2, 1] inner_dims_pos = [1, 3, 2] inner_tiles = [%arg3, %arg4, %arg5] into %arg2 : tensor<?x?x?x?xf32> -> tensor<?x?x?x?x?x?x?xf32>
    return %pack : tensor<?x?x?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.pack_multiple_tiles(%arg0: tensor<?x32x128xbf16>) -> tensor<32x?x64x16x2xbf16> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : bf16
    %dim = tensor.dim %arg0, %c0 : tensor<?x32x128xbf16>
    %0 = tensor.empty(%dim) : tensor<32x128x?xbf16>
    %transposed = linalg.transpose ins(%arg0 : tensor<?x32x128xbf16>) outs(%0 : tensor<32x128x?xbf16>) permutation = [1, 2, 0] 
    %1 = tensor.empty(%dim) : tensor<32x?x64x16x2xbf16>
    %pack = linalg.pack %transposed padding_value(%cst : bf16) outer_dims_perm = [0, 2, 1] inner_dims_pos = [2, 1] inner_tiles = [16, 2] into %1 : tensor<32x128x?xbf16> -> tensor<32x?x64x16x2xbf16>
    return %pack : tensor<32x?x64x16x2xbf16>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.unpack_fold(%arg0: tensor<1x1x4x16xi32>) -> tensor<16x4xi32> {
    %0 = tensor.empty() : tensor<1x1x16x4xi32>
    %transposed = linalg.transpose ins(%arg0 : tensor<1x1x4x16xi32>) outs(%0 : tensor<1x1x16x4xi32>) permutation = [1, 0, 3, 2] 
    %1 = tensor.empty() : tensor<16x4xi32>
    %unpack = linalg.unpack %transposed outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [16, 4] into %1 : tensor<1x1x16x4xi32> -> tensor<16x4xi32>
    return %unpack : tensor<16x4xi32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.unpack_fold_multi_result(%arg0: tensor<1x1x4x16xi32>) -> (tensor<1x1x16x4xi32>, tensor<16x4xi32>) {
    %0 = tensor.empty() : tensor<1x1x16x4xi32>
    %transposed = linalg.transpose ins(%arg0 : tensor<1x1x4x16xi32>) outs(%0 : tensor<1x1x16x4xi32>) permutation = [1, 0, 3, 2] 
    %1 = tensor.empty() : tensor<16x4xi32>
    %unpack = linalg.unpack %transposed outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [16, 4] into %1 : tensor<1x1x16x4xi32> -> tensor<16x4xi32>
    return %transposed, %unpack : tensor<1x1x16x4xi32>, tensor<16x4xi32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.unpack_fold_partial_tile(%arg0: tensor<1x1x4x16xi32>) -> tensor<15x3xi32> {
    %0 = tensor.empty() : tensor<1x1x16x4xi32>
    %transposed = linalg.transpose ins(%arg0 : tensor<1x1x4x16xi32>) outs(%0 : tensor<1x1x16x4xi32>) permutation = [1, 0, 3, 2] 
    %1 = tensor.empty() : tensor<15x3xi32>
    %unpack = linalg.unpack %transposed outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [16, 4] into %1 : tensor<1x1x16x4xi32> -> tensor<15x3xi32>
    return %unpack : tensor<15x3xi32>
  }
}

// -----
module {
  func.func @linalg_transpose_linalg.unpack_fold_dynamic_outer_dims_tile_dims_tile_sizes(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index) -> tensor<?x?xf32> {
    %transposed = linalg.transpose ins(%arg0 : tensor<?x?x?x?xf32>) outs(%arg1 : tensor<?x?x?x?xf32>) permutation = [1, 0, 3, 2] 
    %unpack = linalg.unpack %transposed outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [%arg3, %arg4] into %arg2 : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @linalg.unpack_linalg_transpose_fold(%arg0: tensor<56x57x1x64xf32>) -> tensor<3648x56xf32> {
    %0 = tensor.empty() : tensor<56x3648xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [1, 64] into %0 : tensor<56x57x1x64xf32> -> tensor<56x3648xf32>
    %1 = tensor.empty() : tensor<3648x56xf32>
    %transposed = linalg.transpose ins(%unpack : tensor<56x3648xf32>) outs(%1 : tensor<3648x56xf32>) permutation = [1, 0] 
    return %transposed : tensor<3648x56xf32>
  }
}

// -----
module {
  func.func @tensor_padded_unpack_linalg_transpose_fold(%arg0: tensor<71x7x4x16x16xf32>) -> tensor<100x71x64xf32> {
    %0 = tensor.empty() : tensor<71x100x64xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 2] inner_tiles = [16, 16] into %0 : tensor<71x7x4x16x16xf32> -> tensor<71x100x64xf32>
    %1 = tensor.empty() : tensor<100x71x64xf32>
    %transposed = linalg.transpose ins(%unpack : tensor<71x100x64xf32>) outs(%1 : tensor<100x71x64xf32>) permutation = [1, 0, 2] 
    return %transposed : tensor<100x71x64xf32>
  }
}

// -----
module {
  func.func @non_involution_transpose_unpack_fold(%arg0: tensor<2x3x5x4x16xi32>) -> tensor<5x48x8xi32> {
    %0 = tensor.empty() : tensor<5x2x3x16x4xi32>
    %transposed = linalg.transpose ins(%arg0 : tensor<2x3x5x4x16xi32>) outs(%0 : tensor<5x2x3x16x4xi32>) permutation = [2, 0, 1, 4, 3] 
    %1 = tensor.empty() : tensor<5x48x8xi32>
    %unpack = linalg.unpack %transposed outer_dims_perm = [0, 2, 1] inner_dims_pos = [1, 2] inner_tiles = [16, 4] into %1 : tensor<5x2x3x16x4xi32> -> tensor<5x48x8xi32>
    return %unpack : tensor<5x48x8xi32>
  }
}

// -----
module {
  func.func @unpack_non_involution_transpose_fold(%arg0: tensor<57x3x56x1x64xf32>) -> tensor<3648x3x56xf32> {
    %0 = tensor.empty() : tensor<3x56x3648xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [2, 0, 1] inner_dims_pos = [1, 2] inner_tiles = [1, 64] into %0 : tensor<57x3x56x1x64xf32> -> tensor<3x56x3648xf32>
    %1 = tensor.empty() : tensor<3648x3x56xf32>
    %transposed = linalg.transpose ins(%unpack : tensor<3x56x3648xf32>) outs(%1 : tensor<3648x3x56xf32>) permutation = [2, 0, 1] 
    return %transposed : tensor<3648x3x56xf32>
  }
}

// -----
module {
  func.func @transpose_unpacked_dims_no_fold(%arg0: tensor<2x16x5x4x3xi32>) -> tensor<5x32x12xi32> {
    %0 = tensor.empty() : tensor<5x2x3x16x4xi32>
    %transposed = linalg.transpose ins(%arg0 : tensor<2x16x5x4x3xi32>) outs(%0 : tensor<5x2x3x16x4xi32>) permutation = [2, 0, 4, 1, 3] 
    %1 = tensor.empty() : tensor<5x32x12xi32>
    %unpack = linalg.unpack %transposed inner_dims_pos = [1, 2] inner_tiles = [16, 4] into %1 : tensor<5x2x3x16x4xi32> -> tensor<5x32x12xi32>
    return %unpack : tensor<5x32x12xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d0, d4, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
module {
  func.func @generic_transpose_unpack_fold(%arg0: tensor<2x3x5x4x16xi32>) -> tensor<5x48x8xi32> {
    %0 = tensor.empty() : tensor<5x2x3x16x4xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x5x4x16xi32>) outs(%0 : tensor<5x2x3x16x4xi32>) {
    ^bb0(%in: i32, %out: i32):
      linalg.yield %in : i32
    } -> tensor<5x2x3x16x4xi32>
    %2 = tensor.empty() : tensor<5x48x8xi32>
    %unpack = linalg.unpack %1 outer_dims_perm = [0, 2, 1] inner_dims_pos = [1, 2] inner_tiles = [16, 4] into %2 : tensor<5x2x3x16x4xi32> -> tensor<5x48x8xi32>
    return %unpack : tensor<5x48x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @unpack_generic_transpose_fold(%arg0: tensor<57x3x56x1x64xf32>) -> tensor<3648x3x56xf32> {
    %0 = tensor.empty() : tensor<3x56x3648xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [2, 0, 1] inner_dims_pos = [1, 2] inner_tiles = [1, 64] into %0 : tensor<57x3x56x1x64xf32> -> tensor<3x56x3648xf32>
    %1 = tensor.empty() : tensor<3648x3x56xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%unpack : tensor<3x56x3648xf32>) outs(%1 : tensor<3648x3x56xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3648x3x56xf32>
    return %2 : tensor<3648x3x56xf32>
  }
}

