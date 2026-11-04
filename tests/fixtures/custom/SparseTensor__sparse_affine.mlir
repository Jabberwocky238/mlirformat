#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (3)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d0 + 2, d1 + 3)>
#map5 = affine_map<(d0, d1) -> (d0 + 2, d1)>
#map6 = affine_map<(d0, d1) -> (d0, d1 + 3)>
#map7 = affine_map<(d0, d1) -> (2, d1)>
#map8 = affine_map<(d0, d1) -> (d0, 3)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
module {
  func.func @mul_inv_dense1d(%arg0: tensor<32xf32, #sparse>, %arg1: tensor<4xf32>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) += a(i) * b(3)", indexing_maps = [#map, #map1, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse>, tensor<4xf32>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @mul_inv_enc_dense1d(%arg0: tensor<32xf32, #sparse1>, %arg1: tensor<4xf32, #sparse1>) -> tensor<32xf32, #sparse1> {
    %0 = tensor.empty() : tensor<32xf32, #sparse1>
    %1 = linalg.generic {doc = "x(i) += a(i) * b(3)", indexing_maps = [#map, #map1, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse1>, tensor<4xf32, #sparse1>) outs(%0 : tensor<32xf32, #sparse1>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.mulf %in, %in_0 : f32
      %3 = arith.addf %out, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<32xf32, #sparse1>
    return %1 : tensor<32xf32, #sparse1>
  }
  func.func @and_affine_dense1d(%arg0: tensor<32xi32, #sparse>, %arg1: tensor<34xi32>, %arg2: tensor<32xi32>) -> tensor<32xi32> {
    %0 = linalg.generic {doc = "x(i) = a(i) & b(i+2)", indexing_maps = [#map, #map2, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xi32, #sparse>, tensor<34xi32>) outs(%arg2 : tensor<32xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %1 = arith.andi %in, %in_0 : i32
      linalg.yield %1 : i32
    } -> tensor<32xi32>
    return %0 : tensor<32xi32>
  }
  func.func @mul_affine_dense2d(%arg0: tensor<32x16xf64, #sparse2>, %arg1: tensor<34x19xf64>, %arg2: tensor<32x16xf64>) -> tensor<32x16xf64> {
    %0 = linalg.generic {doc = "x(i,j) += a(i,j) * b(i+2,j+3)", indexing_maps = [#map3, #map4, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf64, #sparse2>, tensor<34x19xf64>) outs(%arg2 : tensor<32x16xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<32x16xf64>
    return %0 : tensor<32x16xf64>
  }
  func.func @mul_affine_dense_dim_2d(%arg0: tensor<34x16xf64, #sparse2>, %arg1: tensor<32x19xf64, #sparse3>, %arg2: tensor<32x16xf64>) -> tensor<32x16xf64> {
    %0 = linalg.generic {doc = "x(i,j) += a(i+2,j) * b(i,j+3)", indexing_maps = [#map5, #map6, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<34x16xf64, #sparse2>, tensor<32x19xf64, #sparse3>) outs(%arg2 : tensor<32x16xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<32x16xf64>
    return %0 : tensor<32x16xf64>
  }
  func.func @mul_const_affine_dense_dim_2d(%arg0: tensor<34x16xf64, #sparse2>, %arg1: tensor<32x19xf64, #sparse3>, %arg2: tensor<32x16xf64>) -> tensor<32x16xf64> {
    %0 = linalg.generic {doc = "x(i,j) += a(2,j) * b(i,3)", indexing_maps = [#map7, #map8, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<34x16xf64, #sparse2>, tensor<32x19xf64, #sparse3>) outs(%arg2 : tensor<32x16xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<32x16xf64>
    return %0 : tensor<32x16xf64>
  }
}

