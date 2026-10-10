#map = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map4 = affine_map<(d0, d1) -> (0, d1, d0)>
#map5 = affine_map<(d0, d1, d2, d3) -> (0, d1, 0, d3)>
module {
  func.func @xfer_write_minor_identity_transposed(%arg0: vector<4x8xi16>, %arg1: memref<2x2x8x4xi16>, %arg2: index) {
    vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2, %arg2] {in_bounds = [true, true], permutation_map = #map} : vector<4x8xi16>, memref<2x2x8x4xi16>
    return
  }
  func.func @xfer_write_minor_identity_transposed_out_of_bounds(%arg0: vector<4x8xi16>, %arg1: memref<2x2x?x?xi16>, %arg2: index) {
    vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2, %arg2] {permutation_map = #map} : vector<4x8xi16>, memref<2x2x?x?xi16>
    return
  }
  func.func @xfer_write_minor_identity_transposed_with_mask_scalable(%arg0: vector<4x[8]xi16>, %arg1: memref<2x2x?x4xi16>, %arg2: vector<[8]x4xi1>, %arg3: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%arg3, %arg3, %arg3, %arg3], %arg2 {in_bounds = [true, true], permutation_map = #map} : vector<4x[8]xi16>, memref<2x2x?x4xi16>
    return
  }
  func.func @xfer_write_minor_identity_transposed_map_masked(%arg0: vector<4x8xi16>, %arg1: memref<2x2x8x4xi16>, %arg2: vector<8x4xi1>, %arg3: index) {
    %c0 = arith.constant 0 : index
    vector.mask %arg2 { vector.transfer_write %arg0, %arg1[%arg3, %arg3, %arg3, %arg3] {in_bounds = [true, true], permutation_map = #map} : vector<4x8xi16>, memref<2x2x8x4xi16> } : vector<8x4xi1>
    return
  }
  func.func @xfer_write_non_minor_identity(%arg0: memref<?x?xf32>, %arg1: vector<7xf32>, %arg2: index, %arg3: index) {
    vector.transfer_write %arg1, %arg0[%arg2, %arg3] {permutation_map = #map1} : vector<7xf32>, memref<?x?xf32>
    return
  }
  func.func @xfer_write_non_minor_identity_with_mask_out_of_bounds(%arg0: memref<?x?xf32>, %arg1: vector<7xf32>, %arg2: index, %arg3: index, %arg4: vector<7xi1>) {
    vector.transfer_write %arg1, %arg0[%arg2, %arg3], %arg4 {permutation_map = #map1} : vector<7xf32>, memref<?x?xf32>
    return
  }
  func.func @xfer_write_non_minor_identity_with_mask_scalable(%arg0: vector<4x[8]xi16>, %arg1: memref<1x4x?x1xi16>, %arg2: vector<4x[8]xi1>, %arg3: index) {
    vector.transfer_write %arg0, %arg1[%arg3, %arg3, %arg3, %arg3], %arg2 {in_bounds = [true, true], permutation_map = #map2} : vector<4x[8]xi16>, memref<1x4x?x1xi16>
    return
  }
  func.func @xfer_write_non_minor_identity_masked(%arg0: tensor<?x?xf32>, %arg1: vector<16xf32>, %arg2: index, %arg3: vector<16xi1>) -> tensor<?x?xf32> {
    %0 = vector.mask %arg3 { vector.transfer_write %arg1, %arg0[%arg2, %arg2] {permutation_map = #map1} : vector<16xf32>, tensor<?x?xf32> } : vector<16xi1> -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @xfer_write_non_minor_identity_masked_scalable(%arg0: vector<4x[8]xi16>, %arg1: tensor<?x?x?x?xf32>, %arg2: vector<4x[8]xi1>, %arg3: index) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.mask %arg2 { vector.transfer_write %arg0, %arg1[%arg3, %arg3, %arg3, %arg3] {in_bounds = [true, true], permutation_map = #map2} : vector<4x[8]xi16>, tensor<?x?x?x?xf32> } : vector<4x[8]xi1> -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @xfer_write_non_minor_identity_masked_2(%arg0: tensor<?x?x?x?xf32>, %arg1: vector<14x8x16xf32>, %arg2: vector<14x8x16xi1>, %arg3: index) -> tensor<?x?x?x?xf32> {
    %0 = vector.mask %arg2 { vector.transfer_write %arg1, %arg0[%arg3, %arg3, %arg3, %arg3] {in_bounds = [false, false, true], permutation_map = #map3} : vector<14x8x16xf32>, tensor<?x?x?x?xf32> } : vector<14x8x16xi1> -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @xfer_read_minor_identity_transposed_with_mask(%arg0: memref<?x?xf32>, %arg1: vector<2x4xi1>, %arg2: index) -> vector<8x4x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg2, %arg2], %cst, %arg1 {in_bounds = [true, true, true], permutation_map = #map4} : memref<?x?xf32>, vector<8x4x2xf32>
    return %0 : vector<8x4x2xf32>
  }
  func.func @xfer_read_minor_identity_transposed_with_mask_scalable(%arg0: memref<?x?xf32>, %arg1: vector<2x[4]xi1>, %arg2: index) -> vector<8x[4]x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg2, %arg2], %cst, %arg1 {in_bounds = [true, true, true], permutation_map = #map4} : memref<?x?xf32>, vector<8x[4]x2xf32>
    return %0 : vector<8x[4]x2xf32>
  }
  func.func @xfer_read_minor_identity_transposed_masked(%arg0: tensor<?x?xf32>, %arg1: vector<2x4xi1>, %arg2: index) -> vector<8x4x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.mask %arg1 { vector.transfer_read %arg0[%arg2, %arg2], %cst {in_bounds = [true, true, true], permutation_map = #map4} : tensor<?x?xf32>, vector<8x4x2xf32> } : vector<2x4xi1> -> vector<8x4x2xf32>
    return %0 : vector<8x4x2xf32>
  }
  func.func @xfer_read_minor_identity_transposed_masked_scalable(%arg0: tensor<?x?xf32>, %arg1: vector<2x[4]xi1>, %arg2: index) -> vector<8x[4]x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.mask %arg1 { vector.transfer_read %arg0[%arg2, %arg2], %cst {in_bounds = [true, true, true], permutation_map = #map4} : tensor<?x?xf32>, vector<8x[4]x2xf32> } : vector<2x[4]xi1> -> vector<8x[4]x2xf32>
    return %0 : vector<8x[4]x2xf32>
  }
  func.func @xfer_read_minor_identitiy_bcast_dims(%arg0: memref<?x?x?x?xf32>, %arg1: index) -> vector<8x4x2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1, %arg1], %cst {in_bounds = [true, true, true, true], permutation_map = #map5} : memref<?x?x?x?xf32>, vector<8x4x2x3xf32>
    return %0 : vector<8x4x2x3xf32>
  }
  func.func @xfer_read_minor_identitiy_bcast_dims_scalable(%arg0: memref<?x?x?x?xf32>, %arg1: index) -> vector<8x[4]x2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1, %arg1], %cst {in_bounds = [true, true, true, true], permutation_map = #map5} : memref<?x?x?x?xf32>, vector<8x[4]x2x3xf32>
    return %0 : vector<8x[4]x2x3xf32>
  }
  func.func @xfer_read_minor_identitiy_bcast_dims_with_mask(%arg0: memref<?x?x?x?xf32>, %arg1: vector<4x3xi1>, %arg2: index) -> vector<8x4x2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg2, %arg2, %arg2, %arg2], %cst, %arg1 {in_bounds = [true, true, true, true], permutation_map = #map5} : memref<?x?x?x?xf32>, vector<8x4x2x3xf32>
    return %0 : vector<8x4x2x3xf32>
  }
  func.func @xfer_read_minor_identitiy_bcast_dims_with_mask_scalable(%arg0: memref<?x?x?x?xf32>, %arg1: vector<[4]x3xi1>, %arg2: index) -> vector<8x[4]x2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg2, %arg2, %arg2, %arg2], %cst, %arg1 {in_bounds = [true, true, true, true], permutation_map = #map5} : memref<?x?x?x?xf32>, vector<8x[4]x2x3xf32>
    return %0 : vector<8x[4]x2x3xf32>
  }
  func.func @xfer_read_minor_identitiy_bcast_dims_masked(%arg0: memref<?x?x?x?xf32>, %arg1: vector<4x3xi1>, %arg2: index) -> vector<8x4x2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.mask %arg1 { vector.transfer_read %arg0[%arg2, %arg2, %arg2, %arg2], %cst {in_bounds = [true, true, true, true], permutation_map = #map5} : memref<?x?x?x?xf32>, vector<8x4x2x3xf32> } : vector<4x3xi1> -> vector<8x4x2x3xf32>
    return %0 : vector<8x4x2x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.any_op
      transform.yield 
    }
  }
}

