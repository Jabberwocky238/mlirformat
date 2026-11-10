#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @brgemm_to_bf16dp(%arg0: vector<1x1x1x2xbf16>, %arg1: vector<1x1x16x2xbf16>, %arg2: vector<1x16xf32>) -> vector<1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x16x2xbf16> into vector<1x16xf32>
    return %0 : vector<1x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @brgemm_to_bf16dp_bcst_B(%arg0: vector<1x16x1x2xbf16>, %arg1: vector<1x1x1x2xbf16>, %arg2: vector<16x1xf32>) -> vector<16x1xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x16x1x2xbf16>, vector<1x1x1x2xbf16> into vector<16x1xf32>
    return %0 : vector<16x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @brgemm_to_avx10int8dp(%arg0: vector<1x1x1x4xi8>, %arg1: vector<1x1x16x4xi8>, %arg2: vector<1x16xi32>) -> vector<1x16xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x4xi8>, vector<1x1x16x4xi8> into vector<1x16xi32>
    return %0 : vector<1x16xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @batch_matmul_avx10int8dp_bcst_B(%arg0: vector<1x16x1x4xi8>, %arg1: vector<1x1x1x4xi8>, %arg2: vector<1x16x1xi32>) -> vector<1x16x1xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x16x1x4xi8>, vector<1x1x1x4xi8> into vector<1x16x1xi32>
    return %0 : vector<1x16x1xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @brgemm_to_int8dp(%arg0: vector<1x1x1x4xi8>, %arg1: vector<1x1x8x4xi8>, %arg2: vector<1x8xi32>) -> vector<1x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x4xi8>, vector<1x1x8x4xi8> into vector<1x8xi32>
    return %0 : vector<1x8xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @batch_matmul_bf16dp(%arg0: vector<1x1x1x2xbf16>, %arg1: vector<1x1x16x2xbf16>, %arg2: vector<1x1x16xf32>) -> vector<1x1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x16x2xbf16> into vector<1x1x16xf32>
    return %0 : vector<1x1x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @batch_matmul_int8dp(%arg0: vector<1x1x1x4xi8>, %arg1: vector<1x1x8x4xi8>, %arg2: vector<1x1x8xi32>) -> vector<1x1x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x4xi8>, vector<1x1x8x4xi8> into vector<1x1x8xi32>
    return %0 : vector<1x1x8xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @batch_matmul_int8dp_bcst_B(%arg0: vector<1x8x1x4xi8>, %arg1: vector<1x1x1x4xi8>, %arg2: vector<1x8x1xi32>) -> vector<1x8x1xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x8x1x4xi8>, vector<1x1x1x4xi8> into vector<1x8x1xi32>
    return %0 : vector<1x8x1xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @matmul_outer_product_to_bf16dp(%arg0: vector<1x1x2xbf16>, %arg1: vector<1x16x2xbf16>, %arg2: vector<1x16xf32>) -> vector<1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x2xbf16>, vector<1x16x2xbf16> into vector<1x16xf32>
    return %0 : vector<1x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @matmul_outer_product_to_int8dp(%arg0: vector<1x1x4xi8>, %arg1: vector<1x8x4xi8>, %arg2: vector<1x8xi32>) -> vector<1x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x4xi8>, vector<1x8x4xi8> into vector<1x8xi32>
    return %0 : vector<1x8xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_bf16dp_flat_layout(%arg0: memref<4x2xbf16>, %arg1: memref<2x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x2xbf16>, vector<1x2xbf16>
    %3 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %4 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %5 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<2x32xbf16>, vector<2x16xbf16>
    %6 = vector.transfer_read %arg1[%c0, %c16], %0 {in_bounds = [true, true]} : memref<2x32xbf16>, vector<2x16xbf16>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %5, %3 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %6, %4 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_i8_avx10dp_flat_layout(%arg0: memref<4x4xi8>, %arg1: memref<4x64xi8>, %arg2: memref<4x64xi32>) -> memref<4x64xi32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x4xi8>, vector<1x4xi8>
    %3 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<4x64xi32>, vector<1x16xi32>
    %4 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<4x64xi32>, vector<1x16xi32>
    %5 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x64xi8>, vector<4x16xi8>
    %6 = vector.transfer_read %arg1[%c0, %c16], %0 {in_bounds = [true, true]} : memref<4x64xi8>, vector<4x16xi8>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %5, %3 : vector<1x4xi8>, vector<4x16xi8> into vector<1x16xi32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %6, %4 : vector<1x4xi8>, vector<4x16xi8> into vector<1x16xi32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xi32>, memref<4x64xi32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xi32>, memref<4x64xi32>
    return %arg2 : memref<4x64xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_i8_avx2dp_flat_layout(%arg0: memref<4x4xi8>, %arg1: memref<4x64xi8>, %arg2: memref<4x64xi32>) -> memref<4x64xi32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x4xi8>, vector<1x4xi8>
    %3 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<4x64xi32>, vector<1x8xi32>
    %4 = vector.transfer_read %arg2[%c0, %c8], %1 {in_bounds = [true, true]} : memref<4x64xi32>, vector<1x8xi32>
    %5 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x64xi8>, vector<4x8xi8>
    %6 = vector.transfer_read %arg1[%c0, %c8], %0 {in_bounds = [true, true]} : memref<4x64xi8>, vector<4x8xi8>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %5, %3 : vector<1x4xi8>, vector<4x8xi8> into vector<1x8xi32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %6, %4 : vector<1x4xi8>, vector<4x8xi8> into vector<1x8xi32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x8xi32>, memref<4x64xi32>
    vector.transfer_write %8, %arg2[%c0, %c8] {in_bounds = [true, true]} : vector<1x8xi32>, memref<4x64xi32>
    return %arg2 : memref<4x64xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_bf16dp_flat_layout_offset_args_and_read_after_vc(%arg0: memref<4x2xbf16>, %arg1: memref<2x32xbf16>, %arg2: memref<2x32xf32>, %arg3: index) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x2xbf16>, vector<1x2xbf16>
    %3 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %4 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %5 = vector.transfer_read %arg1[%arg3, %c0], %0 {in_bounds = [true, true]} : memref<2x32xbf16>, vector<2x16xbf16>
    %6 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %5, %3 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    %7 = vector.transfer_read %arg1[%arg3, %c16], %0 {in_bounds = [true, true]} : memref<2x32xbf16>, vector<2x16xbf16>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %7, %4 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    vector.transfer_write %6, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @brmatmul_bf16dp_flat_layout_loop(%arg0: memref<16x64x32xbf16>, %arg1: memref<16x32x64xbf16>, %arg2: memref<64x64xf32>) -> memref<64x64xf32> {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    scf.for %arg3 = %c0 to %c64 step %c1 {
      scf.for %arg4 = %c0 to %c64 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [1, 32] [1, 1] : memref<64x64xf32> to memref<1x32xf32, strided<[64, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[64, 1], offset: ?>>, vector<1x16xf32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[64, 1], offset: ?>>, vector<1x16xf32>
        %4:2 = scf.for %arg5 = %c0 to %c16 step %c1 iter_args(%arg6 = %2, %arg7 = %3) -> (vector<1x16xf32>, vector<1x16xf32>) {
          %5:2 = scf.for %arg8 = %c0 to %c32 step %c2 iter_args(%arg9 = %arg6, %arg10 = %arg7) -> (vector<1x16xf32>, vector<1x16xf32>) {
            %subview_0 = memref.subview %arg0[%arg5, %arg3, %arg8] [1, 1, 2] [1, 1, 1] : memref<16x64x32xbf16> to memref<1x1x2xbf16, strided<[2048, 32, 1], offset: ?>>
            %subview_1 = memref.subview %arg1[%arg5, %arg8, %arg4] [1, 2, 32] [1, 1, 1] : memref<16x32x64xbf16> to memref<1x2x32xbf16, strided<[2048, 64, 1], offset: ?>>
            %6 = vector.transfer_read %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x1x2xbf16, strided<[2048, 32, 1], offset: ?>>, vector<1x1x2xbf16>
            %7 = vector.transfer_read %subview_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x2x32xbf16, strided<[2048, 64, 1], offset: ?>>, vector<1x2x16xbf16>
            %8 = vector.transfer_read %subview_1[%c0, %c0, %c16], %1 {in_bounds = [true, true, true]} : memref<1x2x32xbf16, strided<[2048, 64, 1], offset: ?>>, vector<1x2x16xbf16>
            %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %6, %7, %arg9 {unroll_shape = array<i64: 1, 1, 16, 2>} : vector<1x1x2xbf16>, vector<1x2x16xbf16> into vector<1x16xf32>
            %10 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %6, %8, %arg10 {unroll_shape = array<i64: 1, 1, 16, 2>} : vector<1x1x2xbf16>, vector<1x2x16xbf16> into vector<1x16xf32>
            scf.yield %9, %10 : vector<1x16xf32>, vector<1x16xf32>
          }
          scf.yield %5#0, %5#1 : vector<1x16xf32>, vector<1x16xf32>
        }
        vector.transfer_write %4#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, memref<1x32xf32, strided<[64, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, memref<1x32xf32, strided<[64, 1], offset: ?>>
      }
    }
    return %arg2 : memref<64x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_bf16dp_flat_layout_B_shuffled(%arg0: memref<4x2xbf16>, %arg1: memref<2x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x2xbf16>, vector<1x2xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<2x32xbf16>, vector<2x16xbf16>
    %4 = vector.load %arg1[%c0, %c16] : memref<2x32xbf16>, vector<2x16xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x16xf32>
    %6 = vector.load %arg2[%c0, %c16] : memref<2x32xf32>, vector<1x16xf32>
    %7 = vector.shape_cast %3 : vector<2x16xbf16> to vector<32xbf16>
    %8 = vector.shape_cast %4 : vector<2x16xbf16> to vector<32xbf16>
    %9 = vector.shuffle %7, %8 [0, 32, 1, 33, 2, 34, 3, 35, 8, 40, 9, 41, 10, 42, 11, 43, 16, 48, 17, 49, 18, 50, 19, 51, 24, 56, 25, 57, 26, 58, 27, 59] : vector<32xbf16>, vector<32xbf16>
    %10 = vector.shuffle %7, %8 [4, 36, 5, 37, 6, 38, 7, 39, 12, 44, 13, 45, 14, 46, 15, 47, 20, 52, 21, 53, 22, 54, 23, 55, 28, 60, 29, 61, 30, 62, 31, 63] : vector<32xbf16>, vector<32xbf16>
    %11 = vector.shape_cast %9 : vector<32xbf16> to vector<2x16xbf16>
    %12 = vector.shape_cast %10 : vector<32xbf16> to vector<2x16xbf16>
    %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %11, %5 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %12, %6 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    vector.store %13, %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x16xf32>
    vector.store %14, %arg2[%c0, %c16] : memref<2x32xf32>, vector<1x16xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @brgemm_int8_flat_avx10(%arg0: memref<16x64x256xi8>, %arg1: memref<16x256x128xi8>, %arg2: memref<64x128xi32>) -> memref<64x128xi32> {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c256 = arith.constant 256 : index
    %c2 = arith.constant 2 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.for %arg3 = %c0 to %c64 step %c2 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [2, 32] [1, 1] : memref<64x128xi32> to memref<2x32xi32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<2x32xi32, strided<[128, 1], offset: ?>>, vector<1x16xi32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<2x32xi32, strided<[128, 1], offset: ?>>, vector<1x16xi32>
        %4 = vector.transfer_read %subview[%c1, %c0], %0 {in_bounds = [true, true]} : memref<2x32xi32, strided<[128, 1], offset: ?>>, vector<1x16xi32>
        %5 = vector.transfer_read %subview[%c1, %c16], %0 {in_bounds = [true, true]} : memref<2x32xi32, strided<[128, 1], offset: ?>>, vector<1x16xi32>
        %6:4 = scf.for %arg5 = %c0 to %c16 step %c1 iter_args(%arg6 = %2, %arg7 = %3, %arg8 = %4, %arg9 = %5) -> (vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>) {
          %7:4 = scf.for %arg10 = %c0 to %c256 step %c4 iter_args(%arg11 = %arg6, %arg12 = %arg7, %arg13 = %arg8, %arg14 = %arg9) -> (vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>) {
            %subview_0 = memref.subview %arg0[%arg5, %arg3, %arg10] [1, 2, 4] [1, 1, 1] : memref<16x64x256xi8> to memref<1x2x4xi8, strided<[16384, 256, 1], offset: ?>>
            %subview_1 = memref.subview %arg1[%arg5, %arg10, %arg4] [1, 4, 32] [1, 1, 1] : memref<16x256x128xi8> to memref<1x4x32xi8, strided<[32768, 128, 1], offset: ?>>
            %8 = vector.transfer_read %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x2x4xi8, strided<[16384, 256, 1], offset: ?>>, vector<1x1x4xi8>
            %9 = vector.transfer_read %subview_0[%c0, %c1, %c0], %1 {in_bounds = [true, true, true]} : memref<1x2x4xi8, strided<[16384, 256, 1], offset: ?>>, vector<1x1x4xi8>
            %10 = vector.transfer_read %subview_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x4x32xi8, strided<[32768, 128, 1], offset: ?>>, vector<1x4x16xi8>
            %11 = vector.transfer_read %subview_1[%c0, %c0, %c16], %1 {in_bounds = [true, true, true]} : memref<1x4x32xi8, strided<[32768, 128, 1], offset: ?>>, vector<1x4x16xi8>
            %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %10, %arg11 {unroll_shape = array<i64: 1, 1, 16, 4>} : vector<1x1x4xi8>, vector<1x4x16xi8> into vector<1x16xi32>
            %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %11, %arg12 {unroll_shape = array<i64: 1, 1, 16, 4>} : vector<1x1x4xi8>, vector<1x4x16xi8> into vector<1x16xi32>
            %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %9, %10, %arg13 {unroll_shape = array<i64: 1, 1, 16, 4>} : vector<1x1x4xi8>, vector<1x4x16xi8> into vector<1x16xi32>
            %15 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %9, %11, %arg14 {unroll_shape = array<i64: 1, 1, 16, 4>} : vector<1x1x4xi8>, vector<1x4x16xi8> into vector<1x16xi32>
            scf.yield %12, %13, %14, %15 : vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>
          }
          scf.yield %7#0, %7#1, %7#2, %7#3 : vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>, vector<1x16xi32>
        }
        vector.transfer_write %6#3, %subview[%c1, %c16] {in_bounds = [true, true]} : vector<1x16xi32>, memref<2x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#2, %subview[%c1, %c0] {in_bounds = [true, true]} : vector<1x16xi32>, memref<2x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xi32>, memref<2x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xi32>, memref<2x32xi32, strided<[128, 1], offset: ?>>
      }
    }
    %alloc = memref.alloc() : memref<64x128xi32>
    memref.copy %arg2, %alloc : memref<64x128xi32> to memref<64x128xi32>
    return %alloc : memref<64x128xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @brmatmul_bf16dp_flat_layout_loop_tensor_type(%arg0: tensor<16x64x32xbf16>, %arg1: tensor<16x32x64xbf16>, %arg2: tensor<64x64xf32>) -> tensor<64x64xf32> {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %2 = scf.for %arg3 = %c0 to %c64 step %c2 iter_args(%arg4 = %arg2) -> (tensor<64x64xf32>) {
      %3 = scf.for %arg5 = %c0 to %c64 step %c32 iter_args(%arg6 = %arg4) -> (tensor<64x64xf32>) {
        %extracted_slice = tensor.extract_slice %arg6[%arg3, %arg5] [2, 32] [1, 1] : tensor<64x64xf32> to tensor<2x32xf32>
        %4 = vector.transfer_read %extracted_slice[%c0, %c0], %0 {in_bounds = [true, true]} : tensor<2x32xf32>, vector<1x16xf32>
        %5 = vector.transfer_read %extracted_slice[%c0, %c16], %0 {in_bounds = [true, true]} : tensor<2x32xf32>, vector<1x16xf32>
        %6 = vector.transfer_read %extracted_slice[%c1, %c0], %0 {in_bounds = [true, true]} : tensor<2x32xf32>, vector<1x16xf32>
        %7 = vector.transfer_read %extracted_slice[%c1, %c16], %0 {in_bounds = [true, true]} : tensor<2x32xf32>, vector<1x16xf32>
        %8:4 = scf.for %arg7 = %c0 to %c16 step %c1 iter_args(%arg8 = %4, %arg9 = %5, %arg10 = %6, %arg11 = %7) -> (vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>) {
          %13:4 = scf.for %arg12 = %c0 to %c32 step %c2 iter_args(%arg13 = %arg8, %arg14 = %arg9, %arg15 = %arg10, %arg16 = %arg11) -> (vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>) {
            %extracted_slice_0 = tensor.extract_slice %arg0[%arg7, %arg3, %arg12] [1, 2, 2] [1, 1, 1] : tensor<16x64x32xbf16> to tensor<1x2x2xbf16>
            %extracted_slice_1 = tensor.extract_slice %arg1[%arg7, %arg12, %arg5] [1, 2, 32] [1, 1, 1] : tensor<16x32x64xbf16> to tensor<1x2x32xbf16>
            %14 = vector.transfer_read %extracted_slice_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : tensor<1x2x2xbf16>, vector<1x1x2xbf16>
            %15 = vector.transfer_read %extracted_slice_0[%c0, %c1, %c0], %1 {in_bounds = [true, true, true]} : tensor<1x2x2xbf16>, vector<1x1x2xbf16>
            %16 = vector.transfer_read %extracted_slice_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : tensor<1x2x32xbf16>, vector<1x2x16xbf16>
            %17 = vector.transfer_read %extracted_slice_1[%c0, %c0, %c16], %1 {in_bounds = [true, true, true]} : tensor<1x2x32xbf16>, vector<1x2x16xbf16>
            %18 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %14, %16, %arg13 {unroll_shape = array<i64: 1, 1, 16, 2>} : vector<1x1x2xbf16>, vector<1x2x16xbf16> into vector<1x16xf32>
            %19 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %14, %17, %arg14 {unroll_shape = array<i64: 1, 1, 16, 2>} : vector<1x1x2xbf16>, vector<1x2x16xbf16> into vector<1x16xf32>
            %20 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %15, %16, %arg15 {unroll_shape = array<i64: 1, 1, 16, 2>} : vector<1x1x2xbf16>, vector<1x2x16xbf16> into vector<1x16xf32>
            %21 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %15, %17, %arg16 {unroll_shape = array<i64: 1, 1, 16, 2>} : vector<1x1x2xbf16>, vector<1x2x16xbf16> into vector<1x16xf32>
            scf.yield %18, %19, %20, %21 : vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>
          }
          scf.yield %13#0, %13#1, %13#2, %13#3 : vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>, vector<1x16xf32>
        }
        %9 = vector.transfer_write %8#3, %extracted_slice[%c1, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, tensor<2x32xf32>
        %10 = vector.transfer_write %8#2, %9[%c1, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, tensor<2x32xf32>
        %11 = vector.transfer_write %8#1, %10[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, tensor<2x32xf32>
        %12 = vector.transfer_write %8#0, %11[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, tensor<2x32xf32>
        %inserted_slice = tensor.insert_slice %12 into %arg6[%arg3, %arg5] [2, 32] [1, 1] : tensor<2x32xf32> into tensor<64x64xf32>
        scf.yield %inserted_slice : tensor<64x64xf32>
      }
      scf.yield %3 : tensor<64x64xf32>
    }
    return %2 : tensor<64x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @negative_invalid_vc_kind(%arg0: vector<1x1x2xbf16>, %arg1: vector<1x16x2xbf16>, %arg2: vector<1x16xf32>) -> vector<1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<mul>} %arg0, %arg1, %arg2 : vector<1x1x2xbf16>, vector<1x16x2xbf16> into vector<1x16xf32>
    return %0 : vector<1x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @negative_false_vnni_bf16(%arg0: vector<1x1x1x4xbf16>, %arg1: vector<1x1x16x4xbf16>, %arg2: vector<1x16xf32>) -> vector<1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x4xbf16>, vector<1x1x16x4xbf16> into vector<1x16xf32>
    return %0 : vector<1x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @negative_false_vnni_int8(%arg0: vector<1x1x1x2xi8>, %arg1: vector<1x1x8x2xi8>, %arg2: vector<1x8xi32>) -> vector<1x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x2xi8>, vector<1x1x8x2xi8> into vector<1x8xi32>
    return %0 : vector<1x8xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @negative_batch_dimension(%arg0: vector<3x1x1x2xbf16>, %arg1: vector<3x1x16x2xbf16>, %arg2: vector<3x1x16xf32>) -> vector<3x1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<3x1x1x2xbf16>, vector<3x1x16x2xbf16> into vector<3x1x16xf32>
    return %0 : vector<3x1x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @negative_brgemm_dimension(%arg0: vector<2x1x1x4xi8>, %arg1: vector<2x1x8x4xi8>, %arg2: vector<1x8xi32>) -> vector<1x8xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<2x1x1x4xi8>, vector<2x1x8x4xi8> into vector<1x8xi32>
    return %0 : vector<1x8xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @negative_float_acc_type(%arg0: vector<1x1x1x2xbf16>, %arg1: vector<1x1x16x2xbf16>, %arg2: vector<1x1x16xbf16>) -> vector<1x1x16xbf16> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x16x2xbf16> into vector<1x1x16xbf16>
    return %0 : vector<1x1x16xbf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @negative_int_acc_type(%arg0: vector<1x1x1x4xi8>, %arg1: vector<1x1x8x4xi8>, %arg2: vector<1x1x8xi8>) -> vector<1x1x8xi8> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x4xi8>, vector<1x1x8x4xi8> into vector<1x1x8xi8>
    return %0 : vector<1x1x8xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @negative_wrong_vnni_blocking_factor_bf16(%arg0: vector<1x1x1x4xbf16>, %arg1: vector<1x1x16x4xbf16>, %arg2: vector<1x1x16xbf16>) -> vector<1x1x16xbf16> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x4xbf16>, vector<1x1x16x4xbf16> into vector<1x1x16xbf16>
    return %0 : vector<1x1x16xbf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @negative_brgemm_not_vnni(%arg0: vector<1x1x1xbf16>, %arg1: vector<1x1x32xbf16>, %arg2: vector<1x32xf32>) -> vector<1x32xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1xbf16>, vector<1x1x32xbf16> into vector<1x32xf32>
    return %0 : vector<1x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @negative_wrong_vector_shape_int8(%arg0: vector<1x1x1x4xi8>, %arg1: vector<1x1x32x4xi8>, %arg2: vector<1x1x32xi32>) -> vector<1x1x32xi32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x4xi8>, vector<1x1x32x4xi8> into vector<1x1x32xi32>
    return %0 : vector<1x1x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d3)>
module {
  func.func @negative_wrong_vector_shape_bf16(%arg0: vector<1x1x1x2xbf16>, %arg1: vector<1x1x32x2xbf16>, %arg2: vector<1x1x32xf32>) -> vector<1x1x32xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x32x2xbf16> into vector<1x1x32xf32>
    return %0 : vector<1x1x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_flat_other_dim_is_not_2(%arg0: memref<4x4xbf16>, %arg1: memref<4x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x4xbf16>, vector<1x4xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x32xbf16>, vector<4x16xbf16>
    %4 = vector.transfer_read %arg1[%c0, %c16], %0 {in_bounds = [true, true]} : memref<4x32xbf16>, vector<4x16xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %6 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x4xbf16>, vector<4x16xbf16> into vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x4xbf16>, vector<4x16xbf16> into vector<1x16xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_flat_offset_diff_is_not16(%arg0: memref<4x2xbf16>, %arg1: memref<2x64xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x2xbf16>, vector<1x2xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<2x64xbf16>, vector<2x16xbf16>
    %4 = vector.transfer_read %arg1[%c0, %c32], %0 {in_bounds = [true, true]} : memref<2x64xbf16>, vector<2x16xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %6 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_flat_dynamic_offset(%arg0: memref<4x2xbf16>, %arg1: memref<2x64xbf16>, %arg2: memref<2x32xf32>, %arg3: index) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x2xbf16>, vector<1x2xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<2x64xbf16>, vector<2x16xbf16>
    %4 = vector.transfer_read %arg1[%c0, %arg3], %0 {in_bounds = [true, true]} : memref<2x64xbf16>, vector<2x16xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %6 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_flat_read_after_contract(%arg0: memref<4x2xbf16>, %arg1: memref<2x64xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x2xbf16>, vector<1x2xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<2x64xbf16>, vector<2x16xbf16>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    %6 = vector.transfer_read %arg1[%c0, %c16], %0 {in_bounds = [true, true]} : memref<2x64xbf16>, vector<2x16xbf16>
    %7 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %6, %7 : vector<1x2xbf16>, vector<2x16xbf16> into vector<1x16xf32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x16xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_contracts_not_in_order(%arg0: memref<4x2xbf16>, %arg1: memref<2x64xbf16>, %arg2: memref<2x64xf32>) -> memref<2x64xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x2xbf16>, vector<1x1xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<2x64xbf16>, vector<1x16xbf16>
    %4 = vector.load %arg1[%c0, %c32] : memref<2x64xbf16>, vector<1x16xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x16xf32>
    %6 = vector.load %arg2[%c0, %c16] : memref<2x64xf32>, vector<1x16xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x16xbf16> into vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x16xbf16> into vector<1x16xf32>
    vector.store %8, %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x16xf32>
    vector.store %7, %arg2[%c0, %c16] : memref<2x64xf32>, vector<1x16xf32>
    return %arg2 : memref<2x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_dim_is_32(%arg0: memref<4x2xbf16>, %arg1: memref<2x64xbf16>, %arg2: memref<2x64xf32>) -> memref<2x64xf32> {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x2xbf16>, vector<1x1xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<2x64xbf16>, vector<1x32xbf16>
    %4 = vector.load %arg1[%c0, %c32] : memref<2x64xbf16>, vector<1x32xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x32xf32>
    %6 = vector.load %arg2[%c0, %c32] : memref<2x64xf32>, vector<1x32xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x32xbf16> into vector<1x32xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x32xbf16> into vector<1x32xf32>
    vector.store %7, %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x32xf32>
    vector.store %8, %arg2[%c0, %c32] : memref<2x64xf32>, vector<1x32xf32>
    return %arg2 : memref<2x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_offset_diff_is_32(%arg0: memref<4x2xbf16>, %arg1: memref<2x64xbf16>, %arg2: memref<2x64xf32>) -> memref<2x64xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x2xbf16>, vector<1x1xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<2x64xbf16>, vector<1x16xbf16>
    %4 = vector.load %arg1[%c0, %c32] : memref<2x64xbf16>, vector<1x16xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x16xf32>
    %6 = vector.load %arg2[%c0, %c16] : memref<2x64xf32>, vector<1x16xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x16xbf16> into vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x16xbf16> into vector<1x16xf32>
    vector.store %7, %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x16xf32>
    vector.store %8, %arg2[%c0, %c16] : memref<2x64xf32>, vector<1x16xf32>
    return %arg2 : memref<2x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_dynamic_offset(%arg0: memref<4x2xbf16>, %arg1: memref<2x64xbf16>, %arg2: memref<2x64xf32>, %arg3: index) -> memref<2x64xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x2xbf16>, vector<1x1xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<2x64xbf16>, vector<1x16xbf16>
    %4 = vector.load %arg1[%c0, %arg3] : memref<2x64xbf16>, vector<1x16xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x16xf32>
    %6 = vector.load %arg2[%c0, %c16] : memref<2x64xf32>, vector<1x16xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x16xbf16> into vector<1x16xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x16xbf16> into vector<1x16xf32>
    vector.store %7, %arg2[%c0, %c0] : memref<2x64xf32>, vector<1x16xf32>
    vector.store %8, %arg2[%c0, %c16] : memref<2x64xf32>, vector<1x16xf32>
    return %arg2 : memref<2x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_i8_avx2dp_flat_layout_offset_diff_16(%arg0: memref<4x4xi8>, %arg1: memref<4x64xi8>, %arg2: memref<4x64xi32>) -> memref<4x64xi32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x4xi8>, vector<1x4xi8>
    %3 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<4x64xi32>, vector<1x8xi32>
    %4 = vector.transfer_read %arg2[%c0, %c16], %1 {in_bounds = [true, true]} : memref<4x64xi32>, vector<1x8xi32>
    %5 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x64xi8>, vector<4x8xi8>
    %6 = vector.transfer_read %arg1[%c0, %c16], %0 {in_bounds = [true, true]} : memref<4x64xi8>, vector<4x8xi8>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %5, %3 : vector<1x4xi8>, vector<4x8xi8> into vector<1x8xi32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %6, %4 : vector<1x4xi8>, vector<4x8xi8> into vector<1x8xi32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x8xi32>, memref<4x64xi32>
    vector.transfer_write %8, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<1x8xi32>, memref<4x64xi32>
    return %arg2 : memref<4x64xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

