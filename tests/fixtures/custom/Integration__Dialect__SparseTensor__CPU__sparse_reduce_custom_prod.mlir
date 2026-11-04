#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func @redProdLex(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i) = PROD_j A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = sparse_tensor.reduce %in, %out, %cst : f64 {
      ^bb0(%arg1: f64, %arg2: f64):
        %3 = arith.mulf %arg1, %arg2 : f64
        sparse_tensor.yield %3 : f64
      }
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse1>
    return %1 : tensor<?xf64, #sparse1>
  }
  func.func @redProdExpand(%arg0: tensor<?x?xf64, #sparse2>) -> tensor<?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse2>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i) = PROD_j A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf64, #sparse2>) outs(%0 : tensor<?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = sparse_tensor.reduce %in, %out, %cst : f64 {
      ^bb0(%arg1: f64, %arg2: f64):
        %3 = arith.mulf %arg1, %arg2 : f64
        sparse_tensor.yield %3 : f64
      }
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse1>
    return %1 : tensor<?xf64, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant sparse<[[0, 0], [0, 1], [1, 0], [2, 2], [2, 3], [2, 4], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x5xf64>
    %cst_0 = arith.constant sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<4x5xf64> to tensor<?x?xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<5x4xf64> to tensor<?x?xf64, #sparse>
    %2 = sparse_tensor.convert %cst_0 : tensor<5x4xf64> to tensor<?x?xf64, #sparse2>
    %3 = call @redProdLex(%0) : (tensor<?x?xf64, #sparse>) -> tensor<?xf64, #sparse1>
    %4 = call @redProdExpand(%2) : (tensor<?x?xf64, #sparse2>) -> tensor<?xf64, #sparse1>
    sparse_tensor.print %0 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %1 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?xf64, #sparse1>
    sparse_tensor.print %4 : tensor<?xf64, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse2>
    bufferization.dealloc_tensor %3 : tensor<?xf64, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<?xf64, #sparse1>
    return
  }
}

