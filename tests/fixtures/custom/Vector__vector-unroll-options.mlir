#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @vector_contract_f32(%arg0: vector<8x4xf32>, %arg1: vector<8x4xf32>, %arg2: vector<8x8xf32>) -> vector<8x8xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<8x4xf32>, vector<8x4xf32> into vector<8x8xf32>
    return %0 : vector<8x8xf32>
  }
  func.func @vector_contract_f16(%arg0: vector<8x8xf16>, %arg1: vector<8x8xf16>, %arg2: vector<8x8xf16>) -> vector<8x8xf16> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<8x8xf16>, vector<8x8xf16> into vector<8x8xf16>
    return %0 : vector<8x8xf16>
  }
  func.func @vector_fma(%arg0: vector<4x4xf32>, %arg1: vector<4x4xf32>, %arg2: vector<4x4xf32>) -> vector<4x4xf32> {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
  func.func @vector_fma_3d(%arg0: vector<3x2x2xf32>) -> vector<3x2x2xf32> {
    %0 = vector.fma %arg0, %arg0, %arg0 : vector<3x2x2xf32>
    return %0 : vector<3x2x2xf32>
  }
  func.func @vector_multi_reduction(%arg0: vector<4x6xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [1] : vector<4x6xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @negative_vector_multi_reduction(%arg0: vector<4x2xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0, 1] : vector<4x2xf32> to f32
    return %0 : f32
  }
  func.func @vector_reduction(%arg0: vector<8xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<8xf32> into f32
    return %0 : f32
  }
  func.func @vector_transpose(%arg0: vector<2x4x3x8xf32>) -> vector<2x3x8x4xf32> {
    %0 = vector.transpose %arg0, [0, 2, 3, 1] : vector<2x4x3x8xf32> to vector<2x3x8x4xf32>
    return %0 : vector<2x3x8x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @vector_contract_batched(%arg0: vector<8x8x4xf32>, %arg1: vector<8x8x4xf32>, %arg2: vector<8x8x8xf32>) -> vector<8x8x8xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<8x8x4xf32>, vector<8x8x4xf32> into vector<8x8x8xf32>
    return %0 : vector<8x8x8xf32>
  }
  func.func @vector_broadcast(%arg0: vector<4xf32>) -> vector<4x4xf32> {
    %0 = vector.broadcast %arg0 : vector<4xf32> to vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
  func.func @vector_broadcast_with_leading_unit_dim(%arg0: vector<1x4xf32>) -> vector<4x4xf32> {
    %0 = vector.broadcast %arg0 : vector<1x4xf32> to vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
  func.func @vector_broadcast_with_tailing_unit_dim(%arg0: vector<4x1xf32>) -> vector<4x4xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1xf32> to vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
  func.func @vector_load_2D(%arg0: memref<4x4xf16>) -> vector<4x4xf16> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<4x4xf16>, vector<4x4xf16>
    return %0 : vector<4x4xf16>
  }
  func.func @vector_store_2D(%arg0: memref<4x4xf16>, %arg1: vector<4x4xf16>) {
    %c0 = arith.constant 0 : index
    vector.store %arg1, %arg0[%c0, %c0] : memref<4x4xf16>, vector<4x4xf16>
    return
  }
  func.func @vector_step() -> vector<32xindex> {
    %0 = vector.step : vector<32xindex>
    return %0 : vector<32xindex>
  }
  func.func @elementwise_3D_to_2D(%arg0: vector<2x2x2xf32>, %arg1: vector<2x2x2xf32>) -> vector<2x2x2xf32> {
    %0 = arith.addf %arg0, %arg1 : vector<2x2x2xf32>
    return %0 : vector<2x2x2xf32>
  }
  func.func @elementwise_4D_to_2D(%arg0: vector<2x2x2x2xf32>, %arg1: vector<2x2x2x2xf32>) -> vector<2x2x2x2xf32> {
    %0 = arith.addf %arg0, %arg1 : vector<2x2x2x2xf32>
    return %0 : vector<2x2x2x2xf32>
  }
  func.func @vector_create_mask(%arg0: index, %arg1: index) -> vector<16x16xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<16x16xi1>
    return %0 : vector<16x16xi1>
  }
  func.func @vector_create_mask_constant_dim_sizes() -> vector<16x16xi1> {
    %c16 = arith.constant 16 : index
    %0 = vector.create_mask %c16, %c16 : vector<16x16xi1>
    return %0 : vector<16x16xi1>
  }
  func.func @vector_constant_mask() -> vector<16x16xi1> {
    %0 = vector.constant_mask [12, 10] : vector<16x16xi1>
    return %0 : vector<16x16xi1>
  }
  func.func @shape_cast_1D(%arg0: vector<16xf32>) -> vector<2x2x4xf32> {
    %0 = vector.shape_cast %arg0 : vector<16xf32> to vector<2x2x4xf32>
    return %0 : vector<2x2x4xf32>
  }
  func.func @shape_cast_2D(%arg0: vector<8x2xf32>) -> vector<4x4xf32> {
    %0 = vector.shape_cast %arg0 : vector<8x2xf32> to vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
  func.func @negative_shape_cast_target_shape_not_contiguous(%arg0: vector<64xf32>) -> vector<8x8xf32> {
    %0 = vector.shape_cast %arg0 : vector<64xf32> to vector<8x8xf32>
    return %0 : vector<8x8xf32>
  }
  func.func @negative_shape_cast_source_shape_not_determinable(%arg0: vector<8x3xf32>) -> vector<6x4xf32> {
    %0 = vector.shape_cast %arg0 : vector<8x3xf32> to vector<6x4xf32>
    return %0 : vector<6x4xf32>
  }
  func.func @shape_cast_leading_unit_dim(%arg0: vector<32xf32>) -> vector<1x32xf32> {
    %0 = vector.shape_cast %arg0 : vector<32xf32> to vector<1x32xf32>
    return %0 : vector<1x32xf32>
  }
}

