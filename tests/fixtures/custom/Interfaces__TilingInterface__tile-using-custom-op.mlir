#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  module {
    func.func @generic_parallel(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?x?xf32> {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
      %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
      %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
      %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%0 : tensor<?x?xf32>) {
      ^bb0(%in: f32, %in_1: f32, %out: f32):
        %2 = arith.addf %in, %in_1 : f32
        linalg.yield %2 : f32
      } -> tensor<?x?xf32>
      return %1 : tensor<?x?xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_ops, %loops = transform.test.tile_using_custom_loop %0 tile_sizes = [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

