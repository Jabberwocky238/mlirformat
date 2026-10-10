#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @cast_away_contraction_leading_one_dims(%arg0: vector<1x16x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x16x16xf32>) -> vector<1x16x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x16x8xf32>, vector<1x8x16xf32> into vector<1x16x16xf32>
    return %0 : vector<1x16x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @cast_away_contraction_leading_one_dim_under_const_mask(%arg0: vector<1x16x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x16x16xf32>) -> vector<1x16x16xf32> {
    %0 = vector.constant_mask [1, 15, 15, 8] : vector<1x16x16x8xi1>
    %1 = vector.mask %0 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x16x8xf32>, vector<1x8x16xf32> into vector<1x16x16xf32> } : vector<1x16x16x8xi1> -> vector<1x16x16xf32>
    return %1 : vector<1x16x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @cast_away_contraction_leading_one_dim_under_mask(%arg0: vector<1x16x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x16x16xf32>, %arg3: vector<1x16x16x8xi1>) -> vector<1x16x16xf32> {
    %0 = vector.mask %arg3 { vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x16x8xf32>, vector<1x8x16xf32> into vector<1x16x16xf32> } : vector<1x16x16x8xi1> -> vector<1x16x16xf32>
    return %0 : vector<1x16x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @cast_away_contraction_leading_one_dims_transposeneeded(%arg0: vector<1x1x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x1x16xf32>) -> vector<1x1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<mul>} %arg0, %arg1, %arg2 : vector<1x1x8xf32>, vector<1x8x16xf32> into vector<1x1x16xf32>
    return %0 : vector<1x1x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, d0, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d3, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @cast_away_contraction_leading_one_dims_transposeneeded2(%arg0: vector<8x1x16xf32>, %arg1: vector<2x8x1xf32>, %arg2: vector<1x2x16xf32>) -> vector<1x2x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<8x1x16xf32>, vector<2x8x1xf32> into vector<1x2x16xf32>
    return %0 : vector<1x2x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3)>
module {
  func.func @cast_away_contraction_leading_one_dims_nonleadingunitdim_rank4(%arg0: vector<1x8x1x16xf32>, %arg1: vector<1x2x8x1xf32>, %arg2: vector<1x1x2x16xf32>) -> vector<1x1x2x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x8x1x16xf32>, vector<1x2x8x1xf32> into vector<1x1x2x16xf32>
    return %0 : vector<1x1x2x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d0, d2, d3)>
module {
  func.func @cast_away_contraction_leading_one_dims_nonleadingunitdim_rank4_acctranspose(%arg0: vector<1x8x1x16xf32>, %arg1: vector<1x2x8x1xf32>, %arg2: vector<1x1x2x16xf32>) -> vector<1x1x2x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x8x1x16xf32>, vector<1x2x8x1xf32> into vector<1x1x2x16xf32>
    return %0 : vector<1x1x2x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @cast_away_contraction_does_not_transpose_leading_unit_dims(%arg0: vector<1x1x8xi32>, %arg1: vector<1x8x8xi32>, %arg2: vector<1x8xi32>) -> vector<1x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x8xi32>, vector<1x8x8xi32> into vector<1x8xi32>
    return %0 : vector<1x8xi32>
  }
}

// -----
module {
  func.func @cast_away_extract_strided_slice_leading_one_dims(%arg0: vector<1x8x8xf16>) -> vector<1x1x8xf16> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [0, 4], sizes = [1, 1], strides = [1, 1]} : vector<1x8x8xf16> to vector<1x1x8xf16>
    return %0 : vector<1x1x8xf16>
  }
  func.func @cast_away_extract_strided_slice_leading_one_dims_scalable(%arg0: vector<1x8x[8]xf16>) -> vector<1x1x[8]xf16> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [0, 4], sizes = [1, 1], strides = [1, 1]} : vector<1x8x[8]xf16> to vector<1x1x[8]xf16>
    return %0 : vector<1x1x[8]xf16>
  }
  func.func @cast_away_insert_strided_slice_leading_one_dims(%arg0: vector<1x8xf16>, %arg1: vector<1x8x8xf16>) -> vector<1x8x8xf16> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [0, 0, 0], strides = [1, 1]} : vector<1x8xf16> into vector<1x8x8xf16>
    return %0 : vector<1x8x8xf16>
  }
  func.func @cast_away_insert_strided_slice_leading_one_dims_scalable(%arg0: vector<1x[8]xf16>, %arg1: vector<1x8x[8]xf16>) -> vector<1x8x[8]xf16> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [0, 0, 0], strides = [1, 1]} : vector<1x[8]xf16> into vector<1x8x[8]xf16>
    return %0 : vector<1x8x[8]xf16>
  }
  func.func @cast_away_insert_strided_slice_leading_one_dims_one_element(%arg0: vector<1x1xf16>, %arg1: vector<1x1x1xf16>) -> vector<1x1x1xf16> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [0, 0, 0], strides = [1, 1]} : vector<1x1xf16> into vector<1x1x1xf16>
    return %0 : vector<1x1x1xf16>
  }
  func.func @cast_away_insert_strided_slice_leading_one_dims_one_element_scalable(%arg0: vector<1x[1]xf16>, %arg1: vector<1x1x[1]xf16>) -> vector<1x1x[1]xf16> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [0, 0, 0], strides = [1, 1]} : vector<1x[1]xf16> into vector<1x1x[1]xf16>
    return %0 : vector<1x1x[1]xf16>
  }
  func.func @cast_away_transfer_read_leading_one_dims(%arg0: memref<1x4x8x16xf16>) -> vector<1x4xf16> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true]} : memref<1x4x8x16xf16>, vector<1x4xf16>
    return %0 : vector<1x4xf16>
  }
  func.func @cast_away_masked_transfer_read_leading_one_dims(%arg0: memref<1x4x8x16xf16>, %arg1: vector<1x4xi1>) -> vector<1x4xf16> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst, %arg1 {in_bounds = [true, true]} : memref<1x4x8x16xf16>, vector<1x4xf16>
    return %0 : vector<1x4xf16>
  }
  func.func @cast_away_transfer_read_leading_one_dims_one_element(%arg0: memref<1x1x1x1xf16>) -> vector<1x1xf16> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true]} : memref<1x1x1x1xf16>, vector<1x1xf16>
    return %0 : vector<1x1xf16>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
