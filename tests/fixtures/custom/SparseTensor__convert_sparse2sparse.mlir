#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(2, 2, 1)>, d1 : #sparse_tensor<slice(12, 13, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @sparse_nop_convert(%arg0: tensor<64xf32, #sparse>) -> tensor<64xf32, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<64xf32, #sparse> to tensor<64xf32, #sparse>
    return %0 : tensor<64xf32, #sparse>
  }
  func.func @sparse_hidden_nop_cast(%arg0: tensor<32xf32, #sparse>) -> tensor<?xf32, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<32xf32, #sparse> to tensor<?xf32, #sparse>
    return %0 : tensor<?xf32, #sparse>
  }
  func.func @sparse_convert_1d_ss(%arg0: tensor<?xf32, #sparse1>) -> tensor<?xf32, #sparse2> {
    %0 = sparse_tensor.convert %arg0 : tensor<?xf32, #sparse1> to tensor<?xf32, #sparse2>
    return %0 : tensor<?xf32, #sparse2>
  }
  func.func @sparse_convert(%arg0: tensor<?xf32, #sparse1>) -> tensor<?xf32, #sparse2> {
    %0 = sparse_tensor.convert %arg0 : tensor<?xf32, #sparse1> to tensor<?xf32, #sparse2>
    return %0 : tensor<?xf32, #sparse2>
  }
  func.func @sparse_convert_permuted(%arg0: tensor<?x?x?xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse4> {
    %0 = sparse_tensor.convert %arg0 : tensor<?x?x?xf32, #sparse3> to tensor<?x?x?xf32, #sparse4>
    return %0 : tensor<?x?x?xf32, #sparse4>
  }
  func.func @sparse_convert_slice(%arg0: tensor<2x13xi32, #sparse5>) -> tensor<2x13xi32, #sparse6> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x13xi32, #sparse5> to tensor<2x13xi32, #sparse6>
    return %0 : tensor<2x13xi32, #sparse6>
  }
}

