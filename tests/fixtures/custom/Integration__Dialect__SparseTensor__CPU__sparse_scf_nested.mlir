#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
module @func_sparse.2 {
  func.func public @condition(%arg0: i1, %arg1: tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse> {
    %0 = scf.if %arg0 -> (tensor<2x3x4xf64, #sparse>) {
      %cst = arith.constant dense<1.000000e+00> : tensor<f64>
      %cst_0 = arith.constant dense<1.000000e+00> : tensor<2x3x4xf64>
      %1 = tensor.empty() : tensor<2x3x4xf64, #sparse>
      %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg1, %cst_0 : tensor<2x3x4xf64, #sparse>, tensor<2x3x4xf64>) outs(%1 : tensor<2x3x4xf64, #sparse>) {
      ^bb0(%in: f64, %in_1: f64, %out: f64):
        %3 = arith.subf %in, %in_1 : f64
        linalg.yield %3 : f64
      } -> tensor<2x3x4xf64, #sparse>
      scf.yield %2 : tensor<2x3x4xf64, #sparse>
    } else {
      %cst = arith.constant dense<1.000000e+00> : tensor<f64>
      %cst_0 = arith.constant dense<1.000000e+00> : tensor<2x3x4xf64>
      %1 = tensor.empty() : tensor<2x3x4xf64, #sparse>
      %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg1, %cst_0 : tensor<2x3x4xf64, #sparse>, tensor<2x3x4xf64>) outs(%1 : tensor<2x3x4xf64, #sparse>) {
      ^bb0(%in: f64, %in_1: f64, %out: f64):
        %3 = arith.addf %in, %in_1 : f64
        linalg.yield %3 : f64
      } -> tensor<2x3x4xf64, #sparse>
      scf.yield %2 : tensor<2x3x4xf64, #sparse>
    }
    return %0 : tensor<2x3x4xf64, #sparse>
  }
  func.func public @main() {
    %cst = arith.constant dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>
    %true = arith.constant true
    %false = arith.constant false
    %0 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse>
    %1 = call @condition(%true, %0) : (i1, tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>
    %2 = call @condition(%false, %0) : (i1, tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>
    sparse_tensor.print %1 : tensor<2x3x4xf64, #sparse>
    sparse_tensor.print %2 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64, #sparse>
    return
  }
}

