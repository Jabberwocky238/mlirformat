module {
  func.func @insert_slice(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[%arg2, %arg3, %arg4] [%dim, %dim_0, %dim_1] [1, 1, 1] : tensor<?x?x?xf32> into tensor<?x?x?xf32>
    %dim_2 = tensor.dim %inserted_slice, %c0 : tensor<?x?x?xf32>
    %dim_3 = tensor.dim %inserted_slice, %c1 : tensor<?x?x?xf32>
    %dim_4 = tensor.dim %inserted_slice, %c2 : tensor<?x?x?xf32>
    return %dim_2, %dim_3, %dim_4 : index, index, index
  }
}

// -----
module {
  func.func @extract_slice(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> (index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [%arg1, %arg2, %arg3] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x?x?xf32>
    %dim = tensor.dim %extracted_slice, %c0 : tensor<?x?x?xf32>
    %dim_0 = tensor.dim %extracted_slice, %c1 : tensor<?x?x?xf32>
    %dim_1 = tensor.dim %extracted_slice, %c2 : tensor<?x?x?xf32>
    return %dim, %dim_0, %dim_1 : index, index, index
  }
}

// -----
module {
  func.func @extract_slice_rank_reduced_1(%arg0: tensor<?x?x?xf32>, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?xf32>
    %dim = tensor.dim %extracted_slice, %c0 : tensor<?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @extract_slice_rank_reduced_2(%arg0: tensor<?x?x?xf32>, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x1xf32>
    %dim = tensor.dim %extracted_slice, %c0 : tensor<?x1xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @extract_slice_rank_reduced_3(%arg0: tensor<?x?x?xf32>, %arg1: index) -> index {
    %c1 = arith.constant 1 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1] : tensor<?x?x?xf32> to tensor<1x?xf32>
    %dim = tensor.dim %extracted_slice, %c1 : tensor<1x?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @extract_slice_rank_reduced_4(%arg0: tensor<?x?x?xf32>, %arg1: index) -> index {
    %c1 = arith.constant 1 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1] : tensor<?x?x?xf32> to tensor<1x?x1xf32>
    %dim = tensor.dim %extracted_slice, %c1 : tensor<1x?x1xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @extract_slice_rank_reduced_5(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [%arg1, 1, %arg2] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x?xf32>
    %dim = tensor.dim %extracted_slice, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %extracted_slice, %c1 : tensor<?x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @extract_slice_rank_reduced_6(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [%arg1, 1, %arg2] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x1x?xf32>
    %dim = tensor.dim %extracted_slice, %c0 : tensor<?x1x?xf32>
    %dim_0 = tensor.dim %extracted_slice, %c2 : tensor<?x1x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @collapse_shape() -> index {
    %c0 = arith.constant 0 : index
    %c7 = arith.constant 7 : index
    %c1_i16 = arith.constant 1 : i16
    %generated = tensor.generate %c7 {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c1_i16 : i16
    } : tensor<?x22xi16>
    %collapsed = tensor.collapse_shape %generated [[0, 1]] : tensor<?x22xi16> into tensor<?xi16>
    %dim = tensor.dim %collapsed, %c0 : tensor<?xi16>
    return %dim : index
  }
}

