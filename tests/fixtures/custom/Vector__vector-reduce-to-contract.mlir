module {
  func.func @multidimreduction_contract(%arg0: vector<8x32x16xf32>, %arg1: vector<8x32x16xf32>, %arg2: vector<8x16xf32>) -> vector<8x16xf32> {
    %0 = arith.mulf %arg0, %arg1 : vector<8x32x16xf32>
    %1 = vector.multi_reduction <add>, %0, %arg2 [1] : vector<8x32x16xf32> to vector<8x16xf32>
    return %1 : vector<8x16xf32>
  }
}

// -----
module {
  func.func @multidimreduction_contract_int(%arg0: vector<8x32x16xi32>, %arg1: vector<8x32x16xi32>, %arg2: vector<8x16xi32>) -> vector<8x16xi32> {
    %0 = arith.muli %arg0, %arg1 : vector<8x32x16xi32>
    %1 = vector.multi_reduction <add>, %0, %arg2 [1] : vector<8x32x16xi32> to vector<8x16xi32>
    return %1 : vector<8x16xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_transpose(%arg0: vector<32x16x8xf32>, %arg1: vector<8x32x16xf32>) -> vector<8x32xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<8x32xf32>
    %0 = vector.transpose %arg0, [2, 0, 1] : vector<32x16x8xf32> to vector<8x32x16xf32>
    %1 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %arg1, %cst : vector<8x32x16xf32>, vector<8x32x16xf32> into vector<8x32xf32>
    return %1 : vector<8x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_broadcast(%arg0: vector<32x16xf32>, %arg1: vector<8x32x16xf32>) -> vector<8x32xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<8x32xf32>
    %0 = vector.broadcast %arg0 : vector<32x16xf32> to vector<8x32x16xf32>
    %1 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %arg1, %cst : vector<8x32x16xf32>, vector<8x32x16xf32> into vector<8x32xf32>
    return %1 : vector<8x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_broadcast_masked(%arg0: vector<32x16xf32>, %arg1: vector<8x32x16xf32>, %arg2: vector<8x32x16xi1>) -> vector<8x32xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<8x32xf32>
    %0 = vector.broadcast %arg0 : vector<32x16xf32> to vector<8x32x16xf32>
    %1 = vector.mask %arg2 { vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %arg1, %cst : vector<8x32x16xf32>, vector<8x32x16xf32> into vector<8x32xf32> } : vector<8x32x16xi1> -> vector<8x32xf32>
    return %1 : vector<8x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_broadcast_masked_scalable(%arg0: vector<[32]x16xf32>, %arg1: vector<8x[32]x16xf32>, %arg2: vector<8x[32]x16xi1>) -> vector<8x32xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<8x32xf32>
    %0 = vector.broadcast %arg0 : vector<[32]x16xf32> to vector<8x[32]x16xf32>
    %1 = vector.mask %arg2 { vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %arg1, %cst : vector<8x[32]x16xf32>, vector<8x[32]x16xf32> into vector<8x32xf32> } : vector<8x[32]x16xi1> -> vector<8x32xf32>
    return %1 : vector<8x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @contract_broadcast_unit_dim_reduction(%arg0: vector<8x4xi32>, %arg1: vector<8x4xi32>, %arg2: vector<8x8xi32>) -> vector<8x8xi32> {
    %0 = vector.broadcast %arg0 : vector<8x4xi32> to vector<1x8x4xi32>
    %1 = vector.broadcast %arg1 : vector<8x4xi32> to vector<1x8x4xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<1x8x4xi32>, vector<1x8x4xi32> into vector<8x8xi32>
    return %2 : vector<8x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @contract_broadcast_unit_dim_reduction_masked(%arg0: vector<8x4xi32>, %arg1: vector<8x4xi32>, %arg2: vector<8x8xi32>, %arg3: vector<1x8x8x4xi1>) -> vector<8x8xi32> {
    %0 = vector.broadcast %arg0 : vector<8x4xi32> to vector<1x8x4xi32>
    %1 = vector.broadcast %arg1 : vector<8x4xi32> to vector<1x8x4xi32>
    %2 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<1x8x4xi32>, vector<1x8x4xi32> into vector<8x8xi32> } : vector<1x8x8x4xi1> -> vector<8x8xi32>
    return %2 : vector<8x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @contract_broadcast_unit_dim_reduction_masked_scalable(%arg0: vector<8x4xi32>, %arg1: vector<[8]x4xi32>, %arg2: vector<8x[8]xi32>, %arg3: vector<1x8x[8]x4xi1>) -> vector<8x[8]xi32> {
    %0 = vector.broadcast %arg0 : vector<8x4xi32> to vector<1x8x4xi32>
    %1 = vector.broadcast %arg1 : vector<[8]x4xi32> to vector<1x[8]x4xi32>
    %2 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<1x8x4xi32>, vector<1x[8]x4xi32> into vector<8x[8]xi32> } : vector<1x8x[8]x4xi1> -> vector<8x[8]xi32>
    return %2 : vector<8x[8]xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2)>
module {
  func.func @contract_broadcast_non_unit_dim_reduction_with_permutation(%arg0: vector<8x4xi32>, %arg1: vector<8x4xi32>, %arg2: vector<8x8xi32>) -> vector<8x8xi32> {
    %0 = vector.broadcast %arg0 : vector<8x4xi32> to vector<2x8x4xi32>
    %1 = vector.broadcast %arg1 : vector<8x4xi32> to vector<2x8x4xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<2x8x4xi32>, vector<2x8x4xi32> into vector<8x8xi32>
    return %2 : vector<8x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
module {
  func.func @contract_broadcast_unit_dim_reduction_as_only_reduction(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: vector<8x8xi32>) -> vector<8x8xi32> {
    %0 = vector.broadcast %arg0 : vector<8xi32> to vector<1x8xi32>
    %1 = vector.broadcast %arg1 : vector<8xi32> to vector<1x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<1x8xi32>, vector<1x8xi32> into vector<8x8xi32>
    return %2 : vector<8x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1)>
module {
  func.func @contract_broadcast_dimension_would_go_unused_in_lhs_rhs(%arg0: vector<1x2xi32>, %arg1: vector<2xi32>, %arg2: vector<1xi32>) -> vector<1xi32> {
    %0 = vector.broadcast %arg1 : vector<2xi32> to vector<1x1x2xi32>
    %1 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %0, %arg2 : vector<1x2xi32>, vector<1x1x2xi32> into vector<1xi32>
    return %1 : vector<1xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @contract_broadcast_would_have_no_reduction_dim_pair(%arg0: vector<1xf32>, %arg1: vector<1xf32>, %arg2: vector<1xf32>) -> vector<1xf32> {
    %0 = vector.broadcast %arg1 : vector<1xf32> to vector<1x1xf32>
    %1 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %0, %arg2 : vector<1xf32>, vector<1x1xf32> into vector<1xf32>
    return %1 : vector<1xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @contract_result_transpose(%arg0: vector<2x4x4xf32>, %arg1: vector<4x8xf32>, %arg2: vector<2x8x4xf32>) -> vector<2x8x4xf32> {
    %0 = vector.transpose %arg2, [0, 2, 1] : vector<2x8x4xf32> to vector<2x4x8xf32>
    %1 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %0 : vector<2x4x4xf32>, vector<4x8xf32> into vector<2x4x8xf32>
    %2 = vector.transpose %1, [0, 2, 1] : vector<2x4x8xf32> to vector<2x8x4xf32>
    return %2 : vector<2x8x4xf32>
  }
}

