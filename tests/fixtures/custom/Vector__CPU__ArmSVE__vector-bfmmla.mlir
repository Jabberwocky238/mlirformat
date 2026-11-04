#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @test_vector_contract_to_bfmmla(%arg0: vector<4x4xbf16>, %arg1: vector<[4]x4xbf16>, %arg2: vector<4x[4]xf32>) -> vector<4x[4]xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xbf16>, vector<[4]x4xbf16> into vector<4x[4]xf32>
    return %0 : vector<4x[4]xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.arm_sve.vector_contract_to_bfmmla
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

