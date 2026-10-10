module {
  func.func @swap_fill_insert_slice(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x6xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %extracted_slice = tensor.extract_slice %0[%arg1, 8, 4] [1, %arg2, 6] [1, 3, 1] : tensor<?x?x?xf32> to tensor<?x6xf32>
    return %extracted_slice : tensor<?x6xf32>
  }
}

// -----
module {
  func.func @dont_swap_fill_insert_slice_multi_user(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> (tensor<?x?x?xf32>, tensor<2x?x6xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %extracted_slice = tensor.extract_slice %0[%arg1, 8, 4] [2, %arg2, 6] [1, 3, 1] : tensor<?x?x?xf32> to tensor<2x?x6xf32>
    return %0, %extracted_slice : tensor<?x?x?xf32>, tensor<2x?x6xf32>
  }
}

