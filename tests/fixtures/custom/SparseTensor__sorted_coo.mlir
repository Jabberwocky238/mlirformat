#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @sparse_scale(%arg0: tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse> {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = linalg.generic {doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<?x?xf32, #sparse>) {
    ^bb0(%out: f32):
      %1 = arith.mulf %out, %cst : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32, #sparse>
    return %0 : tensor<?x?xf32, #sparse>
  }
  func.func @matvec(%arg0: tensor<32x64xf64, #sparse>, %arg1: tensor<64xf64>, %arg2: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) += A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<32x64xf64, #sparse>, tensor<64xf64>) outs(%arg2 : tensor<32xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @mateltmul(%arg0: tensor<32x64xf64, #sparse>, %arg1: tensor<32x64xf64, #sparse>, %arg2: tensor<32x64xf64>) -> tensor<32x64xf64> {
    %0 = linalg.generic {doc = "Z(i,j) = X(i,j) * Y(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x64xf64, #sparse>, tensor<32x64xf64, #sparse>) outs(%arg2 : tensor<32x64xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      linalg.yield %1 : f64
    } -> tensor<32x64xf64>
    return %0 : tensor<32x64xf64>
  }
}