module {
  func.func @cast_away_nontrivial_map_masked_transfer_read(%arg0: memref<1x4x8xf16>, %arg1: vector<1x4x1xi1>) -> vector<1x1x4xf16> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst, %arg1 {in_bounds = [true, true, true], permutation_map = #map} : memref<1x4x8xf16>, vector<1x1x4xf16>
    return %0 : vector<1x1x4xf16>
  }
}

// -----
module {
  func.func @not_insert_cast_fo4_transfer_read_under_mask(%arg0: memref<1x1x4xf16>) -> vector<1x4xf16> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.constant_mask [1, 3] : vector<1x4xi1>
    %1 = vector.mask %0 { vector.transfer_read %arg0[%c0, %c0, %c0], %cst {in_bounds = [true, true]} : memref<1x1x4xf16>, vector<1x4xf16> } : vector<1x4xi1> -> vector<1x4xf16>
    return %1 : vector<1x4xf16>
  }
}

// -----
module {
  func.func @cast_away_transfer_write_leading_one_dims(%arg0: memref<1x4x8x16xf16>, %arg1: vector<1x4xf16>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] {in_bounds = [true, true]} : vector<1x4xf16>, memref<1x4x8x16xf16>
    return
  }
  func.func @cast_away_masked_transfer_write_leading_one_dims(%arg0: memref<1x4x8x16xf16>, %arg1: vector<1x4xf16>, %arg2: vector<1x4xi1>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0], %arg2 {in_bounds = [true, true]} : vector<1x4xf16>, memref<1x4x8x16xf16>
    return
  }
  func.func @cast_away_transfer_write_leading_one_dims_one_element(%arg0: memref<1x1x1x1xf16>, %arg1: vector<1x1xf16>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] {in_bounds = [true, true]} : vector<1x1xf16>, memref<1x1x1x1xf16>
    return
  }
}

