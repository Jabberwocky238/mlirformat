#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @mul(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<f32>, %arg2: f32, %arg3: f32, %arg4: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = arith.addf %arg2, %arg3 : f32
    %cst = arith.constant 2.200000e+00 : f32
    %1 = linalg.generic {doc = "X(i,j) += A(i,j) * p * q * r * s * 2.2", indexing_maps = [#map, #map1, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<32x16xf32, #sparse>, tensor<f32>, f32) outs(%arg4 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %2 = arith.mulf %in, %in_0 : f32
      %3 = arith.mulf %2, %in_1 : f32
      %4 = arith.mulf %3, %arg3 : f32
      %5 = arith.mulf %4, %0 : f32
      %6 = arith.mulf %5, %cst : f32
      %7 = arith.addf %6, %out : f32
      linalg.yield %7 : f32
    } -> tensor<32x16xf32>
    return %1 : tensor<32x16xf32>
  }
}

