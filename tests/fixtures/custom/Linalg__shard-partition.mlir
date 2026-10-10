#map = affine_map<(d0) -> (d0)>
module {
  shard.grid @grid_1d(shape = 2)
  func.func @elementwise_static_1d_grid_static_1d_tensor(%arg0: tensor<2xi8>, %arg1: tensor<2xi8>, %arg2: tensor<2xi8>) -> tensor<2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xi8>
    %sharding_annotated_0 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<2xi8>
    %sharding_annotated_1 = shard.shard %arg1 to %sharding : tensor<2xi8>
    %sharding_annotated_2 = shard.shard %sharding_annotated_1 to %sharding annotate_for_users : tensor<2xi8>
    %sharding_annotated_3 = shard.shard %arg2 to %sharding : tensor<2xi8>
    %sharding_annotated_4 = shard.shard %sharding_annotated_3 to %sharding annotate_for_users : tensor<2xi8>
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%sharding_annotated_0, %sharding_annotated_2 : tensor<2xi8>, tensor<2xi8>) outs(%sharding_annotated_4 : tensor<2xi8>) {
    ^bb0(%in: i8, %in_7: i8, %out: i8):
      %1 = arith.muli %in, %in_7 : i8
      linalg.yield %1 : i8
    } -> tensor<2xi8>
    %sharding_annotated_5 = shard.shard %0 to %sharding : tensor<2xi8>
    %sharding_annotated_6 = shard.shard %sharding_annotated_5 to %sharding annotate_for_users : tensor<2xi8>
    return %sharding_annotated_6 : tensor<2xi8>
  }
}

// -----
module {
  shard.grid @grid_1d(shape = 4)
  func.func @matmul_1d_grid_static_tensors_parallel_iterator_sharding(%arg0: tensor<4x3xi8>, %arg1: tensor<3x8xi8>, %arg2: tensor<4x8xi8>) -> tensor<4x8xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x3xi8>
    %sharding_annotated_0 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<4x3xi8>
    %sharding_1 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_2 = shard.shard %arg1 to %sharding_1 : tensor<3x8xi8>
    %sharding_annotated_3 = shard.shard %sharding_annotated_2 to %sharding_1 annotate_for_users : tensor<3x8xi8>
    %sharding_annotated_4 = shard.shard %arg2 to %sharding : tensor<4x8xi8>
    %sharding_annotated_5 = shard.shard %sharding_annotated_4 to %sharding annotate_for_users : tensor<4x8xi8>
    %0 = linalg.matmul ins(%sharding_annotated_0, %sharding_annotated_3 : tensor<4x3xi8>, tensor<3x8xi8>) outs(%sharding_annotated_5 : tensor<4x8xi8>) -> tensor<4x8xi8>
    %sharding_annotated_6 = shard.shard %0 to %sharding : tensor<4x8xi8>
    %sharding_annotated_7 = shard.shard %sharding_annotated_6 to %sharding annotate_for_users : tensor<4x8xi8>
    return %sharding_annotated_7 : tensor<4x8xi8>
  }
}

// -----
module {
  shard.grid @grid_1d(shape = 3)
  func.func @matmul_1d_grid_static_tensors_reduction_iterator_sharding(%arg0: tensor<4x6xi8>, %arg1: tensor<6x8xi8>, %arg2: tensor<4x8xi8>) -> tensor<4x8xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x6xi8>
    %sharding_annotated_0 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<4x6xi8>
    %sharding_1 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_2 = shard.shard %arg1 to %sharding_1 : tensor<6x8xi8>
    %sharding_annotated_3 = shard.shard %sharding_annotated_2 to %sharding_1 annotate_for_users : tensor<6x8xi8>
    %sharding_4 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_5 = shard.shard %arg2 to %sharding_4 : tensor<4x8xi8>
    %sharding_annotated_6 = shard.shard %sharding_annotated_5 to %sharding_4 annotate_for_users : tensor<4x8xi8>
    %0 = linalg.matmul ins(%sharding_annotated_0, %sharding_annotated_3 : tensor<4x6xi8>, tensor<6x8xi8>) outs(%sharding_annotated_6 : tensor<4x8xi8>) -> tensor<4x8xi8>
    %sharding_annotated_7 = shard.shard %0 to %sharding_4 : tensor<4x8xi8>
    %sharding_annotated_8 = shard.shard %sharding_annotated_7 to %sharding_4 annotate_for_users : tensor<4x8xi8>
    return %sharding_annotated_8 : tensor<4x8xi8>
  }
}

// -----
module {
  shard.grid @grid_1d(shape = 4)
  func.func @matmul_1d_grid_static_tensors_parallel_iterator_unsplit_last_axis(%arg0: tensor<4x6xi8>, %arg1: tensor<6x8xi8>, %arg2: tensor<4x8xi8>) -> tensor<4x8xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[], []] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x6xi8>
    %sharding_annotated_0 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<4x6xi8>
    %sharding_annotated_1 = shard.shard %arg1 to %sharding : tensor<6x8xi8>
    %sharding_2 = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_3 = shard.shard %sharding_annotated_1 to %sharding_2 annotate_for_users : tensor<6x8xi8>
    %sharding_annotated_4 = shard.shard %arg2 to %sharding : tensor<4x8xi8>
    %sharding_annotated_5 = shard.shard %sharding_annotated_4 to %sharding_2 annotate_for_users : tensor<4x8xi8>
    %0 = linalg.matmul ins(%sharding_annotated_0, %sharding_annotated_3 : tensor<4x6xi8>, tensor<6x8xi8>) outs(%sharding_annotated_5 : tensor<4x8xi8>) -> tensor<4x8xi8>
    %sharding_annotated_6 = shard.shard %0 to %sharding_2 : tensor<4x8xi8>
    %sharding_annotated_7 = shard.shard %sharding_annotated_6 to %sharding annotate_for_users : tensor<4x8xi8>
    return %sharding_annotated_7 : tensor<4x8xi8>
  }
}

