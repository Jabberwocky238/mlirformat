#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func @min_plus_csrcsr(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0x7FF0000000000000 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf64, #sparse>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse>
    %1 = linalg.generic {doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) outs(%0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%in: f64, %in_1: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_1 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %4 = arith.addf %arg2, %arg3 : f64
        sparse_tensor.yield %4 : f64
      }
       left = {
      }
       right = {
      }
      %3 = sparse_tensor.reduce %2, %out, %cst : f64 {
      ^bb0(%arg2: f64, %arg3: f64):
        %4 = arith.cmpf olt, %arg2, %arg3 : f64
        %5 = arith.select %4, %arg2, %arg3 : f64
        sparse_tensor.yield %5 : f64
      }
      linalg.yield %3 : f64
    } -> tensor<?x?xf64, #sparse>
    return %1 : tensor<?x?xf64, #sparse>
  }
  func.func @min_plus_csrcsc(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0x7FF0000000000000 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf64, #sparse1>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse>
    %1 = linalg.generic {doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse1>) outs(%0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%in: f64, %in_1: f64, %out: f64):
      %2 = sparse_tensor.binary %in, %in_1 : f64, f64 to f64
       overlap = {
      ^bb0(%arg2: f64, %arg3: f64):
        %4 = arith.addf %arg2, %arg3 : f64
        sparse_tensor.yield %4 : f64
      }
       left = {
      }
       right = {
      }
      %3 = sparse_tensor.reduce %2, %out, %cst : f64 {
      ^bb0(%arg2: f64, %arg3: f64):
        %4 = arith.cmpf olt, %arg2, %arg3 : f64
        %5 = arith.select %4, %arg2, %arg3 : f64
        sparse_tensor.yield %5 : f64
      }
      linalg.yield %3 : f64
    } -> tensor<?x?xf64, #sparse>
    return %1 : tensor<?x?xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant sparse<[[0, 0], [0, 1], [1, 0], [2, 2], [2, 3], [2, 4], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x5xf64>
    %cst_0 = arith.constant sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<4x5xf64> to tensor<?x?xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<5x4xf64> to tensor<?x?xf64, #sparse>
    %2 = sparse_tensor.convert %cst_0 : tensor<5x4xf64> to tensor<?x?xf64, #sparse1>
    %3 = call @min_plus_csrcsr(%0, %1) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %4 = call @min_plus_csrcsc(%0, %2) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse>
    sparse_tensor.print %0 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %1 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %4 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<?x?xf64, #sparse>
    return
  }
}

