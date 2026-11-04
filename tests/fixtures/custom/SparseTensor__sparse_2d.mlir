#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> ()>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : loose_compressed) }>
module {
  func.func @add_dd(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @cmp_dd(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xi1>) -> tensor<32x16xi1> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xi1>) {
    ^bb0(%in: f32, %in_0: f32, %out: i1):
      %1 = arith.cmpf ult, %in, %in_0 : f32
      linalg.yield %1 : i1
    } -> tensor<32x16xi1>
    return %0 : tensor<32x16xi1>
  }
  func.func @mul_dd(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @add_ds(%arg0: tensor<32x16xf32, #sparse1>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse1>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @cmp_ds(%arg0: tensor<32x16xf32, #sparse1>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xi1>) -> tensor<32x16xi1> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse1>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xi1>) {
    ^bb0(%in: f32, %in_0: f32, %out: i1):
      %1 = arith.cmpf ult, %in, %in_0 : f32
      linalg.yield %1 : i1
    } -> tensor<32x16xi1>
    return %0 : tensor<32x16xi1>
  }
  func.func @mul_ds(%arg0: tensor<32x16xf32, #sparse1>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse1>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @add_sd(%arg0: tensor<32x16xf32, #sparse2>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse2>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @cmp_sd(%arg0: tensor<32x16xf32, #sparse2>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xi1>) -> tensor<32x16xi1> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse2>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xi1>) {
    ^bb0(%in: f32, %in_0: f32, %out: i1):
      %1 = arith.cmpf ult, %in, %in_0 : f32
      linalg.yield %1 : i1
    } -> tensor<32x16xi1>
    return %0 : tensor<32x16xi1>
  }
  func.func @mul_sd(%arg0: tensor<32x16xf32, #sparse2>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse2>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @add_ss(%arg0: tensor<32x16xf32, #sparse3>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse3>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @cmp_ss(%arg0: tensor<32x16xf32, #sparse3>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xi1>) -> tensor<32x16xi1> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse3>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xi1>) {
    ^bb0(%in: f32, %in_0: f32, %out: i1):
      %1 = arith.cmpf ult, %in, %in_0 : f32
      linalg.yield %1 : i1
    } -> tensor<32x16xi1>
    return %0 : tensor<32x16xi1>
  }
  func.func @mul_ss(%arg0: tensor<32x16xf32, #sparse3>, %arg1: tensor<32x16xf32>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse3>, tensor<32x16xf32>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @add_ss_ss(%arg0: tensor<32x16xf32, #sparse3>, %arg1: tensor<32x16xf32, #sparse3>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @cmp_ss_ss(%arg0: tensor<32x16xf32, #sparse3>, %arg1: tensor<32x16xf32, #sparse3>, %arg2: tensor<32x16xi1>) -> tensor<32x16xi1> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>) outs(%arg2 : tensor<32x16xi1>) {
    ^bb0(%in: f32, %in_0: f32, %out: i1):
      %1 = arith.cmpf ult, %in, %in_0 : f32
      linalg.yield %1 : i1
    } -> tensor<32x16xi1>
    return %0 : tensor<32x16xi1>
  }
  func.func @sub_ss_batched(%arg0: tensor<2x3xf64, #sparse4>, %arg1: tensor<2x3xf64, #sparse4>) -> tensor<2x3xf64, #sparse4> {
    %0 = tensor.empty() : tensor<2x3xf64, #sparse4>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<2x3xf64, #sparse4>, tensor<2x3xf64, #sparse4>) outs(%0 : tensor<2x3xf64, #sparse4>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.subf %in, %in_0 : f64
      linalg.yield %2 : f64
    } -> tensor<2x3xf64, #sparse4>
    return %1 : tensor<2x3xf64, #sparse4>
  }
  func.func @mul_ss_ss(%arg0: tensor<32x16xf32, #sparse3>, %arg1: tensor<32x16xf32, #sparse3>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @add_sd_ds(%arg0: tensor<32x16xf32, #sparse2>, %arg1: tensor<32x16xf32, #sparse1>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse2>, tensor<32x16xf32, #sparse1>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @mul_sd_ds(%arg0: tensor<32x16xf32, #sparse2>, %arg1: tensor<32x16xf32, #sparse1>, %arg2: tensor<32x16xf32>) -> tensor<32x16xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse2>, tensor<32x16xf32, #sparse1>) outs(%arg2 : tensor<32x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32>
    return %0 : tensor<32x16xf32>
  }
  func.func @matvec(%arg0: tensor<16x32xf32, #sparse1>, %arg1: tensor<32xf32>, %arg2: tensor<16xf32>) -> tensor<16xf32> {
    %0 = linalg.generic {doc = "x(i) += SUM_j A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x32xf32, #sparse1>, tensor<32xf32>) outs(%arg2 : tensor<16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<16xf32>
    return %0 : tensor<16xf32>
  }
  func.func @sum_reduction(%arg0: tensor<10x20xf32, #sparse1>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += SUM_ij A(i,j)", indexing_maps = [#map, #map3], iterator_types = ["reduction", "reduction"]} ins(%arg0 : tensor<10x20xf32, #sparse1>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @scale(%arg0: tensor<?x?xf64, #sparse1>, %arg1: tensor<?x?xf64>) -> tensor<?x?xf64> {
    %cst = arith.constant 2.000000e+00 : f64
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf64, #sparse1>) outs(%arg1 : tensor<?x?xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = arith.mulf %in, %cst : f64
      linalg.yield %1 : f64
    } -> tensor<?x?xf64>
    return %0 : tensor<?x?xf64>
  }
  func.func @sampled_dense_dense(%arg0: tensor<?x?xf32, #sparse3>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map4, #map5, #map6, #map4], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1, %arg2 : tensor<?x?xf32, #sparse3>, tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in_0, %in_1 : f32
      %2 = arith.mulf %in, %1 : f32
      %3 = arith.addf %out, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @sum_kernel_with_inv(%arg0: tensor<?x?xf32, #sparse3>, %arg1: tensor<?x?xf32, #sparse1>, %arg2: tensor<?x?xf32, #sparse1>, %arg3: tensor<?xf32>, %arg4: tensor<f32>, %arg5: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {doc = "x(i) = SUM_j A(i,j) * B(i,j) * d(i) * e + C(i,j)", indexing_maps = [#map, #map, #map, #map2, #map3, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1, %arg2, %arg3, %arg4 : tensor<?x?xf32, #sparse3>, tensor<?x?xf32, #sparse1>, tensor<?x?xf32, #sparse1>, tensor<?xf32>, tensor<f32>) outs(%arg5 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %in_2: f32, %in_3: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.mulf %1, %in_2 : f32
      %3 = arith.mulf %2, %in_3 : f32
      %4 = arith.addf %3, %in_1 : f32
      %5 = arith.addf %out, %4 : f32
      linalg.yield %5 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

