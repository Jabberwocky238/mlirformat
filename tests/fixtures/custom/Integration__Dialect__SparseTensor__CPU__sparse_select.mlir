#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @vecSelect(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = sparse_tensor.select %in : f64 {
      ^bb0(%arg1: f64):
        %3 = arith.cmpf oge, %arg1, %cst : f64
        sparse_tensor.yield %3 : i1
      }
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @matUpperTriangle(%arg0: tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse1>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse1>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse1>
    %1 = linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf64, #sparse1>) outs(%0 : tensor<?x?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = sparse_tensor.select %in : f64 {
      ^bb0(%arg1: f64):
        %5 = arith.cmpi ugt, %3, %2 : index
        sparse_tensor.yield %5 : i1
      }
      linalg.yield %4 : f64
    } -> tensor<?x?xf64, #sparse1>
    return %1 : tensor<?x?xf64, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant sparse<[[1], [3], [5], [7], [9]], [1.000000e+00, 2.000000e+00, -4.000000e+00, 0.000000e+00, 5.000000e+00]> : tensor<10xf64>
    %cst_0 = arith.constant sparse<[[0, 3], [1, 4], [2, 1], [2, 3], [3, 3], [3, 4], [4, 2]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<5x5xf64>
    %0 = sparse_tensor.convert %cst : tensor<10xf64> to tensor<?xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<5x5xf64> to tensor<?x?xf64, #sparse1>
    %2 = call @vecSelect(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %3 = call @matUpperTriangle(%1) : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    sparse_tensor.print %0 : tensor<?xf64, #sparse>
    sparse_tensor.print %1 : tensor<?x?xf64, #sparse1>
    sparse_tensor.print %2 : tensor<?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?x?xf64, #sparse1>
    return
  }
}

