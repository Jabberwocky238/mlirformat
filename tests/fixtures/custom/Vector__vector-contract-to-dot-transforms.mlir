#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map7 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map8 = affine_map<(d0, d1) -> ()>
#map9 = affine_map<(d0, d1) -> (d1, d0)>
#map10 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map11 = affine_map<(d0, d1, d2) -> (d1)>
module {
  func.func @extract_contract1(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: f32) -> f32 {
    %0 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4xf32>, vector<4xf32> into f32
    return %0 : f32
  }
  func.func @masked_extract_contract1(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: f32, %arg3: vector<4xi1>) -> f32 {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4xf32>, vector<4xf32> into f32 } : vector<4xi1> -> f32
    return %0 : f32
  }
  func.func @extract_contract1_int(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: i32) -> i32 {
    %0 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4xi32>, vector<4xi32> into i32
    return %0 : i32
  }
  func.func @extract_contract2(%arg0: vector<2x3xf32>, %arg1: vector<3xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x3xf32>, vector<3xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @extract_contract2_int(%arg0: vector<2x3xi32>, %arg1: vector<3xi32>, %arg2: vector<2xi32>) -> vector<2xi32> {
    %0 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x3xi32>, vector<3xi32> into vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @extract_contract3(%arg0: vector<3xf32>, %arg1: vector<2x3xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map3, #map2, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<3xf32>, vector<2x3xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @contract_to_dot_matmat(%arg0: vector<2x2xf32>, %arg1: vector<2x2xf32>, %arg2: vector<2x2xf32>) -> vector<2x2xf32> {
    %0 = vector.contract {indexing_maps = [#map5, #map6, #map7], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @full_contract1(%arg0: vector<2x3xf32>, %arg1: vector<2x3xf32>, %arg2: f32) -> f32 {
    %0 = vector.contract {indexing_maps = [#map2, #map2, #map8], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x3xf32>, vector<2x3xf32> into f32
    return %0 : f32
  }
  func.func @full_contract2(%arg0: vector<2x3xf32>, %arg1: vector<3x2xf32>, %arg2: f32) -> f32 {
    %0 = vector.contract {indexing_maps = [#map2, #map9, #map8], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x3xf32>, vector<3x2xf32> into f32
    return %0 : f32
  }
  func.func @contract_one_sided_unit_reduction_dim(%arg0: vector<1x2xi32>, %arg1: vector<2x2xi32>, %arg2: vector<2xi32>) -> vector<2xi32> {
    %0 = vector.contract {indexing_maps = [#map5, #map10, #map11], iterator_types = ["reduction", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x2xi32>, vector<2x2xi32> into vector<2xi32>
    return %0 : vector<2xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_contraction lowering_strategy = dot
      } : !transform.any_op
      transform.yield 
    }
  }
}

