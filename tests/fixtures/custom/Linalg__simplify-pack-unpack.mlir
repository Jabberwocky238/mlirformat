module {
  func.func @single_dim_packing(%arg0: tensor<256xf32>) -> tensor<8x32xf32> {
    %0 = tensor.empty() : tensor<8x32xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0] inner_tiles = [32] into %0 : tensor<256xf32> -> tensor<8x32xf32>
    return %pack : tensor<8x32xf32>
  }
}

// -----
module {
  func.func @single_dim_packing_with_padding(%arg0: tensor<255xf32>) -> tensor<8x32xf32> {
    %0 = tensor.empty() : tensor<8x32xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [0] inner_tiles = [32] into %0 : tensor<255xf32> -> tensor<8x32xf32>
    return %pack : tensor<8x32xf32>
  }
}

// -----
module {
  func.func @single_last_inner_dim_packing(%arg0: tensor<5x256xf32>) -> tensor<5x8x32xf32> {
    %0 = tensor.empty() : tensor<5x8x32xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [1] inner_tiles = [32] into %0 : tensor<5x256xf32> -> tensor<5x8x32xf32>
    return %pack : tensor<5x8x32xf32>
  }
}

// -----
module {
  func.func @pack_1d_with_outer_dims_perm(%arg0: tensor<64xf32>) -> tensor<2x32xf32> {
    %0 = tensor.empty() : tensor<2x32xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [0] inner_dims_pos = [0] inner_tiles = [32] into %0 : tensor<64xf32> -> tensor<2x32xf32>
    return %pack : tensor<2x32xf32>
  }
}

// -----
module {
  func.func @single_last_inner_dim_packing_with_identity_outer_dims_perm(%arg0: tensor<5x256xf32>) -> tensor<5x8x32xf32> {
    %0 = tensor.empty() : tensor<5x8x32xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [0, 1] inner_dims_pos = [1] inner_tiles = [32] into %0 : tensor<5x256xf32> -> tensor<5x8x32xf32>
    return %pack : tensor<5x8x32xf32>
  }
}

// -----
module {
  func.func @packing_with_outer_dims_perm(%arg0: tensor<5x256xf32>) -> tensor<8x5x32xf32> {
    %0 = tensor.empty() : tensor<8x5x32xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [1] inner_tiles = [32] into %0 : tensor<5x256xf32> -> tensor<8x5x32xf32>
    return %pack : tensor<8x5x32xf32>
  }
}

// -----
module {
  func.func @single_first_inner_dim_packing(%arg0: tensor<256x5xf32>) -> tensor<8x5x32xf32> {
    %0 = tensor.empty() : tensor<8x5x32xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0] inner_tiles = [32] into %0 : tensor<256x5xf32> -> tensor<8x5x32xf32>
    return %pack : tensor<8x5x32xf32>
  }
}

// -----
module {
  func.func @pack_1x32_to_1x32x1x1(%arg0: tensor<1x32xf32>) -> tensor<1x32x1x1xf32> {
    %0 = tensor.empty() : tensor<1x32x1x1xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [1, 1] into %0 : tensor<1x32xf32> -> tensor<1x32x1x1xf32>
    return %pack : tensor<1x32x1x1xf32>
  }
}

// -----
module {
  func.func @pack_1x32_to_1x16x1x2(%arg0: tensor<1x32xf32>) -> tensor<1x16x1x2xf32> {
    %0 = tensor.empty() : tensor<1x16x1x2xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [1, 2] into %0 : tensor<1x32xf32> -> tensor<1x16x1x2xf32>
    return %pack : tensor<1x16x1x2xf32>
  }
}

// -----
module {
  func.func @pack_32x1_to_16x1x2x1(%arg0: tensor<32x1xf32>) -> tensor<1x16x2x1xf32> {
    %0 = tensor.empty() : tensor<1x16x2x1xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [2, 1] into %0 : tensor<32x1xf32> -> tensor<1x16x2x1xf32>
    return %pack : tensor<1x16x2x1xf32>
  }
}

