#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @transfers_static_dims(%arg0: memref<64x32x16x2xf16>, %arg1: memref<64x16x32x2xf16>, %arg2: memref<64x64xf32>, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg3, %arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<64x32x16x2xf16>, vector<4x8x2xf16>
    %1 = vector.transfer_read %arg1[%arg3, %arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<64x16x32x2xf16>, vector<8x16x2xf16>
    %2 = vector.transfer_read %arg2[%arg3, %arg3], %cst_0 {in_bounds = [true, true]} : memref<64x64xf32>, vector<4x16xf32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    vector.transfer_write %3, %arg2[%arg3, %arg3] {in_bounds = [true, true]} : vector<4x16xf32>, memref<64x64xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @transfers_dynamic_outer_dims(%arg0: memref<?x?x16x2xf16>, %arg1: memref<?x?x32x2xf16>, %arg2: memref<?x64xf32>, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg3, %arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<?x?x16x2xf16>, vector<4x8x2xf16>
    %1 = vector.transfer_read %arg1[%arg3, %arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<?x?x32x2xf16>, vector<8x16x2xf16>
    %2 = vector.transfer_read %arg2[%arg3, %arg3], %cst_0 {in_bounds = [true, true]} : memref<?x64xf32>, vector<4x16xf32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    vector.transfer_write %3, %arg2[%arg3, %arg3] {in_bounds = [true, true]} : vector<4x16xf32>, memref<?x64xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @transfer_read_multiple_users(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: index) -> vector<4x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg3, %arg3], %cst {in_bounds = [true, true]} : memref<64x64xf32>, vector<4x16xf32>
    %1 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg1, %arg2, %0 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    %2 = arith.mulf %0, %1 : vector<4x16xf32>
    return %2 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_contract_multiple_users(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: vector<4x16xf32>, %arg4: index) -> vector<4x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg1, %arg2, %arg3 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    vector.transfer_write %0, %arg0[%arg4, %arg4] {in_bounds = [true, true]} : vector<4x16xf32>, memref<64x64xf32>
    %1 = arith.mulf %arg3, %0 : vector<4x16xf32>
    return %1 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_out_of_bounds(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: vector<4x16xf32>, %arg4: index) {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg1, %arg2, %arg3 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    vector.transfer_write %0, %arg0[%arg4, %arg4] {in_bounds = [true, false]} : vector<4x16xf32>, memref<64x64xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @negative_non_identity_map(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: vector<4x16xf32>, %arg4: index) {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg1, %arg2, %arg3 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    vector.transfer_write %0, %arg0[%arg4, %arg4] {in_bounds = [true, true], permutation_map = #map3} : vector<4x16xf32>, memref<64x64xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_non_contiguous_row(%arg0: memref<8x128x2xf16, strided<[256, 4, 1]>>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>, %arg3: index) -> vector<4x16xf32> {
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<8x128x2xf16, strided<[256, 4, 1]>>, vector<4x8x2xf16>
    %1 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %0, %arg1, %arg2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    return %1 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0) -> (0, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_1D_buffer(%arg0: memref<512xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: index) -> vector<4x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg3], %cst {in_bounds = [true, true], permutation_map = #map} : memref<512xf32>, vector<4x16xf32>
    %1 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg1, %arg2, %0 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    return %1 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_dynamic_shapes(%arg0: memref<?x?x?x2xf16>, %arg1: memref<?x?x2xf16>, %arg2: memref<?x?xf32>, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg3, %arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<?x?x?x2xf16>, vector<4x8x2xf16>
    %1 = vector.transfer_read %arg1[%arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<?x?x2xf16>, vector<8x16x2xf16>
    %2 = vector.transfer_read %arg2[%arg3, %arg3], %cst_0 {in_bounds = [true, true]} : memref<?x?xf32>, vector<4x16xf32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    vector.transfer_write %3, %arg2[%arg3, %arg3] {in_bounds = [true, true]} : vector<4x16xf32>, memref<?x?xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_invalid_buffer_row_shape(%arg0: memref<5x2x4x4xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: index) -> vector<4x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg3, %arg3, %arg3, %arg3], %cst {in_bounds = [true, true]} : memref<5x2x4x4xf32>, vector<4x16xf32>
    %1 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %arg1, %arg2, %0 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    return %1 : vector<4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @negative_buffer_non_packed_source_shape(%arg0: memref<8x64x64xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>, %arg3: index) -> vector<4x16xf32> {
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%arg3, %arg3, %arg3], %cst {in_bounds = [true, true, true]} : memref<8x64x64xf16>, vector<4x8x2xf16>
    %1 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"], kind = #vector.kind<add>} %0, %arg1, %arg2 : vector<4x8x2xf16>, vector<8x16x2xf16> into vector<4x16xf32>
    return %1 : vector<4x16xf32>
  }
}