// -----
module {
  func.func @not_insert_cast_for_transfer_write_under_mask(%arg0: memref<1x1x4xf16>, %arg1: vector<1x4xf16>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 3] : vector<1x4xi1>
    vector.mask %0 { vector.transfer_write %arg1, %arg0[%c0, %c0, %c0] {in_bounds = [true, true]} : vector<1x4xf16>, memref<1x1x4xf16> } : vector<1x4xi1>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
module {
  func.func @cast_away_nontrivial_map_masked_transfer_write(%arg0: memref<1x4x8xf16>, %arg1: vector<1x1x4xf16>, %arg2: vector<1x4x1xi1>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0], %arg2 {in_bounds = [true, true, true], permutation_map = #map} : vector<1x1x4xf16>, memref<1x4x8xf16>
    return
  }
}

// -----
module {
  func.func @cast_away_elementwise_leading_one_dims(%arg0: vector<1x1x8xf32>, %arg1: f32, %arg2: vector<1x4xf32>, %arg3: vector<1x4xf32>, %arg4: i1) -> (vector<1x1x8xf32>, vector<1x4xi1>, vector<1x4xf32>, vector<1x4xf32>) {
    %0 = arith.addf %arg0, %arg0 : vector<1x1x8xf32>
    %1 = arith.cmpf ogt, %arg2, %arg3 : vector<1x4xf32>
    %2 = arith.select %1, %arg3, %arg2 : vector<1x4xi1>, vector<1x4xf32>
    %3 = arith.select %arg4, %arg3, %arg2 : vector<1x4xf32>
    return %0, %1, %2, %3 : vector<1x1x8xf32>, vector<1x4xi1>, vector<1x4xf32>, vector<1x4xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_scalar(%arg0: f32, %arg1: vector<1x1x4xf32>) -> vector<1x1x4xf32> {
    %0 = vector.insert %arg0, %arg1 [0, 0, 0] : f32 into vector<1x1x4xf32>
    return %0 : vector<1x1x4xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_scalar_scalable(%arg0: f32, %arg1: vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32> {
    %0 = vector.insert %arg0, %arg1 [0, 0, 0] : f32 into vector<1x1x[4]xf32>
    return %0 : vector<1x1x[4]xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_scalar_skip_scalable_dim(%arg0: f32, %arg1: vector<1x[1]x4xf32>) -> vector<1x[1]x4xf32> {
    %0 = vector.insert %arg0, %arg1 [0, 0, 0] : f32 into vector<1x[1]x4xf32>
    return %0 : vector<1x[1]x4xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_rank1(%arg0: vector<4xf32>, %arg1: vector<1x1x4xf32>) -> vector<1x1x4xf32> {
    %0 = vector.insert %arg0, %arg1 [0, 0] : vector<4xf32> into vector<1x1x4xf32>
    return %0 : vector<1x1x4xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_rank1_scalable(%arg0: vector<[4]xf32>, %arg1: vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32> {
    %0 = vector.insert %arg0, %arg1 [0, 0] : vector<[4]xf32> into vector<1x1x[4]xf32>
    return %0 : vector<1x1x[4]xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_rank2(%arg0: vector<1x4xf32>, %arg1: vector<1x1x4xf32>) -> vector<1x1x4xf32> {
    %0 = vector.insert %arg0, %arg1 [0] : vector<1x4xf32> into vector<1x1x4xf32>
    return %0 : vector<1x1x4xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_rank2_scalable(%arg0: vector<1x[4]xf32>, %arg1: vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32> {
    %0 = vector.insert %arg0, %arg1 [0] : vector<1x[4]xf32> into vector<1x1x[4]xf32>
    return %0 : vector<1x1x[4]xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_rank2_one_dest(%arg0: vector<1x4xf32>, %arg1: vector<1x2x1x4xf32>) -> vector<1x2x1x4xf32> {
    %0 = vector.insert %arg0, %arg1 [0, 1] : vector<1x4xf32> into vector<1x2x1x4xf32>
    return %0 : vector<1x2x1x4xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_rank2_one_dest_scalable(%arg0: vector<1x[4]xf32>, %arg1: vector<1x2x1x[4]xf32>) -> vector<1x2x1x[4]xf32> {
    %0 = vector.insert %arg0, %arg1 [0, 1] : vector<1x[4]xf32> into vector<1x2x1x[4]xf32>
    return %0 : vector<1x2x1x[4]xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_non_one_dest(%arg0: vector<1x4xf32>, %arg1: vector<8x1x4xf32>) -> vector<8x1x4xf32> {
    %0 = vector.insert %arg0, %arg1 [5] : vector<1x4xf32> into vector<8x1x4xf32>
    return %0 : vector<8x1x4xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_non_one_dest_scalable(%arg0: vector<1x[4]xf32>, %arg1: vector<8x1x[4]xf32>) -> vector<8x1x[4]xf32> {
    %0 = vector.insert %arg0, %arg1 [5] : vector<1x[4]xf32> into vector<8x1x[4]xf32>
    return %0 : vector<8x1x[4]xf32>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_one_two_dest(%arg0: vector<1x8xi1>, %arg1: vector<1x1x8x1x8xi1>) -> vector<1x1x8x1x8xi1> {
    %0 = vector.insert %arg0, %arg1 [0, 0, 7] : vector<1x8xi1> into vector<1x1x8x1x8xi1>
    return %0 : vector<1x1x8x1x8xi1>
  }
}

// -----
module {
  func.func @cast_away_insert_leading_one_dims_one_two_dest_scalable(%arg0: vector<1x[8]xi1>, %arg1: vector<1x1x8x1x[8]xi1>) -> vector<1x1x8x1x[8]xi1> {
    %0 = vector.insert %arg0, %arg1 [0, 0, 7] : vector<1x[8]xi1> into vector<1x1x8x1x[8]xi1>
    return %0 : vector<1x1x8x1x[8]xi1>
  }
}

// -----
module {
  func.func @cast_away_constant_mask() -> vector<1x1x8x2x1xi1> {
    %0 = vector.constant_mask [1, 1, 6, 1, 1] : vector<1x1x8x2x1xi1>
    return %0 : vector<1x1x8x2x1xi1>
  }
}

// -----
module {
  func.func @drop_unit_dims_scalar_cond_select(%arg0: i1, %arg1: vector<1x16xi1>, %arg2: vector<1x16xi1>) -> vector<1x16xi1> {
    %0 = arith.select %arg0, %arg1, %arg2 : vector<1x16xi1>
    return %0 : vector<1x16xi1>
  }
}

