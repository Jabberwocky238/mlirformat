#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
module {
  func.func @vector_min(%arg0: tensor<?xf16, #sparse>, %arg1: tensor<?xf16, #sparse>) -> tensor<?xf16, #sparse1> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf16, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf16, #sparse1>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf16, #sparse>, tensor<?xf16, #sparse>) outs(%0 : tensor<?xf16, #sparse1>) {
    ^bb0(%in: f16, %in_0: f16, %out: f16):
      %2 = sparse_tensor.binary %in, %in_0 : f16, f16 to f16
       overlap = {
      ^bb0(%arg2: f16, %arg3: f16):
        %3 = arith.cmpf olt, %arg2, %arg3 : f16
        %4 = arith.select %3, %arg2, %arg3 : f16
        sparse_tensor.yield %4 : f16
      }
       left = identity
       right = identity
      linalg.yield %2 : f16
    } -> tensor<?xf16, #sparse1>
    return %1 : tensor<?xf16, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf16>
    %cst_0 = arith.constant sparse<[[1], [3], [4], [10], [16], [18], [21], [28], [29], [31]], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01]> : tensor<32xf16>
    %0 = sparse_tensor.convert %cst : tensor<32xf16> to tensor<?xf16, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<32xf16> to tensor<?xf16, #sparse>
    %2 = call @vector_min(%0, %1) : (tensor<?xf16, #sparse>, tensor<?xf16, #sparse>) -> tensor<?xf16, #sparse1>
    sparse_tensor.print %2 : tensor<?xf16, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<?xf16, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?xf16, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?xf16, #sparse1>
    return
  }
}

