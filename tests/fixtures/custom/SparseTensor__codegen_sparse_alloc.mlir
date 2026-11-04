#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @sparse_alloc_copy_CSR(%arg0: tensor<2x2xf32, #sparse>) -> tensor<2x2xf32, #sparse> {
    %0 = bufferization.alloc_tensor() copy(%arg0) : tensor<2x2xf32, #sparse>
    "test.sink"(%0) : (tensor<2x2xf32, #sparse>) -> ()
  }
  func.func @sparse_alloc_copy_COO(%arg0: tensor<2x2xf32, #sparse1>) -> tensor<2x2xf32, #sparse1> {
    %0 = bufferization.alloc_tensor() copy(%arg0) : tensor<2x2xf32, #sparse1>
    "test.sink"(%0) : (tensor<2x2xf32, #sparse1>) -> ()
  }
}

