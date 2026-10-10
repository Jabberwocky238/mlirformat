#map = affine_map<(d0) -> (d0)>
module {
  func.func @indexed_vector(%arg0: memref<50xindex>) {
    linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : memref<50xindex>) {
    ^bb0(%out: index):
      %0 = linalg.index 0 : index
      linalg.yield %0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [10] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @indexed_matrix(%arg0: memref<50x50xindex>) {
    linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : memref<50x50xindex>) {
    ^bb0(%out: index):
      %0 = linalg.index 0 : index
      %1 = linalg.index 1 : index
      %2 = arith.addi %0, %1 : index
      linalg.yield %2 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [10, 25] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

