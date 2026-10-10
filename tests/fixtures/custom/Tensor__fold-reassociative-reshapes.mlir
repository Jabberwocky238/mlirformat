module {
  func.func @expand_shape_of_rank_reducing_extract(%arg0: tensor<?x?x?x?xf32>, %arg1: index) -> (tensor<?x1x1x5xf32>, tensor<?x1x1x5xf32>) {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [%arg1, 1, 1, 5] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<?x1x5xf32>
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %extracted_slice, %c0 : tensor<?x1x5xf32>
    %expanded = tensor.expand_shape %extracted_slice [[0], [1, 2], [3]] output_shape [%dim, 1, 1, 5] : tensor<?x1x5xf32> into tensor<?x1x1x5xf32>
    %expanded_0 = tensor.expand_shape %extracted_slice [[0, 1], [2], [3]] output_shape [%dim, 1, 1, 5] : tensor<?x1x5xf32> into tensor<?x1x1x5xf32>
    return %expanded, %expanded_0 : tensor<?x1x1x5xf32>, tensor<?x1x1x5xf32>
  }
}

// -----
module {
  func.func @unpadding_collapse_of_extract_slice(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %dim = tensor.dim %arg0, %c1 : tensor<?x?x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c3 : tensor<?x?x?x?xf32>
    %extracted_slice = tensor.extract_slice %arg0[%arg1, %arg2, 0, 0] [1, %dim, 1, %dim_0] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<1x?x1x?xf32>
    %collapsed = tensor.collapse_shape %extracted_slice [[0, 1], [2, 3]] : tensor<1x?x1x?xf32> into tensor<?x?xf32>
    return %collapsed : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @non_unpadding_collapse_of_extract_slice(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?x?xf32>
    %extracted_slice = tensor.extract_slice %arg0[%arg1, %arg2, 0, 0] [%dim, %dim_0, %arg3, 1] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<?x?x?xf32>
    %collapsed = tensor.collapse_shape %extracted_slice [[0], [1, 2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
    return %collapsed : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @unpadding_collapse_of_extract_slice_with_multiple_users(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index) -> (tensor<1x?x1x?xf32>, tensor<?x?xf32>) {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %dim = tensor.dim %arg0, %c1 : tensor<?x?x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c3 : tensor<?x?x?x?xf32>
    %extracted_slice = tensor.extract_slice %arg0[%arg1, %arg2, 0, 0] [1, %dim, 1, %dim_0] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<1x?x1x?xf32>
    %collapsed = tensor.collapse_shape %extracted_slice [[0, 1], [2, 3]] : tensor<1x?x1x?xf32> into tensor<?x?xf32>
    return %extracted_slice, %collapsed : tensor<1x?x1x?xf32>, tensor<?x?xf32>
  }
}

// -----
module {
  func.func @rank_reducing_insert_of_collapse_shape(%arg0: tensor<?x1x1x5xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index) -> tensor<?x?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3]] : tensor<?x1x1x5xf32> into tensor<?x1x5xf32>
    %inserted_slice = tensor.insert_slice %collapsed into %arg1[0, 0, 0, 0] [%arg2, 1, 1, 5] [1, 1, 1, 1] : tensor<?x1x5xf32> into tensor<?x?x?x?xf32>
    return %inserted_slice : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @rank_reducing_parallel_insert_of_collapse_shape(%arg0: tensor<?x1x1x5xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3]] : tensor<?x1x1x5xf32> into tensor<?x1x5xf32>
    %0 = scf.forall (%arg4) in (%arg3) shared_outs(%arg5 = %arg1) -> (tensor<?x?x?x?xf32>) {
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %collapsed into %arg5[0, 0, 0, 0] [%arg2, 1, 1, 5] [1, 1, 1, 1] : tensor<?x1x5xf32> into tensor<?x?x?x?xf32>
      }
    }
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @insert_of_padding_expand_shape(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, %dim, 1, %dim_0] : tensor<?x?xf32> into tensor<1x?x1x?xf32>
    %inserted_slice = tensor.insert_slice %expanded into %arg1[%arg2, %arg3, 0, 0] [1, %dim, 1, %dim_0] [1, 1, 1, 1] : tensor<1x?x1x?xf32> into tensor<?x?x?x?xf32>
    return %inserted_slice : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @insert_of_non_padding_expand_shape(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg4, %dim, %dim_0] : tensor<?x?xf32> into tensor<?x?x?xf32>
    %inserted_slice = tensor.insert_slice %expanded into %arg1[%arg2, %arg3, 0, 0] [%arg4, 1, %dim, %dim_0] [1, 1, 1, 1] : tensor<?x?x?xf32> into tensor<?x?x?x?xf32>
    return %inserted_slice : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @parallel_insert_of_padding_expand_shape(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, %dim, 1, %dim_0] : tensor<?x?xf32> into tensor<1x?x1x?xf32>
    %0 = scf.forall (%arg4, %arg5) in (%arg2, %arg3) shared_outs(%arg6 = %arg1) -> (tensor<?x?x?x?xf32>) {
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %expanded into %arg6[%arg4, %arg5, 0, 0] [1, %dim, 1, %dim_0] [1, 1, 1, 1] : tensor<1x?x1x?xf32> into tensor<?x?x?x?xf32>
      }
    }
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @parallel_insert_of_non_padding_expand_shape(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg4, %dim, %dim_0] : tensor<?x?xf32> into tensor<?x?x?xf32>
    %0 = scf.forall (%arg5, %arg6) in (%arg2, %arg3) shared_outs(%arg7 = %arg1) -> (tensor<?x?x?x?xf32>) {
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %expanded into %arg7[%arg5, %arg6, 0, 0] [%arg4, 1, %dim, %dim_0] [1, 1, 1, 1] : tensor<?x?x?xf32> into tensor<?x?x?x?xf32>
      }
    }
    return %0 : tensor<?x?x?x?xf32>
  }
}