// -----
module {
  func.func @pack_32x1_to_16x1x1x2(%arg0: tensor<32x1xf32>) -> tensor<16x1x1x2xf32> {
    %0 = tensor.empty() : tensor<16x1x1x2xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [1, 0] inner_tiles = [1, 2] into %0 : tensor<32x1xf32> -> tensor<16x1x1x2xf32>
    return %pack : tensor<16x1x1x2xf32>
  }
}

// -----
module {
  func.func @unpack_1d_to_collapse(%arg0: tensor<8x32xf32>) -> tensor<256xf32> {
    %0 = tensor.empty() : tensor<256xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0] inner_tiles = [32] into %0 : tensor<8x32xf32> -> tensor<256xf32>
    return %unpack : tensor<256xf32>
  }
}

// -----
module {
  func.func @unpack_to_partial_slice(%arg0: tensor<8x32xf32>) -> tensor<255xf32> {
    %0 = tensor.empty() : tensor<255xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0] inner_tiles = [32] into %0 : tensor<8x32xf32> -> tensor<255xf32>
    return %unpack : tensor<255xf32>
  }
}

// -----
module {
  func.func @unpack_dynamic(%arg0: tensor<?x32xf32>) -> tensor<?xf32> {
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x32xf32>
    %0 = arith.muli %dim, %c32 : index
    %1 = tensor.empty(%0) : tensor<?xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0] inner_tiles = [32] into %1 : tensor<?x32xf32> -> tensor<?xf32>
    return %unpack : tensor<?xf32>
  }
}

// -----
module {
  func.func @single_last_inner_dim_unpacking(%arg0: tensor<5x8x32xf32>) -> tensor<5x256xf32> {
    %0 = tensor.empty() : tensor<5x256xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1] inner_tiles = [32] into %0 : tensor<5x8x32xf32> -> tensor<5x256xf32>
    return %unpack : tensor<5x256xf32>
  }
}

// -----
module {
  func.func @single_last_inner_dim_unpacking_with_identity_outer_dims_perm(%arg0: tensor<5x8x32xf32>) -> tensor<5x256xf32> {
    %0 = tensor.empty() : tensor<5x256xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 1] inner_dims_pos = [1] inner_tiles = [32] into %0 : tensor<5x8x32xf32> -> tensor<5x256xf32>
    return %unpack : tensor<5x256xf32>
  }
}

// -----
module {
  func.func @unpacking_with_outer_dims_perm(%arg0: tensor<8x5x32xf32>) -> tensor<5x256xf32> {
    %0 = tensor.empty() : tensor<5x256xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [1] inner_tiles = [32] into %0 : tensor<8x5x32xf32> -> tensor<5x256xf32>
    return %unpack : tensor<5x256xf32>
  }
}

// -----
module {
  func.func @single_first_inner_dim_unpacking(%arg0: tensor<8x5x32xf32>) -> tensor<256x5xf32> {
    %0 = tensor.empty() : tensor<256x5xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0] inner_tiles = [32] into %0 : tensor<8x5x32xf32> -> tensor<256x5xf32>
    return %unpack : tensor<256x5xf32>
  }
}

// -----
module {
  func.func @unpack_1x32x1x1_to_1x32(%arg0: tensor<1x32x1x1xf32>) -> tensor<1x32xf32> {
    %0 = tensor.empty() : tensor<1x32xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [1, 1] into %0 : tensor<1x32x1x1xf32> -> tensor<1x32xf32>
    return %unpack : tensor<1x32xf32>
  }
}

// -----
module {
  func.func @unpack_1x2x1x16_to_1x32(%arg0: tensor<1x2x1x16xf32>) -> tensor<1x32xf32> {
    %0 = tensor.empty() : tensor<1x32xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [1, 16] into %0 : tensor<1x2x1x16xf32> -> tensor<1x32xf32>
    return %unpack : tensor<1x32xf32>
  }
}

// -----
module {
  func.func @unpack_16x1x2x1_to_32x1(%arg0: tensor<1x16x2x1xf32>) -> tensor<32x1xf32> {
    %0 = tensor.empty() : tensor<32x1xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [2, 1] into %0 : tensor<1x16x2x1xf32> -> tensor<32x1xf32>
    return %unpack : tensor<32x1xf32>
  }
}

