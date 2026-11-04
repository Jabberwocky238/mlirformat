#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
module {
  func.func @vector_scale(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %cst = arith.constant 2.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {doc = "x(i) = a(i) * 2.0", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = arith.mulf %in, %cst : f64
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @vector_scale_inplace(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %cst = arith.constant 2.000000e+00 : f64
    %0 = linalg.generic {doc = "x(i) *= 2.0", indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : tensor<?xf64, #sparse>) {
    ^bb0(%out: f64):
      %1 = arith.mulf %out, %cst : f64
      linalg.yield %1 : f64
    } -> tensor<?xf64, #sparse>
    return %0 : tensor<?xf64, #sparse>
  }
  func.func @vector_add(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.addf %in, %in_0 : f64
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @vector_mul(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.mulf %in, %in_0 : f64
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @vector_mul_d(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse1>
    %1 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse1>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.mulf %in, %in_0 : f64
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse1>
    return %1 : tensor<?xf64, #sparse1>
  }
  func.func @vector_dotprod(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>, %arg2: tensor<f64>) -> tensor<f64> {
    %0 = linalg.generic {doc = "x(i) += a(i) * b(i)", indexing_maps = [#map, #map, #map1], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) outs(%arg2 : tensor<f64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<f64>
    return %0 : tensor<f64>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.100000e+00 : f64
    %cst_0 = arith.constant sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf64>
    %cst_1 = arith.constant sparse<[[1], [3], [4], [10], [16], [18], [21], [28], [29], [31]], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01]> : tensor<32xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<32xf64> to tensor<?xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<32xf64> to tensor<?xf64, #sparse>
    %2 = sparse_tensor.convert %cst_1 : tensor<32xf64> to tensor<?xf64, #sparse>
    %from_elements = tensor.from_elements %cst : tensor<f64>
    %3 = call @vector_scale(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %4 = call @vector_scale_inplace(%1) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %5 = call @vector_add(%4, %2) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %6 = call @vector_mul(%4, %2) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %7 = call @vector_mul_d(%4, %2) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse1>
    %8 = call @vector_dotprod(%4, %2, %from_elements) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<f64>) -> tensor<f64>
    sparse_tensor.print %0 : tensor<?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?xf64, #sparse>
    sparse_tensor.print %4 : tensor<?xf64, #sparse>
    sparse_tensor.print %5 : tensor<?xf64, #sparse>
    sparse_tensor.print %6 : tensor<?xf64, #sparse>
    sparse_tensor.print %7 : tensor<?xf64, #sparse1>
    %extracted = tensor.extract %8[] : tensor<f64>
    vector.print %extracted : f64
    bufferization.dealloc_tensor %0 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %5 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %6 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %7 : tensor<?xf64, #sparse1>
    bufferization.dealloc_tensor %8 : tensor<f64>
    return
  }
}

