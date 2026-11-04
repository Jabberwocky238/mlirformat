#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
module {
  func.func @sparse_scale(%arg0: tensor<1x1xf32, #sparse>) -> tensor<1x1xf32, #sparse> {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = linalg.generic {doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<1x1xf32, #sparse>) {
    ^bb0(%out: f32):
      %1 = arith.mulf %out, %cst : f32
      linalg.yield %1 : f32
    } -> tensor<1x1xf32, #sparse>
    return %0 : tensor<1x1xf32, #sparse>
  }
}

