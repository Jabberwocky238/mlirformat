#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0)>
#map4 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map5 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sampled_dd(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8x8xf64>
    %0 = linalg.generic {doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2, #map], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1, %arg2 : tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %in_1: f64, %out: f64):
      %1 = arith.mulf %in_0, %in_1 : f64
      %2 = arith.mulf %in, %1 : f64
      %3 = arith.addf %out, %2 : f64
      linalg.yield %3 : f64
    } -> tensor<8x8xf64>
    return %0 : tensor<8x8xf64>
  }
  func.func @sampled_dd_unfused(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8x8xf64>
    %0 = linalg.generic {indexing_maps = [#map3, #map1, #map4], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg1, %arg2 : tensor<8x8xf64>, tensor<8x8xf64>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.mulf %in, %in_0 : f64
      %3 = arith.addf %out, %2 : f64
      linalg.yield %3 : f64
    } -> tensor<8x8xf64>
    %1 = linalg.generic {indexing_maps = [#map5, #map5, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %arg0 : tensor<8x8xf64>, tensor<8x8xf64, #sparse>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.mulf %in, %in_0 : f64
      linalg.yield %2 : f64
    } -> tensor<8x8xf64>
    bufferization.dealloc_tensor %0 : tensor<8x8xf64>
    return %1 : tensor<8x8xf64>
  }
  func.func @sparse_sampled_dd(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>) -> tensor<8x8xf64, #sparse> {
    %0 = tensor.empty() : tensor<8x8xf64, #sparse>
    %1 = linalg.generic {doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2, #map], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1, %arg2 : tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) outs(%0 : tensor<8x8xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %in_1: f64, %out: f64):
      %2 = arith.mulf %in_0, %in_1 : f64
      %3 = arith.mulf %in, %2 : f64
      %4 = arith.addf %out, %3 : f64
      linalg.yield %4 : f64
    } -> tensor<8x8xf64, #sparse>
    return %1 : tensor<8x8xf64, #sparse>
  }
  func.func @sparse_sampled_dd_unfused(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>) -> tensor<8x8xf64, #sparse> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8x8xf64>
    %0 = linalg.generic {indexing_maps = [#map3, #map1, #map4], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg1, %arg2 : tensor<8x8xf64>, tensor<8x8xf64>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %3 = arith.mulf %in, %in_0 : f64
      %4 = arith.addf %out, %3 : f64
      linalg.yield %4 : f64
    } -> tensor<8x8xf64>
    %1 = tensor.empty() : tensor<8x8xf64, #sparse>
    %2 = linalg.generic {indexing_maps = [#map5, #map5, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %arg0 : tensor<8x8xf64>, tensor<8x8xf64, #sparse>) outs(%1 : tensor<8x8xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %3 = arith.mulf %in, %in_0 : f64
      linalg.yield %3 : f64
    } -> tensor<8x8xf64, #sparse>
    return %2 : tensor<8x8xf64, #sparse>
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant sparse<[[0, 0], [7, 7]], [1.000000e+00, 2.000000e+00]> : tensor<8x8xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<8x8xf64> to tensor<8x8xf64, #sparse>
    %cst_1 = arith.constant dense<3.000000e+00> : tensor<8x8xf64>
    %cst_2 = arith.constant dense<4.000000e+00> : tensor<8x8xf64>
    %1 = call @sampled_dd(%0, %cst_1, %cst_2) : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %2 = call @sampled_dd_unfused(%0, %cst_1, %cst_2) : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %3 = call @sparse_sampled_dd(%0, %cst_1, %cst_2) : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>
    %4 = call @sparse_sampled_dd_unfused(%0, %cst_1, %cst_2) : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>
    %5 = vector.transfer_read %1[%c0, %c0], %cst : tensor<8x8xf64>, vector<8x8xf64>
    %6 = vector.transfer_read %2[%c0, %c0], %cst : tensor<8x8xf64>, vector<8x8xf64>
    vector.print %5 : vector<8x8xf64>
    vector.print %6 : vector<8x8xf64>
    sparse_tensor.print %3 : tensor<8x8xf64, #sparse>
    sparse_tensor.print %4 : tensor<8x8xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<8x8xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<8x8xf64>
    bufferization.dealloc_tensor %2 : tensor<8x8xf64>
    bufferization.dealloc_tensor %3 : tensor<8x8xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<8x8xf64, #sparse>
    return
  }
}

