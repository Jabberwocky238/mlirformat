#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @fold_arith_extf_into_contract(%arg0: vector<64x64xf16>, %arg1: vector<64x64xf16>, %arg2: vector<64x64xf32>) -> vector<64x64xf32> {
    %0 = arith.extf %arg0 : vector<64x64xf16> to vector<64x64xf32>
    %1 = arith.extf %arg1 : vector<64x64xf16> to vector<64x64xf32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<64x64xf32>, vector<64x64xf32> into vector<64x64xf32>
    return %2 : vector<64x64xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @fold_arith_extf_into_contract_scalable(%arg0: vector<[64]x64xf16>, %arg1: vector<64x64xf16>, %arg2: vector<[64]x64xf32>) -> vector<[64]x64xf32> {
    %0 = arith.extf %arg0 : vector<[64]x64xf16> to vector<[64]x64xf32>
    %1 = arith.extf %arg1 : vector<64x64xf16> to vector<64x64xf32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<[64]x64xf32>, vector<64x64xf32> into vector<[64]x64xf32>
    return %2 : vector<[64]x64xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @fold_arith_extsi_into_contract(%arg0: vector<64x64xi8>, %arg1: vector<64x64xi8>, %arg2: vector<64x64xi32>) -> vector<64x64xi32> {
    %0 = arith.extsi %arg0 : vector<64x64xi8> to vector<64x64xi32>
    %1 = arith.extsi %arg1 : vector<64x64xi8> to vector<64x64xi32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<64x64xi32>, vector<64x64xi32> into vector<64x64xi32>
    return %2 : vector<64x64xi32>
  }
}

