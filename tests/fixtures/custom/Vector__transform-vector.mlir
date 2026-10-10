module {
  func.func @matmul_tensors(%arg0: tensor<8x16xf32>, %arg1: tensor<16x32xf32>, %arg2: tensor<8x32xf32>) -> tensor<8x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<8x16xf32>, tensor<16x32xf32>) outs(%arg2 : tensor<8x32xf32>) -> tensor<8x32xf32>
    return %0 : tensor<8x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [8, 4, 2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_parent_op %tiled_linalg_op {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      %3 = transform.bufferization.one_shot_bufferize layout{IdentityLayoutMap} %arg0 {allow_return_allocs = true, bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["func.func"]} in %3 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.lower_contraction
      } : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.lower_multi_reduction
      } : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.split_transfer_full_partial
      } : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.transfer_to_scf full_unroll = true
      } : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.lower_transfer
      } : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.lower_shape_cast
      } : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.lower_transpose lowering_strategy = shuffle_1d
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
  func.func @fold_arith_extf_into_contract(%arg0: vector<64x64xf16>, %arg1: vector<64x64xf16>, %arg2: vector<64x64xf32>) -> vector<64x64xf32> {
    %0 = arith.extf %arg0 : vector<64x64xf16> to vector<64x64xf32>
    %1 = arith.extf %arg1 : vector<64x64xf16> to vector<64x64xf32>
    %2 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %arg2 : vector<64x64xf32>, vector<64x64xf32> into vector<64x64xf32>
    return %2 : vector<64x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.fold_arith_extension
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @arith_to_outerproduct_scalable_i32(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>) -> vector<[4]x[4]xi32> {
    %0 = vector.broadcast %arg0 : vector<[4]xi32> to vector<[4]x[4]xi32>
    %1 = vector.transpose %0, [1, 0] : vector<[4]x[4]xi32> to vector<[4]x[4]xi32>
    %2 = vector.broadcast %arg1 : vector<[4]xi32> to vector<[4]x[4]xi32>
    %3 = arith.muli %1, %2 : vector<[4]x[4]xi32>
    return %3 : vector<[4]x[4]xi32>
  }
  func.func @arith_to_outerproduct_trans_rhs_f32(%arg0: vector<16xf32>, %arg1: vector<8xf32>) -> vector<8x16xf32> {
    %0 = vector.broadcast %arg1 : vector<8xf32> to vector<16x8xf32>
    %1 = vector.transpose %0, [1, 0] : vector<16x8xf32> to vector<8x16xf32>
    %2 = vector.broadcast %arg0 : vector<16xf32> to vector<8x16xf32>
    %3 = arith.mulf %2, %1 : vector<8x16xf32>
    return %3 : vector<8x16xf32>
  }
  func.func @negative_non_vector_type(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.mulf %arg0, %arg1 : f32
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.elementwise_to_vector
      } : !transform.any_op
      transform.yield 
    }
  }
}

