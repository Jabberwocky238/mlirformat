#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @add_only_where_nonzero(%arg0: tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse> {
    %cst = arith.constant 2.000000e+00 : f64
    %0 = linalg.generic {doc = "A(i,j) += 2.0 where A(i,j) != 0", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<8x8xf64, #sparse>) {
    ^bb0(%out: f64):
      %1 = sparse_tensor.unary %out : f64 to f64
       present = {
      ^bb0(%arg1: f64):
        %2 = arith.addf %arg1, %cst : f64
        sparse_tensor.yield %2 : f64
      }
       absent = {
      }
      linalg.yield %1 : f64
    } -> tensor<8x8xf64, #sparse>
    return %0 : tensor<8x8xf64, #sparse>
  }
}

