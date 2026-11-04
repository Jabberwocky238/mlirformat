#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>
module {
  func.func @tensor_scale(%arg0: tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse1> {
    %cst = arith.constant 2.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf64, #sparse>
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf64, #sparse>
    %0 = tensor.empty(%dim, %dim_0, %dim_1) : tensor<?x?x?xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) * 2.0", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf64, #sparse>) outs(%0 : tensor<?x?x?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = arith.mulf %in, %cst : f64
      linalg.yield %2 : f64
    } -> tensor<?x?x?xf64, #sparse1>
    return %1 : tensor<?x?x?xf64, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %cst_0 = arith.constant dense<[[[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 3.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<3x4x8xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<3x4x8xf64> to tensor<?x?x?xf64, #sparse>
    %1 = call @tensor_scale(%0) : (tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse1>
    sparse_tensor.print %0 : tensor<?x?x?xf64, #sparse>
    sparse_tensor.print %1 : tensor<?x?x?xf64, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<?x?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?x?xf64, #sparse1>
    return
  }
}

