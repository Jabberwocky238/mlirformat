module {
  func.func @main() {
    %0 = tensor.empty() : tensor<7x16xi32>
    %1 = tensor.empty() : tensor<16x13xi32>
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %2 = linalg.fill ins(%c3_i32 : i32) outs(%0 : tensor<7x16xi32>) -> tensor<7x16xi32>
    %3 = linalg.fill ins(%c4_i32 : i32) outs(%1 : tensor<16x13xi32>) -> tensor<16x13xi32>
    %cst = arith.constant dense<[[1, 8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, 85], [2, 9, 16, 23, 30, 37, 44, 51, 58, 65, 72, 79, 86], [3, 10, 17, 24, 31, 38, 45, 52, 59, 66, 73, 80, 87], [4, 11, 18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88], [5, 12, 19, 26, 33, 40, 47, 54, 61, 68, 75, 82, 89], [6, 13, 20, 27, 34, 41, 48, 55, 62, 69, 76, 83, 90], [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91]]> : tensor<7x13xi32>
    %4 = call @mmt4d(%2, %3, %cst) : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %cast = tensor.cast %4 : tensor<7x13xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    %5 = call @matmul(%2, %3, %cst) : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %cast_0 = tensor.cast %5 : tensor<7x13xi32> to tensor<*xi32>
    call @printMemrefI32(%cast_0) : (tensor<*xi32>) -> ()
    return
  }
  func.func private @matmul(%arg0: tensor<7x16xi32>, %arg1: tensor<16x13xi32>, %arg2: tensor<7x13xi32>) -> tensor<7x13xi32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<7x16xi32>, tensor<16x13xi32>) outs(%arg2 : tensor<7x13xi32>) -> tensor<7x13xi32>
    return %0 : tensor<7x13xi32>
  }
  func.func private @mmt4d(%arg0: tensor<7x16xi32>, %arg1: tensor<16x13xi32>, %arg2: tensor<7x13xi32>) -> tensor<7x13xi32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = tensor.empty() : tensor<1x16x8x1xi32>
    %1 = tensor.empty() : tensor<2x16x8x1xi32>
    %2 = tensor.empty() : tensor<1x2x8x8xi32>
    %pack = linalg.pack %arg0 padding_value(%c0_i32 : i32) inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %0 : tensor<7x16xi32> -> tensor<1x16x8x1xi32>
    %pack_0 = linalg.pack %arg1 padding_value(%c0_i32 : i32) outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [8, 1] into %1 : tensor<16x13xi32> -> tensor<2x16x8x1xi32>
    %pack_1 = linalg.pack %arg2 padding_value(%c0_i32 : i32) outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %2 : tensor<7x13xi32> -> tensor<1x2x8x8xi32>
    %3 = linalg.mmt4d ins(%pack, %pack_0 : tensor<1x16x8x1xi32>, tensor<2x16x8x1xi32>) outs(%pack_1 : tensor<1x2x8x8xi32>) -> tensor<1x2x8x8xi32>
    %4 = tensor.empty() : tensor<7x13xi32>
    %unpack = linalg.unpack %3 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %4 : tensor<1x2x8x8xi32> -> tensor<7x13xi32>
    return %unpack : tensor<7x13xi32>
  }
  module @transforms attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.collect_matching @match_mmt4d in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [1, 1, 0, 8, 8, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %tiled_linalg_op tile_sizes [0, 0, 1, 0, 0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_linalg_op_0 : !transform.any_op
      transform.apply_patterns to %1 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.op<"func.func">
      %2 = transform.structured.hoist_redundant_vector_transfers %1 : (!transform.op<"func.func">) -> !transform.op<"func.func">
      %3 = transform.structured.match interface{LoopLikeInterface} in %2 : (!transform.op<"func.func">) -> !transform.any_op
      transform.apply_licm to %3 : !transform.any_op
      transform.loop.hoist_loop_invariant_subsets %3 : !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.cast_away_vector_leading_one_dim
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      %4 = transform.structured.match ops{["linalg.pack"]} in %2 : (!transform.op<"func.func">) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %4 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      %5 = transform.structured.match ops{["linalg.unpack"]} in %2 : (!transform.op<"func.func">) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op_2, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %5 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      transform.yield 
    }
    transform.named_sequence @match_mmt4d(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
      transform.match.operation_name %arg0 ["linalg.mmt4d"] : !transform.any_op
      transform.yield %arg0 : !transform.any_op
    }
  }
  func.func private @printMemrefI32(tensor<*xi32>)
}

