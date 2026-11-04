#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_select(%arg0: tensor<5x5xi1>, %arg1: tensor<5x5xf64, #sparse>, %arg2: tensor<5x5xf64, #sparse>) -> tensor<5x5xf64, #sparse> {
    %0 = tensor.empty() : tensor<5x5xf64, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<5x5xi1>, tensor<5x5xf64, #sparse>, tensor<5x5xf64, #sparse>) outs(%0 : tensor<5x5xf64, #sparse>) {
    ^bb0(%in: i1, %in_0: f64, %in_1: f64, %out: f64):
      %2 = arith.select %in, %in_0, %in_1 : f64
      linalg.yield %2 : f64
    } -> tensor<5x5xf64, #sparse>
    return %1 : tensor<5x5xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant sparse<[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]], true> : tensor<5x5xi1>
    %cst_1 = arith.constant sparse<[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]], [1.000000e-01, 1.100000e+00, 2.100000e+00, 3.100000e+00, 4.100000e+00]> : tensor<5x5xf64>
    %cst_2 = arith.constant sparse<[[0, 1], [1, 2], [2, 3], [3, 4], [4, 4]], [1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 5.500000e+00]> : tensor<5x5xf64>
    %0 = sparse_tensor.convert %cst_1 : tensor<5x5xf64> to tensor<5x5xf64, #sparse>
    %1 = sparse_tensor.convert %cst_2 : tensor<5x5xf64> to tensor<5x5xf64, #sparse>
    %2 = call @sparse_select(%cst_0, %0, %1) : (tensor<5x5xi1>, tensor<5x5xf64, #sparse>, tensor<5x5xf64, #sparse>) -> tensor<5x5xf64, #sparse>
    sparse_tensor.print %2 : tensor<5x5xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<5x5xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<5x5xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<5x5xf64, #sparse>
    return
  }
}

