#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @test_vector_contract_to_usmmla_rev(%arg0: vector<4x8xi8>, %arg1: vector<[4]x8xi8>, %arg2: vector<4x[4]xi32>) -> vector<4x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<4x8xi8> to vector<4x8xi32>
    %1 = arith.extui %arg1 : vector<[4]x8xi8> to vector<[4]x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<4x8xi32>, vector<[4]x8xi32> into vector<4x[4]xi32>
    return %2 : vector<4x[4]xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.arm_sve.vector_contract_to_i8mm
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

