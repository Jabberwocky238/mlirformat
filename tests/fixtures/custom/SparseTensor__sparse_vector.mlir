#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
module {
  func.func @scale_d(%arg0: tensor<1024xf32, #sparse>, %arg1: f32, %arg2: tensor<1024xf32>) -> tensor<1024xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) * b", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<1024xf32, #sparse>) outs(%arg2 : tensor<1024xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %arg1 : f32
      linalg.yield %1 : f32
    } -> tensor<1024xf32>
    return %0 : tensor<1024xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @mul_s(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32>, %arg2: tensor<1024xf32>) -> tensor<1024xf32> {
    %0 = linalg.generic {doc = "x(i) = a(i) * b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<1024xf32, #sparse>, tensor<1024xf32>) outs(%arg2 : tensor<1024xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<1024xf32>
    return %0 : tensor<1024xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
module {
  func.func @reduction_d(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += a(i) * b(i)", indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"]} ins(%arg0, %arg1 : tensor<1024xf32, #sparse>, tensor<1024xf32>) outs(%arg2 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @mul_ds(%arg0: tensor<512x1024xf32, #sparse>, %arg1: tensor<512x1024xf32>, %arg2: tensor<512x1024xf32>) -> tensor<512x1024xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) * B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<512x1024xf32, #sparse>, tensor<512x1024xf32>) outs(%arg2 : tensor<512x1024xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<512x1024xf32>
    return %0 : tensor<512x1024xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + 1, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @add_dense(%arg0: tensor<32x64xf64, #sparse>, %arg1: tensor<33x64xf64>) -> tensor<33x64xf64> {
    %0 = linalg.generic {doc = "X(i+1,j) += A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<32x64xf64, #sparse>) outs(%arg1 : tensor<33x64xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = arith.addf %out, %in : f64
      linalg.yield %1 : f64
    } -> tensor<33x64xf64>
    return %0 : tensor<33x64xf64>
  }
}

