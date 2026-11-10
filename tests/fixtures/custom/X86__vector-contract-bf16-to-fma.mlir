#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @brgemm_to_fma(%arg0: memref<1x4x1x2xbf16>, %arg1: memref<1x1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x4x1x2xbf16>, vector<1x1x1x2xbf16>
    %2 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x1x32x2xbf16>, vector<1x1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @brgemm_to_fma_load(%arg0: memref<1x4x1x2xbf16>, %arg1: memref<1x1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %c0, %c0] : memref<1x4x1x2xbf16>, vector<1x1x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0, %c0] : memref<1x1x32x2xbf16>, vector<1x1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @brgemm_to_fma_load_bcst_B(%arg0: memref<1x32x1x2xbf16>, %arg1: memref<1x1x4x2xbf16>, %arg2: vector<8x1xf32>) -> vector<8x1xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %c0, %c0] : memref<1x32x1x2xbf16>, vector<1x8x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0, %c0] : memref<1x1x4x2xbf16>, vector<1x1x1x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x8x1x2xbf16>, vector<1x1x1x2xbf16> into vector<8x1xf32>
    return %3 : vector<8x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @batch_matmul_fma_load(%arg0: memref<1x4x1x2xbf16>, %arg1: memref<1x1x32x2xbf16>, %arg2: vector<1x1x8xf32>) -> vector<1x1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %c0, %c0] : memref<1x4x1x2xbf16>, vector<1x1x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0, %c0] : memref<1x1x32x2xbf16>, vector<1x1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x8x2xbf16> into vector<1x1x8xf32>
    return %3 : vector<1x1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @matmul_outer_product_to_fma_load(%arg0: memref<4x1x2xbf16>, %arg1: memref<1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %c0] : memref<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0] : memref<1x32x2xbf16>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @matmul_to_fma_flat_layout(%arg0: memref<4x1xbf16>, %arg1: memref<1x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x1xbf16>, vector<1x1xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<1x32xbf16>, vector<1x8xbf16>
    %4 = vector.transfer_read %arg1[%c0, %c8], %0 {in_bounds = [true, true]} : memref<1x32xbf16>, vector<1x8xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x8xf32>
    %6 = vector.transfer_read %arg2[%c0, %c8], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x8xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x8xf32>, memref<2x32xf32>
    vector.transfer_write %8, %arg2[%c0, %c8] {in_bounds = [true, true]} : vector<1x8xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @matmul_to_fma_flat_layout_load(%arg0: memref<4x1xbf16>, %arg1: memref<1x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x1xbf16>, vector<1x1xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<1x32xbf16>, vector<1x8xbf16>
    %4 = vector.load %arg1[%c0, %c8] : memref<1x32xbf16>, vector<1x8xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x8xf32>
    %6 = vector.load %arg2[%c0, %c8] : memref<2x32xf32>, vector<1x8xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    vector.store %7, %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x8xf32>
    vector.store %8, %arg2[%c0, %c8] : memref<2x32xf32>, vector<1x8xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @matmul_to_fma_flat_layout_loop(%arg0: memref<16x64x32xbf16>, %arg1: memref<16x32x64xbf16>, %arg2: memref<64x64xf32>) -> memref<64x64xf32> {
    %c8 = arith.constant 8 : index
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c64 step %c1 {
      scf.for %arg4 = %c0 to %c64 step %c16 {
        %subview = memref.subview %arg2[%arg3, %arg4] [1, 16] [1, 1] : memref<64x64xf32> to memref<1x16xf32, strided<[64, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<1x16xf32, strided<[64, 1], offset: ?>>, vector<1x8xf32>
        %3 = vector.transfer_read %subview[%c0, %c8], %0 {in_bounds = [true, true]} : memref<1x16xf32, strided<[64, 1], offset: ?>>, vector<1x8xf32>
        %4:2 = scf.for %arg5 = %c0 to %c16 step %c1 iter_args(%arg6 = %2, %arg7 = %3) -> (vector<1x8xf32>, vector<1x8xf32>) {
          %5:2 = scf.for %arg8 = %c0 to %c32 step %c1 iter_args(%arg9 = %arg6, %arg10 = %arg7) -> (vector<1x8xf32>, vector<1x8xf32>) {
            %subview_0 = memref.subview %arg0[%arg5, %arg3, %arg8] [1, 1, 1] [1, 1, 1] : memref<16x64x32xbf16> to memref<1x1x1xbf16, strided<[2048, 32, 1], offset: ?>>
            %subview_1 = memref.subview %arg1[%arg5, %arg8, %arg4] [1, 1, 16] [1, 1, 1] : memref<16x32x64xbf16> to memref<1x1x16xbf16, strided<[2048, 64, 1], offset: ?>>
            %6 = vector.transfer_read %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x1x1xbf16, strided<[2048, 32, 1], offset: ?>>, vector<1x1x1xbf16>
            %7 = vector.transfer_read %subview_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x1x16xbf16, strided<[2048, 64, 1], offset: ?>>, vector<1x1x8xbf16>
            %8 = vector.transfer_read %subview_1[%c0, %c0, %c8], %1 {in_bounds = [true, true, true]} : memref<1x1x16xbf16, strided<[2048, 64, 1], offset: ?>>, vector<1x1x8xbf16>
            %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %6, %7, %arg9 {unroll_shape = array<i64: 1, 1, 8, 1>} : vector<1x1x1xbf16>, vector<1x1x8xbf16> into vector<1x8xf32>
            %10 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %6, %8, %arg10 {unroll_shape = array<i64: 1, 1, 8, 1>} : vector<1x1x1xbf16>, vector<1x1x8xbf16> into vector<1x8xf32>
            scf.yield %9, %10 : vector<1x8xf32>, vector<1x8xf32>
          }
          scf.yield %5#0, %5#1 : vector<1x8xf32>, vector<1x8xf32>
        }
        vector.transfer_write %4#1, %subview[%c0, %c8] {in_bounds = [true, true]} : vector<1x8xf32>, memref<1x16xf32, strided<[64, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x8xf32>, memref<1x16xf32, strided<[64, 1], offset: ?>>
      }
    }
    return %arg2 : memref<64x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @matmul_to_fma_flat_layout_bcstB(%arg0: memref<32x1xbf16>, %arg1: memref<1x4xbf16>, %arg2: memref<32x4xf32>) -> memref<32x4xf32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x1xbf16>, vector<8x1xbf16>
    %3 = vector.transfer_read %arg0[%c8, %c0], %0 {in_bounds = [true, true]} : memref<32x1xbf16>, vector<8x1xbf16>
    %4 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<1x4xbf16>, vector<1x1xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x4xf32>, vector<8x1xf32>
    %6 = vector.transfer_read %arg2[%c8, %c0], %1 {in_bounds = [true, true]} : memref<32x4xf32>, vector<8x1xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %5 : vector<8x1xbf16>, vector<1x1xbf16> into vector<8x1xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %6 : vector<8x1xbf16>, vector<1x1xbf16> into vector<8x1xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<32x4xf32>
    vector.transfer_write %8, %arg2[%c8, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<32x4xf32>
    return %arg2 : memref<32x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @matmul_dynamic_offset(%arg0: memref<4x1x2xbf16>, %arg1: memref<1x32x2xbf16>, %arg2: vector<1x8xf32>, %arg3: index) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%arg3, %c0, %c0] : memref<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0] : memref<1x32x2xbf16>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @matmul_to_fma_load_bcst_B(%arg0: memref<32x1x2xbf16>, %arg1: memref<1x4x2xbf16>, %arg2: vector<8x1xf32>) -> vector<8x1xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %c0] : memref<32x1x2xbf16>, vector<8x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0] : memref<1x4x2xbf16>, vector<1x1x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<8x1x2xbf16>, vector<1x1x2xbf16> into vector<8x1xf32>
    return %3 : vector<8x1xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d5, d2)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d5, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4)>
