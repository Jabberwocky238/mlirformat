#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %low_size, %high_size, %split_point = transform.structured.multitile_sizes %0 {dimension = 0 : i64, target_size = 3 : i64} : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.split %0 after %split_point  {dimension = 0 : i64} : !transform.any_op, !transform.any_op
      %2:2 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %2#0 tile_sizes [%low_size] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_linalg_op_0, %loops_1 = transform.structured.tile_using_for %2#1 tile_sizes [%high_size] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3 = transform.merge_handles %tiled_linalg_op, %tiled_linalg_op_0 : !transform.any_op
      transform.foreach %3 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        %low_size_2, %high_size_3, %split_point_4 = transform.structured.multitile_sizes %arg1 {dimension = 1 : i64, target_size = 10 : i64} : (!transform.any_op) -> !transform.any_op
        %4 = transform.structured.split %arg1 after %split_point_4  {dimension = 1 : i64} : !transform.any_op, !transform.any_op
        %5:2 = transform.split_handle %4 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        %tiled_linalg_op_5, %loops_6 = transform.structured.tile_using_for %5#0 tile_sizes [0, %low_size_2] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
        %tiled_linalg_op_7, %loops_8 = transform.structured.tile_using_for %5#1 tile_sizes [0, %high_size_3] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      }
      transform.yield 
    }
  }
  func.func private @elem(f32, index, index) -> f32
  func.func @two_d(%arg0: tensor<10x34xf32>, %arg1: tensor<10x34xf32>) -> tensor<10x34xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<10x34xf32>) outs(%arg1 : tensor<10x34xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = func.call @elem(%in, %1, %2) : (f32, index, index) -> f32
      linalg.yield %3 : f32
    } -> tensor<10x34xf32>
    return %0 : tensor<10x34xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %low_size, %high_size, %split_point = transform.structured.multitile_sizes %0 {dimension = 0 : i64, target_size = 3 : i64} : (!transform.any_op) -> !transform.param<i64>
      %low_size_0, %high_size_1, %split_point_2 = transform.structured.multitile_sizes %0 {dimension = 1 : i64, target_size = 10 : i64} : (!transform.any_op) -> !transform.param<i64>
      %1 = transform.structured.split %0 after %split_point  {dimension = 0 : i64} : !transform.any_op, !transform.param<i64>
      %2:2 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %2#0 tile_sizes [%low_size] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
      %tiled_linalg_op_3, %loops_4 = transform.structured.tile_using_for %2#1 tile_sizes [%high_size] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
      %3 = transform.merge_handles %tiled_linalg_op, %tiled_linalg_op_3 : !transform.any_op
      %4:3 = transform.replicate num(%3) %low_size_0, %high_size_1, %split_point_2 : !transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
      transform.foreach %3, %4#0, %4#1, %4#2 : !transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64> {
      ^bb0(%arg1: !transform.any_op, %arg2: !transform.param<i64>, %arg3: !transform.param<i64>, %arg4: !transform.param<i64>):
        %5 = transform.structured.split %arg1 after %arg4  {dimension = 1 : i64} : !transform.any_op, !transform.param<i64>
        %6:2 = transform.split_handle %5 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        %tiled_linalg_op_5, %loops_6 = transform.structured.tile_using_for %6#0 tile_sizes [0, %arg2] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        %tiled_linalg_op_7, %loops_8 = transform.structured.tile_using_for %6#1 tile_sizes [0, %arg3] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
      }
      transform.yield 
    }
  }
  func.func private @elem(f32, index, index) -> f32
  func.func @two_d_param(%arg0: tensor<10x34xf32>, %arg1: tensor<10x34xf32>) -> tensor<10x34xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<10x34xf32>) outs(%arg1 : tensor<10x34xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = func.call @elem(%in, %1, %2) : (f32, index, index) -> f32
      linalg.yield %3 : f32
    } -> tensor<10x34xf32>
    return %0 : tensor<10x34xf32>
  }
}

