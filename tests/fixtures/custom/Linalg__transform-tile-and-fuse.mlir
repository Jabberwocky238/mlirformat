#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @foo(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?x?xf32>, %arg4: index, %arg5: index) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill {__producer__} ins(%cst : f32) outs(%arg3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.matmul {__producer__} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg2, %1 : tensor<?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) attrs =  {__root__} {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.maximumf %in_0, %cst : f32
      %4 = arith.cmpf ogt, %in, %cst : f32
      %5 = arith.select %4, %cst, %3 : f32
      linalg.yield %5 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match attributes {__root__} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match attributes {__producer__} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0 num_threads [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %1 into %forall_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @foo(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?x?xf32>, %arg4: index, %arg5: index) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill {__producer__} ins(%cst : f32) outs(%arg3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.matmul {__producer__} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg2, %1 : tensor<?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) attrs =  {__root__} {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.maximumf %in_0, %cst : f32
      %4 = arith.cmpf ogt, %in, %cst : f32
      %5 = arith.select %4, %cst, %3 : f32
      linalg.yield %5 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match attributes {__root__} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match attributes {__producer__} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.test_reverse_payload_ops %1 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0 num_threads [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %2 into %forall_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

