#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_expand(%arg0: tensor<100xf64, #sparse>) -> tensor<10x10xf64, #sparse1> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [10, 10] : tensor<100xf64, #sparse> into tensor<10x10xf64, #sparse1>
    return %expanded : tensor<10x10xf64, #sparse1>
  }
  func.func @sparse_collapse(%arg0: tensor<10x10xf64, #sparse1>) -> tensor<100xf64, #sparse> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<10x10xf64, #sparse1> into tensor<100xf64, #sparse>
    return %collapsed : tensor<100xf64, #sparse>
  }
  func.func @dynamic_sparse_expand(%arg0: tensor<?xf64, #sparse>, %arg1: index) -> tensor<?x10xf64, #sparse1> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [%arg1, 10] : tensor<?xf64, #sparse> into tensor<?x10xf64, #sparse1>
    return %expanded : tensor<?x10xf64, #sparse1>
  }
  func.func @dynamic_sparse_collapse(%arg0: tensor<10x?xf64, #sparse1>) -> tensor<?xf64, #sparse> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<10x?xf64, #sparse1> into tensor<?xf64, #sparse>
    return %collapsed : tensor<?xf64, #sparse>
  }
}

