#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @pack_elemwise(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %c8 = arith.constant 8 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %c4_vscale = arith.muli %c4, %vscale : index
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %arg1 : tensor<?x?xf32> -> tensor<?x?x?x?xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%pack : tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = math.exp %in : f32
      linalg.yield %1 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @ones_equal(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [1, 1, 0, 0] inner_tile_alignments = [Equal, Equal] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @ones_multiple(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [1, 1, 0, 0] inner_tile_alignments = [Multiple, Multiple] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @ones_nohint(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @inner_equal(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [0, 0, 8, 4] inner_tile_alignments = [Equal, Equal] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @inner_multiple(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [0, 0, 8, 4] inner_tile_alignments = [Multiple, Multiple] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @inner_nohint(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [0, 0, 8, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

