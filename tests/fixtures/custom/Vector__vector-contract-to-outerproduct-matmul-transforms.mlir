#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0)>
#map5 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @matmul(%arg0: vector<2x4xf32>, %arg1: vector<4x3xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x4xf32>, vector<4x3xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @matmul_scalable(%arg0: vector<2x4xf32>, %arg1: vector<4x[3]xf32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x4xf32>, vector<4x[3]xf32> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
  func.func @masked_matmul(%arg0: vector<3x5xf32>, %arg1: vector<5x7xf32>, %arg2: vector<3x7xf32>, %arg3: vector<3x7x5xi1>) -> vector<3x7xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<3x5xf32>, vector<5x7xf32> into vector<3x7xf32> } : vector<3x7x5xi1> -> vector<3x7xf32>
    return %0 : vector<3x7xf32>
  }
  func.func @masked_matmul_scalable(%arg0: vector<3x5xf32>, %arg1: vector<5x[7]xf32>, %arg2: vector<3x[7]xf32>, %arg3: vector<3x[7]x5xi1>) -> vector<3x[7]xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<3x5xf32>, vector<5x[7]xf32> into vector<3x[7]xf32> } : vector<3x[7]x5xi1> -> vector<3x[7]xf32>
    return %0 : vector<3x[7]xf32>
  }
  func.func @matmul_mixed(%arg0: vector<2x1xf16>, %arg1: vector<1x3xf16>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x1xf16>, vector<1x3xf16> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @matmul_mixed_scalable(%arg0: vector<2x1xf16>, %arg1: vector<1x[3]xf16>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x1xf16>, vector<1x[3]xf16> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
  func.func @matmul_1(%arg0: vector<2x1xf32>, %arg1: vector<3x1xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map3, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x1xf32>, vector<3x1xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @matmul_1_scalable(%arg0: vector<2x1xf32>, %arg1: vector<[3]x1xf32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map3, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x1xf32>, vector<[3]x1xf32> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
  func.func @matmul_2(%arg0: vector<1x2xf32>, %arg1: vector<1x3xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.contract {indexing_maps = [#map4, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x2xf32>, vector<1x3xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @matmul_2_scalable(%arg0: vector<1x2xf32>, %arg1: vector<1x[3]xf32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.contract {indexing_maps = [#map4, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x2xf32>, vector<1x[3]xf32> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
  func.func @matmul_3(%arg0: vector<1x2xf32>, %arg1: vector<3x1xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.contract {indexing_maps = [#map4, #map3, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x2xf32>, vector<3x1xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @matmul_3_scalable(%arg0: vector<1x2xf32>, %arg1: vector<[3]x1xf32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.contract {indexing_maps = [#map4, #map3, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x2xf32>, vector<[3]x1xf32> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
  func.func @matmul_4(%arg0: vector<2x1xf32>, %arg1: vector<1x3xf32>, %arg2: vector<3x2xf32>) -> vector<3x2xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map5], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x1xf32>, vector<1x3xf32> into vector<3x2xf32>
    return %0 : vector<3x2xf32>
  }
  func.func @matmul_4_scalable(%arg0: vector<[2]x1xf32>, %arg1: vector<1x3xf32>, %arg2: vector<3x[2]xf32>) -> vector<3x[2]xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map5], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<[2]x1xf32>, vector<1x3xf32> into vector<3x[2]xf32>
    return %0 : vector<3x[2]xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_contraction
      } : !transform.any_op
      transform.yield 
    }
  }
}

