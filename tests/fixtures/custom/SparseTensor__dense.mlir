#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
module {
  func.func @dense1(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) + 1", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<32x16xf32, #sparse>) outs(%arg1 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %cst : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @dense2(%arg0: tensor<32x16xf32>, %arg1: tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse> {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) + 1", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<32x16xf32>) outs(%arg1 : tensor<32x16xf32, #sparse>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %cst : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32, #sparse>
    return %0 : tensor<32x16xf32, #sparse>
  }
  func.func @dense3(%arg0: tensor<32x16x8xf32>, %arg1: tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse> {
    %0 = linalg.generic {doc = "X(i,j) += A(i,j,k)", indexing_maps = [#map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0 : tensor<32x16x8xf32>) outs(%arg1 : tensor<32x16xf32, #sparse>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32, #sparse>
    return %0 : tensor<32x16xf32, #sparse>
  }
}

