#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @allout_inplace(%arg0: tensor<10xi32, #sparse>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xi32, #sparse>) outs(%arg1 : tensor<10xf32>) {
    ^bb0(%in: i32, %out: f32):
      %1 = arith.sitofp %in : i32 to f32
      linalg.yield %1 : f32
    } -> tensor<10xf32>
    return %0 : tensor<10xf32>
  }
  func.func @allout_materialize(%arg0: tensor<10xi32, #sparse>) -> tensor<10xf32> {
    %0 = tensor.empty() : tensor<10xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xi32, #sparse>) outs(%0 : tensor<10xf32>) {
    ^bb0(%in: i32, %out: f32):
      %2 = arith.sitofp %in : i32 to f32
      linalg.yield %2 : f32
    } -> tensor<10xf32>
    return %1 : tensor<10xf32>
  }
  func.func @update_inplace(%arg0: tensor<10xf32, #sparse>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf32, #sparse>) outs(%arg1 : tensor<10xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<10xf32>
    return %0 : tensor<10xf32>
  }
}

