#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @vector_contract_to_bfmmla(%arg0: vector<4x8xbf16>, %arg1: vector<4x8xbf16>, %arg2: vector<4x4xf32>) -> vector<4x4xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x8xbf16>, vector<4x8xbf16> into vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
  func.func @vector_contract_vecmat_to_bfmmla(%arg0: vector<8xbf16>, %arg1: vector<4x8xbf16>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.contract {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<8xbf16>, vector<4x8xbf16> into vector<4xf32>
    return %0 : vector<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.arm_neon.vector_contract_to_bfmmla
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

