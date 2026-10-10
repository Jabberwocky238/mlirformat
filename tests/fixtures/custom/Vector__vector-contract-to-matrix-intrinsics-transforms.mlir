#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul(%arg0: vector<2x4xf32>, %arg1: vector<4x3xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x4xf32>, vector<4x3xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @matmul_scalable(%arg0: vector<2x4xf32>, %arg1: vector<4x[3]xf32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x4xf32>, vector<4x[3]xf32> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
}

