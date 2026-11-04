#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
module {
  func.func @tensor_mul(%arg0: tensor<?x?x?xf64, #sparse>, %arg1: tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf64, #sparse>
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf64, #sparse>
    %0 = tensor.empty(%dim, %dim_0, %dim_1) : tensor<?x?x?xf64, #sparse>
    %1 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) * B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?x?xf64, #sparse>, tensor<?x?x?xf64, #sparse>) outs(%0 : tensor<?x?x?xf64, #sparse>) {
    ^bb0(%in: f64, %in_2: f64, %out: f64):
      %2 = arith.mulf %in, %in_2 : f64
      linalg.yield %2 : f64
    } -> tensor<?x?x?xf64, #sparse>
    return %1 : tensor<?x?x?xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %cst_0 = arith.constant dense<[[[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [1.200000e+00, 0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]], [[2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<3x3x5xf64>
    %cst_1 = arith.constant dense<[[[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [2.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 9.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 7.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]], [[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<3x3x5xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<3x3x5xf64> to tensor<?x?x?xf64, #sparse>
    %1 = sparse_tensor.convert %cst_1 : tensor<3x3x5xf64> to tensor<?x?x?xf64, #sparse>
    %2 = call @tensor_mul(%0, %1) : (tensor<?x?x?xf64, #sparse>, tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?x?x?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?x?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?x?xf64, #sparse>
    return
  }
}

