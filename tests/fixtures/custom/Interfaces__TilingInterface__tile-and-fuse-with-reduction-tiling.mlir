#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  module {
    func.func @tile_and_fuse_with_partial_reduction_outer_parallel(%arg0: tensor<?x?xf32>) -> tensor<?xf32> {
      %c0 = arith.constant 0 : index
      %cst = arith.constant 0.000000e+00 : f32
      %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
      %0 = tensor.empty(%dim) : tensor<?xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?xf32>) -> tensor<?xf32>
      %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%1 : tensor<?xf32>) {
      ^bb0(%in: f32, %out: f32):
        %3 = arith.addf %in, %out : f32
        linalg.yield %3 : f32
      } -> tensor<?xf32>
      return %2 : tensor<?xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_ops, %loops = transform.test.tile_and_fuse_outer_parallel_partial_reduction %0 tile_sizes = [128] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

