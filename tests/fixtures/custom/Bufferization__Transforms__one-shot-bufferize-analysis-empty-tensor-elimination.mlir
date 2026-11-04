module {
  func.func @buffer_forwarding_conflict(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty(%arg1) : tensor<?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?xf32>) -> tensor<?xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg0[0] [%arg1] [1] : tensor<?xf32> into tensor<?xf32>
    %inserted_slice_0 = tensor.insert_slice %1 into %arg0[42] [%arg1] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice, %inserted_slice_0 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @buffer_forwarding_no_conflict(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty(%arg1) : tensor<?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?xf32>) -> tensor<?xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg0[42] [%arg1] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice, %inserted_slice : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @buffer_forwarding_conflict_with_different_element_type(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty(%arg1) : tensor<?xf32>
    %1 = tensor.empty(%arg1) : tensor<?xbf16>
    %2 = linalg.copy ins(%0 : tensor<?xf32>) outs(%1 : tensor<?xbf16>) -> tensor<?xbf16>
    %3 = linalg.copy ins(%2 : tensor<?xbf16>) outs(%0 : tensor<?xf32>) -> tensor<?xf32>
    %inserted_slice = tensor.insert_slice %3 into %arg0[42] [%arg1] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice, %inserted_slice : tensor<?xf32>, tensor<?xf32>
  }
}

