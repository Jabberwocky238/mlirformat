#map = affine_map<()[s0, s1] -> (s0 + s1)>
module {
  func.func @affine_apply(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map()[%arg0, %arg1]
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0, 2)>
module {
  func.func @affine_max_lb(%arg0: index) -> index {
    %0 = affine.max #map()[%arg0]
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0, 2)>
module {
  func.func @affine_min_ub(%arg0: index) -> index {
    %0 = affine.min #map()[%arg0]
    %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1 : index
  }
}

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
module {
  func.func @composed_affine_apply(%arg0: index) -> index {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1(%arg0)
    %2 = affine.apply #map2()[%0, %1]
    %3 = "test.reify_bound"(%2) <{constant, type = "EQ"}> : (index) -> index
    return %3 : index
  }
}

