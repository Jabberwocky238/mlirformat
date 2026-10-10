#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @matvec_mk_k_m(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_matvec_mk_k_m(%arg0: vector<2x3xf32>, %arg1: vector<3xf32>, %arg2: vector<2xf32>, %arg3: vector<2x3xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x3xf32>, vector<3xf32> into vector<2xf32> } : vector<2x3xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_matvec_mk_k_m_scalable_parallel_dim(%arg0: vector<[2]x3xf32>, %arg1: vector<3xf32>, %arg2: vector<[2]xf32>, %arg3: vector<[2]x3xi1>) -> vector<[2]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<[2]x3xf32>, vector<3xf32> into vector<[2]xf32> } : vector<[2]x3xi1> -> vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
  func.func @matvec_mk_k_m_max(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<maxnumf>} %arg0, %arg1, %arg2 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_matvec_mk_k_m_max(%arg0: vector<2x3xf32>, %arg1: vector<3xf32>, %arg2: vector<2xf32>, %arg3: vector<2x3xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<maxnumf>} %arg0, %arg1, %arg2 : vector<2x3xf32>, vector<3xf32> into vector<2xf32> } : vector<2x3xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_matvec_mk_k_m_max_scalable_parallel_dim(%arg0: vector<[2]x3xf32>, %arg1: vector<3xf32>, %arg2: vector<[2]xf32>, %arg3: vector<[2]x3xi1>) -> vector<[2]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<maxnumf>} %arg0, %arg1, %arg2 : vector<[2]x3xf32>, vector<3xf32> into vector<[2]xf32> } : vector<[2]x3xi1> -> vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
  func.func @matvec_km_k_m(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map3, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_matvec_km_k_m(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>, %arg2: vector<4xf32>, %arg3: vector<4x2xi1>) -> vector<4xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map3, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x4xf32>, vector<2xf32> into vector<4xf32> } : vector<4x2xi1> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_matvec_km_k_m_scalable_parallel_dim(%arg0: vector<2x[4]xf32>, %arg1: vector<2xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]x2xi1>) -> vector<[4]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map3, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x[4]xf32>, vector<2xf32> into vector<[4]xf32> } : vector<[4]x2xi1> -> vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @matvec_k_mk_m(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map1, #map, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_matvec_k_mk_m(%arg0: vector<4x2xf32>, %arg1: vector<2xf32>, %arg2: vector<4xf32>, %arg3: vector<4x2xi1>) -> vector<4xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map1, #map, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<4x2xf32> into vector<4xf32> } : vector<4x2xi1> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_matvec_k_mk_m_scalable_parallel_dim(%arg0: vector<[4]x2xf32>, %arg1: vector<2xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]x2xi1>) -> vector<[4]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map1, #map, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<[4]x2xf32> into vector<[4]xf32> } : vector<[4]x2xi1> -> vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @matvec_k_km_m(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map1, #map3, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_matvec_k_km_m_scalable_parallel_dim(%arg0: vector<2x[4]xf32>, %arg1: vector<2xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]x2xi1>) -> vector<[4]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map1, #map3, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x[4]xf32> into vector<[4]xf32> } : vector<[4]x2xi1> -> vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @masked_matvec_k_km_m(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>, %arg2: vector<4xf32>, %arg3: vector<4x2xi1>) -> vector<4xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map1, #map3, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x4xf32> into vector<4xf32> } : vector<4x2xi1> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @tmatvec_mk_k_m(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map3, #map2, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_tmatvec_mk_k_m(%arg0: vector<4x2xf32>, %arg1: vector<2xf32>, %arg2: vector<4xf32>, %arg3: vector<2x4xi1>) -> vector<4xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map3, #map2, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x2xf32>, vector<2xf32> into vector<4xf32> } : vector<2x4xi1> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_tmatvec_mk_k_m_scalable_parallel_dim(%arg0: vector<[4]x2xf32>, %arg1: vector<2xf32>, %arg2: vector<[4]xf32>, %arg3: vector<2x[4]xi1>) -> vector<[4]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map3, #map2, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<[4]x2xf32>, vector<2xf32> into vector<[4]xf32> } : vector<2x[4]xi1> -> vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @tmatvec_km_k_m(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map2, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_tmatvec_km_k_m(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>, %arg2: vector<4xf32>, %arg3: vector<2x4xi1>) -> vector<4xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map2, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x4xf32>, vector<2xf32> into vector<4xf32> } : vector<2x4xi1> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_tmatvec_km_k_m_scalable_parallel_dim(%arg0: vector<2x[4]xf32>, %arg1: vector<2xf32>, %arg2: vector<[4]xf32>, %arg3: vector<2x[4]xi1>) -> vector<[4]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map2, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x[4]xf32>, vector<2xf32> into vector<[4]xf32> } : vector<2x[4]xi1> -> vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @tmatvec_k_mk_m(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map2, #map3, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_tmatvec_k_mk_m(%arg0: vector<4x2xf32>, %arg1: vector<2xf32>, %arg2: vector<4xf32>, %arg3: vector<2x4xi1>) -> vector<4xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map2, #map3, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<4x2xf32> into vector<4xf32> } : vector<2x4xi1> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_tmatvec_k_mk_m_scalable_parallel_dim(%arg0: vector<[4]x2xf32>, %arg1: vector<2xf32>, %arg2: vector<[4]xf32>, %arg3: vector<2x[4]xi1>) -> vector<[4]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map2, #map3, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<[4]x2xf32> into vector<[4]xf32> } : vector<2x[4]xi1> -> vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @tmatvec_m_mk_k(%arg0: vector<2x2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.contract {indexing_maps = [#map2, #map, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @masked_tmatvec_k_km_m(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>, %arg2: vector<4xf32>, %arg3: vector<2x4xi1>) -> vector<4xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map2, #map, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x4xf32> into vector<4xf32> } : vector<2x4xi1> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_tmatvec_k_km_m_scalable_parallel_dim(%arg0: vector<2x[4]xf32>, %arg1: vector<2xf32>, %arg2: vector<[4]xf32>, %arg3: vector<2x[4]xi1>) -> vector<[4]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map2, #map, #map1], iterator_types = ["reduction", "parallel"], kind = #vector.kind<add>} %arg1, %arg0, %arg2 : vector<2xf32>, vector<2x[4]xf32> into vector<[4]xf32> } : vector<2x[4]xi1> -> vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @masked_extract_contract2_scalable_reduction_dim(%arg0: vector<[2]x[3]xf32>, %arg1: vector<[3]xf32>, %arg2: vector<[2]xf32>, %arg3: vector<[2]x[3]xi1>) -> vector<[2]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<[2]x[3]xf32>, vector<[3]xf32> into vector<[2]xf32> } : vector<[2]x[3]xi1> -> vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_contraction
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

