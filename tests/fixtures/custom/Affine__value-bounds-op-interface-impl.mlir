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
  func.func @affine_max_ub(%arg0: index) -> index {
    %0 = affine.max #map()[%arg0]
    %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
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
#map = affine_map<()[s0] -> (s0, 2)>
module {
  func.func @affine_min_lb(%arg0: index) -> index {
    %0 = affine.min #map()[%arg0]
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
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

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
module {
  func.func @are_equal(%arg0: index) {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1(%arg0)
    %2 = affine.apply #map2()[%0, %1]
    "test.compare"(%0, %1) <{cmp = "EQ"}> : (index, index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
module {
  func.func @composed_are_equal(%arg0: index) {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1(%arg0)
    %2 = affine.apply #map2()[%0, %1]
    "test.compare"(%0, %1) <{cmp = "EQ", compose}> : (index, index) -> ()
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0, s1)>
module {
  func.func @compare_affine_max(%arg0: index, %arg1: index) {
    %0 = affine.max #map()[%arg0, %arg1]
    "test.compare"(%0, %arg0) <{cmp = "GE"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "GT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LE"}> : (index, index) -> ()
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0, s1)>
module {
  func.func @compare_affine_min(%arg0: index, %arg1: index) {
    %0 = affine.min #map()[%arg0, %arg1]
    "test.compare"(%0, %arg0) <{cmp = "GE"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "GT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LE"}> : (index, index) -> ()
    return
  }
}

// -----
#map = affine_map<() -> (4)>
module {
  func.func @compare_const_map() {
    %c5 = arith.constant 5 : index
    "test.compare"(%c5) <{cmp = "GT", rhs_map = #map}> : (index) -> ()
    "test.compare"(%c5) <{cmp = "LT", lhs_map = #map}> : (index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1 + 1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @compare_maps(%arg0: index, %arg1: index) {
    "test.compare"(%arg0, %arg1, %arg1, %arg0) <{cmp = "GT", lhs_map = #map, rhs_map = #map1}> : (index, index, index, index) -> ()
    return
  }
}

// -----
module {
  func.func @delinearize_static(%arg0: index) -> (index, index, index) {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0:3 = affine.delinearize_index %arg0 into (2, 3, 5) : index, index, index
    %1 = "test.reify_bound"(%0#0) <{type = "EQ"}> : (index) -> index
    %2 = "test.reify_bound"(%0#1) <{type = "EQ"}> : (index) -> index
    %3 = "test.reify_bound"(%0#2) <{type = "EQ"}> : (index) -> index
    "test.compare"(%0#0, %c2) <{cmp = "LT"}> : (index, index) -> ()
    "test.compare"(%0#1, %c3) <{cmp = "LT"}> : (index, index) -> ()
    return %1, %2, %3 : index, index, index
  }
}

// -----
module {
  func.func @delinearize_static_no_outer_bound(%arg0: index) -> (index, index, index) {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0:3 = affine.delinearize_index %arg0 into (3, 5) : index, index, index
    %1 = "test.reify_bound"(%0#0) <{type = "EQ"}> : (index) -> index
    %2 = "test.reify_bound"(%0#1) <{type = "EQ"}> : (index) -> index
    %3 = "test.reify_bound"(%0#2) <{type = "EQ"}> : (index) -> index
    "test.compaare"(%0#0, %c2) {cmp = "LT"} : (index, index) -> ()
    "test.compare"(%0#1, %c3) <{cmp = "LT"}> : (index, index) -> ()
    return %1, %2, %3 : index, index, index
  }
}

// -----
module {
  func.func @linearize_static(%arg0: index, %arg1: index) -> index {
    %c6 = arith.constant 6 : index
    %0 = affine.linearize_index disjoint [%arg0, %arg1] by (2, 3) : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "test.compare"(%0, %c6) <{cmp = "LT"}> : (index, index) -> ()
    return %1 : index
  }
}

// -----
module {
  func.func @linearize_static_no_outer_bound(%arg0: index, %arg1: index) -> index {
    %c6 = arith.constant 6 : index
    %0 = affine.linearize_index disjoint [%arg0, %arg1] by (3) : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "test.compare"(%0, %c6) <{cmp = "LT"}> : (index, index) -> ()
    return %1 : index
  }
}

