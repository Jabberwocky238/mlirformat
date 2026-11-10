#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_expansion(%arg0: tensor<8x8xf64, #sparse>) -> index {
    %values, %filled, %added, %count = sparse_tensor.expand %arg0 : tensor<8x8xf64, #sparse> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %count : index
  }
}

