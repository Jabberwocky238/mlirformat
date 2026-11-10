module {
  func.func @pack(%arg0: tensor<128x256xf32>, %arg1: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %c8 = arith.constant 8 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %c4_vscale = arith.muli %c4, %vscale : index
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %arg1 : tensor<128x256xf32> -> tensor<?x?x?x?xf32>
    return %pack : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @ones_equal(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 1] inner_tile_alignments = [Equal, Equal] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @ones_multiple(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 1] inner_tile_alignments = [Multiple, Multiple] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @ones_nohint(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @twofour_equal(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 4] inner_tile_alignments = [Equal, Equal] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @twofour_multiple(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 4] inner_tile_alignments = [Multiple, Multiple] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @twofour_nohint(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

