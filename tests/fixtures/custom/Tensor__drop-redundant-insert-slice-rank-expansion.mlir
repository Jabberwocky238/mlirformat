module {
  func.func @test_drop_rank_expansion(%arg0: tensor<128x480xf32>, %arg1: tensor<1x1x128x480xf32>) -> tensor<123x456xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0, 0, 0, 0] [1, 1, 128, 480] [1, 1, 1, 1] : tensor<128x480xf32> into tensor<1x1x128x480xf32>
    %extracted_slice = tensor.extract_slice %inserted_slice[0, 0, 0, 0] [1, 1, 123, 456] [1, 1, 1, 1] : tensor<1x1x128x480xf32> to tensor<123x456xf32>
    return %extracted_slice : tensor<123x456xf32>
  }
}

// -----
module {
  func.func @fold_casting_insert_slice_of_extract_slice(%arg0: tensor<?x8x2x8xf32>, %arg1: tensor<8x1x8xf32>) -> tensor<8x1x8xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [1, 8, 1, 8] [1, 1, 1, 1] : tensor<?x8x2x8xf32> to tensor<8x8xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg1[0, 0, 0] [8, 1, 8] [1, 1, 1] : tensor<8x8xf32> into tensor<8x1x8xf32>
    return %inserted_slice : tensor<8x1x8xf32>
  }
}

// -----
module {
  func.func @fold_casting_insert_slice_of_strided_extract_slice(%arg0: tensor<?x8x2x8xf32>, %arg1: tensor<1x4x8xf32>) -> tensor<1x4x8xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [1, 4, 1, 8] [1, 2, 1, 1] : tensor<?x8x2x8xf32> to tensor<4x8xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg1[0, 0, 0] [1, 4, 8] [1, 1, 1] : tensor<4x8xf32> into tensor<1x4x8xf32>
    return %inserted_slice : tensor<1x4x8xf32>
  }
}

// -----
module {
  func.func @no_fold_more_unit_dims_insert_slice_of_extract_slice(%arg0: tensor<?x8x8xf32>, %arg1: tensor<1x1x8x8xf32>) -> tensor<1x1x8x8xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [1, 8, 8] [1, 1, 1] : tensor<?x8x8xf32> to tensor<8x8xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg1[0, 0, 0, 0] [1, 1, 8, 8] [1, 1, 1, 1] : tensor<8x8xf32> into tensor<1x1x8x8xf32>
    return %inserted_slice : tensor<1x1x8x8xf32>
  }
}

// -----
module {
  func.func @no_fold_strided_insert_slice_of_extract_slice(%arg0: tensor<?x8x2x8xf32>, %arg1: tensor<1x15x15xf32>) -> tensor<1x15x15xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [1, 8, 1, 8] [1, 1, 1, 1] : tensor<?x8x2x8xf32> to tensor<8x8xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg1[0, 0, 0] [1, 8, 8] [1, 2, 2] : tensor<8x8xf32> into tensor<1x15x15xf32>
    return %inserted_slice : tensor<1x15x15xf32>
  }
}

// -----
module {
  func.func @no_fold_non_casting_insert_slice_of_extract_slice(%arg0: tensor<1x1x1x8x8xf32>, %arg1: tensor<2x8x8xf32>) -> tensor<2x8x8xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0, 0] [1, 1, 1, 8, 8] [1, 1, 1, 1, 1] : tensor<1x1x1x8x8xf32> to tensor<8x8xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg1[0, 0, 0] [1, 8, 8] [1, 1, 1] : tensor<8x8xf32> into tensor<2x8x8xf32>
    return %inserted_slice : tensor<2x8x8xf32>
  }
}

