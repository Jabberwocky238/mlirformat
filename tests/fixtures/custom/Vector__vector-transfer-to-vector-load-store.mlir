#map = affine_map<() -> (0)>
#map1 = affine_map<(d0, d1) -> (d0 * 16 + d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (0)>
#map4 = affine_map<(d0, d1) -> (0, 0)>
#map5 = affine_map<(d0, d1, d2, d3, d4) -> (d1, 0, 0, d4)>
module {
  func.func @vector_transfer_ops_0d_memref(%arg0: memref<f32>, %arg1: vector<f32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[], %cst : memref<f32>, vector<f32>
    vector.transfer_write %0, %arg0[] : vector<f32>, memref<f32>
    vector.store %arg1, %arg0[] : memref<f32>, vector<f32>
    return
  }
  func.func @vector_transfer_ops_0d_tensor(%arg0: tensor<f32>) -> vector<1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[], %cst {in_bounds = [true], permutation_map = #map} : tensor<f32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @transfer_to_load(%arg0: memref<8x8xf32>, %arg1: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true]} : memref<8x8xf32>, vector<4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1] {in_bounds = [true]} : vector<4xf32>, memref<8x8xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_transfer_to_load(%arg0: memref<8x8xf32>, %arg1: index, %arg2: vector<4xi1>) -> memref<8x8xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.mask %arg2 { vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true]} : memref<8x8xf32>, vector<4xf32> } : vector<4xi1> -> vector<4xf32>
    vector.mask %arg2 { vector.transfer_write %0, %arg0[%arg1, %arg1] {in_bounds = [true]} : vector<4xf32>, memref<8x8xf32> } : vector<4xi1>
    return %arg0 : memref<8x8xf32>
  }
  func.func @transfer_2D(%arg0: memref<8x8xf32>, %arg1: index) -> vector<2x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, true]} : memref<8x8xf32>, vector<2x4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1] {in_bounds = [true, true]} : vector<2x4xf32>, memref<8x8xf32>
    return %0 : vector<2x4xf32>
  }
  func.func @transfer_vector_element(%arg0: memref<8x8xvector<2x4xf32>>, %arg1: index) -> vector<2x4xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<2x4xf32>
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst : memref<8x8xvector<2x4xf32>>, vector<2x4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1] : vector<2x4xf32>, memref<8x8xvector<2x4xf32>>
    return %0 : vector<2x4xf32>
  }
  func.func @transfer_vector_element_different_types(%arg0: memref<8x8xvector<2x4xf32>>, %arg1: index) -> vector<1x2x4xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<2x4xf32>
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true]} : memref<8x8xvector<2x4xf32>>, vector<1x2x4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1] {in_bounds = [true]} : vector<1x2x4xf32>, memref<8x8xvector<2x4xf32>>
    return %0 : vector<1x2x4xf32>
  }
  func.func @transfer_2D_not_inbounds(%arg0: memref<8x8xf32>, %arg1: index) -> vector<2x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, false]} : memref<8x8xf32>, vector<2x4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1] {in_bounds = [false, true]} : vector<2x4xf32>, memref<8x8xf32>
    return %0 : vector<2x4xf32>
  }
  func.func @transfer_not_inbounds(%arg0: memref<8x8xf32>, %arg1: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst : memref<8x8xf32>, vector<4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1] : vector<4xf32>, memref<8x8xf32>
    return %0 : vector<4xf32>
  }
  func.func @transfer_nondefault_layout(%arg0: memref<8x8xf32, #map1>, %arg1: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true]} : memref<8x8xf32, #map1>, vector<4xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1] {in_bounds = [true]} : vector<4xf32>, memref<8x8xf32, #map1>
    return %0 : vector<4xf32>
  }
  func.func @transfer_perm_map(%arg0: memref<8x8xf32>, %arg1: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true], permutation_map = #map2} : memref<8x8xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @transfer_broadcasting(%arg0: memref<8x8xf32>, %arg1: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true], permutation_map = #map3} : memref<8x8xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @transfer_scalar(%arg0: memref<?x?xf32>, %arg1: index) -> vector<1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true]} : memref<?x?xf32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @transfer_broadcasting_2D(%arg0: memref<8x8xf32>, %arg1: index) -> vector<4x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, true], permutation_map = #map4} : memref<8x8xf32>, vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
  func.func @transfer_broadcasting_complex(%arg0: memref<10x20x30x8x8xf32>, %arg1: index) -> vector<3x2x4x5xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1, %arg1, %arg1], %cst {in_bounds = [true, true, true, true], permutation_map = #map5} : memref<10x20x30x8x8xf32>, vector<3x2x4x5xf32>
    return %0 : vector<3x2x4x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transfer max_transfer_rank = 99
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, 0, 0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, d1, 0, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d1, 0, 0)>
#map3 = affine_map<(d0, d1) -> (d1, d0, 0, 0)>
#map4 = affine_map<(d0, d1) -> (0, d1, 0, d0)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3, d0)>
#map6 = affine_map<(d0, d1) -> (0)>
#map7 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map8 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map9 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @transfer_read_permutations(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?x?xf32>, %arg2: i1) -> (vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<8xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg2 : i1 to vector<14x7xi1>
    %1 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %cst, %0 {in_bounds = [true, false, true, true], permutation_map = #map} : memref<?x?x?x?xf32>, vector<7x14x8x16xf32>
    %2 = vector.broadcast %arg2 : i1 to vector<16x14xi1>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %cst, %2 {in_bounds = [true, false, true, false], permutation_map = #map1} : memref<?x?x?x?xf32>, vector<7x14x8x16xf32>
    %4 = vector.broadcast %arg2 : i1 to vector<14x7xi1>
    %5 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %cst, %4 {in_bounds = [true, false, true, true], permutation_map = #map2} : memref<?x?x?x?xf32>, vector<7x14x8x16xf32>
    %6 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [false, false, true, true], permutation_map = #map3} : memref<?x?xf32>, vector<7x14x8x16xf32>
    %7 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, false, true, false], permutation_map = #map4} : memref<?x?xf32>, vector<7x14x8x16xf32>
    %8 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %cst {permutation_map = #map5} : memref<?x?x?x?xf32>, vector<7x14x8x16xf32>
    %9 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true], permutation_map = #map6} : memref<?x?xf32>, vector<8xf32>
    return %1, %3, %5, %6, %7, %8, %9 : vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<8xf32>
  }
  func.func @transfer_write_permutations_tensor_masked(%arg0: tensor<?x?x?x?xf32>, %arg1: vector<7x14x8x16xf32>, %arg2: i1) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg2 : i1 to vector<16x14x7x8xi1>
    %1 = vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, false, false, true], permutation_map = #map5} : vector<7x14x8x16xf32>, tensor<?x?x?x?xf32>
    return %1 : tensor<?x?x?x?xf32>
  }
  func.func @transfer_write_permutations_memref(%arg0: memref<?x?x?x?xf32>, %arg1: vector<8x16xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] {permutation_map = #map7} : vector<8x16xf32>, memref<?x?x?x?xf32>
    return
  }
  func.func @transfer_write_broadcast_unit_dim_tensor(%arg0: tensor<?x?x?x?xf32>, %arg1: vector<14x8x16xf32>) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] {in_bounds = [false, false, true], permutation_map = #map8} : vector<14x8x16xf32>, tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @transfer_write_broadcast_unit_dim_memref(%arg0: memref<?x?x?x?xf32>, %arg1: vector<8x16xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] {permutation_map = #map9} : vector<8x16xf32>, memref<?x?x?x?xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transfer max_transfer_rank = 99
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @transfer_2D_masked(%arg0: memref<?x?xf32>, %arg1: vector<2x4xi1>) -> vector<2x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst, %arg1 {in_bounds = [true, true]} : memref<?x?xf32>, vector<2x4xf32>
    vector.transfer_write %0, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<2x4xf32>, memref<?x?xf32>
    return %0 : vector<2x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_transfer max_transfer_rank = 2
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

