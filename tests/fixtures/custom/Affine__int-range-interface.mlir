#map = affine_map<() -> (42)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0) -> (d0 floordiv 4)>
#map4 = affine_map<(d0) -> (d0 ceildiv 4)>
#map5 = affine_map<(d0) -> (d0 mod 4)>
#map6 = affine_map<(d0, d1) -> (d0 floordiv 2 + d1 mod 4)>
#map7 = affine_map<(d0)[s0] -> (d0 * s0 + s0)>
#map8 = affine_map<(d0, d1) -> (d0 - d1)>
#map9 = affine_map<(d0) -> (d0 * 4)>
#map10 = affine_map<(d0) -> (d0 mod 10)>
#map11 = affine_map<(d0)[s0] -> (d0 mod s0)>
module {
  func.func @affine_apply_constant() -> index {
    %0 = affine.apply #map()
    %1 = test.reflect_bounds %0 : index
    return %1 : index
  }
  func.func @affine_apply_add() -> index {
    %0 = test.with_bounds {smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index} : index
    %1 = test.with_bounds {smax = 10 : index, smin = 4 : index, umax = 10 : index, umin = 4 : index} : index
    %2 = affine.apply #map1(%0, %1)
    %3 = test.reflect_bounds %2 : index
    return %3 : index
  }
  func.func @affine_apply_mul() -> index {
    %0 = test.with_bounds {smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index} : index
    %1 = test.with_bounds {smax = 6 : index, smin = 6 : index, umax = 6 : index, umin = 6 : index} : index
    %2 = affine.apply #map2(%0)[%1]
    %3 = test.reflect_bounds %2 : index
    return %3 : index
  }
  func.func @affine_apply_floordiv() -> index {
    %0 = test.with_bounds {smax = 10 : index, smin = 5 : index, umax = 10 : index, umin = 5 : index} : index
    %1 = affine.apply #map3(%0)
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @affine_apply_ceildiv() -> index {
    %0 = test.with_bounds {smax = 10 : index, smin = 5 : index, umax = 10 : index, umin = 5 : index} : index
    %1 = affine.apply #map4(%0)
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @affine_apply_mod() -> index {
    %0 = test.with_bounds {smax = 27 : index, smin = 5 : index, umax = 27 : index, umin = 5 : index} : index
    %1 = affine.apply #map5(%0)
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @affine_apply_complex() -> index {
    %0 = test.with_bounds {smax = 20 : index, smin = 10 : index, umax = 20 : index, umin = 10 : index} : index
    %1 = test.with_bounds {smax = 7 : index, smin = 3 : index, umax = 7 : index, umin = 3 : index} : index
    %2 = affine.apply #map6(%0, %1)
    %3 = test.reflect_bounds %2 : index
    return %3 : index
  }
  func.func @affine_apply_with_symbols() -> index {
    %0 = test.with_bounds {smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index} : index
    %1 = test.with_bounds {smax = 4 : index, smin = 3 : index, umax = 4 : index, umin = 3 : index} : index
    %2 = affine.apply #map7(%0)[%1]
    %3 = test.reflect_bounds %2 : index
    return %3 : index
  }
  func.func @affine_apply_sub() -> index {
    %0 = test.with_bounds {smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index} : index
    %1 = test.with_bounds {smax = 10 : index, smin = 4 : index, umax = 10 : index, umin = 4 : index} : index
    %2 = affine.apply #map8(%0, %1)
    %3 = test.reflect_bounds %2 : index
    return %3 : index
  }
  func.func @affine_apply_mul_constant() -> index {
    %0 = test.with_bounds {smax = 5 : index, smin = 2 : index, umax = 5 : index, umin = 2 : index} : index
    %1 = affine.apply #map9(%0)
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @affine_apply_mod_small_range() -> index {
    %0 = test.with_bounds {smax = 6 : index, smin = 5 : index, umax = 6 : index, umin = 5 : index} : index
    %1 = affine.apply #map5(%0)
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @affine_apply_mod_already_in_range() -> index {
    %0 = test.with_bounds {smax = 7 : index, smin = 5 : index, umax = 7 : index, umin = 5 : index} : index
    %1 = affine.apply #map10(%0)
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @affine_apply_mod_variable_divisor() -> index {
    %0 = test.with_bounds {smax = 20 : index, smin = 10 : index, umax = 20 : index, umin = 10 : index} : index
    %1 = test.with_bounds {smax = 5 : index, smin = 3 : index, umax = 5 : index, umin = 3 : index} : index
    %2 = affine.apply #map11(%0)[%1]
    %3 = test.reflect_bounds %2 : index
    return %3 : index
  }
  func.func @affine_apply_mod_negative_dividend() -> index {
    %0 = test.with_bounds {smax = 2 : index, smin = -2 : index, umax = 2 : index, umin = 0 : index} : index
    %1 = affine.apply #map5(%0)
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
}

