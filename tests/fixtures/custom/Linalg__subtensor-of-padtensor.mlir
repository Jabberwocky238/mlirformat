module {
  func.func @static_data_only(%arg0: tensor<4x5xf32>, %arg1: f32) -> tensor<2x1xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[7, 8] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x5xf32> to tensor<11x13xf32>
    %extracted_slice = tensor.extract_slice %padded[1, 2] [2, 1] [1, 1] : tensor<11x13xf32> to tensor<2x1xf32>
    return %extracted_slice : tensor<2x1xf32>
  }
}

// -----
module {
  func.func @static_high_pad_only(%arg0: tensor<4x5xf32>, %arg1: f32) -> tensor<2x4xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[7, 8] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x5xf32> to tensor<11x13xf32>
    %extracted_slice = tensor.extract_slice %padded[4, 5] [2, 4] [1, 1] : tensor<11x13xf32> to tensor<2x4xf32>
    return %extracted_slice : tensor<2x4xf32>
  }
}

// -----
module {
  func.func @static_low_pad_only(%arg0: tensor<4x5xf32>, %arg1: f32) -> tensor<2x3xf32> {
    %padded = tensor.pad %arg0 low[3, 7] high[7, 8] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x5xf32> to tensor<14x20xf32>
    %extracted_slice = tensor.extract_slice %padded[1, 3] [2, 3] [1, 1] : tensor<14x20xf32> to tensor<2x3xf32>
    return %extracted_slice : tensor<2x3xf32>
  }
}

// -----
module {
  func.func @static_low_pad_only_2(%arg0: tensor<4x5xf32>, %arg1: f32) -> tensor<1x3xf32> {
    %padded = tensor.pad %arg0 low[3, 7] high[7, 8] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x5xf32> to tensor<14x20xf32>
    %extracted_slice = tensor.extract_slice %padded[1, 3] [1, 3] [1, 1] : tensor<14x20xf32> to tensor<1x3xf32>
    return %extracted_slice : tensor<1x3xf32>
  }
}

// -----
module {
  func.func @static_mixed_data_high_pad(%arg0: tensor<4x5xf32>, %arg1: f32) -> tensor<3x4xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[7, 8] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x5xf32> to tensor<11x13xf32>
    %extracted_slice = tensor.extract_slice %padded[2, 4] [3, 4] [1, 1] : tensor<11x13xf32> to tensor<3x4xf32>
    return %extracted_slice : tensor<3x4xf32>
  }
}

// -----
module {
  func.func @static_mixed_data_low_pad(%arg0: tensor<4x5xf32>, %arg1: f32) -> tensor<3x4xf32> {
    %padded = tensor.pad %arg0 low[3, 7] high[7, 8] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x5xf32> to tensor<14x20xf32>
    %extracted_slice = tensor.extract_slice %padded[2, 4] [3, 4] [1, 1] : tensor<14x20xf32> to tensor<3x4xf32>
    return %extracted_slice : tensor<3x4xf32>
  }
}

// -----
module {
  func.func @static_mixed_data_low_high_pad(%arg0: tensor<4x5xf32>, %arg1: f32) -> tensor<7x9xf32> {
    %padded = tensor.pad %arg0 low[2, 3] high[7, 8] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x5xf32> to tensor<13x16xf32>
    %extracted_slice = tensor.extract_slice %padded[1, 2] [7, 9] [1, 1] : tensor<13x16xf32> to tensor<7x9xf32>
    return %extracted_slice : tensor<7x9xf32>
  }
}

// -----
module {
  func.func @static_rank_reduce(%arg0: tensor<8x16x4xf32>, %arg1: f32) -> tensor<16x4xf32> {
    %padded = tensor.pad %arg0 low[0, 2, 0] high[0, 0, 0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      tensor.yield %arg1 : f32
    } : tensor<8x16x4xf32> to tensor<8x18x4xf32>
    %extracted_slice = tensor.extract_slice %padded[0, 0, 0] [1, 16, 4] [1, 1, 1] : tensor<8x18x4xf32> to tensor<16x4xf32>
    return %extracted_slice : tensor<16x4xf32>
  }
}

// -----
module {
  func.func @dynamic_high_pad(%arg0: tensor<?x5xf32>, %arg1: index, %arg2: f32) -> tensor<3x4xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[%arg1, 8] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<?x5xf32> to tensor<?x13xf32>
    %extracted_slice = tensor.extract_slice %padded[2, 4] [3, 4] [1, 1] : tensor<?x13xf32> to tensor<3x4xf32>
    return %extracted_slice : tensor<3x4xf32>
  }
}

// -----
module {
  func.func @dynamic_extract_size(%arg0: tensor<?x5xf32>, %arg1: index, %arg2: f32) -> tensor<?x4xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[7, 8] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<?x5xf32> to tensor<?x13xf32>
    %extracted_slice = tensor.extract_slice %padded[2, 4] [%arg1, 4] [1, 1] : tensor<?x13xf32> to tensor<?x4xf32>
    return %extracted_slice : tensor<?x4xf32>
  }
}

// -----
module {
  func.func @dynamic_zero_low_padding(%arg0: tensor<?x?xf32>, %arg1: f32, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> tensor<?x?xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[7, 8] {
    ^bb0(%arg6: index, %arg7: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %padded[%arg2, %arg3] [%arg4, %arg5] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @dynamic_zero_high_padding(%arg0: tensor<?x?xf32>, %arg1: f32, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> tensor<?x?xf32> {
    %padded = tensor.pad %arg0 low[7, 8] high[0, 0] {
    ^bb0(%arg6: index, %arg7: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %padded[%arg2, %arg3] [%arg4, %arg5] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @dynamic_rank_reduce(%arg0: tensor<?x5xf32>, %arg1: index, %arg2: f32) -> tensor<4xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[7, 8] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<?x5xf32> to tensor<?x13xf32>
    %extracted_slice = tensor.extract_slice %padded[2, 4] [1, 4] [1, 1] : tensor<?x13xf32> to tensor<4xf32>
    return %extracted_slice : tensor<4xf32>
  }
}

// -----
module {
  func.func @nopaddim_with_dynamic_extract(%arg0: tensor<3x4x5xf32>, %arg1: f32, %arg2: index) -> tensor<?x2x1xf32> {
    %padded = tensor.pad %arg0 low[0, 0, 0] high[0, 7, 8] {
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      tensor.yield %arg1 : f32
    } : tensor<3x4x5xf32> to tensor<3x11x13xf32>
    %extracted_slice = tensor.extract_slice %padded[%arg2, 1, 2] [%arg2, 2, 1] [1, 1, 1] : tensor<3x11x13xf32> to tensor<?x2x1xf32>
    return %extracted_slice : tensor<?x2x1xf32>
  }
}

