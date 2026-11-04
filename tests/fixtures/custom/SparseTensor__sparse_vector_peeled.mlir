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

