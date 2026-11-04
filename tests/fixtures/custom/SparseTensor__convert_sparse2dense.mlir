#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_convert_1d(%arg0: tensor<13xi32, #sparse>) -> tensor<13xi32> {
    %0 = sparse_tensor.convert %arg0 : tensor<13xi32, #sparse> to tensor<13xi32>
    return %0 : tensor<13xi32>
  }
  func.func @sparse_convert_1d_dyn(%arg0: tensor<?xi32, #sparse>) -> tensor<?xi32> {
    %0 = sparse_tensor.convert %arg0 : tensor<?xi32, #sparse> to tensor<?xi32>
    return %0 : tensor<?xi32>
  }
  func.func @sparse_convert_2d(%arg0: tensor<2x4xf64, #sparse1>) -> tensor<2x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x4xf64, #sparse1> to tensor<2x4xf64>
    return %0 : tensor<2x4xf64>
  }
  func.func @sparse_convert_2d_dyn0(%arg0: tensor<?x4xf64, #sparse1>) -> tensor<?x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<?x4xf64, #sparse1> to tensor<?x4xf64>
    return %0 : tensor<?x4xf64>
  }
  func.func @sparse_convert_2d_dyn1(%arg0: tensor<2x?xf64, #sparse1>) -> tensor<2x?xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x?xf64, #sparse1> to tensor<2x?xf64>
    return %0 : tensor<2x?xf64>
  }
  func.func @sparse_convert_2d_dyn2(%arg0: tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<?x?xf64, #sparse1> to tensor<?x?xf64>
    return %0 : tensor<?x?xf64>
  }
  func.func @sparse_convert_3d(%arg0: tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64>
    return %0 : tensor<2x3x4xf64>
  }
}

