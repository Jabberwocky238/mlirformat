#map = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<(d0, d1) -> ()>
module {
  func.func @parallel_contract_lowering(%arg0: vector<1x1x4xf32>, %arg1: vector<1x1x4xf32>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x4xf32>, vector<1x1x4xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @parallel_contract_lowering_broadcast(%arg0: vector<1x1xf32>, %arg1: vector<1x1x4xf32>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.contract {indexing_maps = [#map2, #map, #map1], iterator_types = ["parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1xf32>, vector<1x1x4xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @parallel_contract_lowering_transpose(%arg0: vector<1x1xf32>, %arg1: vector<1x4x1xf32>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.contract {indexing_maps = [#map2, #map3, #map1], iterator_types = ["parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1xf32>, vector<1x4x1xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @parallel_contract_lowering_scalar(%arg0: vector<1x1xf32>, %arg1: vector<1x1xf32>, %arg2: f32) -> f32 {
    %0 = vector.contract {indexing_maps = [#map4, #map4, #map5], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1xf32>, vector<1x1xf32> into f32
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_contraction lowering_strategy = parallelarith
      } : !transform.any_op
      transform.yield 
    }
  }
}

