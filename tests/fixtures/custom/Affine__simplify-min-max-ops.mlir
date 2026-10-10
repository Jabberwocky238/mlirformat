#map = affine_map<()[s0, s1] -> (s0, 192, s1)>
#map1 = affine_map<()[s0, s1] -> (s0, 32, s1)>
#map2 = affine_map<()[s0, s1] -> (s0, 256, s1)>
#map3 = affine_map<()[s0, s1, s2] -> (s0, s1, s2)>
module {
  func.func @min_max_full_simplify() -> (index, index) {
    %0 = test.value_with_bounds {max = 128 : index, min = 0 : index}
    %1 = test.value_with_bounds {max = 512 : index, min = 256 : index}
    %2 = affine.min #map()[%0, %1]
    %3 = affine.max #map()[%0, %1]
    return %2, %3 : index, index
  }
  func.func @min_only_simplify() -> (index, index) {
    %0 = test.value_with_bounds {max = 512 : index, min = 0 : index}
    %1 = test.value_with_bounds {max = 512 : index, min = 256 : index}
    %2 = affine.min #map1()[%0, %1]
    %3 = affine.max #map1()[%0, %1]
    return %2, %3 : index, index
  }
  func.func @max_only_simplify() -> (index, index) {
    %0 = test.value_with_bounds {max = 128 : index, min = 0 : index}
    %1 = test.value_with_bounds {max = 512 : index, min = 0 : index}
    %2 = affine.min #map2()[%0, %1]
    %3 = affine.max #map2()[%0, %1]
    return %2, %3 : index, index
  }
  func.func @overlapping_constraints() -> (index, index) {
    %0 = test.value_with_bounds {max = 192 : index, min = 0 : index}
    %1 = test.value_with_bounds {max = 384 : index, min = 128 : index}
    %2 = test.value_with_bounds {max = 512 : index, min = 256 : index}
    %3 = affine.min #map3()[%0, %1, %2]
    %4 = affine.max #map3()[%0, %1, %2]
    return %3, %4 : index, index
  }
}

