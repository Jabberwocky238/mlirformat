#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_sampled_dd(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse> {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = linalg.generic {doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<8x8xf64>, tensor<8x8xf64>) outs(%arg2 : tensor<8x8xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = sparse_tensor.unary %out : f64 to f64
       present = {
      ^bb0(%arg3: f64):
        %3 = arith.mulf %in, %in_0 : f64
        sparse_tensor.yield %3 : f64
      }
       absent = {
      }
      %2 = sparse_tensor.reduce %out, %1, %cst : f64 {
      ^bb0(%arg3: f64, %arg4: f64):
        %3 = arith.addf %arg3, %arg4 : f64
        sparse_tensor.yield %3 : f64
      }
      linalg.yield %2 : f64
    } -> tensor<8x8xf64, #sparse>
    return %0 : tensor<8x8xf64, #sparse>
  }
}