// -----
module {
  func.func @unpack_16x1x1x2_to_32x1(%arg0: tensor<16x1x1x2xf32>) -> tensor<32x1xf32> {
    %0 = tensor.empty() : tensor<32x1xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 0] inner_tiles = [1, 2] into %0 : tensor<16x1x1x2xf32> -> tensor<32x1xf32>
    return %unpack : tensor<32x1xf32>
  }
}

// -----
module {
  func.func @pad_like_pack(%arg0: tensor<32x64xf32>) -> tensor<1x1x32x64xf32> {
    %0 = tensor.empty() : tensor<1x1x32x64xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [32, 64] into %0 : tensor<32x64xf32> -> tensor<1x1x32x64xf32>
    return %pack : tensor<1x1x32x64xf32>
  }
}

// -----
module {
  func.func @pad_like_pack_with_outer_dims_perm(%arg0: tensor<32x64xf32>) -> tensor<1x1x32x64xf32> {
    %0 = tensor.empty() : tensor<1x1x32x64xf32>
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [32, 64] into %0 : tensor<32x64xf32> -> tensor<1x1x32x64xf32>
    return %pack : tensor<1x1x32x64xf32>
  }
}

// -----
module {
  func.func @inner_pad_like_pack(%arg0: tensor<32x64xf32>) -> tensor<32x1x64xf32> {
    %0 = tensor.empty() : tensor<32x1x64xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [1] inner_tiles = [64] into %0 : tensor<32x64xf32> -> tensor<32x1x64xf32>
    return %pack : tensor<32x1x64xf32>
  }
}

// -----
module {
  func.func @pad_and_inner_dim_shuffle_pack(%arg0: tensor<32x64xf32>) -> tensor<1x1x64x32xf32> {
    %0 = tensor.empty() : tensor<1x1x64x32xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [1, 0] inner_tiles = [64, 32] into %0 : tensor<32x64xf32> -> tensor<1x1x64x32xf32>
    return %pack : tensor<1x1x64x32xf32>
  }
}

// -----
module {
  func.func @pad_like_pack_with_transpose(%arg0: tensor<32x64x16xf32>) -> tensor<32x1x16x64xf32> {
    %0 = tensor.empty() : tensor<32x1x16x64xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [1] inner_tiles = [64] into %0 : tensor<32x64x16xf32> -> tensor<32x1x16x64xf32>
    return %pack : tensor<32x1x16x64xf32>
  }
}

// -----
module {
  func.func @unpad_like_unpack(%arg0: tensor<1x1x32x64xf32>) -> tensor<32x64xf32> {
    %0 = tensor.empty() : tensor<32x64xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [32, 64] into %0 : tensor<1x1x32x64xf32> -> tensor<32x64xf32>
    return %unpack : tensor<32x64xf32>
  }
}

// -----
module {
  func.func @unpad_like_unpack_with_outer_dims_perm(%arg0: tensor<1x1x32x64xf32>) -> tensor<32x64xf32> {
    %0 = tensor.empty() : tensor<32x64xf32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [32, 64] into %0 : tensor<1x1x32x64xf32> -> tensor<32x64xf32>
    return %unpack : tensor<32x64xf32>
  }
}

// -----
module {
  func.func @inner_unpad_like_unpack(%arg0: tensor<32x1x64xf32>) -> tensor<32x64xf32> {
    %0 = tensor.empty() : tensor<32x64xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1] inner_tiles = [64] into %0 : tensor<32x1x64xf32> -> tensor<32x64xf32>
    return %unpack : tensor<32x64xf32>
  }
}

// -----
module {
  func.func @unpad_and_inner_dim_shuffle_pack(%arg0: tensor<1x1x32x64xf32>) -> tensor<64x32xf32> {
    %0 = tensor.empty() : tensor<64x32xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1, 0] inner_tiles = [32, 64] into %0 : tensor<1x1x32x64xf32> -> tensor<64x32xf32>
    return %unpack : tensor<64x32xf32>
  }
}

// -----
module {
  func.func @unpad_like_unpack_with_transpose(%arg0: tensor<32x1x16x64xf32>) -> tensor<32x64x16xf32> {
    %0 = tensor.empty() : tensor<32x64x16xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [1] inner_tiles = [64] into %0 : tensor<32x1x16x64xf32> -> tensor<32x64x16xf32>
    return %unpack : tensor<32x64x16xf32>
  }
}