module {
  func.func @many_dimensions(%arg0: memref<1x1x4x1x2xbf16>, %arg1: memref<1x1x1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %c0, %c0, %c0] : memref<1x1x4x1x2xbf16>, vector<1x1x1x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0, %c0, %c0] : memref<1x1x1x32x2xbf16>, vector<1x1x1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x1x1x2xbf16>, vector<1x1x1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_multiple_vc_users_flat(%arg0: memref<4x1xbf16>, %arg1: memref<1x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x1xbf16>, vector<1x1xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<1x32xbf16>, vector<1x8xbf16>
    %4 = vector.load %arg1[%c0, %c8] : memref<1x32xbf16>, vector<1x8xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x8xf32>
    %6 = vector.load %arg2[%c0, %c8] : memref<2x32xf32>, vector<1x8xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    vector.store %7, %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x8xf32>
    vector.store %8, %arg2[%c0, %c8] : memref<2x32xf32>, vector<1x8xf32>
    %9 = arith.addf %7, %8 : vector<1x8xf32>
    vector.store %9, %arg2[%c0, %c16] : memref<2x32xf32>, vector<1x8xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_tensor_type(%arg0: tensor<4x1x2xbf16>, %arg1: tensor<1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %0 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : tensor<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.transfer_read %arg1[%c0, %c8, %c0], %0 {in_bounds = [true, true, true]} : tensor<1x32x2xbf16>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_offset_diff_is_not_8(%arg0: memref<4x1xbf16>, %arg1: memref<1x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.load %arg0[%c0, %c0] : memref<4x1xbf16>, vector<1x1xbf16>
    %3 = vector.load %arg1[%c0, %c0] : memref<1x32xbf16>, vector<1x8xbf16>
    %4 = vector.load %arg1[%c0, %c16] : memref<1x32xbf16>, vector<1x8xbf16>
    %5 = vector.load %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x8xf32>
    %6 = vector.load %arg2[%c0, %c16] : memref<2x32xf32>, vector<1x8xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    vector.store %7, %arg2[%c0, %c0] : memref<2x32xf32>, vector<1x8xf32>
    vector.store %8, %arg2[%c0, %c16] : memref<2x32xf32>, vector<1x8xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_vector_contracts_not_in_order(%arg0: memref<4x1xbf16>, %arg1: memref<1x32xbf16>, %arg2: memref<2x32xf32>) -> memref<2x32xf32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<4x1xbf16>, vector<1x1xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<1x32xbf16>, vector<1x8xbf16>
    %4 = vector.transfer_read %arg1[%c0, %c8], %0 {in_bounds = [true, true]} : memref<1x32xbf16>, vector<1x8xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x8xf32>
    %6 = vector.transfer_read %arg2[%c0, %c8], %1 {in_bounds = [true, true]} : memref<2x32xf32>, vector<1x8xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %6 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %5 : vector<1x1xbf16>, vector<1x8xbf16> into vector<1x8xf32>
    vector.transfer_write %8, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<1x8xf32>, memref<2x32xf32>
    vector.transfer_write %7, %arg2[%c0, %c8] {in_bounds = [true, true]} : vector<1x8xf32>, memref<2x32xf32>
    return %arg2 : memref<2x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_flat_layout_dynamic_index(%arg0: memref<32x1xbf16>, %arg1: memref<1x4xbf16>, %arg2: memref<32x4xf32>, %arg3: index) -> memref<32x4xf32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x1xbf16>, vector<8x1xbf16>
    %3 = vector.transfer_read %arg0[%arg3, %c0], %0 {in_bounds = [true, true]} : memref<32x1xbf16>, vector<8x1xbf16>
    %4 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<1x4xbf16>, vector<1x1xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x4xf32>, vector<8x1xf32>
    %6 = vector.transfer_read %arg2[%c8, %c0], %1 {in_bounds = [true, true]} : memref<32x4xf32>, vector<8x1xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %5 : vector<8x1xbf16>, vector<1x1xbf16> into vector<8x1xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %6 : vector<8x1xbf16>, vector<1x1xbf16> into vector<8x1xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<32x4xf32>
    vector.transfer_write %8, %arg2[%c8, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<32x4xf32>
    return %arg2 : memref<32x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_non_unit_K_dim(%arg0: memref<32x2xbf16>, %arg1: memref<2x4xbf16>, %arg2: memref<32x4xf32>) -> memref<32x4xf32> {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x2xbf16>, vector<8x2xbf16>
    %3 = vector.transfer_read %arg0[%c8, %c0], %0 {in_bounds = [true, true]} : memref<32x2xbf16>, vector<8x2xbf16>
    %4 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<2x4xbf16>, vector<2x1xbf16>
    %5 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x4xf32>, vector<8x1xf32>
    %6 = vector.transfer_read %arg2[%c8, %c0], %1 {in_bounds = [true, true]} : memref<32x4xf32>, vector<8x1xf32>
    %7 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %4, %5 : vector<8x2xbf16>, vector<2x1xbf16> into vector<8x1xf32>
    %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %4, %6 : vector<8x2xbf16>, vector<2x1xbf16> into vector<8x1xf32>
    vector.transfer_write %7, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<32x4xf32>
    vector.transfer_write %8, %arg2[%c8, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<32x4xf32>
    return %arg2 : memref<32x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_no_memref_src(%arg0: vector<1x1x1x2xbf16>, %arg1: vector<1x1x16x2xbf16>, %arg2: vector<1x1x16xf32>) -> vector<1x1x16xf32> {
    %0 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %arg1, %arg2 : vector<1x1x1x2xbf16>, vector<1x1x16x2xbf16> into vector<1x1x16xf32>
    return %0 : vector<1x1x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_non_zero_vnni_offset(%arg0: memref<4x1x2xbf16>, %arg1: memref<1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %c0] : memref<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c1] : memref<1x32x2xbf16>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d3, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d2, d0)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @negative_perm_map_not_identity(%arg0: memref<4x1x2xbf16>, %arg1: memref<1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true], permutation_map = #map} : memref<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x32x2xbf16>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_non_unit_stride(%arg0: memref<4x1x2xbf16>, %arg1: memref<1x32x2xbf16>, %arg2: vector<1x8xf32>) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %subview = memref.subview %arg1[%c0, %c0, %c0] [1, 16, 2] [1, 1, 2] : memref<1x32x2xbf16> to memref<1x16x2xbf16, strided<[64, 2, 2], offset: ?>>
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.transfer_read %subview[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x16x2xbf16, strided<[64, 2, 2], offset: ?>>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_out_of_bound(%arg0: memref<4x1x2xbf16>, %arg1: memref<1x32x2xbf16>, %arg2: vector<1x8xf32>, %arg3: index) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.transfer_read %arg0[%c0, %arg3, %c0], %0 {in_bounds = [true, false, true]} : memref<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x32x2xbf16>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
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
  func.func @negative_no_dynamic_vnni_offset(%arg0: memref<4x1x2xbf16>, %arg1: memref<1x32x2xbf16>, %arg2: vector<1x8xf32>, %arg3: index) -> vector<1x8xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = vector.load %arg0[%c0, %c0, %arg3] : memref<4x1x2xbf16>, vector<1x1x2xbf16>
    %2 = vector.load %arg1[%c0, %c0, %c0] : memref<1x32x2xbf16>, vector<1x8x2xbf16>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %1, %2, %arg2 : vector<1x1x2xbf16>, vector<1x8x2xbf16> into vector<1x8xf32>
    return %3 : vector<1x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_bf16_to_fma
      } : !transform.any_op
      transform.yield 
    }
  }
}

