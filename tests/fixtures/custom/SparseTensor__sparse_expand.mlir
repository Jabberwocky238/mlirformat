#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func @kernel(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i) = SUM A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = arith.addf %out, %in : f64
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse1>
    return %1 : tensor<?xf64, #sparse1>
  }
  func.func @matmul1(%arg0: tensor<8x2xf64, #sparse2>, %arg1: tensor<2x4xf64, #sparse2>) -> tensor<8x4xf64, #sparse2> {
    %0 = tensor.empty() : tensor<8x4xf64, #sparse2>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<8x2xf64, #sparse2>, tensor<2x4xf64, #sparse2>) outs(%0 : tensor<8x4xf64, #sparse2>) -> tensor<8x4xf64, #sparse2>
    return %1 : tensor<8x4xf64, #sparse2>
  }
  func.func @matmul2(%arg0: tensor<8x2xf64, #sparse3>, %arg1: tensor<2x4xf64, #sparse3>) -> tensor<8x4xf64, #sparse3> {
    %0 = tensor.empty() : tensor<8x4xf64, #sparse3>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<8x2xf64, #sparse3>, tensor<2x4xf64, #sparse3>) outs(%0 : tensor<8x4xf64, #sparse3>) -> tensor<8x4xf64, #sparse3>
    return %1 : tensor<8x4xf64, #sparse3>
  }
}

