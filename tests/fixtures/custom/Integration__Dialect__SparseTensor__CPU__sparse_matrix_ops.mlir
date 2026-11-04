#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @matrix_scale(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %cst = arith.constant 2.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) * 2.0", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf64, #sparse>) outs(%0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = arith.mulf %in, %cst : f64
      linalg.yield %2 : f64
    } -> tensor<?x?xf64, #sparse>
    return %1 : tensor<?x?xf64, #sparse>
  }
  func.func @matrix_scale_inplace(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %cst = arith.constant 2.000000e+00 : f64
    %0 = linalg.generic {doc = "X(i,j) *= 2.0", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%out: f64):
      %1 = arith.mulf %out, %cst : f64
      linalg.yield %1 : f64
    } -> tensor<?x?xf64, #sparse>
    return %0 : tensor<?x?xf64, #sparse>
  }
  func.func @matrix_add(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) outs(%0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%in: f64, %in_1: f64, %out: f64):
      %2 = arith.addf %in, %in_1 : f64
      linalg.yield %2 : f64
    } -> tensor<?x?xf64, #sparse>
    return %1 : tensor<?x?xf64, #sparse>
  }
  func.func @matrix_mul(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) outs(%0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%in: f64, %in_1: f64, %out: f64):
      %2 = arith.mulf %in, %in_1 : f64
      linalg.yield %2 : f64
    } -> tensor<?x?xf64, #sparse>
    return %1 : tensor<?x?xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.100000e+00 : f64
    %cst_0 = arith.constant sparse<[[0, 0], [0, 1], [1, 7], [2, 2], [2, 4], [2, 7], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x8xf64>
    %cst_1 = arith.constant sparse<[[0, 0], [0, 7], [1, 0], [1, 6], [2, 1], [2, 7]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00]> : tensor<4x8xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<4x8xf64> to tensor<?x?xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<4x8xf64> to tensor<?x?xf64, #sparse>
    %2 = sparse_tensor.convert %cst_1 : tensor<4x8xf64> to tensor<?x?xf64, #sparse>
    %3 = call @matrix_scale(%0) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %4 = call @matrix_scale_inplace(%1) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %5 = call @matrix_add(%4, %2) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %6 = call @matrix_mul(%4, %2) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    sparse_tensor.print %0 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %4 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %5 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %6 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %5 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %6 : tensor<?x?xf64, #sparse>
    return
  }
}

