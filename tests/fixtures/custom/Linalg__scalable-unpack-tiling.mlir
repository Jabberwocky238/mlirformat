module {
  func.func @CKkc_to_KC_scalable(%arg0: tensor<32x4x?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c2_vscale = arith.muli %c2, %vscale : index
    %c4_vscale = arith.muli %c4, %vscale : index
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [%c2_vscale, %c4_vscale] into %arg1 : tensor<32x4x?x?xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @equal(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [[2], [4]] inner_tile_alignments = [Equal, Equal] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @aligned(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [[4], [8]] inner_tile_alignments = [Multiple, Multiple] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @unaligned(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [7, 5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

