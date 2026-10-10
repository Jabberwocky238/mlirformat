#map = affine_map<(d0) -> (d0 + 3)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @tile_offset(%arg0: tensor<9xf32>) -> tensor<6xf32> {
    %0 = tensor.empty() : tensor<6xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel"]} ins(%arg0 : tensor<9xf32>) outs(%0 : tensor<6xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<6xf32>
    return %1 : tensor<6xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

