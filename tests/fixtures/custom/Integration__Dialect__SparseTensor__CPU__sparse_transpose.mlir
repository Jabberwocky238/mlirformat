#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
module {
  func.func @sparse_transpose(%arg0: tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<3x4xf64, #sparse> to tensor<3x4xf64, #sparse1>
    %1 = tensor.empty() : tensor<4x3xf64, #sparse>
    %2 = linalg.generic {doc = "X(i,j) = A(j,i)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%0 : tensor<3x4xf64, #sparse1>) outs(%1 : tensor<4x3xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<4x3xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<3x4xf64, #sparse1>
    return %2 : tensor<4x3xf64, #sparse>
  }
  func.func @sparse_transpose_auto(%arg0: tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse> {
    %0 = tensor.empty() : tensor<4x3xf64, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = A(j,i)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<3x4xf64, #sparse>) outs(%0 : tensor<4x3xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<4x3xf64, #sparse>
    return %1 : tensor<4x3xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant dense<[[1.100000e+00, 1.200000e+00, 0.000000e+00, 1.400000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 3.400000e+00]]> : tensor<3x4xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<3x4xf64> to tensor<3x4xf64, #sparse>
    %1 = call @sparse_transpose(%0) : (tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    %2 = call @sparse_transpose_auto(%0) : (tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    sparse_tensor.print %1 : tensor<4x3xf64, #sparse>
    sparse_tensor.print %2 : tensor<4x3xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<3x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<4x3xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<4x3xf64, #sparse>
    return
  }
}

