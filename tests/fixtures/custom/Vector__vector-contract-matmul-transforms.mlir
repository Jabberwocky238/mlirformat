#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d0)>
#map7 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @not_matmul(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: f32) -> f32 {
    %0 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4xf32>, vector<4xf32> into f32
    return %0 : f32
  }
  func.func @matmul_mk_nk_mn_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_mk_kn_mn_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map2, #map5, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_mk_kn_mn_8x16xi8_extsi_i32(%arg0: vector<8x4xi8>, %arg1: vector<4x16xi8>, %arg2: vector<8x16xi32>) -> vector<8x16xi32> {
    %0 = arith.extsi %arg0 : vector<8x4xi8> to vector<8x4xi32>
    %1 = arith.extsi %arg1 : vector<4x16xi8> to vector<4x16xi32>
    %2 = vector.contract {indexing_maps = [#map2, #map5, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<8x4xi32>, vector<4x16xi32> into vector<8x16xi32>
    return %2 : vector<8x16xi32>
  }
  func.func @matmul_mk_kn_mn_4x16xi32(%arg0: vector<4x16xi32>, %arg1: vector<16x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map2, #map5, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x16xi32>, vector<16x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_mk_kn_mn_8x16xi8_extui_i32(%arg0: vector<8x4xi8>, %arg1: vector<4x16xi8>, %arg2: vector<8x16xi32>) -> vector<8x16xi32> {
    %0 = arith.extui %arg0 : vector<8x4xi8> to vector<8x4xi32>
    %1 = arith.extui %arg1 : vector<4x16xi8> to vector<4x16xi32>
    %2 = vector.contract {indexing_maps = [#map2, #map5, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<8x4xi32>, vector<4x16xi32> into vector<8x16xi32>
    return %2 : vector<8x16xi32>
  }
  func.func @matmul_km_nk_mn_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map6, #map3, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_km_kn_mn_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map6, #map5, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_km_kn_mn_8x16xi8_mixed_ext_i32(%arg0: vector<4x8xi8>, %arg1: vector<4x16xi8>, %arg2: vector<8x16xi32>) -> vector<8x16xi32> {
    %0 = arith.extsi %arg0 : vector<4x8xi8> to vector<4x8xi32>
    %1 = arith.extui %arg1 : vector<4x16xi8> to vector<4x16xi32>
    %2 = vector.contract {indexing_maps = [#map6, #map5, #map4], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<4x8xi32>, vector<4x16xi32> into vector<8x16xi32>
    return %2 : vector<8x16xi32>
  }
  func.func @matmul_mk_nk_nm_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map2, #map3, #map7], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_km_kn_nm_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map6, #map5, #map7], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_mk_kn_nm_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map2, #map5, #map7], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
  func.func @matmul_km_nk_nm_4x4xi32(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>) -> vector<4x4xi32> {
    %0 = vector.contract {indexing_maps = [#map6, #map3, #map7], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x4xi32>, vector<4x4xi32> into vector<4x4xi32>
    return %0 : vector<4x4xi32>
  }
}

