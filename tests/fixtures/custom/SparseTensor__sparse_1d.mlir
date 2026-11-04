#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @add_d(%arg0: tensor<32xf32, #sparse>, %arg1: f32, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf32, #sparse>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %arg1 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @add_d_init(%arg0: tensor<32xf32, #sparse>, %arg1: f32) -> tensor<32xf32> {
    %0 = tensor.empty() : tensor<32xf32>
    %1 = linalg.generic {doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf32, #sparse>) outs(%0 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %arg1 : f32
      linalg.yield %2 : f32
    } -> tensor<32xf32>
    return %1 : tensor<32xf32>
  }
  func.func @mul_d(%arg0: tensor<32xf32, #sparse>, %arg1: f32, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf32, #sparse>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %arg1 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @add_s(%arg0: tensor<32xf32, #sparse1>, %arg1: f32, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf32, #sparse1>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %arg1 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @repeated_add_s(%arg0: tensor<32xf32, #sparse1>, %arg1: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf32, #sparse1>) outs(%arg1 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %in : f32
      %2 = arith.addf %in, %in : f32
      %3 = arith.addf %1, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @mul_s(%arg0: tensor<32xf32, #sparse1>, %arg1: f32, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf32, #sparse1>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %arg1 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @add_dd(%arg0: tensor<32xf32, #sparse>, %arg1: tensor<32xf32>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse>, tensor<32xf32>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @mul_dd(%arg0: tensor<32xf32, #sparse>, %arg1: tensor<32xf32>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse>, tensor<32xf32>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @add_ds(%arg0: tensor<32xf32>, %arg1: tensor<32xf32, #sparse1>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32>, tensor<32xf32, #sparse1>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @mul_ds(%arg0: tensor<32xf32>, %arg1: tensor<32xf32, #sparse1>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32>, tensor<32xf32, #sparse1>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @add_sd(%arg0: tensor<32xf32, #sparse1>, %arg1: tensor<32xf32>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse1>, tensor<32xf32>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @mul_sd(%arg0: tensor<32xf32, #sparse1>, %arg1: tensor<32xf32>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse1>, tensor<32xf32>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @add_ss(%arg0: tensor<32xf32, #sparse1>, %arg1: tensor<32xf32, #sparse1>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse1>, tensor<32xf32, #sparse1>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @mul_ss(%arg0: tensor<32xf32, #sparse1>, %arg1: tensor<32xf32, #sparse1>, %arg2: tensor<32xf32>) -> tensor<32xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf32, #sparse1>, tensor<32xf32, #sparse1>) outs(%arg2 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<32xf32>
    return %0 : tensor<32xf32>
  }
  func.func @two_way_inv(%arg0: tensor<16xf32, #sparse1>, %arg1: tensor<16xf32, #sparse1>, %arg2: f32, %arg3: tensor<16xf32>) -> tensor<16xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>) outs(%arg3 : tensor<16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %arg2 : f32
      %2 = arith.mulf %in_0, %arg2 : f32
      %3 = arith.addf %1, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<16xf32>
    return %0 : tensor<16xf32>
  }
  func.func @two_way_inv_alt(%arg0: tensor<16xf32, #sparse1>, %arg1: tensor<16xf32, #sparse1>, %arg2: f32, %arg3: tensor<16xf32>) -> tensor<16xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>) outs(%arg3 : tensor<16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      %2 = arith.mulf %1, %arg2 : f32
      linalg.yield %2 : f32
    } -> tensor<16xf32>
    return %0 : tensor<16xf32>
  }
  func.func @sum_reduction(%arg0: tensor<?xf32, #sparse1>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += SUM_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<?xf32, #sparse1>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @sum_reduction_ss(%arg0: tensor<16xf32, #sparse1>, %arg1: tensor<16xf32, #sparse1>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += SUM_i a(i) + b(i)", indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"]} ins(%arg0, %arg1 : tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>) outs(%arg2 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @sum_reduction_inv(%arg0: tensor<16xf32, #sparse1>, %arg1: tensor<f32>, %arg2: tensor<16xf32, #sparse1>, %arg3: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += SUM_i a(i) * b + c(i)", indexing_maps = [#map, #map1, #map, #map1], iterator_types = ["reduction"]} ins(%arg0, %arg1, %arg2 : tensor<16xf32, #sparse1>, tensor<f32>, tensor<16xf32, #sparse1>) outs(%arg3 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %in_1 : f32
      %3 = arith.addf %out, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @four_tensors_op(%arg0: tensor<?xf64>, %arg1: tensor<?xf64, #sparse1>, %arg2: tensor<?xf64>, %arg3: tensor<?xf64, #sparse1>, %arg4: tensor<?xf64>) -> tensor<?xf64> {
    %0 = linalg.generic {doc = "X(i) = A(i) + B(i) + C(i) + D(i)", indexing_maps = [#map, #map, #map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1, %arg2, %arg3 : tensor<?xf64>, tensor<?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64, #sparse1>) outs(%arg4 : tensor<?xf64>) {
    ^bb0(%in: f64, %in_0: f64, %in_1: f64, %in_2: f64, %out: f64):
      %1 = arith.addf %in, %in_0 : f64
      %2 = arith.addf %in_1, %in_2 : f64
      %3 = arith.addf %1, %2 : f64
      linalg.yield %3 : f64
    } -> tensor<?xf64>
    return %0 : tensor<?xf64>
  }
  func.func @red3s(%arg0: tensor<?xf64, #sparse1>, %arg1: tensor<?xf64, #sparse1>, %arg2: tensor<?xf64, #sparse1>, %arg3: tensor<f64>) -> tensor<f64> {
    %0 = linalg.generic {doc = "x += a(i) + b(i) + c(i)", indexing_maps = [#map, #map, #map, #map1], iterator_types = ["reduction"]} ins(%arg0, %arg1, %arg2 : tensor<?xf64, #sparse1>, tensor<?xf64, #sparse1>, tensor<?xf64, #sparse1>) outs(%arg3 : tensor<f64>) {
    ^bb0(%in: f64, %in_0: f64, %in_1: f64, %out: f64):
      %1 = arith.addf %out, %in : f64
      %2 = arith.addf %1, %in_0 : f64
      %3 = arith.addf %2, %in_1 : f64
      linalg.yield %3 : f64
    } -> tensor<f64>
    return %0 : tensor<f64>
  }
}

