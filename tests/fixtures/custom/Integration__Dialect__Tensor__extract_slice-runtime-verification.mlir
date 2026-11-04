module {
  func.func @extract_slice(%arg0: tensor<1xf32>, %arg1: index) {
    %extracted_slice = tensor.extract_slice %arg0[%arg1] [1] [1] : tensor<1xf32> to tensor<1xf32>
    return
  }
  func.func @extract_slice_dynamic(%arg0: tensor<?x4xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %extracted_slice = tensor.extract_slice %arg0[%arg1, 0] [%arg2, 4] [%arg3, 1] : tensor<?x4xf32> to tensor<?x4xf32>
    return
  }
  func.func @extract_slice_dynamic_rank_reduce(%arg0: tensor<?x4xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %extracted_slice = tensor.extract_slice %arg0[%arg1, 0] [%arg2, 1] [%arg3, 1] : tensor<?x4xf32> to tensor<?xf32>
    return
  }
  func.func @extract_slice_zero_size_dim(%arg0: tensor<10x4x1xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [%arg1, %arg2, %arg3] [1, 1, 1] : tensor<10x4x1xf32> to tensor<?x?x?xf32>
    return
  }
  func.func @extract_slice_empty_tensor(%arg0: tensor<10x4x1xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %extracted_slice = tensor.extract_slice %arg0[%arg4, 0, 0] [%arg1, %arg2, %arg3] [1, 1, 1] : tensor<10x4x1xf32> to tensor<?x?x?xf32>
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %0 = tensor.empty() : tensor<1xf32>
    %1 = tensor.empty() : tensor<4x4xf32>
    %cast = tensor.cast %1 : tensor<4x4xf32> to tensor<?x4xf32>
    call @extract_slice_dynamic_rank_reduce(%cast, %c5, %c5, %c1) : (tensor<?x4xf32>, index, index, index) -> ()
    call @extract_slice(%0, %c1) : (tensor<1xf32>, index) -> ()
    call @extract_slice(%0, %c-1) : (tensor<1xf32>, index) -> ()
    call @extract_slice_dynamic(%cast, %c0, %c5, %c1) : (tensor<?x4xf32>, index, index, index) -> ()
    call @extract_slice_dynamic(%cast, %c0, %c4, %c4) : (tensor<?x4xf32>, index, index, index) -> ()
    call @extract_slice(%0, %c0) : (tensor<1xf32>, index) -> ()
    call @extract_slice_dynamic(%cast, %c0, %c4, %c1) : (tensor<?x4xf32>, index, index, index) -> ()
    call @extract_slice_dynamic_rank_reduce(%cast, %c0, %c1, %c0) : (tensor<?x4xf32>, index, index, index) -> ()
    %cst = arith.constant dense<1.000000e+00> : tensor<10x4x1xf32>
    %c0_0 = arith.constant 0 : index
    %c4_1 = arith.constant 4 : index
    %c1_2 = arith.constant 1 : index
    call @extract_slice_zero_size_dim(%cst, %c0_0, %c4_1, %c1_2) : (tensor<10x4x1xf32>, index, index, index) -> ()
    %c10 = arith.constant 10 : index
    call @extract_slice_empty_tensor(%cst, %c0_0, %c4_1, %c1_2, %c10) : (tensor<10x4x1xf32>, index, index, index, index) -> ()
    return
  }
}

