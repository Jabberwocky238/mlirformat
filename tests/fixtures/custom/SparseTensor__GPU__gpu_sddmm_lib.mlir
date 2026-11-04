#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
module {
  func.func @SDDMM_block(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32, #sparse> {
    %0 = linalg.generic {doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32, #sparse>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %cst = arith.constant 0.000000e+00 : f32
      %1 = sparse_tensor.unary %out : f32 to f32
       present = {
      ^bb0(%arg3: f32):
        %3 = arith.mulf %in, %in_0 : f32
        sparse_tensor.yield %3 : f32
      }
       absent = {
      }
      %2 = sparse_tensor.reduce %out, %1, %cst : f32 {
      ^bb0(%arg3: f32, %arg4: f32):
        %3 = arith.addf %arg3, %arg4 : f32
        sparse_tensor.yield %3 : f32
      }
      linalg.yield %2 : f32
    } -> tensor<?x?xf32, #sparse>
    return %0 : tensor<?x?xf32, #sparse>
  }
}

