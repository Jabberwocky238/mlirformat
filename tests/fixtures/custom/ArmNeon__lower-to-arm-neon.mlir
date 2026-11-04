#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_mixed_types(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi4>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = arith.extsi %arg0 : vector<2x8xi8> to vector<2x8xi32>
    %1 = arith.extsi %arg1 : vector<2x8xi4> to vector<2x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<2x8xi32>, vector<2x8xi32> into vector<2x2xi32>
    return %2 : vector<2x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_implicit_extsi(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x8xi8>, vector<2x8xi8> into vector<2x2xi32>
    return %0 : vector<2x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_signed_signed(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = arith.extsi %arg0 : vector<2x8xi8> to vector<2x8xi32>
    %1 = arith.extsi %arg1 : vector<2x8xi8> to vector<2x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<2x8xi32>, vector<2x8xi32> into vector<2x2xi32>
    return %2 : vector<2x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_unsigned_signed(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = arith.extui %arg0 : vector<2x8xi8> to vector<2x8xi32>
    %1 = arith.extsi %arg1 : vector<2x8xi8> to vector<2x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<2x8xi32>, vector<2x8xi32> into vector<2x2xi32>
    return %2 : vector<2x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_unsigned_unsigned(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = arith.extui %arg0 : vector<2x8xi8> to vector<2x8xi32>
    %1 = arith.extui %arg1 : vector<2x8xi8> to vector<2x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<2x8xi32>, vector<2x8xi32> into vector<2x2xi32>
    return %2 : vector<2x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_signed_unsigned(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = arith.extsi %arg0 : vector<2x8xi8> to vector<2x8xi32>
    %1 = arith.extui %arg1 : vector<2x8xi8> to vector<2x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<2x8xi32>, vector<2x8xi32> into vector<2x2xi32>
    return %2 : vector<2x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_unroll(%arg0: vector<4x8xi8>, %arg1: vector<4x8xi8>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = arith.extsi %arg0 : vector<4x8xi8> to vector<4x8xi32>
    %1 = arith.extsi %arg1 : vector<4x8xi8> to vector<4x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<4x8xi32>, vector<4x8xi32> into vector<4x4xi32>
    return %2 : vector<4x4xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_mixed_unroll(%arg0: vector<4x8xi8>, %arg1: vector<2x8xi4>, %arg2: vector<4x2xi32>) -> vector<4x2xi32> {
    %0 = arith.extsi %arg0 : vector<4x8xi8> to vector<4x8xi32>
    %1 = arith.extsi %arg1 : vector<2x8xi4> to vector<2x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<4x8xi32>, vector<2x8xi32> into vector<4x2xi32>
    return %2 : vector<4x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_unroll_incompatible_shape(%arg0: vector<4x12xi8>, %arg1: vector<4x12xi8>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = arith.extsi %arg0 : vector<4x12xi8> to vector<4x12xi32>
    %1 = arith.extsi %arg1 : vector<4x12xi8> to vector<4x12xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<4x12xi32>, vector<4x12xi32> into vector<4x4xi32>
    return %2 : vector<4x4xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @vector_arm_neon_vecmat_unroll(%arg0: vector<8xi8>, %arg1: vector<8x8xi8>, %arg2: vector<8xi32>) -> vector<8xi32> {
    %0 = arith.extsi %arg0 : vector<8xi8> to vector<8xi32>
    %1 = arith.extsi %arg1 : vector<8x8xi8> to vector<8x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<8xi32>, vector<8x8xi32> into vector<8xi32>
    return %2 : vector<8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_vecmat_unroll_leading_dim(%arg0: vector<1x8xi8>, %arg1: vector<8x8xi8>, %arg2: vector<1x8xi32>) -> vector<1x8xi32> {
    %0 = arith.extsi %arg0 : vector<1x8xi8> to vector<1x8xi32>
    %1 = arith.extsi %arg1 : vector<8x8xi8> to vector<8x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<1x8xi32>, vector<8x8xi32> into vector<1x8xi32>
    return %2 : vector<1x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @vector_arm_neon_matvec(%arg0: vector<8x8xi8>, %arg1: vector<8xi8>, %arg2: vector<8xi32>) -> vector<8xi32> {
    %0 = arith.extsi %arg1 : vector<8xi8> to vector<8xi32>
    %1 = arith.extsi %arg0 : vector<8x8xi8> to vector<8x8xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %1, %0, %arg2 : vector<8x8xi32>, vector<8xi32> into vector<8xi32>
    return %2 : vector<8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_k_unroll(%arg0: vector<2x16xi8>, %arg1: vector<2x16xi4>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = arith.extsi %arg0 : vector<2x16xi8> to vector<2x16xi32>
    %1 = arith.extsi %arg1 : vector<2x16xi4> to vector<2x16xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<2x16xi32>, vector<2x16xi32> into vector<2x2xi32>
    return %2 : vector<2x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_k_unroll_vecmat(%arg0: vector<1x32xi8>, %arg1: vector<2x32xi4>, %arg2: vector<1x2xi32>) -> vector<1x2xi32> {
    %0 = arith.extsi %arg0 : vector<1x32xi8> to vector<1x32xi32>
    %1 = arith.extsi %arg1 : vector<2x32xi4> to vector<2x32xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<1x32xi32>, vector<2x32xi32> into vector<1x2xi32>
    return %2 : vector<1x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_arm_neon_mnk_unroll(%arg0: vector<4x16xi8>, %arg1: vector<4x16xi8>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = arith.extsi %arg0 : vector<4x16xi8> to vector<4x16xi32>
    %1 = arith.extsi %arg1 : vector<4x16xi8> to vector<4x16xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<4x16xi32>, vector<4x16xi32> into vector<4x4xi32>
    return %2 : vector<4x4xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.arm_neon.vector_contract_to_i8mm
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

