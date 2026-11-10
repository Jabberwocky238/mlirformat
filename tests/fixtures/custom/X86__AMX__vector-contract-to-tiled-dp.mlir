#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>
module {
  func.func @brgemm_int8(%arg0: memref<1x32x16x4xi8>, %arg1: memref<1x16x32x4xi8>, %arg2: memref<32x32xi32>) -> memref<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x4xi8>, vector<1x16x16x4xi8>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x4xi8>, vector<1x16x16x4xi8>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xi32>, vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x16x4xi8>, vector<1x16x16x4xi8> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32>
    return %arg2 : memref<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @matmul_int8(%arg0: memref<32x16x4xi8>, %arg1: memref<16x32x4xi8>, %arg2: memref<32x32xi32>) -> memref<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<32x16x4xi8>, vector<16x16x4xi8>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<16x32x4xi8>, vector<16x16x4xi8>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xi32>, vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32>
    return %arg2 : memref<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @brgemm_bf16(%arg0: memref<1x32x16x2xbf16>, %arg1: memref<1x16x32x2xbf16>, %arg2: memref<32x32xf32>) -> memref<32x32xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16>, vector<1x16x16x2xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16>, vector<1x16x16x2xbf16>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    return %arg2 : memref<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @batch_matmul_bf16(%arg0: memref<1x32x16x2xbf16>, %arg1: memref<1x16x32x2xbf16>, %arg2: memref<1x32x32xf32>) -> memref<1x32x32xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16>, vector<1x16x16x2xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16>, vector<1x16x16x2xbf16>
    %4 = vector.transfer_read %arg2[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x32x32xf32>, vector<1x16x16xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<1x16x16xf32>
    vector.transfer_write %5, %arg2[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x16x16xf32>, memref<1x32x32xf32>
    return %arg2 : memref<1x32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @brgemm_f8E5M2(%arg0: memref<1x32x16x4xf8E5M2>, %arg1: memref<1x16x32x4xf8E5M2>, %arg2: memref<32x32xf32>) -> memref<32x32xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : f8E5M2
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x4xf8E5M2>, vector<1x16x16x4xf8E5M2>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x4xf8E5M2>, vector<1x16x16x4xf8E5M2>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x16x4xf8E5M2>, vector<1x16x16x4xf8E5M2> into vector<16x16xf32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    return %arg2 : memref<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @online_packing_int8(%arg0: memref<32x64xi8>, %arg1: memref<64x32xi8>, %arg2: memref<32x32xi32>) -> memref<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x64xi8>, vector<16x64xi8>
    %3 = vector.transfer_read %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : memref<64x32xi8>, vector<64x16xi8>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xi32>, vector<16x16xi32>
    %cst = arith.constant dense<13> : vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
    %6 = arith.addi %5, %cst : vector<16x16xi32>
    vector.transfer_write %6, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32>
    return %arg2 : memref<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @online_packing_bf16(%arg0: memref<1x32x32xbf16>, %arg1: memref<1x32x32xbf16>, %arg2: memref<32x32xf32>) -> memref<32x32xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x32x32xbf16>, vector<1x16x32xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x32x32xbf16>, vector<1x32x16xbf16>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    return %arg2 : memref<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @brgemm_bf16_loop(%arg0: memref<16x64x64x2xbf16>, %arg1: memref<16x64x128x2xbf16>, %arg2: memref<64x128xf32>) -> memref<64x128xf32> {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c64 step %c32 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [32, 32] [1, 1] : memref<64x128xf32> to memref<32x32xf32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %4 = vector.transfer_read %subview[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %5 = vector.transfer_read %subview[%c16, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %6:4 = scf.for %arg5 = %c0 to %c16 step %c1 iter_args(%arg6 = %2, %arg7 = %3, %arg8 = %4, %arg9 = %5) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
          %7:4 = scf.for %arg10 = %c0 to %c64 step %c16 iter_args(%arg11 = %arg6, %arg12 = %arg7, %arg13 = %arg8, %arg14 = %arg9) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
            %subview_0 = memref.subview %arg0[%arg5, %arg3, %arg10, 0] [1, 32, 16, 2] [1, 1, 1, 1] : memref<16x64x64x2xbf16> to memref<1x32x16x2xbf16, strided<[8192, 128, 2, 1], offset: ?>>
            %subview_1 = memref.subview %arg1[%arg5, %arg10, %arg4, 0] [1, 16, 32, 2] [1, 1, 1, 1] : memref<16x64x128x2xbf16> to memref<1x16x32x2xbf16, strided<[16384, 256, 2, 1], offset: ?>>
            %8 = vector.transfer_read %subview_0[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16, strided<[8192, 128, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
            %9 = vector.transfer_read %subview_1[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16, strided<[16384, 256, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
            %10 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %9, %arg11 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
            %11 = vector.transfer_read %subview_1[%c0, %c0, %c16, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16, strided<[16384, 256, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
            %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %11, %arg12 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
            %13 = vector.transfer_read %subview_0[%c0, %c16, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16, strided<[8192, 128, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
            %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %9, %arg13 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
            %15 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %11, %arg14 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
            scf.yield %10, %12, %14, %15 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
          }
          scf.yield %7#0, %7#1, %7#2, %7#3 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
        }
        vector.transfer_write %6#3, %subview[%c16, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#2, %subview[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
      }
    }
    return %arg2 : memref<64x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @matmul_int8_loop(%arg0: memref<64x64x4xi8>, %arg1: memref<64x128x4xi8>, %arg2: memref<64x128xi32>) {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    scf.for %arg3 = %c0 to %c64 step %c16 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [16, 32] [1, 1] : memref<64x128xi32> to memref<16x32xi32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %4:2 = scf.for %arg5 = %c0 to %c64 step %c16 iter_args(%arg6 = %2, %arg7 = %3) -> (vector<16x16xi32>, vector<16x16xi32>) {
          %subview_0 = memref.subview %arg0[%arg3, %arg5, 0] [16, 16, 4] [1, 1, 1] : memref<64x64x4xi8> to memref<16x16x4xi8, strided<[256, 4, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg5, %arg4, 0] [16, 32, 4] [1, 1, 1] : memref<64x128x4xi8> to memref<16x32x4xi8, strided<[512, 4, 1], offset: ?>>
          %5 = vector.transfer_read %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x16x4xi8, strided<[256, 4, 1], offset: ?>>, vector<16x16x4xi8>
          %6 = vector.transfer_read %subview_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x32x4xi8, strided<[512, 4, 1], offset: ?>>, vector<16x16x4xi8>
          %7 = vector.transfer_read %subview_1[%c0, %c16, %c0], %1 {in_bounds = [true, true, true]} : memref<16x32x4xi8, strided<[512, 4, 1], offset: ?>>, vector<16x16x4xi8>
          %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %6, %arg6 {unroll_shape = array<i64: 4, 16, 16, 16>} : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
          %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %7, %arg7 {unroll_shape = array<i64: 4, 16, 16, 16>} : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
          scf.yield %8, %9 : vector<16x16xi32>, vector<16x16xi32>
        }
        vector.transfer_write %4#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @matmul_f8E4M3FN_loop(%arg0: memref<64x64x4xf8E4M3FN>, %arg1: memref<64x128x4xf8E4M3FN>, %arg2: memref<64x128xf32>) {
    %0 = ub.poison : f32
    %1 = ub.poison : f8E4M3FN
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    scf.for %arg3 = %c0 to %c64 step %c16 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [16, 32] [1, 1] : memref<64x128xf32> to memref<16x32xf32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<16x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<16x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %4:2 = scf.for %arg5 = %c0 to %c64 step %c16 iter_args(%arg6 = %2, %arg7 = %3) -> (vector<16x16xf32>, vector<16x16xf32>) {
          %subview_0 = memref.subview %arg0[%arg3, %arg5, 0] [16, 16, 4] [1, 1, 1] : memref<64x64x4xf8E4M3FN> to memref<16x16x4xf8E4M3FN, strided<[256, 4, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg5, %arg4, 0] [16, 32, 4] [1, 1, 1] : memref<64x128x4xf8E4M3FN> to memref<16x32x4xf8E4M3FN, strided<[512, 4, 1], offset: ?>>
          %5 = vector.transfer_read %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x16x4xf8E4M3FN, strided<[256, 4, 1], offset: ?>>, vector<16x16x4xf8E4M3FN>
          %6 = vector.transfer_read %subview_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x32x4xf8E4M3FN, strided<[512, 4, 1], offset: ?>>, vector<16x16x4xf8E4M3FN>
          %7 = vector.transfer_read %subview_1[%c0, %c16, %c0], %1 {in_bounds = [true, true, true]} : memref<16x32x4xf8E4M3FN, strided<[512, 4, 1], offset: ?>>, vector<16x16x4xf8E4M3FN>
          %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %6, %arg6 {unroll_shape = array<i64: 4, 16, 16, 16>} : vector<16x16x4xf8E4M3FN>, vector<16x16x4xf8E4M3FN> into vector<16x16xf32>
          %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %7, %arg7 {unroll_shape = array<i64: 4, 16, 16, 16>} : vector<16x16x4xf8E4M3FN>, vector<16x16x4xf8E4M3FN> into vector<16x16xf32>
          scf.yield %8, %9 : vector<16x16xf32>, vector<16x16xf32>
        }
        vector.transfer_write %4#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<16x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<16x32xf32, strided<[128, 1], offset: ?>>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @batch_matmul_int8_loop(%arg0: memref<16x64x64x4xi8>, %arg1: memref<16x64x128x4xi8>, %arg2: memref<16x64x128xi32>) {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c64 step %c16 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        scf.for %arg5 = %c0 to %c16 step %c1 {
          %subview = memref.subview %arg2[%arg5, %arg3, %arg4] [1, 16, 32] [1, 1, 1] : memref<16x64x128xi32> to memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>
          %2 = vector.transfer_read %subview[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>, vector<1x16x16xi32>
          %3 = vector.transfer_read %subview[%c0, %c0, %c16], %0 {in_bounds = [true, true, true]} : memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>, vector<1x16x16xi32>
          %4:2 = scf.for %arg6 = %c0 to %c64 step %c16 iter_args(%arg7 = %2, %arg8 = %3) -> (vector<1x16x16xi32>, vector<1x16x16xi32>) {
            %subview_0 = memref.subview %arg0[%arg5, %arg3, %arg6, 0] [1, 16, 16, 4] [1, 1, 1, 1] : memref<16x64x64x4xi8> to memref<1x16x16x4xi8, strided<[16384, 256, 4, 1], offset: ?>>
            %subview_1 = memref.subview %arg1[%arg5, %arg6, %arg4, 0] [1, 16, 32, 4] [1, 1, 1, 1] : memref<16x64x128x4xi8> to memref<1x16x32x4xi8, strided<[32768, 512, 4, 1], offset: ?>>
            %5 = vector.transfer_read %subview_0[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x16x4xi8, strided<[16384, 256, 4, 1], offset: ?>>, vector<1x16x16x4xi8>
            %6 = vector.transfer_read %subview_1[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x32x4xi8, strided<[32768, 512, 4, 1], offset: ?>>, vector<1x16x16x4xi8>
            %7 = vector.transfer_read %subview_1[%c0, %c0, %c16, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x32x4xi8, strided<[32768, 512, 4, 1], offset: ?>>, vector<1x16x16x4xi8>
            %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %6, %arg7 {unroll_shape = array<i64: 1, 4, 16, 16, 16>} : vector<1x16x16x4xi8>, vector<1x16x16x4xi8> into vector<1x16x16xi32>
            %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %7, %arg8 {unroll_shape = array<i64: 1, 4, 16, 16, 16>} : vector<1x16x16x4xi8>, vector<1x16x16x4xi8> into vector<1x16x16xi32>
            scf.yield %8, %9 : vector<1x16x16xi32>, vector<1x16x16xi32>
          }
          vector.transfer_write %4#1, %subview[%c0, %c0, %c16] {in_bounds = [true, true, true]} : vector<1x16x16xi32>, memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>
          vector.transfer_write %4#0, %subview[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x16x16xi32>, memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @online_packing_bf16_loop(%arg0: memref<16x64x96xbf16>, %arg1: memref<16x96x128xbf16>, %arg2: memref<64x128xf32>) -> memref<64x128xf32> {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c96 = arith.constant 96 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c64 step %c32 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [32, 32] [1, 1] : memref<64x128xf32> to memref<32x32xf32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %4 = vector.transfer_read %subview[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %5 = vector.transfer_read %subview[%c16, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %6:4 = scf.for %arg5 = %c0 to %c16 step %c1 iter_args(%arg6 = %2, %arg7 = %3, %arg8 = %4, %arg9 = %5) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
          %7:4 = scf.for %arg10 = %c0 to %c96 step %c32 iter_args(%arg11 = %arg6, %arg12 = %arg7, %arg13 = %arg8, %arg14 = %arg9) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
            %subview_0 = memref.subview %arg0[%arg5, %arg3, %arg10] [1, 32, 32] [1, 1, 1] : memref<16x64x96xbf16> to memref<1x32x32xbf16, strided<[6144, 96, 1], offset: ?>>
            %subview_1 = memref.subview %arg1[%arg5, %arg10, %arg4] [1, 32, 32] [1, 1, 1] : memref<16x96x128xbf16> to memref<1x32x32xbf16, strided<[12288, 128, 1], offset: ?>>
            %8 = vector.transfer_read %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x32x32xbf16, strided<[6144, 96, 1], offset: ?>>, vector<1x16x32xbf16>
            %9 = vector.transfer_read %subview_0[%c0, %c16, %c0], %1 {in_bounds = [true, true, true]} : memref<1x32x32xbf16, strided<[6144, 96, 1], offset: ?>>, vector<1x16x32xbf16>
            %10 = vector.transfer_read %subview_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x32x32xbf16, strided<[12288, 128, 1], offset: ?>>, vector<1x32x16xbf16>
            %11 = vector.transfer_read %subview_1[%c0, %c0, %c16], %1 {in_bounds = [true, true, true]} : memref<1x32x32xbf16, strided<[12288, 128, 1], offset: ?>>, vector<1x32x16xbf16>
            %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %10, %arg11 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
            %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %11, %arg12 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
            %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %9, %10, %arg13 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
            %15 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %9, %11, %arg14 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
            scf.yield %12, %13, %14, %15 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
          }
          scf.yield %7#0, %7#1, %7#2, %7#3 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
        }
        vector.transfer_write %6#3, %subview[%c16, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#2, %subview[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
      }
    }
    %alloc = memref.alloc() : memref<64x128xf32>
    memref.copy %arg2, %alloc : memref<64x128xf32> to memref<64x128xf32>
    return %alloc : memref<64x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @online_packing_bf16_loop_lb_non_zero(%arg0: memref<64x96xbf16>, %arg1: memref<96x128xbf16>, %arg2: memref<64x128xf32>, %arg3: index, %arg4: index) -> memref<64x128xf32> {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c96 = arith.constant 96 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg5 = %c0 to %c64 step %c32 {
      scf.for %arg6 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg5, %arg6] [32, 32] [1, 1] : memref<64x128xf32> to memref<32x32xf32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %4 = vector.transfer_read %subview[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %5 = vector.transfer_read %subview[%c16, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %6:4 = scf.for %arg7 = %arg3 to %arg4 step %c32 iter_args(%arg8 = %2, %arg9 = %3, %arg10 = %4, %arg11 = %5) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
          %subview_0 = memref.subview %arg0[%arg5, %arg7] [32, 32] [1, 1] : memref<64x96xbf16> to memref<32x32xbf16, strided<[96, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg7, %arg6] [32, 32] [1, 1] : memref<96x128xbf16> to memref<32x32xbf16, strided<[128, 1], offset: ?>>
          %7 = vector.transfer_read %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[96, 1], offset: ?>>, vector<16x32xbf16>
          %8 = vector.transfer_read %subview_0[%c16, %c0], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[96, 1], offset: ?>>, vector<16x32xbf16>
          %9 = vector.transfer_read %subview_1[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[128, 1], offset: ?>>, vector<32x16xbf16>
          %10 = vector.transfer_read %subview_1[%c0, %c16], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[128, 1], offset: ?>>, vector<32x16xbf16>
          %11 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %9, %arg8 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %10, %arg9 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %9, %arg10 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %10, %arg11 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          scf.yield %11, %12, %13, %14 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
        }
        vector.transfer_write %6#3, %subview[%c16, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#2, %subview[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
      }
    }
    %alloc = memref.alloc() : memref<64x128xf32>
    memref.copy %arg2, %alloc : memref<64x128xf32> to memref<64x128xf32>
    return %alloc : memref<64x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @online_packing_f8E5M2_matmul_loop(%arg0: memref<64x256xf8E5M2>, %arg1: memref<256x128xf8E5M2>, %arg2: memref<64x128xf32>) -> memref<64x128xf32> {
    %c16 = arith.constant 16 : index
    %0 = ub.poison : f32
    %1 = ub.poison : f8E5M2
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c32 = arith.constant 32 : index
    scf.for %arg3 = %c0 to %c64 step %c32 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [32, 32] [1, 1] : memref<64x128xf32> to memref<32x32xf32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %4 = vector.transfer_read %subview[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %5 = vector.transfer_read %subview[%c16, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %6:4 = scf.for %arg5 = %c0 to %c256 step %c64 iter_args(%arg6 = %2, %arg7 = %3, %arg8 = %4, %arg9 = %5) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
          %subview_0 = memref.subview %arg0[%arg3, %arg5] [32, 64] [1, 1] : memref<64x256xf8E5M2> to memref<32x64xf8E5M2, strided<[256, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg5, %arg4] [64, 32] [1, 1] : memref<256x128xf8E5M2> to memref<64x32xf8E5M2, strided<[128, 1], offset: ?>>
          %7 = vector.transfer_read %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x64xf8E5M2, strided<[256, 1], offset: ?>>, vector<16x64xf8E5M2>
          %8 = vector.transfer_read %subview_0[%c16, %c0], %1 {in_bounds = [true, true]} : memref<32x64xf8E5M2, strided<[256, 1], offset: ?>>, vector<16x64xf8E5M2>
          %9 = vector.transfer_read %subview_1[%c0, %c0], %1 {in_bounds = [true, true]} : memref<64x32xf8E5M2, strided<[128, 1], offset: ?>>, vector<64x16xf8E5M2>
          %10 = vector.transfer_read %subview_1[%c0, %c16], %1 {in_bounds = [true, true]} : memref<64x32xf8E5M2, strided<[128, 1], offset: ?>>, vector<64x16xf8E5M2>
          %11 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %9, %arg6 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xf8E5M2>, vector<64x16xf8E5M2> into vector<16x16xf32>
          %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %10, %arg7 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xf8E5M2>, vector<64x16xf8E5M2> into vector<16x16xf32>
          %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %9, %arg8 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xf8E5M2>, vector<64x16xf8E5M2> into vector<16x16xf32>
          %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %10, %arg9 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xf8E5M2>, vector<64x16xf8E5M2> into vector<16x16xf32>
          scf.yield %11, %12, %13, %14 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
        }
        vector.transfer_write %6#3, %subview[%c16, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#2, %subview[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
      }
    }
    %alloc = memref.alloc() : memref<64x128xf32>
    memref.copy %arg2, %alloc : memref<64x128xf32> to memref<64x128xf32>
    return %alloc : memref<64x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @brgemm_bf16_with_cano(%arg0: memref<16x32x16x2xbf16>, %arg1: memref<16x16x32x2xbf16>, %arg2: memref<32x32xf32>) -> memref<32x32xf32> {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    %2 = vector.transfer_read %arg2[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %3 = vector.transfer_read %arg2[%c0, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %4 = vector.transfer_read %arg2[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %5 = vector.transfer_read %arg2[%c16, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %6:4 = scf.for %arg3 = %c0 to %c16 step %c1 iter_args(%arg4 = %2, %arg5 = %3, %arg6 = %4, %arg7 = %5) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
      %subview = memref.subview %arg0[%arg3, 0, 0, 0] [1, 32, 16, 2] [1, 1, 1, 1] : memref<16x32x16x2xbf16> to memref<1x32x16x2xbf16, strided<[1024, 32, 2, 1], offset: ?>>
      %subview_0 = memref.subview %arg1[%arg3, 0, 0, 0] [1, 16, 32, 2] [1, 1, 1, 1] : memref<16x16x32x2xbf16> to memref<1x16x32x2xbf16, strided<[1024, 64, 2, 1], offset: ?>>
      %7 = vector.transfer_read %subview[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16, strided<[1024, 32, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
      %8 = vector.transfer_read %subview[%c0, %c16, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16, strided<[1024, 32, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
      %9 = vector.transfer_read %subview_0[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16, strided<[1024, 64, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
      %10 = vector.transfer_read %subview_0[%c0, %c0, %c16, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16, strided<[1024, 64, 2, 1], offset: ?>>, vector<1x16x16x2xbf16>
      %11 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %9, %arg4 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
      %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %10, %arg5 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
      %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %9, %arg6 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
      %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %10, %arg7 {unroll_shape = array<i64: 1, 2, 16, 16, 16>} : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xf32>
      scf.yield %11, %12, %13, %14 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
    }
    vector.transfer_write %6#3, %arg2[%c16, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    vector.transfer_write %6#2, %arg2[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    vector.transfer_write %6#1, %arg2[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    vector.transfer_write %6#0, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    %alloc = memref.alloc() : memref<32x32xf32>
    memref.copy %arg2, %alloc : memref<32x32xf32> to memref<32x32xf32>
    return %alloc : memref<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @online_packing_int8_matmul_loop(%arg0: memref<64x256xi8>, %arg1: memref<256x128xi8>, %arg2: memref<64x128xi32>) -> memref<64x128xi32> {
    %c16 = arith.constant 16 : index
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant dense<13> : vector<16x16xi32>
    scf.for %arg3 = %c0 to %c64 step %c32 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [32, 32] [1, 1] : memref<64x128xi32> to memref<32x32xi32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<32x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %4 = vector.transfer_read %subview[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %5 = vector.transfer_read %subview[%c16, %c16], %0 {in_bounds = [true, true]} : memref<32x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %6:4 = scf.for %arg5 = %c0 to %c256 step %c64 iter_args(%arg6 = %2, %arg7 = %3, %arg8 = %4, %arg9 = %5) -> (vector<16x16xi32>, vector<16x16xi32>, vector<16x16xi32>, vector<16x16xi32>) {
          %subview_0 = memref.subview %arg0[%arg3, %arg5] [32, 64] [1, 1] : memref<64x256xi8> to memref<32x64xi8, strided<[256, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg5, %arg4] [64, 32] [1, 1] : memref<256x128xi8> to memref<64x32xi8, strided<[128, 1], offset: ?>>
          %11 = vector.transfer_read %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x64xi8, strided<[256, 1], offset: ?>>, vector<16x64xi8>
          %12 = vector.transfer_read %subview_0[%c16, %c0], %1 {in_bounds = [true, true]} : memref<32x64xi8, strided<[256, 1], offset: ?>>, vector<16x64xi8>
          %13 = vector.transfer_read %subview_1[%c0, %c0], %1 {in_bounds = [true, true]} : memref<64x32xi8, strided<[128, 1], offset: ?>>, vector<64x16xi8>
          %14 = vector.transfer_read %subview_1[%c0, %c16], %1 {in_bounds = [true, true]} : memref<64x32xi8, strided<[128, 1], offset: ?>>, vector<64x16xi8>
          %15 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %11, %13, %arg6 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          %16 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %11, %14, %arg7 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          %17 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %12, %13, %arg8 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          %18 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %12, %14, %arg9 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          scf.yield %15, %16, %17, %18 : vector<16x16xi32>, vector<16x16xi32>, vector<16x16xi32>, vector<16x16xi32>
        }
        %7 = arith.addi %6#3, %cst : vector<16x16xi32>
        %8 = arith.addi %6#2, %cst : vector<16x16xi32>
        %9 = arith.addi %6#1, %cst : vector<16x16xi32>
        %10 = arith.addi %6#0, %cst : vector<16x16xi32>
        vector.transfer_write %7, %subview[%c16, %c16] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %8, %subview[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %9, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %10, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32, strided<[128, 1], offset: ?>>
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
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_invalid_vc_kind(%arg0: memref<1x32x16x4xi8>, %arg1: memref<1x16x32x4xi8>, %arg2: memref<32x32xi32>) -> memref<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x4xi8>, vector<1x16x16x4xi8>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x4xi8>, vector<1x16x16x4xi8>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xi32>, vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<mul>} %2, %3, %4 : vector<1x16x16x4xi8>, vector<1x16x16x4xi8> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32>
    return %arg2 : memref<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_wrong_dimensions(%arg0: memref<1x32x16x2xbf16>, %arg1: memref<1x16x32x2xbf16>, %arg2: memref<1x32x32xf32>) -> memref<1x32x32xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16>, vector<1x32x16x2xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16>, vector<1x16x32x2xbf16>
    %4 = vector.transfer_read %arg2[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<1x32x32xf32>, vector<1x32x32xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x32x16x2xbf16>, vector<1x16x32x2xbf16> into vector<1x32x32xf32>
    vector.transfer_write %5, %arg2[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x32x32xf32>, memref<1x32x32xf32>
    return %arg2 : memref<1x32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_no_memref_source_LHS(%arg0: vector<16x16x4xi8>, %arg1: memref<16x32x4xi8>, %arg2: memref<32x32xi32>) -> memref<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<16x32x4xi8>, vector<16x16x4xi8>
    %3 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xi32>, vector<16x16xi32>
    %4 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %arg0, %2, %3 : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
    vector.transfer_write %4, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32>
    return %arg2 : memref<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_wrong_dimensions_online_packing(%arg0: memref<1x32x32xbf16>, %arg1: memref<1x32x32xbf16>, %arg2: memref<32x32xf32>) -> memref<32x32xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x32x32xbf16>, vector<1x16x32xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x32x32xbf16>, vector<1x32x32xbf16>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x32xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x32xbf16>, vector<1x32x32xbf16> into vector<16x32xf32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x32xf32>, memref<32x32xf32>
    return %arg2 : memref<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_VCs_LHS_src_differ(%arg0: memref<64x64x4xi8>, %arg1: memref<64x128x4xi8>, %arg2: memref<64x128xi32>, %arg3: memref<64x64x4xi8>) {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    scf.for %arg4 = %c0 to %c64 step %c16 {
      scf.for %arg5 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg4, %arg5] [16, 32] [1, 1] : memref<64x128xi32> to memref<16x32xi32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %4:2 = scf.for %arg6 = %c0 to %c64 step %c16 iter_args(%arg7 = %2, %arg8 = %3) -> (vector<16x16xi32>, vector<16x16xi32>) {
          %subview_0 = memref.subview %arg0[%arg4, %arg6, 0] [16, 16, 4] [1, 1, 1] : memref<64x64x4xi8> to memref<16x16x4xi8, strided<[256, 4, 1], offset: ?>>
          %subview_1 = memref.subview %arg3[%arg4, %arg6, 0] [16, 16, 4] [1, 1, 1] : memref<64x64x4xi8> to memref<16x16x4xi8, strided<[256, 4, 1], offset: ?>>
          %subview_2 = memref.subview %arg1[%arg6, %arg5, 0] [16, 32, 4] [1, 1, 1] : memref<64x128x4xi8> to memref<16x32x4xi8, strided<[512, 4, 1], offset: ?>>
          %5 = vector.transfer_read %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x16x4xi8, strided<[256, 4, 1], offset: ?>>, vector<16x16x4xi8>
          %6 = vector.transfer_read %subview_1[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x16x4xi8, strided<[256, 4, 1], offset: ?>>, vector<16x16x4xi8>
          %7 = vector.transfer_read %subview_2[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x32x4xi8, strided<[512, 4, 1], offset: ?>>, vector<16x16x4xi8>
          %8 = vector.transfer_read %subview_2[%c0, %c16, %c0], %1 {in_bounds = [true, true, true]} : memref<16x32x4xi8, strided<[512, 4, 1], offset: ?>>, vector<16x16x4xi8>
          %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %7, %arg7 {unroll_shape = array<i64: 4, 16, 16, 16>} : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
          %10 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %6, %8, %arg8 {unroll_shape = array<i64: 4, 16, 16, 16>} : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
          scf.yield %9, %10 : vector<16x16xi32>, vector<16x16xi32>
        }
        vector.transfer_write %4#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_wrong_N_dim(%arg0: memref<16x64x64x4xi8>, %arg1: memref<16x64x128x4xi8>, %arg2: memref<16x64x128xi32>) {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c64 step %c16 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        scf.for %arg5 = %c0 to %c16 step %c1 {
          %subview = memref.subview %arg2[%arg5, %arg3, %arg4] [1, 16, 32] [1, 1, 1] : memref<16x64x128xi32> to memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>
          %2 = vector.transfer_read %subview[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>, vector<1x16x32xi32>
          %3 = scf.for %arg6 = %c0 to %c64 step %c16 iter_args(%arg7 = %2) -> (vector<1x16x32xi32>) {
            %subview_0 = memref.subview %arg0[%arg5, %arg3, %arg6, 0] [1, 16, 16, 4] [1, 1, 1, 1] : memref<16x64x64x4xi8> to memref<1x16x16x4xi8, strided<[16384, 256, 4, 1], offset: ?>>
            %subview_1 = memref.subview %arg1[%arg5, %arg6, %arg4, 0] [1, 16, 32, 4] [1, 1, 1, 1] : memref<16x64x128x4xi8> to memref<1x16x32x4xi8, strided<[32768, 512, 4, 1], offset: ?>>
            %4 = vector.transfer_read %subview_0[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x16x4xi8, strided<[16384, 256, 4, 1], offset: ?>>, vector<1x16x16x4xi8>
            %5 = vector.transfer_read %subview_1[%c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true]} : memref<1x16x32x4xi8, strided<[32768, 512, 4, 1], offset: ?>>, vector<1x16x32x4xi8>
            %6 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %4, %5, %arg7 {unroll_shape = array<i64: 1, 4, 16, 32, 16>} : vector<1x16x16x4xi8>, vector<1x16x32x4xi8> into vector<1x16x32xi32>
            scf.yield %6 : vector<1x16x32xi32>
          }
          vector.transfer_write %3, %subview[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x16x32xi32>, memref<1x16x32xi32, strided<[8192, 128, 1], offset: ?>>
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_online_packing_bf16_dynamic_loop_step(%arg0: memref<64x96xbf16>, %arg1: memref<96x128xbf16>, %arg2: memref<64x128xf32>, %arg3: index) -> memref<64x128xf32> {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c96 = arith.constant 96 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg4 = %c0 to %c64 step %c32 {
      scf.for %arg5 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg4, %arg5] [32, 32] [1, 1] : memref<64x128xf32> to memref<32x32xf32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %4 = vector.transfer_read %subview[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %5 = vector.transfer_read %subview[%c16, %c16], %0 {in_bounds = [true, true]} : memref<32x32xf32, strided<[128, 1], offset: ?>>, vector<16x16xf32>
        %6:4 = scf.for %arg6 = %c0 to %c32 step %arg3 iter_args(%arg7 = %2, %arg8 = %3, %arg9 = %4, %arg10 = %5) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
          %subview_0 = memref.subview %arg0[%arg4, %arg6] [32, 32] [1, 1] : memref<64x96xbf16> to memref<32x32xbf16, strided<[96, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg6, %arg5] [32, 32] [1, 1] : memref<96x128xbf16> to memref<32x32xbf16, strided<[128, 1], offset: ?>>
          %7 = vector.transfer_read %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[96, 1], offset: ?>>, vector<16x32xbf16>
          %8 = vector.transfer_read %subview_0[%c16, %c0], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[96, 1], offset: ?>>, vector<16x32xbf16>
          %9 = vector.transfer_read %subview_1[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[128, 1], offset: ?>>, vector<32x16xbf16>
          %10 = vector.transfer_read %subview_1[%c0, %c16], %1 {in_bounds = [true, true]} : memref<32x32xbf16, strided<[128, 1], offset: ?>>, vector<32x16xbf16>
          %11 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %9, %arg7 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %10, %arg8 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %9, %arg9 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %10, %arg10 {unroll_shape = array<i64: 1, 16, 16, 32>} : vector<16x32xbf16>, vector<32x16xbf16> into vector<16x16xf32>
          scf.yield %11, %12, %13, %14 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
        }
        vector.transfer_write %6#3, %subview[%c16, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#2, %subview[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
        vector.transfer_write %6#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32, strided<[128, 1], offset: ?>>
      }
    }
    %alloc = memref.alloc() : memref<64x128xf32>
    memref.copy %arg2, %alloc : memref<64x128xf32> to memref<64x128xf32>
    return %alloc : memref<64x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_reduction_loop_depth_3(%arg0: memref<2x16x64x64x4xi8>, %arg1: memref<2x16x64x128x4xi8>, %arg2: memref<64x128xi32>) attributes {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"reg_gemm_unroll" = [16, 16, 16]>>} {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c2 = arith.constant 2 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c64 step %c16 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [16, 32] [1, 1] : memref<64x128xi32> to memref<16x32xi32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %4:2 = scf.for %arg5 = %c0 to %c2 step %c1 iter_args(%arg6 = %2, %arg7 = %3) -> (vector<16x16xi32>, vector<16x16xi32>) {
          %5:2 = scf.for %arg8 = %c0 to %c16 step %c1 iter_args(%arg9 = %arg6, %arg10 = %arg7) -> (vector<16x16xi32>, vector<16x16xi32>) {
            %6:2 = scf.for %arg11 = %c0 to %c64 step %c16 iter_args(%arg12 = %arg9, %arg13 = %arg10) -> (vector<16x16xi32>, vector<16x16xi32>) {
              %subview_0 = memref.subview %arg0[%arg5, %arg8, %arg3, %arg11, 0] [1, 1, 16, 16, 4] [1, 1, 1, 1, 1] : memref<2x16x64x64x4xi8> to memref<1x1x16x16x4xi8, strided<[262144, 16384, 256, 4, 1], offset: ?>>
              %subview_1 = memref.subview %arg1[%arg5, %arg8, %arg11, %arg4, 0] [1, 1, 16, 32, 4] [1, 1, 1, 1, 1] : memref<2x16x64x128x4xi8> to memref<1x1x16x32x4xi8, strided<[524288, 32768, 512, 4, 1], offset: ?>>
              %7 = vector.transfer_read %subview_0[%c0, %c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true, true]} : memref<1x1x16x16x4xi8, strided<[262144, 16384, 256, 4, 1], offset: ?>>, vector<1x1x16x16x4xi8>
              %8 = vector.transfer_read %subview_1[%c0, %c0, %c0, %c0, %c0], %1 {in_bounds = [true, true, true, true, true]} : memref<1x1x16x32x4xi8, strided<[524288, 32768, 512, 4, 1], offset: ?>>, vector<1x1x16x16x4xi8>
              %9 = vector.transfer_read %subview_1[%c0, %c0, %c0, %c16, %c0], %1 {in_bounds = [true, true, true, true, true]} : memref<1x1x16x32x4xi8, strided<[524288, 32768, 512, 4, 1], offset: ?>>, vector<1x1x16x16x4xi8>
              %10 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %8, %arg12 {unroll_shape = array<i64: 1, 1, 4, 16, 16, 16>} : vector<1x1x16x16x4xi8>, vector<1x1x16x16x4xi8> into vector<16x16xi32>
              %11 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %7, %9, %arg13 {unroll_shape = array<i64: 1, 1, 4, 16, 16, 16>} : vector<1x1x16x16x4xi8>, vector<1x1x16x16x4xi8> into vector<16x16xi32>
              scf.yield %10, %11 : vector<16x16xi32>, vector<16x16xi32>
            }
            scf.yield %6#0, %6#1 : vector<16x16xi32>, vector<16x16xi32>
          }
          scf.yield %5#0, %5#1 : vector<16x16xi32>, vector<16x16xi32>
        }
        vector.transfer_write %4#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_wrong_type_f16(%arg0: memref<1x32x16x2xf16>, %arg1: memref<1x16x32x2xf16>, %arg2: memref<32x32xf32>) -> memref<32x32xf32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : f16
    %1 = ub.poison : f32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xf16>, vector<1x16x16x2xf16>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xf16>, vector<1x16x16x2xf16>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xf32>, vector<16x16xf32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x16x2xf16>, vector<1x16x16x2xf16> into vector<16x16xf32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<32x32xf32>
    return %arg2 : memref<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_wrong_acc_type_bf16(%arg0: memref<1x32x16x2xbf16>, %arg1: memref<1x16x32x2xbf16>, %arg2: memref<32x32xbf16>) -> memref<32x32xbf16> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : bf16
    %1 = ub.poison : bf16
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x32x16x2xbf16>, vector<1x16x16x2xbf16>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0, %c0], %0 {in_bounds = [true, true, true, true]} : memref<1x16x32x2xbf16>, vector<1x16x16x2xbf16>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xbf16>, vector<16x16xbf16>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<1x16x16x2xbf16>, vector<1x16x16x2xbf16> into vector<16x16xbf16>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xbf16>, memref<32x32xbf16>
    return %arg2 : memref<32x32xbf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_vc_wrong_order_no_pair(%arg0: memref<64x256xi8>, %arg1: memref<256x128xi8>, %arg2: memref<64x128xi32>) -> memref<64x128xi32> {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    scf.for %arg3 = %c0 to %c64 step %c16 {
      scf.for %arg4 = %c0 to %c128 step %c32 {
        %subview = memref.subview %arg2[%arg3, %arg4] [16, 32] [1, 1] : memref<64x128xi32> to memref<16x32xi32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %3 = vector.transfer_read %subview[%c0, %c16], %0 {in_bounds = [true, true]} : memref<16x32xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %4:2 = scf.for %arg5 = %c0 to %c256 step %c64 iter_args(%arg6 = %2, %arg7 = %3) -> (vector<16x16xi32>, vector<16x16xi32>) {
          %subview_0 = memref.subview %arg0[%arg3, %arg5] [16, 64] [1, 1] : memref<64x256xi8> to memref<16x64xi8, strided<[256, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg5, %arg4] [64, 32] [1, 1] : memref<256x128xi8> to memref<64x32xi8, strided<[128, 1], offset: ?>>
          %5 = vector.transfer_read %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : memref<16x64xi8, strided<[256, 1], offset: ?>>, vector<16x64xi8>
          %6 = vector.transfer_read %subview_1[%c0, %c0], %1 {in_bounds = [true, true]} : memref<64x32xi8, strided<[128, 1], offset: ?>>, vector<64x16xi8>
          %7 = vector.transfer_read %subview_1[%c0, %c16], %1 {in_bounds = [true, true]} : memref<64x32xi8, strided<[128, 1], offset: ?>>, vector<64x16xi8>
          %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %7, %arg7 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %6, %arg6 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          scf.yield %9, %8 : vector<16x16xi32>, vector<16x16xi32>
        }
        vector.transfer_write %4#1, %subview[%c0, %c16] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<16x32xi32, strided<[128, 1], offset: ?>>
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
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_vc_no_pair(%arg0: memref<64x256xi8>, %arg1: memref<256x128xi8>, %arg2: memref<64x128xi32>) -> memref<64x128xi32> {
    %0 = ub.poison : i32
    %1 = ub.poison : i8
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c32 = arith.constant 32 : index
    %c16 = arith.constant 16 : index
    scf.for %arg3 = %c0 to %c64 step %c32 {
      scf.for %arg4 = %c0 to %c128 step %c16 {
        %subview = memref.subview %arg2[%arg3, %arg4] [32, 16] [1, 1] : memref<64x128xi32> to memref<32x16xi32, strided<[128, 1], offset: ?>>
        %2 = vector.transfer_read %subview[%c0, %c0], %0 {in_bounds = [true, true]} : memref<32x16xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %3 = vector.transfer_read %subview[%c16, %c0], %0 {in_bounds = [true, true]} : memref<32x16xi32, strided<[128, 1], offset: ?>>, vector<16x16xi32>
        %4:2 = scf.for %arg5 = %c0 to %c256 step %c64 iter_args(%arg6 = %2, %arg7 = %3) -> (vector<16x16xi32>, vector<16x16xi32>) {
          %subview_0 = memref.subview %arg0[%arg3, %arg5] [32, 64] [1, 1] : memref<64x256xi8> to memref<32x64xi8, strided<[256, 1], offset: ?>>
          %subview_1 = memref.subview %arg1[%arg5, %arg4] [64, 16] [1, 1] : memref<256x128xi8> to memref<64x16xi8, strided<[128, 1], offset: ?>>
          %5 = vector.transfer_read %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x64xi8, strided<[256, 1], offset: ?>>, vector<16x64xi8>
          %6 = vector.transfer_read %subview_0[%c16, %c0], %1 {in_bounds = [true, true]} : memref<32x64xi8, strided<[256, 1], offset: ?>>, vector<16x64xi8>
          %7 = vector.transfer_read %subview_1[%c0, %c0], %1 {in_bounds = [true, true]} : memref<64x16xi8, strided<[128, 1], offset: ?>>, vector<64x16xi8>
          %8 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %5, %7, %arg6 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          %9 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %6, %7, %arg7 {unroll_shape = array<i64: 16, 16, 64>} : vector<16x64xi8>, vector<64x16xi8> into vector<16x16xi32>
          scf.yield %8, %9 : vector<16x16xi32>, vector<16x16xi32>
        }
        vector.transfer_write %4#1, %subview[%c16, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x16xi32, strided<[128, 1], offset: ?>>
        vector.transfer_write %4#0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x16xi32, strided<[128, 1], offset: ?>>
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
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_no_read_op_source(%arg0: memref<16x64x32xbf16>, %arg1: memref<16x32x128xbf16>, %arg2: memref<64x32xf32>) {
    %0 = ub.poison : f32
    %1 = ub.poison : bf16
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c64 step %c32 {
      %2 = vector.transfer_read %arg2[%arg3, %c0], %0 {in_bounds = [true, true]} : memref<64x32xf32>, vector<16x16xf32>
      %3 = vector.transfer_read %arg2[%arg3, %c16], %0 {in_bounds = [true, true]} : memref<64x32xf32>, vector<16x16xf32>
      %4 = arith.addi %arg3, %c16 : index
      %5 = vector.transfer_read %arg2[%4, %c0], %0 {in_bounds = [true, true]} : memref<64x32xf32>, vector<16x16xf32>
      %6 = vector.transfer_read %arg2[%4, %c16], %0 {in_bounds = [true, true]} : memref<64x32xf32>, vector<16x16xf32>
      %7:4 = scf.for %arg4 = %c0 to %c16 step %c1 iter_args(%arg5 = %2, %arg6 = %3, %arg7 = %5, %arg8 = %6) -> (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) {
        %8 = vector.transfer_read %arg0[%arg4, %arg3, %c0], %1 {in_bounds = [true, true, true]} : memref<16x64x32xbf16>, vector<1x16x32xbf16>
        %9 = vector.transfer_read %arg0[%arg4, %4, %c0], %1 {in_bounds = [true, true, true]} : memref<16x64x32xbf16>, vector<1x16x32xbf16>
        %10 = vector.transfer_read %arg1[%arg4, %c0, %c0], %1 {in_bounds = [true, true, true]} : memref<16x32x128xbf16>, vector<1x32x16xbf16>
        %11 = vector.transfer_read %arg1[%arg4, %c0, %c16], %1 {in_bounds = [true, true, true]} : memref<16x32x128xbf16>, vector<1x32x16xbf16>
        %12 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %10, %arg5 : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
        %13 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %8, %11, %arg6 : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
        %14 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %9, %10, %arg7 : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
        %15 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %9, %11, %arg8 : vector<1x16x32xbf16>, vector<1x32x16xbf16> into vector<16x16xf32>
        scf.yield %12, %13, %14, %15 : vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>
      }
      vector.transfer_write %7#3, %arg2[%4, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<64x32xf32>
      vector.transfer_write %7#2, %arg2[%4, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<64x32xf32>
      vector.transfer_write %7#1, %arg2[%arg3, %c16] {in_bounds = [true, true]} : vector<16x16xf32>, memref<64x32xf32>
      vector.transfer_write %7#0, %arg2[%arg3, %c0] {in_bounds = [true, true]} : vector<16x16xf32>, memref<64x32xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_lhs_tensor(%arg0: tensor<32x16x4xi8>, %arg1: memref<16x32x4xi8>, %arg2: memref<32x32xi32>) -> memref<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : tensor<32x16x4xi8>, vector<16x16x4xi8>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<16x32x4xi8>, vector<16x16x4xi8>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xi32>, vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32>
    return %arg2 : memref<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_rhs_tensor(%arg0: memref<32x16x4xi8>, %arg1: tensor<16x32x4xi8>, %arg2: memref<32x32xi32>) -> memref<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<32x16x4xi8>, vector<16x16x4xi8>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : tensor<16x32x4xi8>, vector<16x16x4xi8>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : memref<32x32xi32>, vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
    vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, memref<32x32xi32>
    return %arg2 : memref<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
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
  func.func @negative_acc_tensor(%arg0: memref<32x16x4xi8>, %arg1: memref<16x32x4xi8>, %arg2: tensor<32x32xi32>) -> tensor<32x32xi32> {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : i8
    %1 = ub.poison : i32
    %2 = vector.transfer_read %arg0[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<32x16x4xi8>, vector<16x16x4xi8>
    %3 = vector.transfer_read %arg1[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : memref<16x32x4xi8>, vector<16x16x4xi8>
    %4 = vector.transfer_read %arg2[%c0, %c0], %1 {in_bounds = [true, true]} : tensor<32x32xi32>, vector<16x16xi32>
    %5 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %2, %3, %4 : vector<16x16x4xi8>, vector<16x16x4xi8> into vector<16x16xi32>
    %6 = vector.transfer_write %5, %arg2[%c0, %c0] {in_bounds = [true, true]} : vector<16x16xi32>, tensor<32x32xi32>
    return %6 : tensor<32x32xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.x86.vector_contract_to_amx_dot_product
      } : !transform.any_op
      transform.yield 
    }
  }
}

