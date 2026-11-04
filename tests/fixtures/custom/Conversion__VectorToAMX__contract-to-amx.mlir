#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @contract_vnni_f16(%arg0: vector<4x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>) -> vector<4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    return %0 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @contract_vnni_bf16(%arg0: vector<4x8x2xbf16>, %arg1: vector<8x16x2xbf16>, %arg2: vector<4x16xf32>) -> vector<4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x8x2xbf16>, vector<8x16x2xbf16> into vector<4x16xf32>
    return %0 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @contract_vnni_i8(%arg0: vector<4x16x4xi8>, %arg1: vector<16x8x4xi8>, %arg2: vector<4x8xi32>) -> vector<4x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x16x4xi8>, vector<16x8x4xi8> into vector<4x8xi32>
    return %0 : vector<4x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
module {
  func.func @contract_shuffled_iterators(%arg0: vector<4x16x4xi8>, %arg1: vector<16x8x4xi8>, %arg2: vector<4x8xi32>) -> vector<4x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "reduction", "parallel"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x16x4xi8>, vector<16x8x4xi8> into vector<4x8xi32>
    return %0 : vector<4x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_invalid_kind(%arg0: vector<4x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>) -> vector<4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<mul>} %arg0, %arg1, %arg2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    return %0 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> ()>
module {
  func.func @negative_non_vector_acc(%arg0: vector<4x8x2xf16>, %arg1: vector<8x4x2xf16>, %arg2: f32) -> f32 {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x8x2xf16>, vector<8x4x2xf16> into f32
    return %0 : f32
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_invalid_operand_types(%arg0: vector<4x8x2xf32>, %arg1: vector<8x16x2xf32>, %arg2: vector<4x16xf32>) -> vector<4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x8x2xf32>, vector<8x16x2xf32> into vector<4x16xf32>
    return %0 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_non_packed_layout(%arg0: vector<4x16xf16>, %arg1: vector<16x16xf16>, %arg2: vector<4x16xf32>) -> vector<4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x16xf16>, vector<16x16xf16> into vector<4x16xf32>
    return %0 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_invalid_vnni_factor(%arg0: vector<4x2x4xf16>, %arg1: vector<2x2x4xf16>, %arg2: vector<4x2xf32>) -> vector<4x2xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x2x4xf16>, vector<2x2x4xf16> into vector<4x2xf32>
    return %0 : vector<4x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
module {
  func.func @negative_invalid_operands_shapes(%arg0: vector<1x4x8x2xf16>, %arg1: vector<1x8x16x2xf16>, %arg2: vector<1x4x16xf32>) -> vector<1x4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x4x8x2xf16>, vector<1x8x16x2xf16> into vector<1x4x16xf32>
    return %0 : vector<1x4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_too_many_rows(%arg0: vector<32x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<32x16xf32>) -> vector<32x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<32x8x2xf16>, vector<8x16x2xf16> into vector<32x16xf32>
    return %0 : vector<32x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_too_wide_rows(%arg0: vector<4x32x2xf16>, %arg1: vector<32x16x2xf16>, %arg2: vector<4x16xf32>) -> vector<4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x32x2xf16>, vector<32x16x2xf16> into vector<4x16xf32>
    return %0 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_input_dim_permutation(%arg0: vector<2x2x2xf16>, %arg1: vector<2x2x2xf16>, %arg2: vector<2x2xf32>) -> vector<2x2xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x2x2xf16>, vector<2x2x2xf16> into vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d0)>
module {
  func.func @negative_output_dim_permutation(%arg0: vector<4x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<16x4xf32>) -> vector<16x4xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<16x4xf32>
    return %0 : vector<16x4xf32>
  }
}

