#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(0, 8, 1)>) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_slice(%arg0: tensor<8x8xf64, #sparse>) -> tensor<4x8xf64, #sparse1> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0] [4, 8] [1, 1] : tensor<8x8xf64, #sparse> to tensor<4x8xf64, #sparse1>
    return %extracted_slice : tensor<4x8xf64, #sparse1>
  }
}

