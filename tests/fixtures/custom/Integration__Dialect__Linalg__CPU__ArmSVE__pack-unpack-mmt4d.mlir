module {
  func.func @main() {
    %0 = tensor.empty() : tensor<7x16xi32>
    %1 = tensor.empty() : tensor<16x13xi32>
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %2 = linalg.fill ins(%c3_i32 : i32) outs(%0 : tensor<7x16xi32>) -> tensor<7x16xi32>
    %3 = linalg.fill ins(%c4_i32 : i32) outs(%1 : tensor<16x13xi32>) -> tensor<16x13xi32>
    %cst = arith.constant dense<[[1, 8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, 85], [2, 9, 16, 23, 30, 37, 44, 51, 58, 65, 72, 79, 86], [3, 10, 17, 24, 31, 38, 45, 52, 59, 66, 73, 80, 87], [4, 11, 18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88], [5, 12, 19, 26, 33, 40, 47, 54, 61, 68, 75, 82, 89], [6, 13, 20, 27, 34, 41, 48, 55, 62, 69, 76, 83, 90], [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91]]> : tensor<7x13xi32>
    %4 = call @matmul_via_mmt4d(%2, %3, %cst) : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %cast = tensor.cast %4 : tensor<7x13xi32> to tensor<*xi32>
    vector.print str "--------------------------\0A"
    vector.print str "RESULT FROM linalg.mmt4d:\0A"
    vector.print str "--------------------------\0A"
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    %5 = call @matmul(%2, %3, %cst) : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %cast_0 = tensor.cast %5 : tensor<7x13xi32> to tensor<*xi32>
    vector.print str "\0A--------------------------\0A"
    vector.print str "RESULT FROM linalg.matmul:\0A"
    vector.print str "--------------------------\0A"
    call @printMemrefI32(%cast_0) : (tensor<*xi32>) -> ()
    return
  }
  func.func private @matmul(%arg0: tensor<7x16xi32>, %arg1: tensor<16x13xi32>, %arg2: tensor<7x13xi32>) -> tensor<7x13xi32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<7x16xi32>, tensor<16x13xi32>) outs(%arg2 : tensor<7x13xi32>) -> tensor<7x13xi32>
    return %0 : tensor<7x13xi32>
  }
  func.func private @pack_lhs(%arg0: tensor<7x16xi32>) -> tensor<1x16x8x1xi32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = tensor.empty() : tensor<1x16x8x1xi32>
    %pack = linalg.pack %arg0 padding_value(%c0_i32 : i32) inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %0 : tensor<7x16xi32> -> tensor<1x16x8x1xi32>
    return %pack : tensor<1x16x8x1xi32>
  }
  func.func private @pack_rhs(%arg0: tensor<16x13xi32>) -> tensor<?x16x?x1xi32> {
    %c0_i32 = arith.constant 0 : i32
    %vscale = vector.vscale
    %c8 = arith.constant 8 : index
    %c8_vscale = arith.muli %vscale, %c8 : index
    %c13 = arith.constant 13 : index
    %0 = arith.ceildivui %c13, %c8_vscale : index
    %1 = tensor.empty(%0, %c8_vscale) : tensor<?x16x?x1xi32>
    %pack = linalg.pack %arg0 padding_value(%c0_i32 : i32) outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [%c8_vscale, 1] into %1 : tensor<16x13xi32> -> tensor<?x16x?x1xi32>
    return %pack : tensor<?x16x?x1xi32>
  }
  func.func private @pack_acc(%arg0: tensor<7x13xi32>) -> tensor<1x?x8x?xi32> {
    %c0_i32 = arith.constant 0 : i32
    %c13 = arith.constant 13 : index
    %vscale = vector.vscale
    %c8 = arith.constant 8 : index
    %c8_vscale = arith.muli %vscale, %c8 : index
    %0 = arith.ceildivui %c13, %c8_vscale : index
    %1 = tensor.empty(%0, %c8_vscale) : tensor<1x?x8x?xi32>
    %pack = linalg.pack %arg0 padding_value(%c0_i32 : i32) outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, %c8_vscale] into %1 : tensor<7x13xi32> -> tensor<1x?x8x?xi32>
    return %pack : tensor<1x?x8x?xi32>
  }
  func.func private @unpack_acc(%arg0: tensor<1x?x8x?xi32>) -> tensor<7x13xi32> {
    %vscale = vector.vscale
    %c8 = arith.constant 8 : index
    %c8_vscale = arith.muli %vscale, %c8 : index
    %0 = tensor.empty() : tensor<7x13xi32>
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, %c8_vscale] into %0 : tensor<1x?x8x?xi32> -> tensor<7x13xi32>
    return %unpack : tensor<7x13xi32>
  }
  func.func private @print_pack_A(%arg0: tensor<1x16x8x1xi32>) {
    %cast = tensor.cast %arg0 : tensor<1x16x8x1xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
  func.func private @print_pack_B(%arg0: tensor<?x16x?x1xi32>) {
    %cast = tensor.cast %arg0 : tensor<?x16x?x1xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
  func.func private @print_pack_C(%arg0: tensor<1x?x8x?xi32>) {
    %cast = tensor.cast %arg0 : tensor<1x?x8x?xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
  func.func private @matmul_via_mmt4d(%arg0: tensor<7x16xi32>, %arg1: tensor<16x13xi32>, %arg2: tensor<7x13xi32>) -> tensor<7x13xi32> {
    %0 = call @pack_lhs(%arg0) : (tensor<7x16xi32>) -> tensor<1x16x8x1xi32>
    %1 = call @pack_rhs(%arg1) : (tensor<16x13xi32>) -> tensor<?x16x?x1xi32>
    %2 = call @pack_acc(%arg2) : (tensor<7x13xi32>) -> tensor<1x?x8x?xi32>
    call @print_pack_A(%0) : (tensor<1x16x8x1xi32>) -> ()
    call @print_pack_B(%1) : (tensor<?x16x?x1xi32>) -> ()
    call @print_pack_C(%2) : (tensor<1x?x8x?xi32>) -> ()
    %3 = linalg.mmt4d ins(%0, %1 : tensor<1x16x8x1xi32>, tensor<?x16x?x1xi32>) outs(%2 : tensor<1x?x8x?xi32>) -> tensor<1x?x8x?xi32>
    %4 = call @unpack_acc(%3) : (tensor<1x?x8x?xi32>) -> tensor<7x13xi32>
    return %4 : tensor<7x13xi32>
  }
  module @transforms attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.collect_matching @match_mmt4d in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [1, 1, 0, 8, [8], 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %tiled_linalg_op tile_sizes [0, 0, 1, 0, 0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_linalg_op_0 vector_sizes [1, 1, 1, 8, [8], 1] {assume_dynamic_dims_match_vec_sizes} : !transform.any_op
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
      %4 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op_2, %loops_3:2 = transform.structured.tile_using_for %4 tile_sizes [1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_linalg_op_4, %loops_5:2 = transform.structured.tile_using_for %5 tile_sizes [8, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %6 = transform.get_parent_op %tiled_linalg_op_2 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %6 {
        transform.apply_patterns.linalg.decompose_pack_unpack
        transform.apply_patterns.linalg.decompose_pad
      } : !transform.op<"func.func">
      transform.apply_patterns to %6 {
        transform.apply_patterns.tensor.fold_tensor_subset_ops
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      %7 = transform.get_parent_op %tiled_linalg_op_4 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %7 {
        transform.apply_patterns.linalg.decompose_pack_unpack
      } : !transform.op<"func.func">
      transform.apply_patterns to %7 {
        transform.apply_patterns.tensor.fold_tensor_subset_ops
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      %8 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %9 = transform.collect_matching @match_contract in %8 : (!transform.any_op) -> !transform.any_op
      %10 = transform.get_parent_op %9 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %10 {
        transform.apply_patterns.tensor.fold_tensor_subset_ops
        transform.apply_patterns.vector.drop_inner_most_unit_dims_from_xfer_ops
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      transform.apply_patterns to %10 {
        transform.apply_patterns.vector.lower_contraction
        transform.apply_patterns.vector.lower_outerproduct
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @match_mmt4d(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
      transform.match.operation_name %arg0 ["linalg.mmt4d"] : !transform.any_op
      transform.yield %arg0 : !transform.any_op
    }
    transform.named_sequence @match_contract(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
      transform.match.operation_name %arg0 ["vector.contract"] : !transform.any_op
      transform.yield %arg0 : !transform.any_op
    }
  }
  func.func private @printMemrefI32(tensor<*xi32>)
}

