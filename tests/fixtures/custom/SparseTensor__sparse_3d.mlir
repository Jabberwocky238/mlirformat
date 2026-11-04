#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d3, d1)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map5 = affine_map<(d0, d1, d2) -> ()>
#map6 = affine_map<(d0, d1, d2) -> (d0)>
#map7 = affine_map<(d0, d1, d2) -> (d1)>
#map8 = affine_map<(d0, d1, d2) -> (d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : dense) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>
#sparse7 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse8 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
module {
  func.func @add_ddd(%arg0: tensor<32x16x8xf32, #sparse>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_ddd(%arg0: tensor<32x16x8xf32, #sparse>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @add_dds(%arg0: tensor<32x16x8xf32, #sparse1>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse1>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_dds(%arg0: tensor<32x16x8xf32, #sparse1>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse1>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @add_dsd(%arg0: tensor<32x16x8xf32, #sparse2>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse2>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_dsd(%arg0: tensor<32x16x8xf32, #sparse2>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse2>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @add_dss(%arg0: tensor<32x16x8xf32, #sparse3>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse3>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_dss(%arg0: tensor<32x16x8xf32, #sparse3>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse3>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @add_sdd(%arg0: tensor<32x16x8xf32, #sparse4>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse4>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_sdd(%arg0: tensor<32x16x8xf32, #sparse4>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse4>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @add_sds(%arg0: tensor<32x16x8xf32, #sparse5>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse5>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_sds(%arg0: tensor<32x16x8xf32, #sparse5>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse5>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @add_ssd(%arg0: tensor<32x16x8xf32, #sparse6>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse6>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_ssd(%arg0: tensor<32x16x8xf32, #sparse6>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse6>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @add_sss(%arg0: tensor<32x16x8xf32, #sparse7>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse7>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @mul_sss(%arg0: tensor<32x16x8xf32, #sparse7>, %arg1: tensor<32x16x8xf32>, %arg2: tensor<32x16x8xf32>) -> tensor<32x16x8xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16x8xf32, #sparse7>, tensor<32x16x8xf32>) outs(%arg2 : tensor<32x16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16x8xf32>
    return %0 : tensor<32x16x8xf32>
  }
  func.func @kernel_3d(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?xf32, #sparse1>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {doc = "A(i,j) += SUM_k,l B(i,k,l) * C(k,j) * D(l,j)", indexing_maps = [#map1, #map2, #map3, #map4], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%arg1, %arg2, %arg3 : tensor<?x?x?xf32, #sparse1>, tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.mulf %1, %in_1 : f32
      %3 = arith.addf %2, %out : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @sum_reduction(%arg0: tensor<10x20x30xf32, #sparse7>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += SUM_ijk A(i,j,k)", indexing_maps = [#map, #map5], iterator_types = ["reduction", "reduction", "reduction"]} ins(%arg0 : tensor<10x20x30xf32, #sparse7>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @sum_reduction_inv(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32, #sparse8>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += SUM_i A(i,j,k) * b(i)", indexing_maps = [#map, #map6, #map5], iterator_types = ["reduction", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?xf32, #sparse8>) outs(%arg2 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @invariants(%arg0: tensor<10xf32, #sparse8>, %arg1: tensor<20xf32>, %arg2: tensor<30xf32>, %arg3: tensor<10x20x30xf32>) -> tensor<10x20x30xf32> {
    %0 = linalg.generic {doc = "X(i,j,k) = a(i) * b(j) * c(k)", indexing_maps = [#map6, #map7, #map8, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<10xf32, #sparse8>, tensor<20xf32>, tensor<30xf32>) outs(%arg3 : tensor<10x20x30xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.mulf %1, %in_1 : f32
      linalg.yield %2 : f32
    } -> tensor<10x20x30xf32>
    return %0 : tensor<10x20x30xf32>
  }
}

