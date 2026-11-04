#map = affine_map<()[s0, s1] -> (s0, s1, 128)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv 128 + s0 ceildiv s1)>
#map2 = affine_map<()[s0, s1, s2] -> (s0, s1 + s2)>
#map3 = affine_map<()[s0, s1, s2, s3] -> ((s0 ceildiv s3) * 3 + s0 ceildiv (s1 + s2))>
#map4 = affine_map<()[s0, s1] -> (s1)>
#map5 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map6 = affine_map<()[s0, s1] -> (s0, s1, -128)>
module {
  func.func @apply_simplification_1() -> index {
    %0 = test.value_with_bounds {max = 64 : index, min = 32 : index}
    %1 = test.value_with_bounds {max = 64 : index, min = 32 : index}
    %2 = affine.min #map()[%0, %1]
    %3 = affine.apply #map1()[%2, %1]
    return %3 : index
  }
  func.func @apply_simplification_2() -> index {
    %0 = test.value_with_bounds {max = 64 : index, min = 32 : index}
    %1 = test.value_with_bounds {max = 64 : index, min = 32 : index}
    %2 = test.value_with_bounds {max = 64 : index, min = 32 : index}
    %3 = affine.min #map2()[%0, %1, %2]
    %4 = affine.apply #map3()[%3, %1, %2, %0]
    return %4 : index
  }
  func.func @no_simplification_0() -> index {
    %0 = test.value_with_bounds {max = 64 : index, min = 32 : index}
    %1 = test.value_with_bounds {max = 64 : index, min = 16 : index}
    %2 = affine.min #map4()[%0, %1]
    %3 = affine.apply #map5()[%2, %0]
    return %3 : index
  }
  func.func @no_simplification_1() -> index {
    %0 = test.value_with_bounds {max = 64 : index, min = 32 : index}
    %1 = test.value_with_bounds {max = 64 : index, min = 16 : index}
    %2 = affine.min #map6()[%0, %1]
    %3 = affine.apply #map1()[%2, %1]
    return %3 : index
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.apply"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.test.make_composed_folded_affine_apply %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

